package RISCVsim

import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val c2Full = Input(Bool())
    val c5Full = Input(Bool())
    val noCans = Input(Bool())
    val iced = Input(Bool())
    val hex = Input(UInt(16.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  //Wire default, default selections of display and displaystatec
  val sevSeg = WireDefault("b1111111".U(7.W));
  val select = WireDefault("b0001".U(4.W))

  //List of overwriting situations and what to display
  val coin2full = VecInit("b0000001".U,"b0000010".U,"b0000100".U,"b0001000".U) //C2FL
  val coin5full = VecInit("b0010000".U,"b0100000".U,"b1000000".U,"b0000000".U) //C5FL
  val empty = VecInit("b0000000".U, "b0000000".U, "b0000000".U, "b0000000".U) //0CAn
  val ice = VecInit("b1111111".U, "b1111111".U, "b1111111".U, "b1111111".U) //iCEd

  //creating of decoding modules (Importing SevenSegDecoder)
  val sevenSegDec0 = Module(new SevenSegDec())
  val sevenSegDec1 = Module(new SevenSegDec())
  val sevenSegDec2 = Module(new SevenSegDec())
  val sevenSegDec3 = Module(new SevenSegDec())
  val CNT_MAX = 1000.U

  val cntReg = RegInit(0.U(32.W))
  val outReg = RegInit(1.U(4.W))
  val outReg2 = RegInit(0.U(16.W))

  //Display lighting shifting, so each display gets adequate time to
  //light up but also is perceived they are all on at the same time
  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {
    cntReg := 0.U
    outReg := outReg(0) ## outReg(3, 1)
    outReg2 := io.hex
  }
  select := outReg

  //Connection decoders to input values.
  sevenSegDec0.io.in := outReg2(3, 0)
  sevenSegDec1.io.in := outReg2(7, 4)
  sevenSegDec2.io.in := outReg2(11, 8)
  sevenSegDec3.io.in := outReg2(15, 12)

  //Switch statement switching what data to send according to which display is currently displaying
  switch(select) {
    is("b0001".U) {
      //Overwriting states listed in precedence
      when(io.iced) {
        sevSeg := ice(3)
      }.elsewhen(io.c2Full){
        sevSeg := coin2full(3)
      }.elsewhen(io.c5Full){
        sevSeg := coin5full(3)
      }.elsewhen(io.noCans) {
        sevSeg := empty(3)
      }.otherwise{ //If no overwriting state, display price and sum
        sevSeg := sevenSegDec0.io.out
      }
    }
    is("b0010".U) {
      when(io.iced) {
        sevSeg := ice(2)
      }.elsewhen(io.c2Full) {
        sevSeg := coin2full(2)
      }.elsewhen(io.c5Full) {
        sevSeg := coin5full(2)
      }.elsewhen(io.noCans) {
        sevSeg := empty(2)
      }.otherwise {
        sevSeg := sevenSegDec1.io.out
      }
    }
    is("b0100".U) {
      when(io.iced) {
        sevSeg := ice(1)
      }.elsewhen(io.c2Full) {
        sevSeg := coin2full(1)
      }.elsewhen(io.c5Full) {
        sevSeg := coin5full(1)
      }.elsewhen(io.noCans) {
        sevSeg := empty(1)
      }.otherwise {
        sevSeg := sevenSegDec2.io.out
      }
    }
    is("b1000".U) {
      when(io.iced) {
        sevSeg := ice(0)
      }.elsewhen(io.c2Full) {
        sevSeg := coin2full(0)
      }.elsewhen(io.c5Full) {
        sevSeg := coin5full(0)
      }.elsewhen(io.noCans) {
        sevSeg := empty(0)
      }.otherwise {
        sevSeg := sevenSegDec3.io.out
      }
    }
  }

  //Connecting coded display signal and display selector
  io.seg := ~sevSeg
  io.an := ~select
}
