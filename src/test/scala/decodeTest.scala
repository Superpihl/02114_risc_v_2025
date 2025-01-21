package RISCVsim

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class decodeTest extends AnyFlatSpec with ChiselScalatestTester {
  "Decoder" should "pass" in {
    test(new cpu).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      println("damn")
      dut.clock.setTimeout(3000)

      dut.clock.step(20)

      /*dut.clock.step(5)
      dut.io.test2.expect(0x1000.U)
      dut.io.test1.expect(0.U)

      dut.clock.step(1)
      dut.io.test1.expect(0x8.U)

      dut.clock.step(3)
      dut.io.test2.expect(0xff0.U)
      dut.io.test8.expect(0.U)

      dut.clock.step(3)
      dut.io.test8.expect(0x1000.U)
      dut.io.test10.expect(0.U)

      dut.clock.step(1)
      dut.io.test10.expect(0x64.U)

      dut.clock.step(1)
      dut.io.test1.expect(0x80.U)
      dut.io.test2.expect(0xff0.U)
      dut.io.test15.expect(0.U)

      dut.clock.step(3)
      dut.io.test2.expect(0xfd0.U)
      dut.io.test8.expect(0x001000.U)
      dut.io.test15.expect(0.U)

      dut.clock.step(3)
      dut.io.test8.expect(0x00ff0.U)
      dut.io.test15.expect(0.U)

      dut.clock.step(2)
      dut.io.test15.expect(0x64.U)
      
      dut.clock.step(7)
      dut.io.test15.expect(0x63.U)

      dut.clock.step(1)
      dut.io.test10.expect(0x63.U)
      dut.clock.step(1)
      dut.io.test1.expect(0x4c.U)
      dut.io.test0.expect(0.U)

      dut.clock.step(1711-31)
      dut.io.test1.expect(0x4c.U)
      dut.io.test2.expect(0x370.U)
      //dut.io.test3.expect(0x10000000.U)
      dut.io.test10.expect(1.U)
      dut.io.test15.expect(1.U)
      dut.io.test17.expect(0.U)
      dut.clock.step(2)
      dut.io.test10.expect(0.U)
      dut.io.test15.expect(0.U)
      dut.clock.step(4)
      dut.io.test2.expect(0x350.U)
      dut.clock.step(3)
      dut.io.test8.expect(0x370.U)
      dut.clock.step(4)
      dut.io.test15.expect(0.U)
      dut.io.test0.expect(0.U)
      dut.clock.step(1)
      dut.io.test15.expect(1.U)
      dut.clock.step(4)
      dut.io.test10.expect(1.U)
      dut.clock.step(2)
      dut.io.test8.expect(0x390.U)
      dut.clock.step(9)
      dut.io.test8.expect(0x3b0.U)
      dut.clock.step(6*9)
      dut.io.test8.expect(0x470.U)
      dut.io.test2.expect(0x430.U)
      dut.clock.step(1)
      dut.io.test2.expect(0x450.U)
      dut.clock.step(5)
      dut.io.test15.expect(9.U)
      dut.clock.step(1)
      dut.io.test10.expect(9.U)
      dut.clock.step(2)
      dut.io.test8.expect(0x490.U)
      dut.clock.step(1)
      dut.io.test2.expect(0x470.U)

      dut.clock.step(2215-(1711+2+4+3+4+1+4+2+9+6*9+1+5+1+2+1))
      dut.io.test10.expect(0x37.U)
      dut.io.test15.expect(0x37.U)
      dut.clock.step(2)
      dut.io.test8.expect(0xa50.U)
      /*dut.io.test10.expect(0x64.U)
      dut.io.test15.expect(0x64.U)
      dut.io.test8.expect(0xfffd0.U)
      dut.clock.step(2)
      dut.io.test8.expect(0xffff0.U)
      dut.clock.step(8)
      dut.io.test1.expect(0x80.U)*/
      //dut.io.test1.expect(0x8.U)
      //dut.io.test2.expect(0x00100000.U)
      //dut.io.test3.expect(0x10000000.U)
      dut.clock.step(2642-2215)
      dut.io.test10.expect(0x65.U)
      dut.io.test15.expect(0x65.U)
      dut.io.test17.expect(0xa.U)*/
      
      /*width.bin
      
      dut.clock.step(4)
      dut.io.test5.expect(0.U)
      dut.io.test6.expect(0.U)
      dut.io.test11.expect(0.U)
      dut.clock.step(1)
      dut.io.test5.expect("b10101011110011011111000000000000".U)
      dut.clock.step(1)
      dut.io.test5.expect("b10101011110011011110111110101011".U)
      dut.clock.step(1)
      dut.io.test6.expect(0x7f)
      dut.clock.step(4)
      dut.io.test11.expect("b11111111111111111111111110101011".U)
      dut.clock.step(1)
      dut.io.test12.expect("b11111111111111111110111110101011".U)
      dut.clock.step(1)
      dut.io.test13.expect("b10101011110011011110111110101011".U)
      dut.clock.step(1)
      dut.io.test14.expect(0x000000ab.U)
      dut.clock.step(1)
      dut.io.test15.expect(0x0000efab.U)
      dut.clock.step(1)
      dut.io.test16.expect("b10101011111011111010101110101011".U)
      dut.clock.step(1)
      dut.io.test5.expect("b10101011110011011110111110101011".U)
      dut.io.test6.expect(0x7f)
      dut.io.test11.expect("b11111111111111111111111110101011".U)
      dut.io.test12.expect("b11111111111111111110111110101011".U)
      dut.io.test13.expect("b10101011110011011110111110101011".U)
      dut.io.test14.expect(0x000000ab.U)
      dut.io.test15.expect(0x0000efab.U)
      dut.io.test16.expect("b10101011111011111010101110101011".U)
      dut.io.test17.expect(0x0000000a.U)*/

    }
  }
}