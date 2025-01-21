import chisel3._
import chisel3.util._

class connection extends Module {
    val io = IO(new Bundle {
        val seg = Output(UInt(7.W))
        val an = Output(UInt(4.W))
    })

    val CPU = Module(new cpu())
    val SevenSeg = Module(new DisplayMultiplexer())

    SevenSeg.io.in := CPU.io.sevSegNum

    io.seg := SevenSeg.io.out
    io.an := SevenSeg.io.an

}

object VendingMachine extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu())
}