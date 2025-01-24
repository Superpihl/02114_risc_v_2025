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
}

class cpu extends Module {
  val io = IO(new Bundle {
    /*val test0 = Output(UInt(32.W))
    val test1 = Output(UInt(32.W))
    val test2 = Output(UInt(32.W))
    val test3 = Output(UInt(32.W))
    val test4 = Output(UInt(32.W))
    val test5 = Output(UInt(32.W)) // Scala Testing IO
    val test6 = Output(UInt(32.W))
    val test7 = Output(UInt(32.W))
    val test8 = Output(UInt(32.W))
    val test9 = Output(UInt(32.W))
    val test10 = Output(UInt(32.W))
    val test11 = Output(UInt(32.W))
    val test12 = Output(UInt(32.W))
    val test13 = Output(UInt(32.W))
    val test14 = Output(UInt(32.W))
    val test15 = Output(UInt(32.W))
    val test16 = Output(UInt(32.W))
    val test17 = Output(UInt(32.W))*/

    val sevSegNum = Output(UInt(16.W))
    val instr = Output(UInt(32.W))
    val pc = Output(UInt(32.W))
  })

    // === 32 register creation === //
  val reg = /*SyncReadMem(32, UInt(32.W))*/ RegInit(VecInit(Seq.fill(32)(0.U(32.W))))

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
  
    // === Setup of instruction memory === //
  //val InstrcutionMem = VecInit(fetch.readBin("binfiles/recursive(nopAfterLoad).bin").toIndexedSeq.map(_.S(32.W).asUInt))
  val array = new Array[Int](14)
  array(0) = 0x10000293
  array(1) = 0x0fc00313
  array(2) = 0x06400513
  array(3) = 0xfff50513
  array(4) = 0x00a28023
  array(5) = 0xfea04ce3
  array(6) = 0x00150513
  array(7) = 0x00258593
  array(8) = 0x00150513
  array(9) = 0x00a28023
  array(10) = 0x00b280a3
  array(11) = 0xfe65c8e3
  array(12) = 0x00a00893
  array(13) = 0x00000073
  val InstrcutionMem = VecInit(array.toIndexedSeq.map(_.S(32.W).asUInt))

    // === Creation of modules and bundles of wires === //
  val decoder = Module(new decode())
  val decOut = Wire(new decodedInstr())

  val exe = Module(new execution())
  val decExReg = RegInit(0.U.asTypeOf(decOut))
  val memReg = RegInit(0.U.asTypeOf(memBundle))
  val wbReg = RegInit(0.U.asTypeOf(memBundle))
  val wbData = WireDefault(0.U)

  val doBranch = WireDefault(false.B)
  val branchTarget = WireDefault(0.U)

  val CNT_MAX = (100000000 / 2 - 1).U
  
  val cntReg = RegInit(0.U(32.W))
  val pcRegReg = RegInit(0.U(32.W).asUInt)


    // === PC counter === //
  val pcReg = RegInit(0.U(32.W).asUInt)
  val instrReg = RegInit(0x00000033.U)

  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {
    cntReg := 0.U

    
    val pcNext = Mux(doBranch, branchTarget, pcReg + 4.U)
    pcReg := pcNext
    pcRegReg := pcReg

    

      // === Instruction read === //
    val instr = InstrcutionMem(pcReg(31,2))
       
        // === Instruction register (IF/ID) === //
    instrReg := Mux(doBranch, 0x00000033.U, instr)
  
      // === ID/EX register === //
    decExReg := decOut

      // === EXE/MEM register === //
    memReg.regData := Mux(decExReg.valid,exe.io.res,0.U)
    memReg.rd := Mux(decExReg.valid,exe.io.rd,0.U)
    memReg.Addr := exe.io.rs1 + exe.io.imm
    memReg.memWr := ((exe.io.memLen > 0.U) & (exe.io.opcode === 0x23.U))
    memReg.Len :=  Mux(decExReg.valid,exe.io.memLen,0.U)
    memReg.sign := exe.io.sign
    memReg.valid := (exe.io.opcode =/= 0x63.U) && decExReg.valid

        // === MEM/WB register === //
    wbReg := memReg
    wbReg.memData := DataMem.io.DataOut
  }

    // === Seven segement display === //
  io.sevSegNum := DataMem.io.hex
  io.instr := instrReg
  io.pc := pcReg

    // === Connection to decode module, input and output === //
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

    // === Connection to execution module, input and output === //
  exe.io.opcode := decExReg.opcode
  exe.io.rs1 := Mux((memReg.rd === decExReg.rs1) && memReg.valid && !memReg.memWr, memReg.regData,
    Mux((wbReg.rd === decExReg.rs1) && wbReg.valid, wbData,reg(decExReg.rs1)))
  exe.io.rs2 := Mux(memReg.rd === decExReg.rs2, memReg.regData,
    Mux(wbReg.rd === decExReg.rs2, wbData,reg(decExReg.rs2)))
  exe.io.rd := decExReg.rd
  exe.io.func3 := decExReg.func3
  exe.io.func10 := decExReg.func10
  exe.io.imm := decExReg.imm
  exe.io.imm20 := decExReg.imm20
  exe.io.pc := decExReg.pc

    // === Branch calculations === //
  branchTarget := Mux(exe.io.opcode === 0x67.U,(exe.io.rs1.asSInt + decExReg.imm.asSInt).asUInt,(decExReg.pc.asSInt + Mux(exe.io.opcode === 0x17.U,decExReg.imm20.asSInt,decExReg.imm.asSInt)).asUInt)
  doBranch := exe.io.branch && decExReg.valid

    // === Hex dump of registers at end of program === //
  /*when(exe.io.opcode === 0x73.U){
    printf("reg: \n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x",reg(0),reg(1),reg(2),reg(3),reg(4),reg(5),reg(6),reg(7),reg(8),reg(9),reg(10),reg(11),reg(12),reg(13),reg(14),reg(15),reg(16),reg(17),reg(18),reg(19),reg(20),reg(21),reg(22),reg(23),reg(24),reg(25),reg(26),reg(27),reg(28),reg(29),reg(30),reg(31))
  }*/

    // === Connection to Memory module, input and output === //
  DataMem.io.DataIn := memReg.regData
  DataMem.io.rd := memReg.rd
  DataMem.io.Addr := memReg.Addr
  DataMem.io.Length := memReg.Len
  DataMem.io.memWr := memReg.memWr
  DataMem.io.sign := memReg.sign

    // === Writeback === //
  when(!wbReg.memWr && wbReg.valid){
    when(wbReg.Len > 0.U){
      wbData := wbReg.memData
    }.otherwise{
      wbData := wbReg.regData
    }
    when(wbReg.rd === 0.U){ 
      wbData := 0.U
    }
    reg(wbReg.rd) := wbData
  }

    // === Register IO output === //
  /*io.test0 := reg(0)
  io.test1 := reg(1)
  io.test2 := reg(2)
  io.test3 := reg(3)
  io.test4 := reg(4)
  io.test5 := reg(5)
  io.test6 := reg(6)
  io.test7 := reg(7)
  io.test8 := reg(8)
  io.test9 := reg(9)
  io.test10 := reg(10)
  io.test11 := reg(11)
  io.test12 := reg(12)
  io.test13 := reg(13)
  io.test14 := reg(14)
  io.test15 := reg(15)
  io.test16 := reg(16)
  io.test17 := reg(17)*/
}