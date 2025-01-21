package RISCVsim

import chisel3._
import chisel3.util._

class SevenSegDec extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(4.W))
    val out = Output(UInt(7.W))
  })

  val sevSeg = WireDefault(0.U)

  //Table for conversion

  switch(io.in) {
    is(0x0.U) {
      sevSeg := "b0111111".U
    }
    is(0x1.U) {
      sevSeg := "b0000110".U
    }
    is(0x2.U) {
      sevSeg := "b1011011".U
    }
    is(0x3.U) {
      sevSeg := "b1001111".U
    }
    is(0x4.U) {
      sevSeg := "b1100110".U
    }
    is(0x5.U) {
      sevSeg := "b1101101".U
    }
    is(0x6.U) {
      sevSeg := "b1111101".U
    }
    is(0x7.U) {
      sevSeg := "b0000111".U
    }
    is(0x8.U) {
      sevSeg := "b1111111".U
    }
    is(0x9.U) {
      sevSeg := "b1101111".U
    }
    is(0xa.U) {
      sevSeg := "b1110111".U
    }
    is(0xb.U) {
      sevSeg := "b1111100".U
    }
    is(0xc.U) {
      sevSeg := "b0111001".U
    }
    is(0xd.U) {
      sevSeg := "b1011110".U
    }
    is(0xe.U) {
      sevSeg := "b1111001".U
    }
    is(0xf.U) {
      sevSeg := "b1110001".U
    }
  }

  //Connection to output
  io.out := sevSeg
}


