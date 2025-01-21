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
    val SevenSeg = Module(new DisplayMultiplexer(100000))

    SevenSeg.io.hex := CPU.io.sevSegNum

    SevenSeg.io.c2Full := io.sw(0)
    SevenSeg.io.c5Full := io.sw(1)
    SevenSeg.io.noCans := io.sw(2)
    SevenSeg.io.iced := io.sw(3)

    io.seg := SevenSeg.io.seg
    io.an := SevenSeg.io.an

    io.led := io.sw

}

object RISCV extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new connection())
}