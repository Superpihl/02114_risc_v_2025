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

  val DataMemory = SyncReadMem(memSize, UInt(8.W)) /*RegInit(VecInit(Seq.fill(memSize)(0.U(8.W)))) */

  val tempOut = VecInit(Seq.fill(4)(0.U(8.W)))
  val tempSeg = VecInit(Seq.fill(2)(0.U(8.W)))

    // === Memory read/write based on length of memory access (0 = no read or write, 1 = byte, 2 = half word, 3 = full word) === //
  when(0.U < io.Length){
    when(io.memWr){ /* Write */
      when(io.Addr === memSize.U){ /* Seven segments display */
        tempSeg(0) := io.DataIn(7,0)
      }.elsewhen((io.Addr) === (memSize+1).U){ /* Seven segments display */
        tempSeg(1) := io.DataIn(7,0)
      }.otherwise{ /* Standard memory */
        DataMemory(io.Addr) := io.DataIn(7,0)
      }
    }.otherwise{ /* Read */
      tempOut(0) := DataMemory(io.Addr)
    }
  }
  when(1.U < io.Length){
    when(io.memWr){ /* Write */
      when((io.Addr+1.U) === memSize.U){ /* Seven segments display */
        tempSeg(0) := io.DataIn(15,8)
      }.elsewhen((io.Addr+2.U) === memSize.U){ /* Seven segments display */
        tempSeg(1) := io.DataIn(15,8)
      }.otherwise{ /* Standard memory */
        DataMemory(io.Addr+1.U) := io.DataIn(15,8)
      }
    }.otherwise{ /* Read */
      tempOut(1) := DataMemory(io.Addr+1.U)
    }
  }
  when(2.U < io.Length){
    when(io.memWr){ /* Write */
      when((io.Addr+2.U) === memSize.U){ /* Seven segments display */
        tempSeg(0) := io.DataIn(23,16)
        tempSeg(1) := io.DataIn(31,24)
      }.otherwise{ /* Standard memory */
        DataMemory(io.Addr+2.U) := io.DataIn(23,16)
        DataMemory(io.Addr+3.U) := io.DataIn(31,24)
      }
    }.otherwise{ /* Read */
      tempOut(2) := DataMemory(io.Addr+2.U)
      tempOut(3) := DataMemory(io.Addr+3.U)
    }
  }

    // === Output === //
  io.hex := tempSeg(1) ## tempSeg(0) // Seven segments display

    // === DataOut with sign extension === //
  when(io.Length === 1.U && !io.sign && (tempOut(0) & 0x80.U) === 0x80.U){
    io.DataOut := 0xFFFFFF.U ## tempOut(0)
  }.elsewhen(io.Length === 2.U && !io.sign && (tempOut(1) & 0x80.U) === 0x80.U){
    io.DataOut := 0xFFFF.U ## tempOut(1) ## tempOut(0)
  }.otherwise{ 
    io.DataOut := tempOut(3) ## tempOut(2) ## tempOut(1) ## tempOut(0)
  }

}