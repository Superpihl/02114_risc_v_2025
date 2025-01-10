package RISCVsim

import chisel3._
import chisel3.util._

class memory extends Module {
  val io = IO(new Bundle {
    val Addr = Input(UInt(32.W))
    val DataIn = Input(UInt(32.W))
    val Write = Input(Bool())
    val rd = Input(UInt(5.W))
    val DataOut = Output(UInt(32.W))
  })

  val DataMemory = RegInit(VecInit(Seq.fill(128)(0.U(8.W))))

  when(io.Write){
    io.DataOut := io.DataIn
    DataMemory(io.Addr) := io.DataIn
  }.otherwise{
    io.DataOut := DataMemory(io.Addr)
  }


}