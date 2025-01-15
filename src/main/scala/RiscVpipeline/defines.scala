package RiscVpipeline

import chisel3._
import chisel3.util._

object Opcode {
  val Alu = "b0110011".U
  val AluImm = "b0010011".U
  val load = "b0000011".U
  val store = "b0100011".U
  val branch = "b1100011".U
  val jal = "b1101111".U
  val jalr = "b1100111".U
  val lui = "b0110111".U
  val auipc = "b0010111".U
  //val Fence = 0x0f
  //val ECall = 0x73
}

object InstrType extends Enumeration {
  type InstrType = Value
  val R, I, S, B, U, J = Value
}

object AluOperation extends Enumeration {
  type AluOperation = Value

  // Arithmetic and Logical Operations
  //  0    1    2    3   4    5    6    7    8    9
  val Add, Sub, And, Or, Xor, Sll, Srl, Sra, Slt, Sltu = Value

  // Branch Operations
  //  10   11   12   13   14     15
  val Beq, Bne, Blt, Bge, Bltu, Bgeu = Value

  // Load/Store Operations
  //  16  17  18  19  20
  val Jal, Jalr, Lui, Auipc = Value
}

object AluFunct7 {
  val DEFAULT = 0x00
  val SRA_SUB = 0x20
}

object AluFunct3 {
  val add = 0x0
  val sub = 0x0
  val sll = 0x1
  val slt = 0x2
  val sltu = 0x3
  val xor = 0x4
  val srl = 0x5
  val sra = 0x5
  val or = 0x6
  val and = 0x7
}

object BranchFunct {
  val BEQ = 0x00
  val BNE = 0x01
  val BLT = 0x04
  val BGE = 0x05
  val BLTU = 0x06
  val BGEU = 0x07
}

object LoadStoreFunct {
  val LB = 0x00
  val LH = 0x01
  val LW = 0x02
  val LBU = 0x04
  val LHU = 0x05
  val SB = 0x00
  val SH = 0x01
  val SW = 0x02
}

object Load {
  val lb = 0x0
  val lh = 0x1
  val lw = 0x2
  val lbu = 0x4
  val lhu = 0x5
}

object Store {
  val sb = 0x0
  val sh = 0x1
  val sw = 0x2
}