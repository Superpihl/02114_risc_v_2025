package RiscVpipeline

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import RiscVpipeline.AluOperation._


class ALUTester extends AnyFlatSpec with ChiselScalatestTester {
  "ALU" should "correctly perform ALU operations" in {
    test(new ALU).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      // Helper functions
      def pokeInputs(ALUSel: UInt, op1: UInt, op2: UInt): Unit = {
        dut.io.ALUSel.poke(ALUSel)
        dut.io.op1.poke(op1)
        dut.io.op2.poke(op2)
      }
      def checkResult(expected: UInt, message: String): Unit = {
        dut.io.result.expect(expected, message)
      }
      def checkBranch(expected: Bool, message: String): Unit = {
        dut.io.takeBranch.expect(expected, message)
      }

      // Test ALU Add operation
      println("Testing ALU Add operation")
      println(f"AluOperation.Add = ${AluOperation.Add.id.U}")
      pokeInputs(AluOperation.Add.id.U, 5.U, 3.U)
      checkResult(8.U, "Add operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Sub operation
      println("Testing ALU Sub operation")
      println(f"AluOperation.Sub = ${AluOperation.Sub.id.U}")
      pokeInputs(AluOperation.Sub.id.U, 5.U, 3.U)
      checkResult(2.U, "Sub operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU And operation
      println("Testing ALU And operation")
      println(f"AluOperation.And = ${AluOperation.And.id.U}")
      pokeInputs(AluOperation.And.id.U, 5.U, 3.U)
      checkResult(1.U, "And operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Or operation
      println("Testing ALU Or operation")
      println(f"AluOperation = ${AluOperation.Or.id.U}")
      pokeInputs(AluOperation.Or.id.U, 5.U, 3.U)
      checkResult(7.U, "Or operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Xor operation
      println("Testing ALU Xor operation")
      println(f"AluOperation = ${AluOperation.Xor.id.U}")
      pokeInputs(AluOperation.Xor.id.U, 5.U, 3.U)
      checkResult(6.U, "Xor operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Sll operation
      println("Testing ALU Sll operation")
      println(f"AluOperation = ${AluOperation.Sll.id.U}")
      pokeInputs(AluOperation.Sll.id.U, 1.U, 1.U) // 1 << 1 = 2
      checkResult(2.U, "Sll operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Srl operation
      println("Testing ALU Srl operation")
      println(f"AluOperation = ${AluOperation.Srl.id.U}")
      pokeInputs(AluOperation.Srl.id.U, 4.U, 1.U) // 4 >> 1 = 2
      checkResult(2.U, "Srl operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Sra operation
      println("Testing ALU Sra operation")
      println(f"AluOperation = ${AluOperation.Sra.id.U}")
      pokeInputs(AluOperation.Sra.id.U, 4.U, 1.U) // 4 >> 1 = 2 (arithmetic shift)
      checkResult(2.U, "Sra operation failed")
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Slt operation
      println("Testing ALU Slt operation")
      println(f"AluOperation = ${AluOperation.Slt.id.U}")
      pokeInputs(AluOperation.Slt.id.U, 2.U, 3.U)
      checkResult(1.U, "Slt operation failed") // 2 < 3
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Sltu operation
      println("Testing ALU Sltu operation")
      println(f"AluOperation = ${AluOperation.Sltu.id.U}")
      pokeInputs(AluOperation.Sltu.id.U, 2.U, 3.U)
      checkResult(1.U, "Sltu operation failed") // 2 < 3
      println(f"Result = ${dut.io.result.peek()}")

      // Test ALU Beq operation
      println("Testing ALU Beq operation")
      println(f"AluOperation = ${AluOperation.Beq.id.U}")
      pokeInputs(AluOperation.Beq.id.U, 5.U, 5.U)
      checkBranch(true.B, "Beq operation failed") // 5 == 5

      // Test ALU Bne operation
      println("Testing ALU Bne operation")
      println(f"AluOperation = ${AluOperation.Bne.id.U}")
      pokeInputs(AluOperation.Bne.id.U, 5.U, 3.U)
      checkBranch(true.B, "Bne operation failed") // 5 != 3

      // Test ALU Blt operation
      println("Testing ALU Blt operation")
      println(f"AluOperation = ${AluOperation.Blt.id.U}")
      pokeInputs(AluOperation.Blt.id.U, 2.U, 3.U)
      checkBranch(true.B, "Blt operation failed") // 2 < 3

      // Test ALU Bge operation
      println("Testing ALU Bge operation")
      println(f"AluOperation = ${AluOperation.Bge.id.U}")
      pokeInputs(AluOperation.Bge.id.U, 3.U, 2.U)
      checkBranch(true.B, "Bge operation failed") // 3 >= 2

      // Test ALU Bltu operation
      println("Testing ALU Bltu operation")
      println(f"AluOperation = ${AluOperation.Bltu.id.U}")
        pokeInputs(AluOperation.Bltu.id.U, 2.U, 3.U)
        checkBranch(true.B, "Bltu operation failed") // 2 < 3

        // Test ALU Bgeu operation
        println("Testing ALU Bgeu operation")
      println(f"AluOperation = ${AluOperation.Bgeu.id.U}")
        pokeInputs(AluOperation.Bgeu.id.U, 3.U, 2.U)
        checkBranch(true.B, "Bgeu operation failed") // 3 >= 2

        // Test ALU Jal operation
        println("Testing ALU Jal operation")
        pokeInputs(AluOperation.Jal.id.U, 0.U, 0.U)
        checkBranch(true.B, "Jal operation failed") // Should always take branch

        // Test ALU Jalr operation
        println("Testing ALU Jalr operation")
        pokeInputs(AluOperation.Jalr.id.U, 0.U, 0.U)
        checkBranch(true.B, "Jalr operation failed") // Should always take branch

        // Test invalid ALUSel case
        println("Testing invalid ALUSel value")
        pokeInputs(20.U, 5.U, 3.U) // Invalid ALUSel
        checkResult(0.U, "Invalid ALUSel should result in default output")
        checkBranch(false.B, "Invalid ALUSel should not take branch")
    }
  }
}