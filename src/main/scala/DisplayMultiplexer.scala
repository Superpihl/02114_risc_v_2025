import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val hex = Input(UInt(16.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  //Wire default, default selections of display and displaystatec
  val sevSeg = WireDefault("b1111111".U(7.W));
  val select = WireDefault("b0001".U(4.W))

  //creating of decoding modules (Importing SevenSegDecoder)
  val sevenSegDec0 = Module(new SevenSegDec())
  val sevenSegDec1 = Module(new SevenSegDec())
  val sevenSegDec2 = Module(new SevenSegDec())
  val sevenSegDec3 = Module(new SevenSegDec())
  val CNT_MAX = 10.U

  val cntReg = RegInit(0.U(32.W))
  val outReg = RegInit(1.U(4.W))

  //Display lighting shifting, so each display gets adequate time to
  //light up but also is perceived they are all on at the same time
  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {
    cntReg := 0.U
    outReg := outReg(0) ## outReg(3, 1)
  }
  select := outReg

  //Connection decoders to input values.
  sevenSegDec0.io.in := io.hex(3, 0)
  sevenSegDec1.io.in := io.hex(7, 4)
  sevenSegDec2.io.in := io.hex(11, 8)
  sevenSegDec3.io.in := io.hex(15, 12)

  //Switch statement switching what data to send according to which display is currently displaying
  switch(select) {
    is("b0001".U) {
      sevSeg := sevenSegDec0.io.out
    }
    is("b0010".U) {
        sevSeg := sevenSegDec1.io.out
    }
    is("b0100".U) {
        sevSeg := sevenSegDec2.io.out
    }
    is("b1000".U) {
        sevSeg := sevenSegDec3.io.out
    }
  }

  //Connecting coded display signal and display selector
  io.seg := ~sevSeg
  io.an := ~select
}
