import chisel3._
import chisel3.util._

class cpu extends Module {
  /*val io = IO(new Bundle {

  })*/

  val reg = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) /* SyncReadMem(32, UInt(32.W)) */
  val DataMem = RegInit(VecInit(Seq.fill(128)(0.U(8.W))))

  val InstrcutionMem = RegInit(VecInit(0x12300093.U))

  val doBranch = WireDefault(false.B)
  val branchTarget = WireDefault(0.U)

  val pcReg = RegInit(-4.S(32.W).asUInt)
  val pcNext = Mux(doBranch, branchTarget, pcReg + 4.U)
  pcReg := pcNext

  val instr = InstrcutionMem(pcReg)

  val instrReg = RegInit(0x00000033.U)
  instrReg := Mux(doBranch, 0x00000033.U, instr)
  val rs1 = instr(19, 15)
  val rs2 = instr(24, 20)
  val rd = instr(11, 7)

  /*val decOut = decode(instrReg)*/

}

object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu())
}