package RISCVsim

import chisel3._
import chisel3.util._

class DisplayMultiplexer() extends Module {
  val io = IO(new Bundle {
    val set1 = Input(Bool())
    val set2 = Input(Bool())
    val none = Input(Bool())
    val full = Input(Bool())
    val hex = Input(UInt(16.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  //Wire default, default selections of display and displaystatec
  val sevSeg = WireDefault("b1111111".U(7.W));
  val select = WireDefault("b0001".U(4.W))

  //List of overwriting situations and what to display
  val set1 = VecInit("b0000001".U,"b0000010".U,"b0000100".U,"b0001000".U) //C2FL
  val set2 = VecInit("b0010000".U,"b0100000".U,"b1000000".U,"b0000000".U) //C5FL
  val none = VecInit("b0000000".U, "b0000000".U, "b0000000".U, "b0000000".U) //0CAn
  val full = VecInit("b1111111".U, "b1111111".U, "b1111111".U, "b1111111".U) //iCEd

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
      when(io.full) {
        sevSeg := full(3)
      }.elsewhen(io.set1){
        sevSeg := set1(3)
      }.elsewhen(io.set2){
        sevSeg := set2(3)
      }.elsewhen(io.none) {
        sevSeg := none(3)
      }.otherwise{ //If no overwriting state, display price and sum
        sevSeg := sevenSegDec0.io.out
      }
    }
    is("b0010".U) {
      when(io.full) {
        sevSeg := full(2)
      }.elsewhen(io.set1) {
        sevSeg := set1(2)
      }.elsewhen(io.set2) {
        sevSeg := set2(2)
      }.elsewhen(io.none) {
        sevSeg := none(2)
      }.otherwise {
        sevSeg := sevenSegDec1.io.out
      }
    }
    is("b0100".U) {
      when(io.full) {
        sevSeg := full(1)
      }.elsewhen(io.set1) {
        sevSeg := set1(1)
      }.elsewhen(io.set2) {
        sevSeg := set2(1)
      }.elsewhen(io.none) {
        sevSeg := none(1)
      }.otherwise {
        sevSeg := sevenSegDec2.io.out
      }
    }
    is("b1000".U) {
      when(io.full) {
        sevSeg := full(0)
      }.elsewhen(io.set1) {
        sevSeg := set1(0)
      }.elsewhen(io.set2) {
        sevSeg := set2(0)
      }.elsewhen(io.none) {
        sevSeg := none(0)
      }.otherwise {
        sevSeg := sevenSegDec3.io.out
      }
    }
  }

  //Connecting coded display signal and display selector
  io.seg := ~sevSeg
  io.an := ~select
}
