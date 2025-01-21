package RISCVsim

import chisel3._
import chisel3.util._

class connection extends Module {
    val io = IO(new Bundle {
        val seg = Output(UInt(7.W))
        val an = Output(UInt(4.W))
        val sw = Input(UInt(4.W))
        val led = Output(UInt(4.W))
    })

    val CPU = Module(new cpu())
    val SevenSeg = Module(new DisplayMultiplexer())

    SevenSeg.io.hex := CPU.io.sevSegNum

    io.seg := SevenSeg.io.seg
    io.an := SevenSeg.io.an

    io.led := io.sw

}

object RISCV extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new cpu())
}