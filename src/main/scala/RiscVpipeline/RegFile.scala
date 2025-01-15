package RiscVpipeline

import chisel3._

// The RegisterFile class implements a simple register file with 32 registers.
// It can read from one register and write to another.
class RegisterFile extends Module {
  val io = IO(new Bundle {
    val raddr1 = Input(UInt(5.W)) // Read address for first operand
    val raddr2 = Input(UInt(5.W)) // Read address for second operand
    val waddr = Input(UInt(5.W)) // Write address
    val wdata = Input(UInt(32.W)) // Data to write
    val wrEna = Input(Bool()) // wrEna Control signal to write to register
    val rdata1 = Output(UInt(32.W)) // Output for first operand
    val rdata2 = Output(UInt(32.W)) // Output for second operand
    val useMem = Input(Bool()) // Enable on-chip memory
  })

  if (io.useMem == true.B) {
    val regs = SyncReadMem(32, UInt(32.W), SyncReadMem.WriteFirst)
    val debugRegs = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) // only for debugging, not used in synthesis

    io.rdata1 := regs.read(io.raddr1)
    io.rdata2 := regs.read(io.raddr2)

    when(io.wrEna && io.waddr =/= 0.U) {
      regs.write(io.waddr, io.wdata)
      debugRegs(io.waddr) := io.wdata
    }
  } else {
    val regs = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) // 32 registers initialized to 0

    // Read data from registers
    io.rdata1 := Mux(io.raddr1.orR, regs(io.raddr1), 0.U)
    io.rdata2 := Mux(io.raddr2.orR, regs(io.raddr2), 0.U)

    // Write data to register if regWrite is high
    when(io.wrEna & io.waddr.orR) {
      regs(io.waddr) := io.wdata
    }
  }
}

