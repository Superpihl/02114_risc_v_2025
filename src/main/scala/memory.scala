package RISCVsim

import chisel3._
import chisel3.util._

class memory extends Module {
  val io = IO(new Bundle {
    val Addr = Input(UInt(32.W))
    val DataIn = Input(UInt(32.W))
    val Length = Input(UInt(2.W))
    val rd = Input(UInt(5.W))
    val memWr = Input(Bool())
    val sign = Input(Bool())

    val DataOut = Output(UInt(32.W))
    val hex = Output(UInt(16.W))
  })

  val memSize = 256

  val DataMemory = SyncReadMem(memSize+2, UInt(8.W)) /*RegInit(VecInit(Seq.fill(memSize)(0.U(8.W)))) */

  val tempOut = VecInit(Seq.fill(4)(0.U(8.W)))

    // === Memory read/write based on length of memory access (0 = no read or write, 1 = byte, 2 = half word, 3 = full word) === //
  when(0.U < io.Length){
    when(io.memWr){ /* Write */
      DataMemory(io.Addr) := io.DataIn(7,0)
    }.otherwise{ /* Read */
      tempOut(0) := DataMemory(io.Addr)
    }
  }
  when(1.U < io.Length){
    when(io.memWr){ /* Write */
      DataMemory(io.Addr+1.U) := io.DataIn(15,8)
    }.otherwise{ /* Read */
      tempOut(1) := DataMemory(io.Addr+1.U)
    }
  }
  when(2.U < io.Length){
    when(io.memWr){ /* Write */
      DataMemory(io.Addr+2.U) := io.DataIn(23,16)
      DataMemory(io.Addr+3.U) := io.DataIn(31,24)
    }.otherwise{ /* Read */
      tempOut(2) := DataMemory(io.Addr+2.U)
      tempOut(3) := DataMemory(io.Addr+3.U)
    }
  }

    // === Output === //
  io.hex := DataMemory((memSize+1).U) ## DataMemory(memSize.U) // Seven segments display

    // === DataOut with sign extension === //
  when(io.Length === 1.U && !io.sign && (tempOut(0) & 0x80.U) === 0x80.U){
    io.DataOut := 0xFFFFFF.U ## tempOut(0)
  }.elsewhen(io.Length === 2.U && !io.sign && (tempOut(1) & 0x80.U) === 0x80.U){
    io.DataOut := 0xFFFF.U ## tempOut(1) ## tempOut(0)
  }.otherwise{ 
    io.DataOut := tempOut(3) ## tempOut(2) ## tempOut(1) ## tempOut(0)
  }

}