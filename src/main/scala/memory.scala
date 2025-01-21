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

  when(0.U < io.Length){
    when(io.memWr){
      when(io.Addr === memSize.U){
        tempSeg(0) := io.DataIn(7,0)
      }.elsewhen((io.Addr) === (memSize+1).U){
        tempSeg(1) := io.DataIn(7,0)
      }.otherwise{
        DataMemory(io.Addr) := io.DataIn(7,0)
      }
      //printf("Write = mem(%d) = %x\n",io.Addr,io.DataIn)
    }.otherwise{
      tempOut(0) := DataMemory(io.Addr)
      //printf("Read = mem(%d) = %x\n",io.Addr,tempOut(0))
    }
  }
  when(1.U < io.Length){
    when(io.memWr){
      when((io.Addr+1.U) === memSize.U){
        tempSeg(0) := io.DataIn(15,8)
      }.elsewhen((io.Addr+2.U) === memSize.U){
        tempSeg(1) := io.DataIn(15,8)
      }.otherwise{
        DataMemory(io.Addr+1.U) := io.DataIn(15,8)
      }
    }.otherwise{
      tempOut(1) := DataMemory(io.Addr+1.U)
    }
  }
  when(2.U < io.Length){
    when(io.memWr){
      when((io.Addr+2.U) === memSize.U){
        tempSeg(0) := io.DataIn(23,16)
        tempSeg(1) := io.DataIn(31,24)
      }.otherwise{
        DataMemory(io.Addr+2.U) := io.DataIn(23,16)
        DataMemory(io.Addr+3.U) := io.DataIn(31,24)
      }
    }.otherwise{
      tempOut(2) := DataMemory(io.Addr+2.U)
      tempOut(3) := DataMemory(io.Addr+3.U)
    }
  }

  io.hex := tempSeg(1) ## tempSeg(0)

  when(io.Length === 1.U && !io.sign && (tempOut(0) & 0x80.U) === 0x80.U){
    io.DataOut := 0xFFFFFF.U ## tempOut(0)
  }.elsewhen(io.Length === 2.U && !io.sign && (tempOut(1) & 0x80.U) === 0x80.U){
    io.DataOut := 0xFFFF.U ## tempOut(1) ## tempOut(0)
  }.otherwise{
    io.DataOut := tempOut(3) ## tempOut(2) ## tempOut(1) ## tempOut(0)
  }



  //printf("%x,%x,%x,%x,%x,%x,%x\n",DataMemory(127),DataMemory(128),DataMemory(129),DataMemory(130),DataMemory(131),DataMemory(132),DataMemory(133))

}