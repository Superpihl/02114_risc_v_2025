package RISCVsim

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class decodeTest extends AnyFlatSpec with ChiselScalatestTester {
  "Decoder" should "pass" in {
    test(new cpu).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      println("damn")
      dut.clock.step(4)
      dut.io.test.expect(0.U)
      dut.io.test2.expect(0.U)
      dut.io.test3.expect(0.U)
      dut.clock.step(1)
      dut.io.test.expect("b10101011110011011111000000000000".U)
      dut.clock.step(1)
      dut.io.test.expect("b10101011110011011110111110101011".U)
      dut.clock.step(1)
      dut.io.test2.expect(0x7f)
      dut.clock.step(4)
      dut.io.test3.expect("b11111111111111111111111110101011".U)
      dut.clock.step(1)
      dut.io.test4.expect("b11111111111111111110111110101011".U)
      dut.clock.step(1)
      dut.io.test5.expect("b10101011110011011110111110101011".U)
      dut.clock.step(1)
      dut.io.test6.expect(0x000000ab.U)
      dut.clock.step(1)
      dut.io.test7.expect(0x0000efab.U)
      dut.clock.step(1)
      dut.io.test8.expect("b10101011111011111010101110101011".U)
      dut.clock.step(1)
      dut.io.test.expect("b10101011110011011110111110101011".U)
      dut.io.test2.expect(0x7f)
      dut.io.test3.expect("b11111111111111111111111110101011".U)
      dut.io.test4.expect("b11111111111111111110111110101011".U)
      dut.io.test5.expect("b10101011110011011110111110101011".U)
      dut.io.test6.expect(0x000000ab.U)
      dut.io.test7.expect(0x0000efab.U)
      dut.io.test8.expect("b10101011111011111010101110101011".U)
      dut.io.test9.expect(0x0000000a.U)

    }
  }
}