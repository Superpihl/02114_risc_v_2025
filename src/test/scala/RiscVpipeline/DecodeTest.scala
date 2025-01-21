package RiscVpipeline

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class DecodeTest extends AnyFlatSpec with ChiselScalatestTester {
  "InstructionDecoder" should "correctly decode instructions" in {
    test(new InstructionDecoder).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      // Input value
      dut.io.instruction.poke("h12300093".U(32.W))

      // Step the clock to see output
      dut.clock.step(1)

      // Helper function to print the state
      def printState(): Unit = {
        println("\n State:")
        println("instrType: " + dut.io.decoded.instrType.peek().litValue) // Print instruction type
        println("rs1: " + dut.io.decoded.rs1.peek().litValue)            // Source register 1
        println("rs2: " + dut.io.decoded.rs2.peek().litValue)            // Source register 2
        println("rd: " + dut.io.decoded.writeBackRegId.peek().litValue) // Destination register
        println("opcode: " + dut.io.decoded.aluOp.peek().litValue.toInt.toBinaryString.reverse.padTo(7, '0').reverse) // Opcode in binary
        println("funct3: " + dut.io.decoded.funct3.peek().litValue)      // Function field 3
        println("funct7: " + dut.io.decoded.funct7.peek().litValue)      // Function field 7
        println("\n")
      }

      printState()

      dut.clock.step(1)

      // Test R-type instruction (ADD)
      println("Testing R-type instruction (ADD)")
      val rTypeInstr = "b0000000_00001_00010_000_00011_0110011".U // ADD x3, x1, x2
      dut.io.instruction.poke(rTypeInstr)
      dut.clock.step(1)
      printState()

      // Expected values for ADD
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.R.id.U.litValue, "Instruction type mismatch for ADD")
      assert(dut.io.decoded.rs1.peek().litValue == 2, "RS1 mismatch for ADD")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for ADD")
      assert(dut.io.decoded.funct3.peek().litValue == "b000".U.litValue, "Funct3 mismatch for ADD")
      assert(dut.io.decoded.funct7.peek().litValue == "b0000000".U.litValue, "Funct7 mismatch for ADD")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.Alu.litValue, "ALU operation code mismatch for ADD")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 3, "Write back register ID mismatch for ADD")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for ADD")

      // Test I-type instruction (ADDI)
      println("Testing I-type instruction (ADDI)")
      val iTypeInstr = "b000000000001_00010_000_00011_0010011".U // ADDI x3, x2, 1
      dut.io.instruction.poke(iTypeInstr)
      dut.clock.step(1)
      printState()

      // Expected values for ADDI
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for ADDI")
      assert(dut.io.decoded.rs1.peek().litValue == 2, "RS1 mismatch for ADDI")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for ADDI")
      assert(dut.io.decoded.funct3.peek().litValue == "b000".U.litValue, "Funct3 mismatch for ADDI")
      assert(dut.io.decoded.imm.peek().litValue == 1, "Immediate value mismatch for ADDI")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.AluImm.litValue, "ALU operation code mismatch for ADDI")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 3, "Write back register ID mismatch for ADDI")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for ADDI")

      // Test SUB instruction (R-Type)
      println("Testing SUB instruction")
      val subInstruction = "b0100000_00100_00011_000_00101_0110011".U // SUB x5 = x3 - x4
      dut.io.instruction.poke(subInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for SUB
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.R.id.U.litValue, "Instruction type mismatch for SUB")
      assert(dut.io.decoded.rs1.peek().litValue == 3, "RS1 mismatch for SUB")
      assert(dut.io.decoded.rs2.peek().litValue == 4, "RS2 mismatch for SUB")
      assert(dut.io.decoded.funct3.peek().litValue == "b000".U.litValue, "Funct3 mismatch for SUB")
      assert(dut.io.decoded.funct7.peek().litValue == "b0100000".U.litValue, "Funct7 mismatch for SUB")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.Alu.litValue, "ALU operation code mismatch for SUB")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 5, "Write back register ID mismatch for SUB")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for SUB")

      // Test AND instruction (R-Type)
      println("Testing AND instruction")
      val andInstruction = "b0000000_00110_00101_111_00111_0110011".U // AND x7 = x5 & x6
      dut.io.instruction.poke(andInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for AND
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.R.id.U.litValue, "Instruction type mismatch for AND")
      assert(dut.io.decoded.rs1.peek().litValue == 5, "RS1 mismatch for AND")
      assert(dut.io.decoded.rs2.peek().litValue == 6, "RS2 mismatch for AND")
      assert(dut.io.decoded.funct3.peek().litValue == "b111".U.litValue, "Funct3 mismatch for AND")
      assert(dut.io.decoded.funct7.peek().litValue == "b0000000".U.litValue, "Funct7 mismatch for AND")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.Alu.litValue, "ALU operation code mismatch for AND")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 7, "Write back register ID mismatch for AND")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for AND")

      // Test ORI instruction (I-Type)
      println("Testing ORI instruction")
      val oriInstruction = "b000000001011_00010_110_00011_0010011".U // ORI x3 = x2 | 11
      dut.io.instruction.poke(oriInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for ORI
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for ORI")
      assert(dut.io.decoded.rs1.peek().litValue == 2, "RS1 mismatch for ORI")
      assert(dut.io.decoded.rs2.peek().litValue == 11, "RS2 mismatch for ORI")
      assert(dut.io.decoded.funct3.peek().litValue == "b110".U.litValue, "Funct3 mismatch for ORI")
      assert(dut.io.decoded.imm.peek().litValue == 11, "Immediate value mismatch for ORI")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.AluImm.litValue, "ALU operation code mismatch for ORI")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 3, "Write back register ID mismatch for ORI")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for ORI")

      // Test ANDI instruction (I-Type)
      println("Testing ANDI instruction")
      val andiInstruction = "b000000000011_00011_111_00100_0010011".U // ANDI x4 = x3 & 3
      dut.io.instruction.poke(andiInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for ANDI
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for ANDI")
      assert(dut.io.decoded.rs1.peek().litValue == 3, "RS1 mismatch for ANDI")
      assert(dut.io.decoded.rs2.peek().litValue == 3, "RS2 mismatch for ANDI")
      assert(dut.io.decoded.funct3.peek().litValue == "b111".U.litValue, "Funct3 mismatch for ANDI")
      assert(dut.io.decoded.imm.peek().litValue == 3, "Immediate value mismatch for ANDI")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.AluImm.litValue, "ALU operation code mismatch for ANDI")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 4, "Write back register ID mismatch for ANDI")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for ANDI")

      // Test Slli instruction (I-Type)
      println("Testing Slli instruction")
      val slliInstruction = "h00101093".U // slli x1, x0, 1
      dut.io.instruction.poke(slliInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for Slli
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for Slli")
      assert(dut.io.decoded.rs1.peek().litValue == 0, "RS1 mismatch for Slli")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for Slli")
      assert(dut.io.decoded.funct3.peek().litValue == "b001".U.litValue, "Funct3 mismatch for Slli")
      assert(dut.io.decoded.imm.peek().litValue == 1, "Immediate value mismatch for Slli")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.AluImm.litValue, "ALU operation code mismatch for Slli")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 1, "Write back register ID mismatch for Slli")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for Slli")

      // Test Srli instruction (I-Type)
      println("Testing Srli instruction")
      val srliInstruction = "h00105093".U // srli x1, x0, 1
      dut.io.instruction.poke(srliInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for Srli
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for Srli")
      assert(dut.io.decoded.rs1.peek().litValue == 0, "RS1 mismatch for Srli")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for Srli")
      assert(dut.io.decoded.funct3.peek().litValue == "b101".U.litValue, "Funct3 mismatch for Srli")
      assert(dut.io.decoded.imm.peek().litValue == 1, "Immediate value mismatch for Srli")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.AluImm.litValue, "ALU operation code mismatch for Srli")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 1, "Write back register ID mismatch for Srli")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for Srli")

      // Test Srai instruction (I-Type)
      println("Testing Srai instruction")
      val sraiInstruction = "h40105093".U // srai x1, x0, 1
      dut.io.instruction.poke(sraiInstruction)
      dut.clock.step(1)
      printState()

      // Expected values for Srai
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for Srai")
      assert(dut.io.decoded.rs1.peek().litValue == 0, "RS1 mismatch for Srai")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for Srai")
      assert(dut.io.decoded.funct3.peek().litValue == "b101".U.litValue, "Funct3 mismatch for Srai")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.AluImm.litValue, "ALU operation code mismatch for Srai")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 1, "Write back register ID mismatch for Srai")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for Srai")

      // Test Load instruction (e.g., LW)
      println("Testing Load instruction (LW)")
      val loadInstr = "b000000000001_00010_010_00011_0000011".U // LW x3, 1(x2)
      dut.io.instruction.poke(loadInstr)
      dut.clock.step(1)
      printState()

      // Expected values for LW
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for LW")
      assert(dut.io.decoded.rs1.peek().litValue == 2, "RS1 mismatch for LW")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for LW")
      assert(dut.io.decoded.funct3.peek().litValue == "b010".U.litValue, "Funct3 mismatch for LW")
      assert(dut.io.decoded.imm.peek().litValue == 1, "Immediate value mismatch for LW")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.load.litValue, "ALU operation code mismatch for LW")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 3, "Write back register ID mismatch for LW")
      assert(dut.io.decoded.rfWrite.peek().litValue == true.B.litValue, "RF Write flag mismatch for LW")

      // Test Store instruction (e.g., SW)
      println("Testing Store instruction (SW)")
      val storeInstr = "b000000000001_00010_010_00011_0100011".U // SW x3, 1(x2)
      dut.io.instruction.poke(storeInstr)
      dut.clock.step(1)
      printState()

      // Expected values for SW
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.S.id.U.litValue, "Instruction type mismatch for SW")
      assert(dut.io.decoded.rs1.peek().litValue == 2, "RS1 mismatch for SW")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for SW")
      assert(dut.io.decoded.funct3.peek().litValue == "b010".U.litValue, "Funct3 mismatch for SW")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.store.litValue, "ALU operation code mismatch for SW")

      // Test Branch instruction (e.g., BEQ)
      println("Testing Branch instruction (BEQ)")
      val branchInstr = "b0000000_00001_00010_000_00011_1100011".U // BEQ x1, x2, offset
      dut.io.instruction.poke(branchInstr)
      dut.clock.step(1)
      printState()

      // Expected values for BEQ
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.B.id.U.litValue, "Instruction type mismatch for BEQ")
      assert(dut.io.decoded.rs1.peek().litValue == 2, "RS1 mismatch for BEQ")
      assert(dut.io.decoded.rs2.peek().litValue == 1, "RS2 mismatch for BEQ")
        assert(dut.io.decoded.funct3.peek().litValue == "b000".U.litValue, "Funct3 mismatch for BEQ")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.branch.litValue, "ALU operation code mismatch for BEQ")

      // Test JAL instruction
      println("Testing JAL instruction")
      val jalInstr = "b000000000000_00000_000_00001_1101111".U // JAL x1, offset
      dut.io.instruction.poke(jalInstr)
      dut.clock.step(1)
      printState()

      // Expected values for JAL
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.J.id.U.litValue, "Instruction type mismatch for JAL")
      assert(dut.io.decoded.rs1.peek().litValue == 0, "RS1 mismatch for JAL")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 1, "Write back register ID mismatch for JAL")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.jal.litValue, "ALU operation code mismatch for JAL")

      // Test JALR instruction
      println("Testing JALR instruction")
      val jalrInstr = "b000000000001_00001_000_00010_1100111".U // JALR x2, 1(x1)
      dut.io.instruction.poke(jalrInstr)
      dut.clock.step(1)
      printState()

      // Expected values for JALR
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.I.id.U.litValue, "Instruction type mismatch for JALR")
      assert(dut.io.decoded.rs1.peek().litValue == 1, "RS1 mismatch for JALR")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 2, "Write back register ID mismatch for JALR")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.jalr.litValue, "ALU operation code mismatch for JALR")

      // Test LUI instruction
      println("Testing LUI instruction")
      val luiInstr = "b000000000000_00001_00000_00001_0110111".U // LUI x1, 0
      dut.io.instruction.poke(luiInstr)
      dut.clock.step(1)
      printState()

      // Expected values for LUI
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.U.id.U.litValue, "Instruction type mismatch for LUI")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 1, "Write back register ID mismatch for LUI")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.lui.litValue, "ALU operation code mismatch for LUI")

      // Test AUIPC instruction
      println("Testing AUIPC instruction")
      val auipcInstr = "b000000000000_00001_00000_00001_0010111".U // AUIPC x1, 0
      dut.io.instruction.poke(auipcInstr)
      dut.clock.step(1)
      printState()

      // Expected values for AUIPC
      assert(dut.io.decoded.instrType.peek().litValue == InstrType.U.id.U.litValue, "Instruction type mismatch for AUIPC")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 1, "Write back register ID mismatch for AUIPC")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.auipc.litValue, "ALU operation code mismatch for AUIPC")

      // Test invalid instruction
      println("Testing invalid instruction")
      val invalidInstr = "b111111111111_11111_111_11111_1111111".U // Invalid instruction
      dut.io.instruction.poke(invalidInstr)
      dut.clock.step(1)
      printState()

      // Expected values for invalid instruction
      /*
      assert(dut.io.decoded.instrType.peek().litValue == 6.U.litValue, "Instruction type mismatch for invalid instruction")
      assert(dut.io.decoded.rs1.peek().litValue == 0, "RS1 mismatch for invalid instruction")
      assert(dut.io.decoded.rs2.peek().litValue == 0, "RS2 mismatch for invalid instruction")
      assert(dut.io.decoded.writeBackRegId.peek().litValue == 0, "Write back register ID mismatch for invalid instruction")
      assert(dut.io.decoded.aluOp.peek().litValue == Opcode.Invalid.litValue, "ALU operation code mismatch for invalid instruction")

       */
    }
  }
}
