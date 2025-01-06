import chisel3._
import chisel3.util._

class functions extends Module {
  val io = IO(new Bundle {
    val instr = Input(UInt(32.W))
    val aluOp = Output(UInt(32.W))
    val imm = Output(SInt(32.W))
    val instrType = Output(UInt(4.W))

    })
  })
}