import chisel3._
import chisel3.util._

class main extends Module {
  val io = IO(new Bundle {

  })

  val reg = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) /* SyncReadMem(32, UInt(32.W)) */
  val DataMem = RegInit(VecInit(Seq.fill(128)(0.U(8.W))))

  val InstrcutionMem = RegInit(VecInit(0x00100093.U))

  
}

object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new main())
}