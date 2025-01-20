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
    val test0 = Output(UInt(32.W))
    val test1 = Output(UInt(32.W))
    val test2 = Output(UInt(32.W))
    val test3 = Output(UInt(32.W))
    val test8 = Output(UInt(32.W))
    val test10 = Output(UInt(32.W))
    val test15 = Output(UInt(32.W))
    val test17 = Output(UInt(32.W))
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
    val sign = Bool()
    val valid = Bool()
  }
  val InstrcutionMem = VecInit(fetch.readBin("binfiles/recursive(nopAfterLoad).bin").toIndexedSeq.map(_.S(32.W).asUInt))
  /*def getProgramFix() = InstrcutionMem*/
  /*val InstrcutionMem = RegInit(0.U.asTypeOf(decOut))*/
  /*printf("mem: %x\n",InstrcutionMem(6))*/
  val decoder = Module(new decode())
  val decOut = Wire(new decodedInstr())

  val exe = Module(new execution())
  val decExReg = RegInit(0.U.asTypeOf(decOut))
  val memReg = RegInit(0.U.asTypeOf(memBundle))
  val wbReg = RegInit(0.U.asTypeOf(memBundle))
  val wbData = WireDefault(0.U)

  val doBranch = WireDefault(false.B)
  val branchTarget = WireDefault(0.U)

  val pcReg = RegInit(0.U(32.W).asUInt)
  val pcNext = Mux(doBranch, branchTarget, pcReg + 4.U)
  pcReg := pcNext

  val instr = InstrcutionMem(pcReg(31,2))

  val pcRegReg = RegNext(pcReg)

  //printf("pc = %x , instr = %x\n",pcReg,instr)
  printf("%x ",pcReg)

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

  //printf("decExRS1 = %d (%x)\nmemRD = %d\nwbRD = %d\n",decExReg.rs1,reg(decExReg.rs1),memReg.rd,wbReg.rd)

  exe.io.rs1 := Mux((memReg.rd === decExReg.rs1) && memReg.valid, memReg.regData,
    Mux((wbReg.rd === decExReg.rs1) && wbReg.valid, wbData,reg(decExReg.rs1)))
  exe.io.rs2 := Mux(memReg.rd === decExReg.rs2, memReg.regData,
    Mux(wbReg.rd === decExReg.rs2, wbData,reg(decExReg.rs2)))
  //printf("rs1 = %d\n rs2 = %d\n", exe.io.rs1,exe.io.rs2)
  exe.io.rd := decExReg.rd
  exe.io.func3 := decExReg.func3
  exe.io.func10 := decExReg.func10
  exe.io.imm := decExReg.imm
  exe.io.imm20 := decExReg.imm20
  exe.io.pc := decExReg.pc

  /*when(exe.io.rd === 15.U){
    printf("\n(exe) res = %x rs1(%x) = %x, (mem) = %x, (wbReg) = %x, (reg) = %x\n",exe.io.res,decExReg.rs1,exe.io.rs1,memReg.regData,wbData,reg(decExReg.rs1))
  }*/

  branchTarget := Mux(exe.io.opcode === 0x67.U,(exe.io.rs1.asSInt + decExReg.imm.asSInt).asUInt,(decExReg.pc.asSInt + Mux(exe.io.opcode === 0x17.U,decExReg.imm20.asSInt,decExReg.imm.asSInt)).asUInt)
  doBranch := exe.io.branch && decExReg.valid
  /*when(doBranch){
    printf("\nBranch Target: %x | pc: %x | imm : %x\n",branchTarget,decExReg.pc.asSInt,decExReg.imm.asSInt)
    /*printf("branchTarget = %x, also that branch target = %x\n",(decExReg.pc.asSInt + decExReg.imm.asSInt).asUInt, exe.io.res)
    when(exe.io.opcode === 0x63.U){
      printf("definitely a branch branch\n")
    }*/
  }*/

  /*printf("(exe): rs1(%x) = %d, rs2(%x) = %d\n",decExReg.rs1,reg(decExReg.rs1),decExReg.rs2,reg(decExReg.rs2))*/
  when(exe.io.opcode === 0x73.U){
    printf("reg: \n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x",reg(0),reg(1),reg(2),reg(3),reg(4),reg(5),reg(6),reg(7),reg(8),reg(9),reg(10),reg(11),reg(12),reg(13),reg(14),reg(15),reg(16),reg(17),reg(18),reg(19),reg(20),reg(21),reg(22),reg(23),reg(24),reg(25),reg(26),reg(27),reg(28),reg(29),reg(30),reg(31))
  }
  /*printf("exe = opcode: %x, %x + %x = %x |",decExReg.opcode, reg(decExReg.rs1),reg(decExReg.rs2),reg(decExReg.rd))*/
  memReg.regData := Mux(decExReg.valid,exe.io.res,0.U)
  memReg.rd := Mux(decExReg.valid,exe.io.rd,0.U)
  /*when(memReg.rd === 15.U){
    printf("regData = %x\n",memReg.regData)
  }*/
  memReg.Addr := exe.io.rs1 + exe.io.imm
  memReg.memWr := ((exe.io.memLen > 0.U) & (exe.io.opcode === 0x23.U))
  memReg.Len :=  Mux(decExReg.valid,exe.io.memLen,0.U)
  memReg.sign := exe.io.sign
  memReg.valid := (exe.io.opcode =/= 0x63.U) && decExReg.valid
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

  /*when(wbReg.rd === 15.U){
    printf("regData(wb) = %x\n",wbReg.regData)
  }*/

  when(!wbReg.memWr && wbReg.valid){
    when(wbReg.Len > 0.U){
      wbData := wbReg.memData
    }.otherwise{
      wbData := wbReg.regData
    }
    when(wbReg.rd === 0.U){ 
      wbData := 0.U
      //printf("x%d = %x\n (%x(mem),%x(reg))\n",wbReg.rd,wbData,wbReg.memData,wbReg.regData)
    }
    reg(wbReg.rd) := wbData
  }
  //printf("x%d = %x\n",wbReg.rd, wbReg.regData)
  //printf("fail at %d\n", reg(wbReg.rd))
  io.test0 := reg(0)
  io.test1 := reg(1)
  io.test2 := reg(2)
  io.test3 := reg(3)
  io.test8 := reg(8)
  io.test10 := reg(10)
  io.test15 := reg(15)
  io.test17 := reg(17)
}

object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu())
}