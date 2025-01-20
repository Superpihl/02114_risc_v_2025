package RISCVsim

import chisel3._
import chisel3.util._

class hazard extends Module{
  val io = IO(new Bundle {
    // Inputs: Pipeline stage signals
    val id_ex_rs1 = Input(UInt(5.W))
    val id_ex_rs2 = Input(UInt(5.W))
    val ex_mem_rd = Input(UInt(5.W))
    val mem_wb_rd = Input(UInt(5.W))
    val ex_mem_valid = Input(Bool())
    val mem_wb_valid = Input(Bool())
    val ex_mem_opcode = Input(UInt(7.W)) // For detecting `lw`

    // Outputs: Hazard signals
    val stall = Output(Bool())
    val forwardA = Output(UInt(2.W))
    val forwardB = Output(UInt(2.W))
  })

  // Default values
  io.stall := false.B
  io.forwardA := 0.U
  io.forwardB := 0.U

  // Detect data hazards for stalling
  when(io.ex_mem_valid && io.ex_mem_opcode === "b0000011".U && // Load dependency
    (io.id_ex_rs1 === io.ex_mem_rd || io.id_ex_rs2 === io.ex_mem_rd)) {
    io.stall := true.B
  }


  // Forwarding logic
  when(io.ex_mem_valid && io.ex_mem_rd =/= 0.U && io.id_ex_rs1 === io.ex_mem_rd) {
    io.forwardA := 1.U // Forward from EX/MEM
  } .elsewhen(io.mem_wb_valid && io.mem_wb_rd =/= 0.U && io.id_ex_rs1 === io.mem_wb_rd) {
    io.forwardA := 2.U // Forward from MEM/WB
  }

  when(io.ex_mem_valid && io.ex_mem_rd =/= 0.U && io.id_ex_rs2 === io.ex_mem_rd) {
    io.forwardB := 1.U // Forward from EX/MEM
  } .elsewhen(io.mem_wb_valid && io.mem_wb_rd =/= 0.U && io.id_ex_rs2 === io.mem_wb_rd) {
    io.forwardB := 2.U // Forward from MEM/WB
  }
}
