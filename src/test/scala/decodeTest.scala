package RISCVsim

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class decodeTest extends AnyFlatSpec with ChiselScalatestTester {
  "Decoder" should "pass" in {
    test(new cpu).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      println("damn")
      dut.clock.step(5)
      dut.io.test.expect(0.U)
      dut.io.test2.expect(0.U)
      dut.io.test3.expect(0.U)
      dut.clock.step(1)
      dut.io.test2.expect(10.U)
      dut.clock.step(1)
      dut.io.test.expect(1.U)
      dut.clock.step(4)
      dut.io.test.expect(2.U)
      dut.clock.step(28)
      dut.io.test.expect(9.U)
      dut.clock.step(4)
      dut.io.test.expect(10.U)
      dut.clock.step(6)
      dut.io.test.expect(10.U)
      dut.io.test2.expect(10.U)
      dut.io.test3.expect(10.U)
      dut.clock.step(1)

    }
  }
}