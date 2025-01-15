package RiscVpipeline

import chisel3._
import chisel3.util._


class ALU extends Module {
  val io = IO(new Bundle {
    val ALUSel = Input(UInt(7.W)) // ALU operation selection
    val op1 = Input(UInt(32.W)) // First operand
    val op2 = Input(UInt(32.W)) // Second operand
    val result = Output(UInt(32.W)) // ALU result
    val takeBranch = Output(Bool()) // Branch decision
  })

  // Initialize outputs
  io.result := 0.U
  io.takeBranch := false.B

  // ALU operations
  switch(io.ALUSel) {
    is(AluOperation.Add.id.U) {
      io.result := io.op1 + io.op2
    }
    is(AluOperation.Sub.id.U) {
      io.result := io.op1 - io.op2
    }
    is(AluOperation.And.id.U) {
      io.result := io.op1 & io.op2
    }
    is(AluOperation.Or.id.U) {
      io.result := io.op1 | io.op2
    }
    is(AluOperation.Xor.id.U) {
      io.result := io.op1 ^ io.op2
    }
    is(AluOperation.Sll.id.U) {
      io.result := io.op1 << io.op2(4, 0)
    }
    is(AluOperation.Srl.id.U) {
      io.result := io.op1 >> io.op2(4, 0)
    }
    is(AluOperation.Sra.id.U) {
      io.result := (io.op1.asSInt >> io.op2(4, 0)).asUInt
    }
    is(AluOperation.Slt.id.U) {
      io.result := Mux(io.op1.asSInt < io.op2.asSInt, 1.U, 0.U)
    }
    is(AluOperation.Sltu.id.U) {
      io.result := Mux(io.op1 < io.op2, 1.U, 0.U)
    }

    // Branch operations
    is(AluOperation.Beq.id.U) {
      io.takeBranch := (io.op1 === io.op2)
    }
    is(AluOperation.Bne.id.U) {
      io.takeBranch := (io.op1 =/= io.op2)
    }
    is(AluOperation.Blt.id.U) {
      io.takeBranch := (io.op1.asSInt < io.op2.asSInt)
    }
    is(AluOperation.Bge.id.U) {
      io.takeBranch := (io.op1.asSInt >= io.op2.asSInt)
    }
    is(AluOperation.Bltu.id.U) {
      io.takeBranch := (io.op1 < io.op2)
    }
    is(AluOperation.Bgeu.id.U) {
      io.takeBranch := (io.op1 >= io.op2)
    }
    // JAL and JALR
    is(AluOperation.Jal.id.U) {
      io.takeBranch := true.B
    }
    is(AluOperation.Jalr.id.U) {
      io.takeBranch := true.B
    }
  }
}