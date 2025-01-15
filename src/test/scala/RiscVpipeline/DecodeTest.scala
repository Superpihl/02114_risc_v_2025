package RiscVpipeline
/*
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class DecodeTest extends AnyFlatSpec with ChiselScalatestTester {
  "InstructionDecoder" should "correctly decode instructions" in {
    test(new InstructionDecoder).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      // Helper function to poke instruction and check decoded outputs
      def pokeAndCheck(instruction: UInt, expected: DecodedInstr): Unit = {
        dut.io.instruction.poke(instruction)
        dut.io.decoded.instrType.expect(expected.instrType, "Instruction type mismatch")
        dut.io.decoded.isImm.expect(expected.isImm, "Immediate flag mismatch")
        dut.io.decoded.isLui.expect(expected.isLui, "LUI flag mismatch")
        dut.io.decoded.isAuiPc.expect(expected.isAuiPc, "AUIPC flag mismatch")
        dut.io.decoded.isLoad.expect(expected.isLoad, "Load flag mismatch")
        dut.io.decoded.isStore.expect(expected.isStore, "Store flag mismatch")
        dut.io.decoded.isBranch.expect(expected.isBranch, "Branch flag mismatch")
        dut.io.decoded.isJal.expect(expected.isJal, "JAL flag mismatch")
        dut.io.decoded.isJalr.expect(expected.isJalr, "JALR flag mismatch")
        dut.io.decoded.rfWrite.expect(expected.rfWrite, "RF Write flag mismatch")
        dut.io.decoded.rs1Valid.expect(expected.rs1Valid, "RS1 Valid flag mismatch")
        dut.io.decoded.rs2Valid.expect(expected.rs2Valid, "RS2 Valid flag mismatch")
        dut.io.decoded.imm.expect(expected.imm, "Immediate value mismatch")
        dut.io.decoded.aluOp.expect(expected.aluOp, "ALU operation code mismatch")
        dut.io.decoded.writeBackRegId.expect(expected.writeBackRegId, "Write back register ID mismatch")
      }

      // Test R-type instruction (e.g., ADD)
      println("Testing R-type instruction (ADD)")
      val rTypeInstr = "b0000000_00001_00010_000_00011_0110011".U // ADD x3, x1, x2
      val expectedRType = new DecodedInstr {
        instrType := 0.U
        isImm := false.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := true.B
        rs1Valid := true.B
        rs2Valid := true.B
        imm := 0.U
        aluOp := "b000".U
        writeBackRegId := 3.U
      }
      pokeAndCheck(rTypeInstr, expectedRType)

      // Test I-type instruction (e.g., ADDI)
      println("Testing I-type instruction (ADDI)")
      val iTypeInstr = "b000000000001_00010_000_00011_0010011".U // ADDI x3, x2, 1
      val expectedIType = new DecodedInstr {
        instrType := 1.U
        isImm := true.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := true.B
        rs1Valid := true.B
        rs2Valid := false.B
        imm := 1.U
        aluOp := "b001".U
        writeBackRegId := 3.U
      }
      pokeAndCheck(iTypeInstr, expectedIType)

      // Test Load instruction (e.g., LW)
      println("Testing Load instruction (LW)")
      val loadInstr = "b000000000001_00010_010_00011_0000011".U // LW x3, 1(x2)
      val expectedLoad = new DecodedInstr {
        instrType := 1.U
        isImm := true.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := true.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := true.B
        rs1Valid := true.B
        rs2Valid := false.B
        imm := 1.U
        aluOp := "b010".U
        writeBackRegId := 3.U
      }
      pokeAndCheck(loadInstr, expectedLoad)

      // Test Store instruction (e.g., SW)
      println("Testing Store instruction (SW)")
      val storeInstr = "b000000000001_00010_010_00011_0100011".U // SW x3, 1(x2)
      val expectedStore = new DecodedInstr {
        instrType := 2.U
        isImm := true.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := true.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := false.B
        rs1Valid := true.B
        rs2Valid := true.B
        imm := 1.U
        aluOp := "b011".U
        writeBackRegId := 0.U // No write back for store
      }
      pokeAndCheck(storeInstr, expectedStore)

      // Test Branch instruction (e.g., BEQ)
      println("Testing Branch instruction (BEQ)")
      val branchInstr = "b0000000_00001_00010_000_00011_1100011".U // BEQ x1, x2, offset
      val expectedBranch = new DecodedInstr {
        instrType := 3.U
        isImm := true.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := true.B
        isJal := false.B
        isJalr := false.B
        rfWrite := false.B
        rs1Valid := true.B
        rs2Valid := true.B
        imm := 0.U // Immediate value would be calculated based on the offset
        aluOp := "b100".U
        writeBackRegId := 0.U // No write back for branch
      }
      pokeAndCheck(branchInstr, expectedBranch)

      // Test JAL instruction
      println("Testing JAL instruction")
      val jalInstr = "b000000000000_00000_000_00001_1101111".U // JAL x1, offset
      val expectedJal = new DecodedInstr {
        instrType := 4.U
        isImm := true.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := true.B
        isJalr := false.B
        rfWrite := true.B
        rs1Valid := false.B
        rs2Valid := false.B
        imm := 0.U // Immediate value would be calculated based on the offset
        aluOp := 0.U // ALU operation not applicable for JAL
        writeBackRegId := 1.U
      }
      pokeAndCheck(jalInstr, expectedJal)

      // Test JALR instruction
      println("Testing JALR instruction")
      val jalrInstr = "b000000000001_00001_000_00010_1100111".U // JALR x2, 1(x1)
      val expectedJalr = new DecodedInstr {
        instrType := 1.U
        isImm := true.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := true.B
        rfWrite := true.B
        rs1Valid := true.B
        rs2Valid := false.B
        imm := 1.U
        aluOp := "b001".U
        writeBackRegId := 2.U
      }
      pokeAndCheck(jalrInstr, expectedJalr)

      // Test LUI instruction
      println("Testing LUI instruction")
      val luiInstr = "b000000000000_00001_00000_00001_0110111".U // LUI x1, 0
      val expectedLui = new DecodedInstr {
        instrType := 5.U
        isImm := true.B
        isLui := true.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := true.B
        rs1Valid := false.B
        rs2Valid := false.B
        imm := 0.U // Immediate value would be calculated based on the instruction
        aluOp := 0.U // ALU operation not applicable for LUI
        writeBackRegId := 1.U
      }
      pokeAndCheck(luiInstr, expectedLui)

      // Test AUIPC instruction
      println("Testing AUIPC instruction")
      val auipcInstr = "b000000000000_00001_00000_00001_0010111".U // AUIPC x1, 0
      val expectedAuipc = new DecodedInstr {
        instrType := 5.U
        isImm := true.B
        isLui := false.B
        isAuiPc := true.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := true.B
        rs1Valid := false.B
        rs2Valid := false.B
        imm := 0.U // Immediate value would be calculated based on the instruction
        aluOp := 0.U // ALU operation not applicable for AUIPC
        writeBackRegId := 1.U
      }
      pokeAndCheck(auipcInstr, expectedAuipc)

      // Test invalid instruction
      println("Testing invalid instruction")
      val invalidInstr = "b111111111111_11111_111_11111_1111111".U // Invalid instruction
      val expectedInvalid = new DecodedInstr {
        instrType := 6.U // Assuming 6 is used for invalid instruction type
        isImm := false.B
        isLui := false.B
        isAuiPc := false.B
        isLoad := false.B
        isStore := false.B
        isBranch := false.B
        isJal := false.B
        isJalr := false.B
        rfWrite := false.B
        rs1Valid := false.B
        rs2Valid := false.B
        imm := 0.U
        aluOp := 0.U
        writeBackRegId := 0.U // No write back for invalid instruction
      }
      pokeAndCheck(invalidInstr, expectedInvalid)
    }
  }
}

 */