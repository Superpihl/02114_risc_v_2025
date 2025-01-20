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

  val DataMemory = RegInit(VecInit(Seq.fill(128)(0.U(32.W))))

  when(io.Write) {
    // Write operation (word address)
    DataMemory(io.Addr >> 2) := io.DataIn
  }

  // Read operation (word address)
  io.DataOut := DataMemory(io.Addr >> 2)

}