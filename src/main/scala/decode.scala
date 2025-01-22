package RISCVsim

import chisel3._
import chisel3.util._

class decode extends Module {
  val io = IO(new Bundle {
    val instr = Input(UInt(32.W))
    val rs1 = Output(UInt(5.W))
    val rs2 = Output(UInt(5.W))
    val rd = Output(UInt(5.W))
    val func3 = Output(UInt(3.W))
    val func10 = Output(UInt(10.W))
    val imm = Output(UInt(12.W))
    val imm20 = Output(UInt(20.W))
  })

    // === Default values === //
  io.rs1 := 0.U
  io.rs2 := 0.U
  io.rd := 0.U
  io.func3 := 0.U
  io.func10 := 0.U
  io.imm := 0.U
  io.imm20 := 0.U


  val opcode = io.instr(6,0)

    // === Decoding === //
  switch(opcode) {
    is(0x03.U){ /* I-type */
      io.rd := io.instr(11,7)
      io.func3 := io.instr(14,12)
      io.rs1 := io.instr(19,15)
      io.imm := io.instr(31,20)
    }
    is(0x13.U){ /* I-type */
      io.rd := io.instr(11,7)
      io.func3 := io.instr(14,12)
      io.rs1 := io.instr(19,15)
      io.imm := io.instr(31,20)
    }
    is(0x17.U){ /* U-type (AUIPC) */
      io.rd := io.instr(11,7)
      io.imm20 := io.instr(31,12)
    }
    is(0x23.U){ /* S-type (SB, SH, SW) */
      io.func3 := io.instr(14,12)
      io.rs1 := io.instr(19,15)
      io.rs2 := io.instr(24,20)
      io.imm := io.instr(31,25) ## io.instr(11,7)
    }
    is(0x6F.U){ /* J-type (JAL) */
      io.rd := io.instr(11,7)
      io.imm := io.instr(31) ## io.instr(19,12) ## io.instr(20) ## io.instr(30,21) ## 0.U(1.W).asUInt
    }
    is(0x33.U){ /* R-type */
      io.rd := io.instr(11,7)
      io.func10 := io.instr(14,12) ## io.instr(31,25)
      io.rs1 := io.instr(19,15)
      io.rs2 := io.instr(24,20)
    }
    is(0x37.U){ /* U-type (LUI) */
      io.rd := io.instr(11,7)
      io.imm20 := io.instr(31,12)
    }
    is(0x63.U){ /* B-type */
      io.func3 := io.instr(14,12)
      io.rs1 := io.instr(19,15)
      io.rs2 := io.instr(24,20)
      var temp = (io.instr(31) ## io.instr(7) ## io.instr(30,25) ## io.instr(11,8) ## 0.U(1.W).asUInt)
      io.imm := temp(11,0).asUInt
    }
    is(0x67.U){ /* I-type (JALR) */
      io.rd := io.instr(11,7)
      io.func3 := io.instr(14,12)
      io.rs1 := io.instr(19,15)
      io.imm := io.instr(31,20)
    }
    is(0x73.U){ /* Ecall & Ebreak */

    }
  }

}