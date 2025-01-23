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

    SevenSeg.io.hex := Mux(io.sw(0),Mux(io.sw(1),CPU.io.pc(15,0),CPU.io.instr(15,0)),CPU.io.sevSegNum)//Mux(io.sw(0),0x1243.U/*CPU.io.instr(15,0)*/,CPU.io.sevSegNum)

    SevenSeg.io.set1 := false.B//io.sw(0) // io.sw(0) && !io.sw(1)
    SevenSeg.io.set2 := false.B //io.sw(1) && !io.sw(0)
    SevenSeg.io.none := io.sw(2)
    SevenSeg.io.full := io.sw(3)

    io.seg := SevenSeg.io.seg
    io.an := SevenSeg.io.an

    io.led := io.sw

}

object RISCV extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new connection())
}