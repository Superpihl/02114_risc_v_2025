package RISCVsim

import java.io.File
import java.nio.file.{Files, Paths}
import chisel3._

object fetch {
  private def byteToWord(byteArray: Array[Byte]) = {
    val arr = new Array[Int](math.max(1, byteArray.length / 4))

    if (byteArray.length == 0) {
      arr(0) = 0
    }

    // little endian
    for (i <- 0 until byteArray.length / 4) {
      var word = 0
      for (j <- 0 until 4) {
        word >>>= 8
        word += (byteArray(i * 4 + j).toInt & 0xff) << 24
      }
      // printf("%08x\n", word)
      arr(i) = word
    }
    arr
  }
  /**
   * Read a binary file into an array vector
   */
  def readBin(fileName: String): Array[Int] = {
    val byteArray = Files.readAllBytes(Paths.get(fileName))
    byteToWord(byteArray)
  }
}