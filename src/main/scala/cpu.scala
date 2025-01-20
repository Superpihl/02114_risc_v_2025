package RISCVsim

import chisel3._
import RISCVsim.fetch._

class decodedInstr extends Bundle {
  val opcode = UInt(7.W)
  val rs1 = UInt(5.W)
  val rs2 = UInt(5.W)
  val rd = UInt(5.W)
  val func3 = UInt(3.W)
  val func10 = UInt(10.W)
  val imm = UInt(12.W)
  val imm20 = UInt(20.W)
  val pc = UInt(32.W)
}

class cpu extends Module {
  val io = IO(new Bundle {
    val test = Output(UInt(32.W))
    val test2 = Output(UInt(32.W))
    val test3 = Output(UInt(32.W))
  })

  // Register file (32 registers)
  val reg = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

  // Program Counter
  val pcReg = RegInit(0.U(32.W))

  // Modules
  val DataMem = Module(new memory())
  val decoder = Module(new decode())
  val exe = Module(new execution())
  val hazard = Module(new hazard())

  // Instruction Memory
  val InstrMem = VecInit(fetch.readBinAsUInt("binfiles/branchcnt.bin").map(_.U(32.W)))
  val instr = InstrMem(pcReg(31, 2)) // Fetch stage

  // Decode Stage
  val decOut = Wire(new decodedInstr)
  decoder.io.instr := instr
  decOut.opcode := decoder.io.instr(6, 0)
  decOut.rs1 := decoder.io.rs1
  decOut.rs2 := decoder.io.rs2
  decOut.rd := decoder.io.rd
  decOut.func3 := decoder.io.func3
  decOut.func10 := decoder.io.func10
  decOut.imm := decoder.io.imm
  decOut.imm20 := decoder.io.imm20
  decOut.pc := pcReg

  // Pipeline Register Between Decode and Execute
  val decExReg = RegNext(decOut)

  // Execution Stage
  exe.io.opcode := decExReg.opcode
  exe.io.rs1 := reg(decExReg.rs1)
  exe.io.rs2 := reg(decExReg.rs2)
  exe.io.rd := decExReg.rd
  exe.io.func3 := decExReg.func3
  exe.io.func10 := decExReg.func10
  exe.io.imm := decExReg.imm
  exe.io.imm20 := decExReg.imm20
  exe.io.pc := decExReg.pc

  // Hazard Detection
  hazard.io.id_ex_rs1 := decExReg.rs1
  hazard.io.id_ex_rs2 := decExReg.rs2
  hazard.io.ex_mem_rd := exe.io.rd
  hazard.io.ex_mem_valid := exe.io.rd =/= 0.U
  hazard.io.ex_mem_opcode := exe.io.opcode
  hazard.io.mem_wb_rd := 0.U // Connect to WB stage if applicable
  hazard.io.mem_wb_valid := false.B

  // Memory Stage
  DataMem.io.Addr := exe.io.res // Address from execution result
  DataMem.io.DataIn := reg(decExReg.rs2) // Data to write (from rs2)
  DataMem.io.Write := decExReg.opcode === "b0100011".U // Write enable for store
  DataMem.io.rd := exe.io.res

  // Write Back Stage
  when(decExReg.opcode === "b0000011".U) { // Load instruction
    reg(decExReg.rd) := DataMem.io.DataOut
  }.elsewhen(decExReg.opcode === "b0110011".U || // R-Type
    decExReg.opcode === "b0010011".U || // I-Type
    decExReg.opcode === "b1101111".U || // JAL
    decExReg.opcode === "b1100111".U || // JALR
    decExReg.opcode === "b0110111".U || // LUI
    decExReg.opcode === "b0010111".U) { // AUIPC
    reg(decExReg.rd) := exe.io.res
  }

  // Program Counter Update
  val pcNext = WireDefault(pcReg + 4.U)
  val doBranch = exe.io.branch
  val branchTarget = exe.io.nextPC

  pcReg := Mux(hazard.io.stall, pcReg, Mux(doBranch, branchTarget, pcNext))

  // Debug Outputs
  io.test := reg(10)
  io.test2 := reg(11)
  io.test3 := reg(12)
}

object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu(), Array("--target-dir", "generated"))
}
