package RISCVsim

import chisel3._
import chisel3.util._

class execution extends Module {
  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))
    val rs1 = Input(UInt(32.W))
    val rs2 = Input(UInt(32.W))
    val rd = Input(UInt(32.W))
    val func3 = Input(UInt(3.W))
    val func10 = Input(UInt(10.W))
    val imm = Input(UInt(12.W))
    val imm20 = Input(UInt(20.W))
    val res = Output(UInt(32.W))
    val branch = Output(Bool())
    val pc = Input(UInt(32.W))
    val nextPC = Output(UInt(32.W))
  })
  io.nextPC := 0.U

  def RType(func10: UInt, rs1: UInt, rs2: UInt): UInt = {
    val res = Wire(UInt(32.W))
    res := 0.U
    /*printf("func10: &x\n",func10)*/
    switch(func10) {
      is(0x000.U) {/* add */
        res := rs1 + rs2
        /*printf("%d + %d = %d\n", rs1,rs2,res)*/
      }
      is(0x100.U) {/* sub */
        res := rs1 - rs2
      }
      is(0x001.U) {/* sll */
        res := rs1 << rs2(4, 0)
      }
      is(0x002.U) {/* slt */
        res := (rs1.asSInt < rs2.asSInt).asUInt
      }
      is(0x003.U) {/* sltu */
        res := (rs1 < rs2).asUInt
      }
      is(0x004.U) {/* xor */
        res := rs1 ^ rs2
      }
      is(0x005.U) {/* srl */
        res := rs1 >> rs2(4, 0)
      }
      is(0x105.U) {/* sra */
        res := (rs1.asSInt >> rs2(4, 0)).asUInt
      }
      is(0x006.U) {/* or */
        res := rs1 | rs2
      }
      is(0x007.U) {/* and */
        res := rs1 & rs2
      }
    }
    res
  }

  def IType(func3: UInt, rs1: UInt, imm: UInt): UInt = {
    val res = Wire(UInt(32.W))
    res := 0.U
    switch(func3) {
      is(0x00.U) {/* addi */
        res := rs1 + imm
      }
      is(0x02.U) {/* slti */
        res := (rs1.asSInt < imm.asSInt).asUInt
      }
      is(0x03.U) {/* sltiu */
        res := (rs1 < imm).asUInt
      }
      is(0x04.U) {/* xori */
        res := rs1 ^ imm
      }
      is(0x06.U) {/* ori */
        res := rs1 | imm
      }
      is(0x07.U) {/* andi */
        res := rs1 & imm
      }
      is(0x01.U) {/* slli */
        res := rs1 << imm(4, 0)
      }
      is(0x05.U) {/* srai & srli */
        when(imm(10) === 1.U) { /*srai*/
          (rs1.asSInt >> imm(4, 0)).asUInt
        }.otherwise {/*srli*/
          rs1 >> imm(4, 0)
        }
      }
    }
    res
  }

  def BType(func3: UInt, rs1: UInt, rs2: UInt): Bool = {
    val branch = Wire(Bool())
    branch := 0.U
    switch(func3) {
      is(0x00.U) {/* beq */
        branch := rs1 === rs2
      }
      is(0x01.U) {/* bne */
        branch := rs1 =/= rs2
      }
      is(0x04.U) {/* blt */
        branch := rs1.asSInt < rs2.asSInt
      }
      is(0x05.U) {/* bge */
        branch := rs1.asSInt >= rs2.asSInt
      }
      is(0x06.U) {/* bltu */
        branch := rs1 < rs2
      }
      is(0x07.U) {/* bgeu */
        branch := rs1 >= rs2
      }
    }
    branch
  }

  def JAL(pc: UInt, imm: UInt): UInt = pc + imm.asSInt.asUInt
  def JALR(rs1: UInt, imm: UInt): UInt = (rs1 + imm.asSInt.asUInt) & ~1.U

  io.res := 0.U
  io.branch := false.B
  switch(io.opcode) {
    is(0x03.U) {/* I-type */
      io.res := IType(io.func3, io.rs1, io.imm)
    }
    is(0x13.U) {/* I-type */
      io.res := IType(io.func3, io.rs1, io.imm)
    }
    is(0x17.U) { // U-type (AUIPC)
      io.res := io.nextPC + (io.imm20 << 12).asUInt
    }
    is(0x23.U) {/* S-type (SB, SH, SW) */
      io.res := 0.U
    }
    is(0x6F.U) { // J-type (JAL)
      io.res := io.pc + 4.U
      io.nextPC := JAL(io.pc, io.imm)
    }
    is(0x33.U) {/* R-type */
      io.res := RType(io.func10, io.rs1, io.rs2)
      /*printf("%d + %d = %d\n",io.rs1,io.rs2,io.res)*/
    }
    is(0x37.U) { // U-type (LUI)
      io.res := io.imm20 << 12
    }
    is(0x63.U) {/* B-type */
      io.branch := BType(io.func3, io.rs1, io.rs2)
    }
    is(0x67.U) { // JALR
      io.res := io.pc + 4.U
      io.nextPC := JALR(io.rs1, io.imm)
    }
    is(0x73.U){ /* Ecall & Ebreak */

    }
  }

}