package RISCVsim

import chisel3._
import chisel3.util._

import RISCVsim.fetch._

class decodedInstr extends Bundle {
  val opcode = UInt(7.W)
  val rs1 = UInt(32.W)
  val rs2 = UInt(32.W)
  val rd = UInt(5.W)
  val func3 = UInt(3.W)
  val func10 = UInt(10.W)
  val imm = UInt(12.W)
  val imm20 = UInt(20.W)
  val pc = UInt(32.W)
  val valid = Bool()
  //val mem = Bool()
}

class cpu extends Module {
  val io = IO(new Bundle {
    /*val instruct = Input(UInt(32.W))*/
    val test = Output(UInt(32.W))
    val test2 = Output(UInt(32.W))
    val test3 = Output(UInt(32.W))
    val test4 = Output(UInt(32.W))
    val test5 = Output(UInt(32.W))
    val test6 = Output(UInt(32.W))
    val test7 = Output(UInt(32.W))
    val test8 = Output(UInt(32.W))
    val test9 = Output(UInt(32.W))
  })

  val reg = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) /* SyncReadMem(32, UInt(32.W)) */

  val DataMem = Module(new memory())
  DataMem.io.Length := 0.U
  val memBundle = new Bundle() {
    val rd = UInt(5.W)
    val regData = UInt(32.W)
    val memData = UInt(32.W)
    val Addr = UInt(32.W)
    val Len = UInt(2.W)
    val memWr = Bool()
    var sign = Bool()
  }
  val InstrcutionMem = VecInit(fetch.readBin("binfiles/width.bin").toIndexedSeq.map(_.S(32.W).asUInt))
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
  //decOut.mem := decoder.io.mem

  /*printf("Decode =instr: %x, opcode: %x |",instrReg, decOut.opcode)*/
  /*printf("(dec): rs1(%x) = %d, rs2(%x) = %d\n",decOut.rs1,reg(decOut.rs1),decOut.rs2,reg(decOut.rs2))*/
  decExReg := decOut

  exe.io.opcode := decExReg.opcode
  exe.io.rs1 := Mux(memReg.rd === decExReg.rs1, memReg.regData,
    Mux(wbReg.rd === decExReg.rs1, wbReg.regData,reg(decExReg.rs1)))
  exe.io.rs2 := Mux(memReg.rd === decExReg.rs2, memReg.regData,
    Mux(wbReg.rd === decExReg.rs2, wbReg.regData,reg(decExReg.rs2)))
  printf("rs1 = %d\n rs2 = %d\n", exe.io.rs1,exe.io.rs2)
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
  memReg.Addr := exe.io.rs1 + exe.io.imm
  memReg.memWr := ((exe.io.memLen > 0.U) & (exe.io.opcode === 0x23.U))
  memReg.Len :=  Mux(decExReg.valid,exe.io.memLen,0.U)
  memReg.sign := exe.io.sign
  /*when(memReg.writeLen > 0.U){
    printf("%x(addr) + %x(imm) = %d\n",exe.io.rs1,exe.io.imm,exe.io.res)
  }*/
    //printf("this: %d and (%d = %d\n",decExReg.valid,decExReg.opcode, 0x23.U)
  //memReg.mem := decExReg.mem
  DataMem.io.DataIn := memReg.regData
  DataMem.io.rd := memReg.rd
  DataMem.io.Addr := memReg.Addr
  DataMem.io.Length := memReg.Len
  DataMem.io.memWr := memReg.memWr
  DataMem.io.sign := memReg.sign

  //printf("mem = memReg: %x\n",DataMem.io.DataOut)
  wbReg := memReg
  wbReg.memData := DataMem.io.DataOut

  when((wbReg.Len > 0.U) & !wbReg.memWr){
    reg(wbReg.rd) := wbReg.memData
    //printf("MemData Loaded = reg(%d) = %x\n",wbReg.rd,wbReg.memData)
  }.otherwise{
    reg(wbReg.rd) := wbReg.regData
    //printf("RegData Loaded = reg(%d) = %x\n",wbReg.rd,wbReg.regData)
  }
  //printf("x%d = %x\n",wbReg.rd, wbReg.regData)
  //printf("fail at %d\n", reg(wbReg.rd))
  io.test := reg(5)
  //printf("io.test = %d\n",io.test)
  io.test2 := reg(6)
  io.test3 := reg(11)
  io.test4 := reg(12)
  io.test5 := reg(13)
  io.test6 := reg(14)
  io.test7 := reg(15)
  io.test8 := reg(16)
  io.test9 := reg(17)
}

object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu())
}