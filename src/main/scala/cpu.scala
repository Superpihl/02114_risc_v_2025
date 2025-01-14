package RISCVsim

import chisel3._
import chisel3.util._

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
  val valid = Bool()
}

class cpu extends Module {
  val io = IO(new Bundle {
    /*val instruct = Input(UInt(32.W))*/
    val test = Output(UInt(32.W))
    val test2 = Output(UInt(32.W))
    val test3 = Output(UInt(32.W))
  })

  val reg = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) /* SyncReadMem(32, UInt(32.W)) */

  val DataMem = Module(new memory())
  DataMem.io.Write := false.B
  val memBundle = new Bundle() {
    val rd = UInt(5.W)
    val regData = UInt(32.W)
    val memData = UInt(32.W)
    val Addr = UInt(32.W)
    val writeEnable = Bool()
  }
  val InstrcutionMem = VecInit(fetch.readBin("binfiles/branchcnt.bin").toIndexedSeq.map(_.S(32.W).asUInt))
  /*def getProgramFix() = InstrcutionMem*/
  /*val InstrcutionMem = RegInit(0.U.asTypeOf(decOut))*/
  /*printf("mem: %x\n",InstrcutionMem(6))*/
  val decoder = Module(new decode())
  val decOut = Wire(new decodedInstr())

  val exe = Module(new execution())
  val decExReg = RegInit(0.U.asTypeOf(decOut))
  val memReg = RegInit(0.U.asTypeOf(memBundle))
  val wbReg = RegInit(0.U.asTypeOf(memBundle))

  val doBranch = WireDefault(false.B)
  val branchTarget = WireDefault(0.U)

  val pcReg = RegInit(0.U(32.W).asUInt)
  val pcNext = Mux(doBranch, branchTarget, pcReg + 4.U)
  pcReg := pcNext

  val instr = InstrcutionMem(pcReg(31,2))

  val pcRegReg = RegNext(pcReg)

  printf("Fetch = pc: %x, instr: %x |\n",pcReg,instr)

  val instrReg = RegInit(0x00000033.U)
  instrReg := Mux(doBranch, 0x00000033.U, instr)

  /*val rs1 = instr(19, 15)
  val rs2 = instr(24, 20)
  val rd = instr(11, 7)*/

  decoder.io.instr := instrReg
  decOut.opcode := instrReg(6,0)
  decOut.rs1 := decoder.io.rs1
  decOut.rs2 := decoder.io.rs2
  decOut.rd := decoder.io.rd
  decOut.func3 := decoder.io.func3
  decOut.func10 := decoder.io.func10
  decOut.imm := decoder.io.imm
  decOut.imm20 := decoder.io.imm20
  decOut.pc := pcRegReg
  decOut.valid := !doBranch

  /*printf("Decode =instr: %x, opcode: %x |",instrReg, decOut.opcode)*/
  /*printf("(dec): rs1(%x) = %d, rs2(%x) = %d\n",decOut.rs1,reg(decOut.rs1),decOut.rs2,reg(decOut.rs2))*/
  decExReg := decOut

  exe.io.opcode := decExReg.opcode
  exe.io.rs1 := Mux(memReg.rd === decExReg.rs1, memReg.regData,
    Mux(wbReg.rd === decExReg.rs1, wbReg.regData,reg(decExReg.rs1)))
  exe.io.rs2 := Mux(memReg.rd === decExReg.rs2, memReg.regData,
    Mux(wbReg.rd === decExReg.rs2, wbReg.regData,reg(decExReg.rs2)))
  //printf("rs1 = %d\n rs2 = %d\n", exe.io.rs1,exe.io.rs2)
  exe.io.rd := decExReg.rd
  exe.io.func3 := decExReg.func3
  exe.io.func10 := decExReg.func10
  exe.io.imm := decExReg.imm
  exe.io.imm20 := decExReg.imm20

  branchTarget := (decExReg.pc.asSInt + decExReg.imm.asSInt).asUInt
  doBranch := exe.io.branch && decExReg.valid
  when(doBranch){
    printf("Branch Target: %x | pc: %x | imm : %x | opcode: %x\n",branchTarget,decExReg.pc.asSInt,decExReg.imm.asSInt,(decExReg.imm(11) ## decExReg.imm(10,5) ## decExReg.rs2 ## decExReg.rs1 ## decExReg.func3 ## decExReg.imm(4,1) ## decExReg.imm(11) ## decExReg.opcode))
  }

  /*printf("(exe): rs1(%x) = %d, rs2(%x) = %d\n",decExReg.rs1,reg(decExReg.rs1),decExReg.rs2,reg(decExReg.rs2))*/

  /*printf("exe = opcode: %x, %x + %x = %x |",decExReg.opcode, reg(decExReg.rs1),reg(decExReg.rs2),reg(decExReg.rd))*/
  memReg.regData := exe.io.res
  memReg.rd := exe.io.rd
  memReg.Addr := decoder.io.rs1 + decoder.io.imm
  memReg.writeEnable := decExReg.valid && (decExReg.func3 === 0x23.U)

  DataMem.io.DataIn := memReg.regData
  DataMem.io.rd := memReg.rd
  DataMem.io.Addr := memReg.Addr
  DataMem.io.Write := memReg.writeEnable

  /*printf("mem = memReg: %x\n",DataMem.io.DataOut)*/
  wbReg.rd := memReg.rd
  wbReg.regData := memReg.regData
  wbReg.memData := DataMem.io.DataOut

  reg(wbReg.rd) := wbReg.regData
  printf("x%d = %x\n",wbReg.rd, wbReg.regData)
  io.test := reg(10)
  io.test2 := reg(11)
  io.test3 := reg(12)
}

object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu())
}