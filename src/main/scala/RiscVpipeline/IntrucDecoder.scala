package RiscVpipeline

import chisel3._
import chisel3.util._

class DecodedInstr extends Bundle {
  val instrType = Output(UInt(3.W)) // Instruction type (R, I, S, B, U, J)
  val rs1 = Output(UInt(5.W))         // Output for first operand
  val rs2 = Output(UInt(5.W))         // Output for second operand
  val funct3 = Output(UInt(3.W))
  val funct7 = Output(UInt(7.W))
  val imm = Output(UInt(32.W))        // Immediate value
  val aluOp = Output(UInt(7.W))       // ALU operation code
  val writeBackRegId = Output(UInt(5.W)) // Register ID for write back
  // Boolean
  val isImm = Output(Bool())          // Indicates if the instruction uses an immediate
  val isLui = Output(Bool())          // Indicates LUI instruction
  val isAuiPc = Output(Bool())        // Indicates AUIPC instruction
  val isLoad = Output(Bool())         // Indicates Load instruction
  val isStore = Output(Bool())        // Indicates Store instruction
  val isBranch = Output(Bool())       // Indicates Branch instruction
  val isJal = Output(Bool())          // Indicates JAL instruction
  val isJalr = Output(Bool())         // Indicates JALR instruction
  val rfWrite = Output(Bool())        // Indicates if the register file should be written
}

class InstructionDecoder extends Module {
  val io = IO(new Bundle {
    val instruction = Input(UInt(32.W))
    val decoded = new DecodedInstr()
  })

  // Default values for outputs
  io.decoded := 0.U.asTypeOf(new DecodedInstr)

  // Extract opcode / Control signals
  io.decoded.aluOp := io.instruction(6, 0)
  io.decoded.writeBackRegId := io.instruction(11, 7)
  io.decoded.rs1 := io.instruction(19, 15)
  io.decoded.rs2 := io.instruction(24, 20)
  io.decoded.funct3 := io.instruction(14, 12)
  io.decoded.funct7 := io.instruction(31, 25)

  // Default values for outputs
  io.decoded.instrType := 0.U // Invalid instruction type
  io.decoded.rfWrite := false.B
  io.decoded.isImm := false.B
  io.decoded.isLoad := false.B
  io.decoded.isStore := false.B
  io.decoded.isBranch := false.B
  io.decoded.isJal := false.B
  io.decoded.isJalr := false.B
  io.decoded.isLui := false.B
  io.decoded.isAuiPc := false.B

  // Decode instruction type based on opcode
  switch(io.decoded.aluOp) {
    is("b0110011".U) { // R-type
      io.decoded.instrType := 0.U // R-type
      io.decoded.rfWrite := true.B
      io.decoded.rs1Valid := true.B
      io.decoded.rs2Valid := true.B
    }
    is("b0010011".U) { // I-type ALU
      io.decoded.instrType := 1.U // I-type
      io.decoded.rfWrite := true.B
      io.decoded.isImm := true.B
    }
    is("b0000011".U) { // Load
      io.decoded.instrType := 1.U // I-type
      io.decoded.rfWrite := true.B
      io.decoded.isLoad := true.B
      io.decoded.isImm := true.B
    }
    is("b0100011".U) { // Store
      io.decoded.instrType := 2.U // S-type
      io.decoded.isStore := true.B
      io.decoded.isImm := true.B
    }
    is("b1100011".U) { // Branch
      io.decoded.instrType := 3.U // B-type
      io.decoded.isBranch := true.B
      io.decoded.isImm := true.B
    }
    is("b1101111".U) { // JAL
      io.decoded.instrType := 4.U // J-type
      io.decoded.rfWrite := true.B
      io.decoded.isJal := true.B
    }
    is("b1100111".U) { // JALR
      io.decoded.instrType := 1.U // I-type
      io.decoded.rfWrite := true.B
      io.decoded.isJalr := true.B
      io.decoded.isImm := true.B
    }
    is("b0110111".U) { // LUI
      io.decoded.instrType := 5.U // U-type
      io.decoded.rfWrite := true.B
      io.decoded.isLui := true.B
    }
    is("b0010111".U) { // AUIPC
      io.decoded.instrType := 5.U // U-type
      io.decoded.rfWrite := true.B
      io.decoded.isAuiPc := true.B
    }

    // Add additional cases for other opcodes as needed

  }

  // Set immediate values based on instruction type
  io.decoded.imm := MuxLookup(io.decoded.instrType, 0.U, Array(
    1.U -> Cat(Fill(21, io.instruction(31)), io.instruction(30, 20)), // I-type
    2.U -> Cat(Fill(21, io.instruction(31)), io.instruction(30, 25), io.instruction(11, 7)), // S-type
    3.U -> Cat(Fill(20, io.instruction(31)), io.instruction(7), io.instruction(30, 25), io.instruction(11, 8), 0.U(1.W)), // B-type
    4.U -> Cat(Fill(12, io.instruction(31)), io.instruction(19, 12), io.instruction(20), io.instruction(30, 21), 0.U(1.W)), // J-type
    5.U -> Cat(io.instruction(31), io.instruction(30, 12), 0.U(12.W)) // U-type
  ))

  // Determine ALU operation based on instruction type
  io.decoded.aluOp := MuxLookup(io.decoded.instrType, 0.U, Array(
    0.U -> "b000".U, // R-type ALU operation
    1.U -> "b001".U, // I-type ALU operation
    2.U -> "b010".U, // Load operation
    3.U -> "b011".U, // Store operation
    4.U -> "b100".U  // Branch operation
  ))
}



