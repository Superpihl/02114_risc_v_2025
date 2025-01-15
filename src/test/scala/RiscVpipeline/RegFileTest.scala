package RiscVpipeline

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import RiscVpipeline.RegisterFile

class RegisterFileTester extends AnyFlatSpec with ChiselScalatestTester {
  "RegisterFileTester" should "pass" in {
    test(new RegisterFile).withAnnotations(Seq(WriteVcdAnnotation))
    { dut =>

      def pokeInputs(rs1: UInt, rs2: UInt, writeData: UInt, rd: UInt, writeEnable: UInt): Unit = {
        dut.io.raddr1.poke(rs1)
        dut.io.raddr2.poke(rs2)
        dut.io.wdata.poke(writeData)
        dut.io.waddr.poke(rd)
        dut.io.wrEna.poke(writeEnable)
      }

      def checkOutputs(expectedOp1: UInt, expectedOp2: UInt, message: String): Unit = {
        dut.io.rdata1.expect(expectedOp1, message)
        dut.io.rdata2.expect(expectedOp2, message)
      }

      // RUN 1 (Try to write a value to x1)
      pokeInputs(1.U, 31.U, 42.U, 1.U, 1.U)
      dut.clock.step()
      pokeInputs(1.U, 31.U, 42.U, 1.U, 0.U)
      dut.clock.step()
      checkOutputs(42.U, 0.U, "Error when writing to registerFile x1")

      // RUN 2 (Try to write a value to x2)
      pokeInputs(31.U, 2.U, 42.U, 2.U, 1.U)
      dut.clock.step()
      pokeInputs(31.U, 2.U, 42.U, 2.U, 0.U)
      dut.clock.step()
      checkOutputs(0.U, 42.U, "Error when writing to registerFile x2")

      // RUN 3 (Try to write a value to x0 and hopefully fail)
      pokeInputs(0.U, 31.U, 42.U, 0.U, 1.U)
      dut.clock.step()
      pokeInputs(0.U, 31.U, 42.U, 0.U, 0.U)
      dut.clock.step()
      checkOutputs(0.U, 0.U, "Error when writing to registerFile x0 (should not be possible)")
    }
  }
}