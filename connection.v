module memory(
  input         clock,
  input         reset,
  input  [31:0] io_Addr,
  input  [31:0] io_DataIn,
  input  [1:0]  io_Length,
  input         io_memWr,
  input         io_sign,
  output [31:0] io_DataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] DataMemory [0:255]; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_0_MPORT_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_0_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_0_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_1_MPORT_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_1_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_1_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_2_MPORT_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_2_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_2_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_3_MPORT_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_3_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_3_MPORT_data; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_data; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_1_data; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_1_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_1_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_1_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_2_data; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_2_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_2_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_2_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_3_data; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_3_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_3_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_3_en; // @[memory.scala 21:31]
  reg  DataMemory_tempOut_0_MPORT_en_pipe_0;
  reg [7:0] DataMemory_tempOut_0_MPORT_addr_pipe_0;
  reg  DataMemory_tempOut_1_MPORT_en_pipe_0;
  reg [7:0] DataMemory_tempOut_1_MPORT_addr_pipe_0;
  reg  DataMemory_tempOut_2_MPORT_en_pipe_0;
  reg [7:0] DataMemory_tempOut_2_MPORT_addr_pipe_0;
  reg  DataMemory_tempOut_3_MPORT_en_pipe_0;
  reg [7:0] DataMemory_tempOut_3_MPORT_addr_pipe_0;
  wire  _T = 2'h0 < io_Length; // @[memory.scala 26:12]
  wire  _T_1 = io_Addr == 32'h100; // @[memory.scala 28:20]
  wire  _T_3 = ~reset; // @[memory.scala 30:15]
  wire  _T_4 = io_Addr == 32'h101; // @[memory.scala 31:28]
  wire [7:0] _GEN_0 = io_Addr == 32'h101 ? io_DataIn[7:0] : 8'h75; // @[memory.scala 31:46 32:20 24:24]
  wire  _GEN_3 = io_Addr == 32'h101 ? 1'h0 : 1'h1; // @[memory.scala 21:31 31:46 35:19]
  wire [7:0] _GEN_6 = io_Addr == 32'h100 ? io_DataIn[7:0] : 8'h75; // @[memory.scala 28:34 29:20 24:24]
  wire [7:0] _GEN_7 = io_Addr == 32'h100 ? 8'h75 : _GEN_0; // @[memory.scala 24:24 28:34]
  wire  _GEN_10 = io_Addr == 32'h100 ? 1'h0 : _GEN_3; // @[memory.scala 21:31 28:34]
  wire [7:0] _GEN_13 = io_memWr ? _GEN_6 : 8'h75; // @[memory.scala 27:19 24:24]
  wire [7:0] _GEN_14 = io_memWr ? _GEN_7 : 8'h75; // @[memory.scala 27:19 24:24]
  wire  _GEN_17 = io_memWr & _GEN_10; // @[memory.scala 27:19 21:31]
  wire  _GEN_20 = io_memWr ? 1'h0 : 1'h1; // @[memory.scala 27:19 21:31 39:31]
  wire [7:0] _GEN_23 = io_memWr ? 8'h0 : DataMemory_tempOut_0_MPORT_data; // @[memory.scala 27:19 23:24 39:18]
  wire [7:0] _GEN_24 = 2'h0 < io_Length ? _GEN_13 : 8'h75; // @[memory.scala 24:24 26:24]
  wire [7:0] _GEN_25 = 2'h0 < io_Length ? _GEN_14 : 8'h75; // @[memory.scala 24:24 26:24]
  wire [7:0] tempOut_0 = 2'h0 < io_Length ? _GEN_23 : 8'h0; // @[memory.scala 23:24 26:24]
  wire  _T_9 = 2'h1 < io_Length; // @[memory.scala 43:12]
  wire [31:0] _T_11 = io_Addr + 32'h1; // @[memory.scala 45:20]
  wire  _T_12 = _T_11 == 32'h100; // @[memory.scala 45:26]
  wire [31:0] _T_16 = io_Addr + 32'h2; // @[memory.scala 48:26]
  wire  _T_17 = _T_16 == 32'h100; // @[memory.scala 48:32]
  wire [7:0] _GEN_35 = _T_16 == 32'h100 ? io_DataIn[15:8] : _GEN_25; // @[memory.scala 48:46 49:20]
  wire  _GEN_38 = _T_16 == 32'h100 ? 1'h0 : 1'h1; // @[memory.scala 21:31 48:46 52:19]
  wire [7:0] _GEN_41 = _T_11 == 32'h100 ? io_DataIn[15:8] : _GEN_24; // @[memory.scala 45:40 46:20]
  wire [7:0] _GEN_42 = _T_11 == 32'h100 ? _GEN_25 : _GEN_35; // @[memory.scala 45:40]
  wire  _GEN_45 = _T_11 == 32'h100 ? 1'h0 : _GEN_38; // @[memory.scala 21:31 45:40]
  wire [7:0] _GEN_48 = io_memWr ? _GEN_41 : _GEN_24; // @[memory.scala 44:19]
  wire [7:0] _GEN_49 = io_memWr ? _GEN_42 : _GEN_25; // @[memory.scala 44:19]
  wire  _GEN_52 = io_memWr & _GEN_45; // @[memory.scala 44:19 21:31]
  wire [7:0] _GEN_56 = io_memWr ? 8'h0 : DataMemory_tempOut_1_MPORT_data; // @[memory.scala 44:19 23:24 55:18]
  wire [7:0] _GEN_57 = 2'h1 < io_Length ? _GEN_48 : _GEN_24; // @[memory.scala 43:24]
  wire [7:0] _GEN_58 = 2'h1 < io_Length ? _GEN_49 : _GEN_25; // @[memory.scala 43:24]
  wire [7:0] tempOut_1 = 2'h1 < io_Length ? _GEN_56 : 8'h0; // @[memory.scala 23:24 43:24]
  wire  _T_24 = 2'h2 < io_Length; // @[memory.scala 58:12]
  wire [7:0] _GEN_69 = _T_17 ? io_DataIn[31:24] : _GEN_58; // @[memory.scala 60:40 62:20]
  wire [7:0] _GEN_78 = io_memWr ? _GEN_69 : _GEN_58; // @[memory.scala 59:19]
  wire [7:0] tempSeg_1 = 2'h2 < io_Length ? _GEN_78 : _GEN_58; // @[memory.scala 58:24]
  wire [7:0] _GEN_68 = _T_17 ? io_DataIn[23:16] : _GEN_57; // @[memory.scala 60:40 61:20]
  wire [7:0] _GEN_77 = io_memWr ? _GEN_68 : _GEN_57; // @[memory.scala 59:19]
  wire [7:0] tempSeg_0 = 2'h2 < io_Length ? _GEN_77 : _GEN_57; // @[memory.scala 58:24]
  wire [31:0] _T_36 = io_Addr + 32'h3; // @[memory.scala 66:27]
  wire  _GEN_81 = io_memWr & _GEN_38; // @[memory.scala 59:19 21:31]
  wire [7:0] _GEN_87 = io_memWr ? 8'h0 : DataMemory_tempOut_2_MPORT_data; // @[memory.scala 59:19 23:24 69:18]
  wire [7:0] _GEN_89 = io_memWr ? 8'h0 : DataMemory_tempOut_3_MPORT_data; // @[memory.scala 59:19 23:24 70:18]
  wire [7:0] tempOut_2 = 2'h2 < io_Length ? _GEN_87 : 8'h0; // @[memory.scala 23:24 58:24]
  wire [7:0] tempOut_3 = 2'h2 < io_Length ? _GEN_89 : 8'h0; // @[memory.scala 23:24 58:24]
  wire  _T_40 = ~io_sign; // @[memory.scala 76:29]
  wire [7:0] _T_42 = tempOut_0 & 8'h80; // @[memory.scala 76:53]
  wire [31:0] _io_DataOut_T = {24'hffffff,tempOut_0}; // @[memory.scala 77:30]
  wire [7:0] _T_48 = tempOut_1 & 8'h80; // @[memory.scala 78:59]
  wire [31:0] _io_DataOut_T_2 = {16'hffff,tempOut_1,tempOut_0}; // @[memory.scala 79:42]
  wire [31:0] _io_DataOut_T_5 = {tempOut_3,tempOut_2,tempOut_1,tempOut_0}; // @[memory.scala 81:58]
  wire [31:0] _GEN_105 = io_Length == 2'h2 & _T_40 & _T_48 == 8'h80 ? _io_DataOut_T_2 : _io_DataOut_T_5; // @[memory.scala 78:80 79:16 81:16]
  wire  _GEN_107 = _T & io_memWr; // @[memory.scala 30:15]
  wire  _GEN_113 = _T_9 & io_memWr; // @[memory.scala 47:15]
  assign DataMemory_tempOut_0_MPORT_en = DataMemory_tempOut_0_MPORT_en_pipe_0;
  assign DataMemory_tempOut_0_MPORT_addr = DataMemory_tempOut_0_MPORT_addr_pipe_0;
  assign DataMemory_tempOut_0_MPORT_data = DataMemory[DataMemory_tempOut_0_MPORT_addr]; // @[memory.scala 21:31]
  assign DataMemory_tempOut_1_MPORT_en = DataMemory_tempOut_1_MPORT_en_pipe_0;
  assign DataMemory_tempOut_1_MPORT_addr = DataMemory_tempOut_1_MPORT_addr_pipe_0;
  assign DataMemory_tempOut_1_MPORT_data = DataMemory[DataMemory_tempOut_1_MPORT_addr]; // @[memory.scala 21:31]
  assign DataMemory_tempOut_2_MPORT_en = DataMemory_tempOut_2_MPORT_en_pipe_0;
  assign DataMemory_tempOut_2_MPORT_addr = DataMemory_tempOut_2_MPORT_addr_pipe_0;
  assign DataMemory_tempOut_2_MPORT_data = DataMemory[DataMemory_tempOut_2_MPORT_addr]; // @[memory.scala 21:31]
  assign DataMemory_tempOut_3_MPORT_en = DataMemory_tempOut_3_MPORT_en_pipe_0;
  assign DataMemory_tempOut_3_MPORT_addr = DataMemory_tempOut_3_MPORT_addr_pipe_0;
  assign DataMemory_tempOut_3_MPORT_data = DataMemory[DataMemory_tempOut_3_MPORT_addr]; // @[memory.scala 21:31]
  assign DataMemory_MPORT_data = io_DataIn[7:0];
  assign DataMemory_MPORT_addr = io_Addr[7:0];
  assign DataMemory_MPORT_mask = 1'h1;
  assign DataMemory_MPORT_en = _T & _GEN_17;
  assign DataMemory_MPORT_1_data = io_DataIn[15:8];
  assign DataMemory_MPORT_1_addr = _T_11[7:0];
  assign DataMemory_MPORT_1_mask = 1'h1;
  assign DataMemory_MPORT_1_en = _T_9 & _GEN_52;
  assign DataMemory_MPORT_2_data = io_DataIn[23:16];
  assign DataMemory_MPORT_2_addr = _T_16[7:0];
  assign DataMemory_MPORT_2_mask = 1'h1;
  assign DataMemory_MPORT_2_en = _T_24 & _GEN_81;
  assign DataMemory_MPORT_3_data = io_DataIn[31:24];
  assign DataMemory_MPORT_3_addr = _T_36[7:0];
  assign DataMemory_MPORT_3_mask = 1'h1;
  assign DataMemory_MPORT_3_en = _T_24 & _GEN_81;
  assign io_DataOut = io_Length == 2'h1 & ~io_sign & _T_42 == 8'h80 ? _io_DataOut_T : _GEN_105; // @[memory.scala 76:74 77:16]
  always @(posedge clock) begin
    if (DataMemory_MPORT_en & DataMemory_MPORT_mask) begin
      DataMemory[DataMemory_MPORT_addr] <= DataMemory_MPORT_data; // @[memory.scala 21:31]
    end
    if (DataMemory_MPORT_1_en & DataMemory_MPORT_1_mask) begin
      DataMemory[DataMemory_MPORT_1_addr] <= DataMemory_MPORT_1_data; // @[memory.scala 21:31]
    end
    if (DataMemory_MPORT_2_en & DataMemory_MPORT_2_mask) begin
      DataMemory[DataMemory_MPORT_2_addr] <= DataMemory_MPORT_2_data; // @[memory.scala 21:31]
    end
    if (DataMemory_MPORT_3_en & DataMemory_MPORT_3_mask) begin
      DataMemory[DataMemory_MPORT_3_addr] <= DataMemory_MPORT_3_data; // @[memory.scala 21:31]
    end
    DataMemory_tempOut_0_MPORT_en_pipe_0 <= _T & _GEN_20;
    if (_T & _GEN_20) begin
      DataMemory_tempOut_0_MPORT_addr_pipe_0 <= io_Addr[7:0];
    end
    DataMemory_tempOut_1_MPORT_en_pipe_0 <= _T_9 & _GEN_20;
    if (_T_9 & _GEN_20) begin
      DataMemory_tempOut_1_MPORT_addr_pipe_0 <= _T_11[7:0];
    end
    DataMemory_tempOut_2_MPORT_en_pipe_0 <= _T_24 & _GEN_20;
    if (_T_24 & _GEN_20) begin
      DataMemory_tempOut_2_MPORT_addr_pipe_0 <= _T_16[7:0];
    end
    DataMemory_tempOut_3_MPORT_en_pipe_0 <= _T_24 & _GEN_20;
    if (_T_24 & _GEN_20) begin
      DataMemory_tempOut_3_MPORT_addr_pipe_0 <= _T_36[7:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T & io_memWr & _T_1 & ~reset) begin
          $fwrite(32'h80000002,"tempSeg(0) = %x\n",tempSeg_0); // @[memory.scala 30:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_107 & ~_T_1 & _T_4 & _T_3) begin
          $fwrite(32'h80000002,"tempSeg(1) = %x\n",tempSeg_1); // @[memory.scala 33:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_9 & io_memWr & _T_12 & _T_3) begin
          $fwrite(32'h80000002,"tempSeg(0) = %x\n",tempSeg_0); // @[memory.scala 47:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_113 & ~_T_12 & _T_17 & _T_3) begin
          $fwrite(32'h80000002,"tempSeg(1) = %x\n",tempSeg_1); // @[memory.scala 50:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_24 & io_memWr & _T_17 & _T_3) begin
          $fwrite(32'h80000002,"tempSeg = %x\n",{tempSeg_1,tempSeg_0}); // @[memory.scala 63:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    DataMemory[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  DataMemory_tempOut_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  DataMemory_tempOut_0_MPORT_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  DataMemory_tempOut_1_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  DataMemory_tempOut_1_MPORT_addr_pipe_0 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  DataMemory_tempOut_2_MPORT_en_pipe_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  DataMemory_tempOut_2_MPORT_addr_pipe_0 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  DataMemory_tempOut_3_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  DataMemory_tempOut_3_MPORT_addr_pipe_0 = _RAND_8[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module decode(
  input  [31:0] io_instr,
  output [4:0]  io_rs1,
  output [4:0]  io_rs2,
  output [4:0]  io_rd,
  output [2:0]  io_func3,
  output [9:0]  io_func10,
  output [11:0] io_imm,
  output [19:0] io_imm20
);
  wire [6:0] opcode = io_instr[6:0]; // @[decode.scala 29:24]
  wire [11:0] _io_imm_T_4 = {io_instr[31:25],io_instr[11:7]}; // @[decode.scala 53:33]
  wire [20:0] _io_imm_T_12 = {io_instr[31],io_instr[19:12],io_instr[20],io_instr[30:21],1'h0}; // @[decode.scala 59:84]
  wire [9:0] _io_func10_T_2 = {io_instr[14:12],io_instr[31:25]}; // @[decode.scala 63:36]
  wire [12:0] temp = {io_instr[31],io_instr[7],io_instr[30:25],io_instr[11:8],1'h0}; // @[decode.scala 76:84]
  wire [4:0] _GEN_0 = 7'h67 == opcode ? io_instr[11:7] : 5'h0; // @[decode.scala 31:18 81:13 21:9]
  wire [2:0] _GEN_1 = 7'h67 == opcode ? io_instr[14:12] : 3'h0; // @[decode.scala 22:12 31:18 82:16]
  wire [4:0] _GEN_2 = 7'h67 == opcode ? io_instr[19:15] : 5'h0; // @[decode.scala 19:10 31:18 83:14]
  wire [11:0] _GEN_3 = 7'h67 == opcode ? io_instr[31:20] : 12'h0; // @[decode.scala 24:10 31:18 84:14]
  wire [2:0] _GEN_4 = 7'h63 == opcode ? io_instr[14:12] : _GEN_1; // @[decode.scala 31:18 73:16]
  wire [4:0] _GEN_5 = 7'h63 == opcode ? io_instr[19:15] : _GEN_2; // @[decode.scala 31:18 74:14]
  wire [4:0] _GEN_6 = 7'h63 == opcode ? io_instr[24:20] : 5'h0; // @[decode.scala 20:10 31:18 75:14]
  wire [11:0] _GEN_7 = 7'h63 == opcode ? temp[11:0] : _GEN_3; // @[decode.scala 31:18 77:14]
  wire [4:0] _GEN_8 = 7'h63 == opcode ? 5'h0 : _GEN_0; // @[decode.scala 31:18 21:9]
  wire [4:0] _GEN_9 = 7'h37 == opcode ? io_instr[11:7] : _GEN_8; // @[decode.scala 31:18 69:13]
  wire [19:0] _GEN_10 = 7'h37 == opcode ? io_instr[31:12] : 20'h0; // @[decode.scala 25:12 31:18 70:16]
  wire [2:0] _GEN_11 = 7'h37 == opcode ? 3'h0 : _GEN_4; // @[decode.scala 22:12 31:18]
  wire [4:0] _GEN_12 = 7'h37 == opcode ? 5'h0 : _GEN_5; // @[decode.scala 19:10 31:18]
  wire [4:0] _GEN_13 = 7'h37 == opcode ? 5'h0 : _GEN_6; // @[decode.scala 20:10 31:18]
  wire [11:0] _GEN_14 = 7'h37 == opcode ? 12'h0 : _GEN_7; // @[decode.scala 24:10 31:18]
  wire [4:0] _GEN_15 = 7'h33 == opcode ? io_instr[11:7] : _GEN_9; // @[decode.scala 31:18 62:13]
  wire [9:0] _GEN_16 = 7'h33 == opcode ? _io_func10_T_2 : 10'h0; // @[decode.scala 23:13 31:18 63:17]
  wire [4:0] _GEN_17 = 7'h33 == opcode ? io_instr[19:15] : _GEN_12; // @[decode.scala 31:18 64:14]
  wire [4:0] _GEN_18 = 7'h33 == opcode ? io_instr[24:20] : _GEN_13; // @[decode.scala 31:18 65:14]
  wire [19:0] _GEN_19 = 7'h33 == opcode ? 20'h0 : _GEN_10; // @[decode.scala 25:12 31:18]
  wire [2:0] _GEN_20 = 7'h33 == opcode ? 3'h0 : _GEN_11; // @[decode.scala 22:12 31:18]
  wire [11:0] _GEN_21 = 7'h33 == opcode ? 12'h0 : _GEN_14; // @[decode.scala 24:10 31:18]
  wire [4:0] _GEN_22 = 7'h6f == opcode ? io_instr[11:7] : _GEN_15; // @[decode.scala 31:18 58:13]
  wire [20:0] _GEN_23 = 7'h6f == opcode ? _io_imm_T_12 : {{9'd0}, _GEN_21}; // @[decode.scala 31:18 59:14]
  wire [9:0] _GEN_24 = 7'h6f == opcode ? 10'h0 : _GEN_16; // @[decode.scala 23:13 31:18]
  wire [4:0] _GEN_25 = 7'h6f == opcode ? 5'h0 : _GEN_17; // @[decode.scala 19:10 31:18]
  wire [4:0] _GEN_26 = 7'h6f == opcode ? 5'h0 : _GEN_18; // @[decode.scala 20:10 31:18]
  wire [19:0] _GEN_27 = 7'h6f == opcode ? 20'h0 : _GEN_19; // @[decode.scala 25:12 31:18]
  wire [2:0] _GEN_28 = 7'h6f == opcode ? 3'h0 : _GEN_20; // @[decode.scala 22:12 31:18]
  wire [2:0] _GEN_29 = 7'h23 == opcode ? io_instr[14:12] : _GEN_28; // @[decode.scala 31:18 50:16]
  wire [4:0] _GEN_30 = 7'h23 == opcode ? io_instr[19:15] : _GEN_25; // @[decode.scala 31:18 51:14]
  wire [4:0] _GEN_31 = 7'h23 == opcode ? io_instr[24:20] : _GEN_26; // @[decode.scala 31:18 52:14]
  wire [20:0] _GEN_32 = 7'h23 == opcode ? {{9'd0}, _io_imm_T_4} : _GEN_23; // @[decode.scala 31:18 53:14]
  wire [4:0] _GEN_33 = 7'h23 == opcode ? 5'h0 : _GEN_22; // @[decode.scala 31:18 21:9]
  wire [9:0] _GEN_34 = 7'h23 == opcode ? 10'h0 : _GEN_24; // @[decode.scala 23:13 31:18]
  wire [19:0] _GEN_35 = 7'h23 == opcode ? 20'h0 : _GEN_27; // @[decode.scala 25:12 31:18]
  wire [4:0] _GEN_36 = 7'h17 == opcode ? io_instr[11:7] : _GEN_33; // @[decode.scala 31:18 46:13]
  wire [19:0] _GEN_37 = 7'h17 == opcode ? io_instr[31:12] : _GEN_35; // @[decode.scala 31:18 47:16]
  wire [2:0] _GEN_38 = 7'h17 == opcode ? 3'h0 : _GEN_29; // @[decode.scala 22:12 31:18]
  wire [4:0] _GEN_39 = 7'h17 == opcode ? 5'h0 : _GEN_30; // @[decode.scala 19:10 31:18]
  wire [4:0] _GEN_40 = 7'h17 == opcode ? 5'h0 : _GEN_31; // @[decode.scala 20:10 31:18]
  wire [20:0] _GEN_41 = 7'h17 == opcode ? 21'h0 : _GEN_32; // @[decode.scala 24:10 31:18]
  wire [9:0] _GEN_42 = 7'h17 == opcode ? 10'h0 : _GEN_34; // @[decode.scala 23:13 31:18]
  wire [4:0] _GEN_43 = 7'h13 == opcode ? io_instr[11:7] : _GEN_36; // @[decode.scala 31:18 40:13]
  wire [2:0] _GEN_44 = 7'h13 == opcode ? io_instr[14:12] : _GEN_38; // @[decode.scala 31:18 41:16]
  wire [4:0] _GEN_45 = 7'h13 == opcode ? io_instr[19:15] : _GEN_39; // @[decode.scala 31:18 42:14]
  wire [20:0] _GEN_46 = 7'h13 == opcode ? {{9'd0}, io_instr[31:20]} : _GEN_41; // @[decode.scala 31:18 43:14]
  wire [19:0] _GEN_47 = 7'h13 == opcode ? 20'h0 : _GEN_37; // @[decode.scala 25:12 31:18]
  wire [4:0] _GEN_48 = 7'h13 == opcode ? 5'h0 : _GEN_40; // @[decode.scala 20:10 31:18]
  wire [9:0] _GEN_49 = 7'h13 == opcode ? 10'h0 : _GEN_42; // @[decode.scala 23:13 31:18]
  wire [20:0] _GEN_53 = 7'h3 == opcode ? {{9'd0}, io_instr[31:20]} : _GEN_46; // @[decode.scala 31:18 36:14]
  assign io_rs1 = 7'h3 == opcode ? io_instr[19:15] : _GEN_45; // @[decode.scala 31:18 35:14]
  assign io_rs2 = 7'h3 == opcode ? 5'h0 : _GEN_48; // @[decode.scala 20:10 31:18]
  assign io_rd = 7'h3 == opcode ? io_instr[11:7] : _GEN_43; // @[decode.scala 31:18 33:13]
  assign io_func3 = 7'h3 == opcode ? io_instr[14:12] : _GEN_44; // @[decode.scala 31:18 34:16]
  assign io_func10 = 7'h3 == opcode ? 10'h0 : _GEN_49; // @[decode.scala 23:13 31:18]
  assign io_imm = _GEN_53[11:0];
  assign io_imm20 = 7'h3 == opcode ? 20'h0 : _GEN_47; // @[decode.scala 25:12 31:18]
endmodule
module execution(
  input         clock,
  input         reset,
  input  [6:0]  io_opcode,
  input  [31:0] io_rs1,
  input  [31:0] io_rs2,
  input  [31:0] io_rd,
  input  [2:0]  io_func3,
  input  [9:0]  io_func10,
  input  [11:0] io_imm,
  input  [19:0] io_imm20,
  input  [31:0] io_pc,
  output [31:0] io_res,
  output        io_branch,
  output [1:0]  io_memLen,
  output        io_sign
);
  wire  _T = 7'h3 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _GEN_62 = {{20'd0}, io_imm}; // @[execution.scala 133:24]
  wire [31:0] _io_res_T_1 = io_rs1 + _GEN_62; // @[execution.scala 133:24]
  wire  _T_1 = 3'h0 == io_func3; // @[execution.scala 134:23]
  wire  _T_2 = 3'h1 == io_func3; // @[execution.scala 134:23]
  wire  _T_3 = 3'h2 == io_func3; // @[execution.scala 134:23]
  wire  _T_4 = 3'h4 == io_func3; // @[execution.scala 134:23]
  wire  _T_5 = 3'h5 == io_func3; // @[execution.scala 134:23]
  wire [1:0] _GEN_0 = 3'h5 == io_func3 ? 2'h2 : 2'h0; // @[execution.scala 129:13 134:23 149:21]
  wire [1:0] _GEN_2 = 3'h4 == io_func3 ? 2'h1 : _GEN_0; // @[execution.scala 134:23 145:21]
  wire  _GEN_3 = 3'h4 == io_func3 | 3'h5 == io_func3; // @[execution.scala 134:23 146:19]
  wire [1:0] _GEN_4 = 3'h2 == io_func3 ? 2'h3 : _GEN_2; // @[execution.scala 134:23 142:21]
  wire  _GEN_5 = 3'h2 == io_func3 ? 1'h0 : _GEN_3; // @[execution.scala 130:11 134:23]
  wire [1:0] _GEN_6 = 3'h1 == io_func3 ? 2'h2 : _GEN_4; // @[execution.scala 134:23 139:21]
  wire  _GEN_7 = 3'h1 == io_func3 ? 1'h0 : _GEN_5; // @[execution.scala 130:11 134:23]
  wire [1:0] _GEN_8 = 3'h0 == io_func3 ? 2'h1 : _GEN_6; // @[execution.scala 134:23 136:21]
  wire  _GEN_9 = 3'h0 == io_func3 ? 1'h0 : _GEN_7; // @[execution.scala 130:11 134:23]
  wire  _T_6 = 7'h13 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _io_res_res_T = io_rs1; // @[execution.scala 68:21]
  wire [11:0] _io_res_res_T_1 = io_imm; // @[execution.scala 68:34]
  wire [31:0] _GEN_63 = {{20{_io_res_res_T_1[11]}},_io_res_res_T_1}; // @[execution.scala 68:28]
  wire [31:0] _io_res_res_T_5 = $signed(io_rs1) + $signed(_GEN_63); // @[execution.scala 68:42]
  wire [31:0] _io_res_res_T_10 = io_rs1 ^ _GEN_62; // @[execution.scala 78:20]
  wire  _io_res_T_6 = 3'h6 == io_func3; // @[execution.scala 66:19]
  wire [31:0] _io_res_res_T_11 = io_rs1 | _GEN_62; // @[execution.scala 81:20]
  wire  _io_res_T_7 = 3'h7 == io_func3; // @[execution.scala 66:19]
  wire [31:0] _io_res_res_T_12 = io_rs1 & _GEN_62; // @[execution.scala 84:20]
  wire [62:0] _GEN_1 = {{31'd0}, io_rs1}; // @[execution.scala 87:20]
  wire [62:0] _io_res_res_T_14 = _GEN_1 << io_imm[4:0]; // @[execution.scala 87:20]
  wire [62:0] _GEN_10 = _T_2 ? _io_res_res_T_14 : 63'h0; // @[execution.scala 66:19 87:13 65:9]
  wire [62:0] _GEN_11 = 3'h7 == io_func3 ? {{31'd0}, _io_res_res_T_12} : _GEN_10; // @[execution.scala 66:19 84:13]
  wire [62:0] _GEN_12 = 3'h6 == io_func3 ? {{31'd0}, _io_res_res_T_11} : _GEN_11; // @[execution.scala 66:19 81:13]
  wire [62:0] _GEN_13 = _T_4 ? {{31'd0}, _io_res_res_T_10} : _GEN_12; // @[execution.scala 66:19 78:13]
  wire [62:0] _GEN_14 = 3'h3 == io_func3 ? {{62'd0}, io_rs1 < _GEN_62} : _GEN_13; // @[execution.scala 66:19 75:13]
  wire [62:0] _GEN_15 = _T_3 ? {{62'd0}, $signed(_io_res_res_T) < $signed(_GEN_63)} : _GEN_14; // @[execution.scala 66:19 72:13]
  wire [62:0] _GEN_16 = _T_1 ? {{31'd0}, _io_res_res_T_5} : _GEN_15; // @[execution.scala 66:19 68:13]
  wire  _T_7 = 7'h17 == io_opcode; // @[execution.scala 131:21]
  wire [19:0] _io_res_T_19 = io_imm20; // @[execution.scala 158:42]
  wire [31:0] _GEN_69 = {{12{_io_res_T_19[19]}},_io_res_T_19}; // @[execution.scala 158:31]
  wire [31:0] _io_res_T_23 = $signed(io_pc) + $signed(_GEN_69); // @[execution.scala 158:50]
  wire  _T_8 = 7'h23 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _GEN_17 = _T_3 ? io_rs2 : 32'h0; // @[execution.scala 127:10 162:23 172:18]
  wire [1:0] _GEN_18 = _T_3 ? 2'h3 : 2'h0; // @[execution.scala 129:13 162:23 173:21]
  wire [31:0] _GEN_19 = _T_2 ? {{16'd0}, io_rs2[15:0]} : _GEN_17; // @[execution.scala 162:23 168:18]
  wire [1:0] _GEN_20 = _T_2 ? 2'h2 : _GEN_18; // @[execution.scala 162:23 169:21]
  wire [31:0] _GEN_21 = _T_1 ? {{24'd0}, io_rs2[7:0]} : _GEN_19; // @[execution.scala 162:23 164:18]
  wire [1:0] _GEN_22 = _T_1 ? 2'h1 : _GEN_20; // @[execution.scala 162:23 165:21]
  wire  _T_12 = 7'h6f == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _io_res_T_27 = io_pc + 32'h4; // @[execution.scala 179:23]
  wire  _T_13 = 7'h33 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _io_res_res_T_16 = io_rs1 + io_rs2; // @[execution.scala 29:20]
  wire [31:0] _io_res_res_T_18 = io_rs1 - io_rs2; // @[execution.scala 33:20]
  wire [62:0] _GEN_38 = {{31'd0}, io_rs1}; // @[execution.scala 36:20]
  wire [62:0] _io_res_res_T_20 = _GEN_38 << io_rs2[4:0]; // @[execution.scala 36:20]
  wire [31:0] _io_res_res_T_22 = io_rs2; // @[execution.scala 39:34]
  wire  _io_res_res_T_23 = $signed(io_rs1) < $signed(io_rs2); // @[execution.scala 39:28]
  wire  _io_res_res_T_24 = io_rs1 < io_rs2; // @[execution.scala 42:21]
  wire [31:0] _io_res_res_T_25 = io_rs1 ^ io_rs2; // @[execution.scala 45:20]
  wire [31:0] _io_res_res_T_27 = io_rs1 >> io_rs2[4:0]; // @[execution.scala 48:20]
  wire [31:0] _io_res_res_T_31 = $signed(io_rs1) >>> io_rs2[4:0]; // @[execution.scala 51:42]
  wire [31:0] _io_res_res_T_32 = io_rs1 | io_rs2; // @[execution.scala 54:20]
  wire [31:0] _io_res_res_T_33 = io_rs1 & io_rs2; // @[execution.scala 57:20]
  wire [31:0] _GEN_23 = 10'h7 == io_func10 ? _io_res_res_T_33 : 32'h0; // @[execution.scala 27:20 57:13 25:9]
  wire [31:0] _GEN_24 = 10'h6 == io_func10 ? _io_res_res_T_32 : _GEN_23; // @[execution.scala 27:20 54:13]
  wire [31:0] _GEN_25 = 10'h105 == io_func10 ? _io_res_res_T_31 : _GEN_24; // @[execution.scala 27:20 51:13]
  wire [31:0] _GEN_26 = 10'h5 == io_func10 ? _io_res_res_T_27 : _GEN_25; // @[execution.scala 27:20 48:13]
  wire [31:0] _GEN_27 = 10'h4 == io_func10 ? _io_res_res_T_25 : _GEN_26; // @[execution.scala 27:20 45:13]
  wire [31:0] _GEN_28 = 10'h3 == io_func10 ? {{31'd0}, io_rs1 < io_rs2} : _GEN_27; // @[execution.scala 27:20 42:13]
  wire [31:0] _GEN_29 = 10'h2 == io_func10 ? {{31'd0}, $signed(_io_res_res_T) < $signed(_io_res_res_T_22)} : _GEN_28; // @[execution.scala 27:20 39:13]
  wire [62:0] _GEN_30 = 10'h1 == io_func10 ? _io_res_res_T_20 : {{31'd0}, _GEN_29}; // @[execution.scala 27:20 36:13]
  wire [62:0] _GEN_31 = 10'h100 == io_func10 ? {{31'd0}, _io_res_res_T_18} : _GEN_30; // @[execution.scala 27:20 33:13]
  wire [62:0] _GEN_32 = 10'h0 == io_func10 ? {{31'd0}, _io_res_res_T_16} : _GEN_31; // @[execution.scala 27:20 29:13]
  wire  _T_14 = 7'h37 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _io_res_T_38 = {io_imm20, 12'h0}; // @[execution.scala 188:26]
  wire  _T_15 = 7'h63 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _io_res_T_44 = $signed(io_pc) + $signed(_GEN_63); // @[execution.scala 191:48]
  wire  _GEN_33 = _io_res_T_7 & io_rs1 >= io_rs2; // @[execution.scala 102:12 103:19 121:16]
  wire  _GEN_34 = _io_res_T_6 ? _io_res_res_T_24 : _GEN_33; // @[execution.scala 103:19 118:16]
  wire  _GEN_35 = _T_5 ? $signed(io_rs1) >= $signed(io_rs2) : _GEN_34; // @[execution.scala 103:19 115:16]
  wire  _GEN_36 = _T_4 ? _io_res_res_T_23 : _GEN_35; // @[execution.scala 103:19 111:16]
  wire  _GEN_37 = _T_2 ? io_rs1 != io_rs2 : _GEN_36; // @[execution.scala 103:19 108:16]
  wire  io_branch_branch = _T_1 ? io_rs1 == io_rs2 : _GEN_37; // @[execution.scala 103:19 105:16]
  wire  _T_16 = 7'h67 == io_opcode; // @[execution.scala 131:21]
  wire  _T_17 = 7'h73 == io_opcode; // @[execution.scala 131:21]
  wire [31:0] _GEN_39 = 7'h67 == io_opcode ? _io_res_T_27 : 32'h0; // @[execution.scala 127:10 131:21 195:14]
  wire [31:0] _GEN_41 = 7'h63 == io_opcode ? _io_res_T_44 : _GEN_39; // @[execution.scala 131:21 191:14]
  wire  _GEN_42 = 7'h63 == io_opcode ? io_branch_branch : 7'h67 == io_opcode; // @[execution.scala 131:21 192:17]
  wire [31:0] _GEN_43 = 7'h37 == io_opcode ? _io_res_T_38 : _GEN_41; // @[execution.scala 131:21 188:14]
  wire  _GEN_44 = 7'h37 == io_opcode ? 1'h0 : _GEN_42; // @[execution.scala 128:13 131:21]
  wire [31:0] io_res_res_1 = _GEN_32[31:0]; // @[execution.scala 24:19]
  wire [31:0] _GEN_45 = 7'h33 == io_opcode ? io_res_res_1 : _GEN_43; // @[execution.scala 131:21 183:14]
  wire  _GEN_46 = 7'h33 == io_opcode ? 1'h0 : _GEN_44; // @[execution.scala 128:13 131:21]
  wire [31:0] _GEN_47 = 7'h6f == io_opcode ? _io_res_T_27 : _GEN_45; // @[execution.scala 131:21 179:14]
  wire  _GEN_48 = 7'h6f == io_opcode | _GEN_46; // @[execution.scala 131:21 180:17]
  wire [31:0] _GEN_49 = 7'h23 == io_opcode ? _GEN_21 : _GEN_47; // @[execution.scala 131:21]
  wire [1:0] _GEN_50 = 7'h23 == io_opcode ? _GEN_22 : 2'h0; // @[execution.scala 129:13 131:21]
  wire  _GEN_51 = 7'h23 == io_opcode ? 1'h0 : _GEN_48; // @[execution.scala 128:13 131:21]
  wire [31:0] _GEN_52 = 7'h17 == io_opcode ? _io_res_T_23 : _GEN_49; // @[execution.scala 131:21 158:14]
  wire  _GEN_53 = 7'h17 == io_opcode | _GEN_51; // @[execution.scala 131:21 159:17]
  wire [1:0] _GEN_54 = 7'h17 == io_opcode ? 2'h0 : _GEN_50; // @[execution.scala 129:13 131:21]
  wire [31:0] io_res_res = _GEN_16[31:0]; // @[execution.scala 64:19]
  wire [31:0] _GEN_55 = 7'h13 == io_opcode ? io_res_res : _GEN_52; // @[execution.scala 131:21 155:14]
  wire  _GEN_56 = 7'h13 == io_opcode ? 1'h0 : _GEN_53; // @[execution.scala 128:13 131:21]
  wire [1:0] _GEN_57 = 7'h13 == io_opcode ? 2'h0 : _GEN_54; // @[execution.scala 129:13 131:21]
  assign io_res = 7'h3 == io_opcode ? _io_res_T_1 : _GEN_55; // @[execution.scala 131:21 133:14]
  assign io_branch = 7'h3 == io_opcode ? 1'h0 : _GEN_56; // @[execution.scala 128:13 131:21]
  assign io_memLen = 7'h3 == io_opcode ? _GEN_8 : _GEN_57; // @[execution.scala 131:21]
  assign io_sign = 7'h3 == io_opcode & _GEN_9; // @[execution.scala 130:11 131:21]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T & ~_T_6 & ~_T_7 & ~_T_8 & ~_T_12 & ~_T_13 & ~_T_14 & ~_T_15 & ~_T_16 & _T_17 & ~reset) begin
          $fwrite(32'h80000002,"\nEcall got damn\n"); // @[execution.scala 200:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module cpu(
  input         clock,
  input         reset,
  output [31:0] io_sevSegNum
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
`endif // RANDOMIZE_REG_INIT
  wire  DataMem_clock; // @[cpu.scala 49:23]
  wire  DataMem_reset; // @[cpu.scala 49:23]
  wire [31:0] DataMem_io_Addr; // @[cpu.scala 49:23]
  wire [31:0] DataMem_io_DataIn; // @[cpu.scala 49:23]
  wire [1:0] DataMem_io_Length; // @[cpu.scala 49:23]
  wire  DataMem_io_memWr; // @[cpu.scala 49:23]
  wire  DataMem_io_sign; // @[cpu.scala 49:23]
  wire [31:0] DataMem_io_DataOut; // @[cpu.scala 49:23]
  wire [31:0] decoder_io_instr; // @[cpu.scala 82:23]
  wire [4:0] decoder_io_rs1; // @[cpu.scala 82:23]
  wire [4:0] decoder_io_rs2; // @[cpu.scala 82:23]
  wire [4:0] decoder_io_rd; // @[cpu.scala 82:23]
  wire [2:0] decoder_io_func3; // @[cpu.scala 82:23]
  wire [9:0] decoder_io_func10; // @[cpu.scala 82:23]
  wire [11:0] decoder_io_imm; // @[cpu.scala 82:23]
  wire [19:0] decoder_io_imm20; // @[cpu.scala 82:23]
  wire  exe_clock; // @[cpu.scala 85:19]
  wire  exe_reset; // @[cpu.scala 85:19]
  wire [6:0] exe_io_opcode; // @[cpu.scala 85:19]
  wire [31:0] exe_io_rs1; // @[cpu.scala 85:19]
  wire [31:0] exe_io_rs2; // @[cpu.scala 85:19]
  wire [31:0] exe_io_rd; // @[cpu.scala 85:19]
  wire [2:0] exe_io_func3; // @[cpu.scala 85:19]
  wire [9:0] exe_io_func10; // @[cpu.scala 85:19]
  wire [11:0] exe_io_imm; // @[cpu.scala 85:19]
  wire [19:0] exe_io_imm20; // @[cpu.scala 85:19]
  wire [31:0] exe_io_pc; // @[cpu.scala 85:19]
  wire [31:0] exe_io_res; // @[cpu.scala 85:19]
  wire  exe_io_branch; // @[cpu.scala 85:19]
  wire [1:0] exe_io_memLen; // @[cpu.scala 85:19]
  wire  exe_io_sign; // @[cpu.scala 85:19]
  reg [31:0] reg_0; // @[cpu.scala 47:52]
  reg [31:0] reg_1; // @[cpu.scala 47:52]
  reg [31:0] reg_2; // @[cpu.scala 47:52]
  reg [31:0] reg_3; // @[cpu.scala 47:52]
  reg [31:0] reg_4; // @[cpu.scala 47:52]
  reg [31:0] reg_5; // @[cpu.scala 47:52]
  reg [31:0] reg_6; // @[cpu.scala 47:52]
  reg [31:0] reg_7; // @[cpu.scala 47:52]
  reg [31:0] reg_8; // @[cpu.scala 47:52]
  reg [31:0] reg_9; // @[cpu.scala 47:52]
  reg [31:0] reg_10; // @[cpu.scala 47:52]
  reg [31:0] reg_11; // @[cpu.scala 47:52]
  reg [31:0] reg_12; // @[cpu.scala 47:52]
  reg [31:0] reg_13; // @[cpu.scala 47:52]
  reg [31:0] reg_14; // @[cpu.scala 47:52]
  reg [31:0] reg_15; // @[cpu.scala 47:52]
  reg [31:0] reg_16; // @[cpu.scala 47:52]
  reg [31:0] reg_17; // @[cpu.scala 47:52]
  reg [31:0] reg_18; // @[cpu.scala 47:52]
  reg [31:0] reg_19; // @[cpu.scala 47:52]
  reg [31:0] reg_20; // @[cpu.scala 47:52]
  reg [31:0] reg_21; // @[cpu.scala 47:52]
  reg [31:0] reg_22; // @[cpu.scala 47:52]
  reg [31:0] reg_23; // @[cpu.scala 47:52]
  reg [31:0] reg_24; // @[cpu.scala 47:52]
  reg [31:0] reg_25; // @[cpu.scala 47:52]
  reg [31:0] reg_26; // @[cpu.scala 47:52]
  reg [31:0] reg_27; // @[cpu.scala 47:52]
  reg [31:0] reg_28; // @[cpu.scala 47:52]
  reg [31:0] reg_29; // @[cpu.scala 47:52]
  reg [31:0] reg_30; // @[cpu.scala 47:52]
  reg [31:0] reg_31; // @[cpu.scala 47:52]
  reg [6:0] decExReg_opcode; // @[cpu.scala 86:25]
  reg [31:0] decExReg_rs1; // @[cpu.scala 86:25]
  reg [31:0] decExReg_rs2; // @[cpu.scala 86:25]
  reg [4:0] decExReg_rd; // @[cpu.scala 86:25]
  reg [2:0] decExReg_func3; // @[cpu.scala 86:25]
  reg [9:0] decExReg_func10; // @[cpu.scala 86:25]
  reg [11:0] decExReg_imm; // @[cpu.scala 86:25]
  reg [19:0] decExReg_imm20; // @[cpu.scala 86:25]
  reg [31:0] decExReg_pc; // @[cpu.scala 86:25]
  reg  decExReg_valid; // @[cpu.scala 86:25]
  reg [4:0] memReg_rd; // @[cpu.scala 87:23]
  reg [31:0] memReg_regData; // @[cpu.scala 87:23]
  reg [31:0] memReg_Addr; // @[cpu.scala 87:23]
  reg [1:0] memReg_Len; // @[cpu.scala 87:23]
  reg  memReg_memWr; // @[cpu.scala 87:23]
  reg  memReg_sign; // @[cpu.scala 87:23]
  reg  memReg_valid; // @[cpu.scala 87:23]
  reg [4:0] wbReg_rd; // @[cpu.scala 88:22]
  reg [31:0] wbReg_regData; // @[cpu.scala 88:22]
  reg [31:0] wbReg_memData; // @[cpu.scala 88:22]
  reg [1:0] wbReg_Len; // @[cpu.scala 88:22]
  reg  wbReg_memWr; // @[cpu.scala 88:22]
  reg  wbReg_valid; // @[cpu.scala 88:22]
  reg [31:0] pcReg; // @[cpu.scala 94:22]
  wire [31:0] _pcNext_T_1 = pcReg + 32'h4; // @[cpu.scala 95:50]
  wire  doBranch = exe_io_branch & decExReg_valid; // @[cpu.scala 158:29]
  wire [11:0] _branchTarget_T_2 = decExReg_imm; // @[cpu.scala 157:82]
  wire [31:0] _GEN_147 = {{20{_branchTarget_T_2[11]}},_branchTarget_T_2}; // @[cpu.scala 157:67]
  wire [31:0] _branchTarget_T_6 = $signed(exe_io_rs1) + $signed(_GEN_147); // @[cpu.scala 157:90]
  wire [19:0] _branchTarget_T_11 = exe_io_opcode == 7'h17 ? $signed(decExReg_imm20) : $signed({{8{_branchTarget_T_2[11
    ]}},_branchTarget_T_2}); // @[cpu.scala 157:122]
  wire [31:0] _GEN_148 = {{12{_branchTarget_T_11[19]}},_branchTarget_T_11}; // @[cpu.scala 157:117]
  wire [31:0] _branchTarget_T_15 = $signed(decExReg_pc) + $signed(_GEN_148); // @[cpu.scala 157:192]
  reg [31:0] pcRegReg; // @[cpu.scala 102:25]
  wire  _T_1 = ~reset; // @[cpu.scala 105:9]
  reg [31:0] instrReg; // @[cpu.scala 107:25]
  wire [31:0] _GEN_1 = 4'h1 == pcReg[5:2] ? 32'hfc00313 : 32'h10000293; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_2 = 4'h2 == pcReg[5:2] ? 32'h6400513 : _GEN_1; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_3 = 4'h3 == pcReg[5:2] ? 32'hfff50513 : _GEN_2; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_4 = 4'h4 == pcReg[5:2] ? 32'ha28023 : _GEN_3; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_5 = 4'h5 == pcReg[5:2] ? 32'hfea04ce3 : _GEN_4; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_6 = 4'h6 == pcReg[5:2] ? 32'h150513 : _GEN_5; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_7 = 4'h7 == pcReg[5:2] ? 32'h258593 : _GEN_6; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_8 = 4'h8 == pcReg[5:2] ? 32'h150513 : _GEN_7; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_9 = 4'h9 == pcReg[5:2] ? 32'ha28023 : _GEN_8; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_10 = 4'ha == pcReg[5:2] ? 32'hb280a3 : _GEN_9; // @[cpu.scala 108:{18,18}]
  wire [31:0] _GEN_11 = 4'hb == pcReg[5:2] ? 32'hfe65c8e3 : _GEN_10; // @[cpu.scala 108:{18,18}]
  wire [6:0] decOut_opcode = instrReg[6:0]; // @[cpu.scala 120:28]
  wire  decOut_valid = ~doBranch; // @[cpu.scala 129:19]
  wire [31:0] _GEN_149 = {{27'd0}, memReg_rd}; // @[cpu.scala 141:32]
  wire [31:0] _GEN_150 = {{27'd0}, wbReg_rd}; // @[cpu.scala 142:19]
  wire [31:0] _GEN_16 = 5'h1 == decExReg_rs1[4:0] ? reg_1 : reg_0; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_17 = 5'h2 == decExReg_rs1[4:0] ? reg_2 : _GEN_16; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_18 = 5'h3 == decExReg_rs1[4:0] ? reg_3 : _GEN_17; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_19 = 5'h4 == decExReg_rs1[4:0] ? reg_4 : _GEN_18; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_20 = 5'h5 == decExReg_rs1[4:0] ? reg_5 : _GEN_19; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_21 = 5'h6 == decExReg_rs1[4:0] ? reg_6 : _GEN_20; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_22 = 5'h7 == decExReg_rs1[4:0] ? reg_7 : _GEN_21; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_23 = 5'h8 == decExReg_rs1[4:0] ? reg_8 : _GEN_22; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_24 = 5'h9 == decExReg_rs1[4:0] ? reg_9 : _GEN_23; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_25 = 5'ha == decExReg_rs1[4:0] ? reg_10 : _GEN_24; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_26 = 5'hb == decExReg_rs1[4:0] ? reg_11 : _GEN_25; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_27 = 5'hc == decExReg_rs1[4:0] ? reg_12 : _GEN_26; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_28 = 5'hd == decExReg_rs1[4:0] ? reg_13 : _GEN_27; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_29 = 5'he == decExReg_rs1[4:0] ? reg_14 : _GEN_28; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_30 = 5'hf == decExReg_rs1[4:0] ? reg_15 : _GEN_29; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_31 = 5'h10 == decExReg_rs1[4:0] ? reg_16 : _GEN_30; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_32 = 5'h11 == decExReg_rs1[4:0] ? reg_17 : _GEN_31; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_33 = 5'h12 == decExReg_rs1[4:0] ? reg_18 : _GEN_32; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_34 = 5'h13 == decExReg_rs1[4:0] ? reg_19 : _GEN_33; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_35 = 5'h14 == decExReg_rs1[4:0] ? reg_20 : _GEN_34; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_36 = 5'h15 == decExReg_rs1[4:0] ? reg_21 : _GEN_35; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_37 = 5'h16 == decExReg_rs1[4:0] ? reg_22 : _GEN_36; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_38 = 5'h17 == decExReg_rs1[4:0] ? reg_23 : _GEN_37; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_39 = 5'h18 == decExReg_rs1[4:0] ? reg_24 : _GEN_38; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_40 = 5'h19 == decExReg_rs1[4:0] ? reg_25 : _GEN_39; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_41 = 5'h1a == decExReg_rs1[4:0] ? reg_26 : _GEN_40; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_42 = 5'h1b == decExReg_rs1[4:0] ? reg_27 : _GEN_41; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_43 = 5'h1c == decExReg_rs1[4:0] ? reg_28 : _GEN_42; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_44 = 5'h1d == decExReg_rs1[4:0] ? reg_29 : _GEN_43; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_45 = 5'h1e == decExReg_rs1[4:0] ? reg_30 : _GEN_44; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_46 = 5'h1f == decExReg_rs1[4:0] ? reg_31 : _GEN_45; // @[cpu.scala 142:{8,8}]
  wire [31:0] _GEN_80 = wbReg_Len > 2'h0 ? wbReg_memData : wbReg_regData; // @[cpu.scala 205:26 206:14 208:14]
  wire [31:0] _GEN_81 = wbReg_rd == 5'h0 ? 32'h0 : _GEN_80; // @[cpu.scala 210:27 211:14]
  wire [31:0] wbData = ~wbReg_memWr & wbReg_valid ? _GEN_81 : 32'h0; // @[cpu.scala 204:36 89:27]
  wire [31:0] _exe_io_rs1_T_7 = _GEN_150 == decExReg_rs1 & wbReg_valid ? wbData : _GEN_46; // @[cpu.scala 142:8]
  wire [31:0] _GEN_48 = 5'h1 == decExReg_rs2[4:0] ? reg_1 : reg_0; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_49 = 5'h2 == decExReg_rs2[4:0] ? reg_2 : _GEN_48; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_50 = 5'h3 == decExReg_rs2[4:0] ? reg_3 : _GEN_49; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_51 = 5'h4 == decExReg_rs2[4:0] ? reg_4 : _GEN_50; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_52 = 5'h5 == decExReg_rs2[4:0] ? reg_5 : _GEN_51; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_53 = 5'h6 == decExReg_rs2[4:0] ? reg_6 : _GEN_52; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_54 = 5'h7 == decExReg_rs2[4:0] ? reg_7 : _GEN_53; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_55 = 5'h8 == decExReg_rs2[4:0] ? reg_8 : _GEN_54; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_56 = 5'h9 == decExReg_rs2[4:0] ? reg_9 : _GEN_55; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_57 = 5'ha == decExReg_rs2[4:0] ? reg_10 : _GEN_56; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_58 = 5'hb == decExReg_rs2[4:0] ? reg_11 : _GEN_57; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_59 = 5'hc == decExReg_rs2[4:0] ? reg_12 : _GEN_58; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_60 = 5'hd == decExReg_rs2[4:0] ? reg_13 : _GEN_59; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_61 = 5'he == decExReg_rs2[4:0] ? reg_14 : _GEN_60; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_62 = 5'hf == decExReg_rs2[4:0] ? reg_15 : _GEN_61; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_63 = 5'h10 == decExReg_rs2[4:0] ? reg_16 : _GEN_62; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_64 = 5'h11 == decExReg_rs2[4:0] ? reg_17 : _GEN_63; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_65 = 5'h12 == decExReg_rs2[4:0] ? reg_18 : _GEN_64; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_66 = 5'h13 == decExReg_rs2[4:0] ? reg_19 : _GEN_65; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_67 = 5'h14 == decExReg_rs2[4:0] ? reg_20 : _GEN_66; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_68 = 5'h15 == decExReg_rs2[4:0] ? reg_21 : _GEN_67; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_69 = 5'h16 == decExReg_rs2[4:0] ? reg_22 : _GEN_68; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_70 = 5'h17 == decExReg_rs2[4:0] ? reg_23 : _GEN_69; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_71 = 5'h18 == decExReg_rs2[4:0] ? reg_24 : _GEN_70; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_72 = 5'h19 == decExReg_rs2[4:0] ? reg_25 : _GEN_71; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_73 = 5'h1a == decExReg_rs2[4:0] ? reg_26 : _GEN_72; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_74 = 5'h1b == decExReg_rs2[4:0] ? reg_27 : _GEN_73; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_75 = 5'h1c == decExReg_rs2[4:0] ? reg_28 : _GEN_74; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_76 = 5'h1d == decExReg_rs2[4:0] ? reg_29 : _GEN_75; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_77 = 5'h1e == decExReg_rs2[4:0] ? reg_30 : _GEN_76; // @[cpu.scala 144:{8,8}]
  wire [31:0] _GEN_78 = 5'h1f == decExReg_rs2[4:0] ? reg_31 : _GEN_77; // @[cpu.scala 144:{8,8}]
  wire [31:0] _exe_io_rs2_T_6 = _GEN_150 == decExReg_rs2 ? wbData : _GEN_78; // @[cpu.scala 144:8]
  wire  _T_3 = exe_io_opcode == 7'h73; // @[cpu.scala 168:22]
  wire [31:0] _memReg_rd_T = decExReg_valid ? exe_io_rd : 32'h0; // @[cpu.scala 174:19]
  wire [31:0] _GEN_153 = {{20'd0}, exe_io_imm}; // @[cpu.scala 178:29]
  wire [31:0] _memReg_Addr_T_1 = exe_io_rs1 + _GEN_153; // @[cpu.scala 178:29]
  wire [31:0] decOut_rs1 = {{27'd0}, decoder_io_rs1}; // @[cpu.scala 121:14 83:20]
  wire [31:0] decOut_rs2 = {{27'd0}, decoder_io_rs2}; // @[cpu.scala 122:14 83:20]
  wire [4:0] decOut_rd = decoder_io_rd; // @[cpu.scala 123:13 83:20]
  wire [2:0] decOut_func3 = decoder_io_func3; // @[cpu.scala 124:16 83:20]
  wire [9:0] decOut_func10 = decoder_io_func10; // @[cpu.scala 125:17 83:20]
  wire [11:0] decOut_imm = decoder_io_imm; // @[cpu.scala 126:14 83:20]
  wire [19:0] decOut_imm20 = decoder_io_imm20; // @[cpu.scala 127:16 83:20]
  wire [31:0] _GEN_154 = reset ? 32'h0 : _memReg_rd_T; // @[cpu.scala 174:13 87:{23,23}]
  memory DataMem ( // @[cpu.scala 49:23]
    .clock(DataMem_clock),
    .reset(DataMem_reset),
    .io_Addr(DataMem_io_Addr),
    .io_DataIn(DataMem_io_DataIn),
    .io_Length(DataMem_io_Length),
    .io_memWr(DataMem_io_memWr),
    .io_sign(DataMem_io_sign),
    .io_DataOut(DataMem_io_DataOut)
  );
  decode decoder ( // @[cpu.scala 82:23]
    .io_instr(decoder_io_instr),
    .io_rs1(decoder_io_rs1),
    .io_rs2(decoder_io_rs2),
    .io_rd(decoder_io_rd),
    .io_func3(decoder_io_func3),
    .io_func10(decoder_io_func10),
    .io_imm(decoder_io_imm),
    .io_imm20(decoder_io_imm20)
  );
  execution exe ( // @[cpu.scala 85:19]
    .clock(exe_clock),
    .reset(exe_reset),
    .io_opcode(exe_io_opcode),
    .io_rs1(exe_io_rs1),
    .io_rs2(exe_io_rs2),
    .io_rd(exe_io_rd),
    .io_func3(exe_io_func3),
    .io_func10(exe_io_func10),
    .io_imm(exe_io_imm),
    .io_imm20(exe_io_imm20),
    .io_pc(exe_io_pc),
    .io_res(exe_io_res),
    .io_branch(exe_io_branch),
    .io_memLen(exe_io_memLen),
    .io_sign(exe_io_sign)
  );
  assign io_sevSegNum = instrReg; // @[cpu.scala 198:16]
  assign DataMem_clock = clock;
  assign DataMem_reset = reset;
  assign DataMem_io_Addr = memReg_Addr; // @[cpu.scala 190:19]
  assign DataMem_io_DataIn = memReg_regData; // @[cpu.scala 188:21]
  assign DataMem_io_Length = memReg_Len; // @[cpu.scala 191:21]
  assign DataMem_io_memWr = memReg_memWr; // @[cpu.scala 192:20]
  assign DataMem_io_sign = memReg_sign; // @[cpu.scala 193:19]
  assign decoder_io_instr = instrReg; // @[cpu.scala 119:20]
  assign exe_clock = clock;
  assign exe_reset = reset;
  assign exe_io_opcode = decExReg_opcode; // @[cpu.scala 136:17]
  assign exe_io_rs1 = _GEN_149 == decExReg_rs1 & memReg_valid & decExReg_rs1 != 32'h0 ? memReg_regData : _exe_io_rs1_T_7
    ; // @[cpu.scala 141:20]
  assign exe_io_rs2 = _GEN_149 == decExReg_rs2 & memReg_valid & decExReg_rs2 != 32'h0 ? memReg_regData : _exe_io_rs2_T_6
    ; // @[cpu.scala 143:20]
  assign exe_io_rd = {{27'd0}, decExReg_rd}; // @[cpu.scala 146:13]
  assign exe_io_func3 = decExReg_func3; // @[cpu.scala 147:16]
  assign exe_io_func10 = decExReg_func10; // @[cpu.scala 148:17]
  assign exe_io_imm = decExReg_imm; // @[cpu.scala 149:14]
  assign exe_io_imm20 = decExReg_imm20; // @[cpu.scala 150:16]
  assign exe_io_pc = decExReg_pc; // @[cpu.scala 151:13]
  always @(posedge clock) begin
    if (reset) begin // @[cpu.scala 47:52]
      reg_0 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h0 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_0 <= _GEN_81;
        end else begin
          reg_0 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_1 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_1 <= _GEN_81;
        end else begin
          reg_1 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_2 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h2 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_2 <= _GEN_81;
        end else begin
          reg_2 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_3 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h3 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_3 <= _GEN_81;
        end else begin
          reg_3 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_4 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h4 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_4 <= _GEN_81;
        end else begin
          reg_4 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_5 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h5 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_5 <= _GEN_81;
        end else begin
          reg_5 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_6 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h6 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_6 <= _GEN_81;
        end else begin
          reg_6 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_7 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h7 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_7 <= _GEN_81;
        end else begin
          reg_7 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_8 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h8 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_8 <= _GEN_81;
        end else begin
          reg_8 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_9 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h9 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_9 <= _GEN_81;
        end else begin
          reg_9 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_10 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'ha == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_10 <= _GEN_81;
        end else begin
          reg_10 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_11 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'hb == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_11 <= _GEN_81;
        end else begin
          reg_11 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_12 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'hc == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_12 <= _GEN_81;
        end else begin
          reg_12 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_13 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'hd == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_13 <= _GEN_81;
        end else begin
          reg_13 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_14 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'he == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_14 <= _GEN_81;
        end else begin
          reg_14 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_15 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'hf == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_15 <= _GEN_81;
        end else begin
          reg_15 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_16 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h10 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_16 <= _GEN_81;
        end else begin
          reg_16 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_17 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h11 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_17 <= _GEN_81;
        end else begin
          reg_17 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_18 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h12 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_18 <= _GEN_81;
        end else begin
          reg_18 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_19 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h13 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_19 <= _GEN_81;
        end else begin
          reg_19 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_20 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h14 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_20 <= _GEN_81;
        end else begin
          reg_20 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_21 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h15 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_21 <= _GEN_81;
        end else begin
          reg_21 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_22 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h16 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_22 <= _GEN_81;
        end else begin
          reg_22 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_23 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h17 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_23 <= _GEN_81;
        end else begin
          reg_23 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_24 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h18 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_24 <= _GEN_81;
        end else begin
          reg_24 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_25 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h19 == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_25 <= _GEN_81;
        end else begin
          reg_25 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_26 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1a == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_26 <= _GEN_81;
        end else begin
          reg_26 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_27 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1b == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_27 <= _GEN_81;
        end else begin
          reg_27 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_28 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1c == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_28 <= _GEN_81;
        end else begin
          reg_28 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_29 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1d == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_29 <= _GEN_81;
        end else begin
          reg_29 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_30 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1e == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_30 <= _GEN_81;
        end else begin
          reg_30 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 47:52]
      reg_31 <= 32'h0; // @[cpu.scala 47:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
      if (5'h1f == wbReg_rd) begin // @[cpu.scala 214:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 204:36]
          reg_31 <= _GEN_81;
        end else begin
          reg_31 <= 32'h0; // @[cpu.scala 89:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_opcode <= 7'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_opcode <= decOut_opcode; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_rs1 <= 32'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_rs1 <= decOut_rs1; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_rs2 <= 32'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_rs2 <= decOut_rs2; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_rd <= 5'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_rd <= decOut_rd; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_func3 <= 3'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_func3 <= decOut_func3; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_func10 <= 10'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_func10 <= decOut_func10; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_imm <= 12'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_imm <= decOut_imm; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_imm20 <= 20'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_imm20 <= decOut_imm20; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_pc <= 32'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_pc <= pcRegReg; // @[cpu.scala 134:12]
    end
    if (reset) begin // @[cpu.scala 86:25]
      decExReg_valid <= 1'h0; // @[cpu.scala 86:25]
    end else begin
      decExReg_valid <= decOut_valid; // @[cpu.scala 134:12]
    end
    memReg_rd <= _GEN_154[4:0]; // @[cpu.scala 174:13 87:{23,23}]
    if (reset) begin // @[cpu.scala 87:23]
      memReg_regData <= 32'h0; // @[cpu.scala 87:23]
    end else if (decExReg_valid) begin // @[cpu.scala 173:24]
      memReg_regData <= exe_io_res;
    end else begin
      memReg_regData <= 32'h0;
    end
    if (reset) begin // @[cpu.scala 87:23]
      memReg_Addr <= 32'h0; // @[cpu.scala 87:23]
    end else begin
      memReg_Addr <= _memReg_Addr_T_1; // @[cpu.scala 178:15]
    end
    if (reset) begin // @[cpu.scala 87:23]
      memReg_Len <= 2'h0; // @[cpu.scala 87:23]
    end else if (decExReg_valid) begin // @[cpu.scala 180:21]
      memReg_Len <= exe_io_memLen;
    end else begin
      memReg_Len <= 2'h0;
    end
    if (reset) begin // @[cpu.scala 87:23]
      memReg_memWr <= 1'h0; // @[cpu.scala 87:23]
    end else begin
      memReg_memWr <= exe_io_memLen > 2'h0 & exe_io_opcode == 7'h23; // @[cpu.scala 179:16]
    end
    if (reset) begin // @[cpu.scala 87:23]
      memReg_sign <= 1'h0; // @[cpu.scala 87:23]
    end else begin
      memReg_sign <= exe_io_sign; // @[cpu.scala 181:15]
    end
    if (reset) begin // @[cpu.scala 87:23]
      memReg_valid <= 1'h0; // @[cpu.scala 87:23]
    end else begin
      memReg_valid <= exe_io_opcode != 7'h63 & decExReg_valid; // @[cpu.scala 182:16]
    end
    if (reset) begin // @[cpu.scala 88:22]
      wbReg_rd <= 5'h0; // @[cpu.scala 88:22]
    end else begin
      wbReg_rd <= memReg_rd; // @[cpu.scala 196:9]
    end
    if (reset) begin // @[cpu.scala 88:22]
      wbReg_regData <= 32'h0; // @[cpu.scala 88:22]
    end else begin
      wbReg_regData <= memReg_regData; // @[cpu.scala 196:9]
    end
    if (reset) begin // @[cpu.scala 88:22]
      wbReg_memData <= 32'h0; // @[cpu.scala 88:22]
    end else begin
      wbReg_memData <= DataMem_io_DataOut; // @[cpu.scala 197:17]
    end
    if (reset) begin // @[cpu.scala 88:22]
      wbReg_Len <= 2'h0; // @[cpu.scala 88:22]
    end else begin
      wbReg_Len <= memReg_Len; // @[cpu.scala 196:9]
    end
    if (reset) begin // @[cpu.scala 88:22]
      wbReg_memWr <= 1'h0; // @[cpu.scala 88:22]
    end else begin
      wbReg_memWr <= memReg_memWr; // @[cpu.scala 196:9]
    end
    if (reset) begin // @[cpu.scala 88:22]
      wbReg_valid <= 1'h0; // @[cpu.scala 88:22]
    end else begin
      wbReg_valid <= memReg_valid; // @[cpu.scala 196:9]
    end
    if (reset) begin // @[cpu.scala 94:22]
      pcReg <= 32'h0; // @[cpu.scala 94:22]
    end else if (doBranch) begin // @[cpu.scala 95:19]
      if (exe_io_opcode == 7'h67) begin // @[cpu.scala 157:22]
        pcReg <= _branchTarget_T_6;
      end else begin
        pcReg <= _branchTarget_T_15;
      end
    end else begin
      pcReg <= _pcNext_T_1;
    end
    pcRegReg <= pcReg; // @[cpu.scala 102:25]
    if (reset) begin // @[cpu.scala 107:25]
      instrReg <= 32'h33; // @[cpu.scala 107:25]
    end else if (doBranch) begin // @[cpu.scala 108:18]
      instrReg <= 32'h33;
    end else if (4'hd == pcReg[5:2]) begin // @[cpu.scala 108:18]
      instrReg <= 32'h73; // @[cpu.scala 108:18]
    end else if (4'hc == pcReg[5:2]) begin // @[cpu.scala 108:18]
      instrReg <= 32'ha00893; // @[cpu.scala 108:18]
    end else begin
      instrReg <= _GEN_11;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"%x ",pcReg); // @[cpu.scala 105:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3 & _T_1) begin
          $fwrite(32'h80000002,
            "reg: \n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x"
            ,reg_0,reg_1,reg_2,reg_3,reg_4,reg_5,reg_6,reg_7,reg_8,reg_9,reg_10,reg_11,reg_12,reg_13,reg_14,reg_15,
            reg_16,reg_17,reg_18,reg_19,reg_20,reg_21,reg_22,reg_23,reg_24,reg_25,reg_26,reg_27,reg_28,reg_29,reg_30,
            reg_31); // @[cpu.scala 169:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  reg_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  reg_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  reg_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  reg_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  reg_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  reg_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  reg_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  reg_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  reg_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  reg_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  reg_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  reg_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  reg_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  reg_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  reg_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  reg_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  reg_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  reg_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  reg_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  reg_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  reg_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  reg_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  reg_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  reg_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  reg_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  reg_31 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  decExReg_opcode = _RAND_32[6:0];
  _RAND_33 = {1{`RANDOM}};
  decExReg_rs1 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  decExReg_rs2 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  decExReg_rd = _RAND_35[4:0];
  _RAND_36 = {1{`RANDOM}};
  decExReg_func3 = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  decExReg_func10 = _RAND_37[9:0];
  _RAND_38 = {1{`RANDOM}};
  decExReg_imm = _RAND_38[11:0];
  _RAND_39 = {1{`RANDOM}};
  decExReg_imm20 = _RAND_39[19:0];
  _RAND_40 = {1{`RANDOM}};
  decExReg_pc = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  decExReg_valid = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  memReg_rd = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  memReg_regData = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  memReg_Addr = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  memReg_Len = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  memReg_memWr = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  memReg_sign = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  memReg_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  wbReg_rd = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  wbReg_regData = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  wbReg_memData = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  wbReg_Len = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  wbReg_memWr = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  wbReg_valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  pcReg = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  pcRegReg = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  instrReg = _RAND_57[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SevenSegDec(
  input  [3:0] io_in,
  output [6:0] io_out
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[SevenSegDec.scala 16:17 63:14 12:27]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[SevenSegDec.scala 16:17 60:14]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[SevenSegDec.scala 16:17 57:14]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h39 : _GEN_2; // @[SevenSegDec.scala 16:17 54:14]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[SevenSegDec.scala 16:17 51:14]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[SevenSegDec.scala 16:17 48:14]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[SevenSegDec.scala 16:17 45:14]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[SevenSegDec.scala 16:17 42:14]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[SevenSegDec.scala 16:17 39:14]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[SevenSegDec.scala 16:17 36:14]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[SevenSegDec.scala 16:17 33:14]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[SevenSegDec.scala 16:17 30:14]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[SevenSegDec.scala 16:17 27:14]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[SevenSegDec.scala 16:17 24:14]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[SevenSegDec.scala 16:17 21:14]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[SevenSegDec.scala 16:17 18:14]
endmodule
module DisplayMultiplexer(
  input         clock,
  input         reset,
  input         io_c5Full,
  input         io_noCans,
  input         io_iced,
  input  [15:0] io_hex,
  output [6:0]  io_seg,
  output [3:0]  io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevenSegDec0_io_in; // @[DisplayMultiplexer.scala 28:28]
  wire [6:0] sevenSegDec0_io_out; // @[DisplayMultiplexer.scala 28:28]
  wire [3:0] sevenSegDec1_io_in; // @[DisplayMultiplexer.scala 29:28]
  wire [6:0] sevenSegDec1_io_out; // @[DisplayMultiplexer.scala 29:28]
  wire [3:0] sevenSegDec2_io_in; // @[DisplayMultiplexer.scala 30:28]
  wire [6:0] sevenSegDec2_io_out; // @[DisplayMultiplexer.scala 30:28]
  wire [3:0] sevenSegDec3_io_in; // @[DisplayMultiplexer.scala 31:28]
  wire [6:0] sevenSegDec3_io_out; // @[DisplayMultiplexer.scala 31:28]
  reg [31:0] cntReg; // @[DisplayMultiplexer.scala 34:23]
  reg [3:0] outReg; // @[DisplayMultiplexer.scala 35:23]
  reg [15:0] outReg2; // @[DisplayMultiplexer.scala 36:24]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[DisplayMultiplexer.scala 40:20]
  wire [3:0] _outReg_T_2 = {outReg[0],outReg[3:1]}; // @[DisplayMultiplexer.scala 43:25]
  wire [6:0] _GEN_3 = io_noCans ? 7'h0 : sevenSegDec0_io_out; // @[DisplayMultiplexer.scala 64:29 65:16 67:16]
  wire [6:0] _GEN_4 = io_c5Full ? 7'h0 : _GEN_3; // @[DisplayMultiplexer.scala 62:28 63:16]
  wire [6:0] _GEN_6 = io_iced ? 7'h7f : _GEN_4; // @[DisplayMultiplexer.scala 58:21 59:16]
  wire [6:0] _GEN_7 = io_noCans ? 7'h0 : sevenSegDec1_io_out; // @[DisplayMultiplexer.scala 77:29 78:16 80:16]
  wire [6:0] _GEN_8 = io_c5Full ? 7'h40 : _GEN_7; // @[DisplayMultiplexer.scala 75:29 76:16]
  wire [6:0] _GEN_10 = io_iced ? 7'h7f : _GEN_8; // @[DisplayMultiplexer.scala 71:21 72:16]
  wire [6:0] _GEN_11 = io_noCans ? 7'h0 : sevenSegDec2_io_out; // @[DisplayMultiplexer.scala 90:29 91:16 93:16]
  wire [6:0] _GEN_12 = io_c5Full ? 7'h20 : _GEN_11; // @[DisplayMultiplexer.scala 88:29 89:16]
  wire [6:0] _GEN_14 = io_iced ? 7'h7f : _GEN_12; // @[DisplayMultiplexer.scala 84:21 85:16]
  wire [6:0] _GEN_15 = io_noCans ? 7'h0 : sevenSegDec3_io_out; // @[DisplayMultiplexer.scala 103:29 104:16 106:16]
  wire [6:0] _GEN_16 = io_c5Full ? 7'h10 : _GEN_15; // @[DisplayMultiplexer.scala 101:29 102:16]
  wire [6:0] _GEN_18 = io_iced ? 7'h7f : _GEN_16; // @[DisplayMultiplexer.scala 97:21 98:16]
  wire [6:0] _GEN_19 = 4'h8 == outReg ? _GEN_18 : 7'h7f; // @[DisplayMultiplexer.scala 55:18 18:27]
  wire [6:0] _GEN_20 = 4'h4 == outReg ? _GEN_14 : _GEN_19; // @[DisplayMultiplexer.scala 55:18]
  wire [6:0] _GEN_21 = 4'h2 == outReg ? _GEN_10 : _GEN_20; // @[DisplayMultiplexer.scala 55:18]
  wire [6:0] sevSeg = 4'h1 == outReg ? _GEN_6 : _GEN_21; // @[DisplayMultiplexer.scala 55:18]
  SevenSegDec sevenSegDec0 ( // @[DisplayMultiplexer.scala 28:28]
    .io_in(sevenSegDec0_io_in),
    .io_out(sevenSegDec0_io_out)
  );
  SevenSegDec sevenSegDec1 ( // @[DisplayMultiplexer.scala 29:28]
    .io_in(sevenSegDec1_io_in),
    .io_out(sevenSegDec1_io_out)
  );
  SevenSegDec sevenSegDec2 ( // @[DisplayMultiplexer.scala 30:28]
    .io_in(sevenSegDec2_io_in),
    .io_out(sevenSegDec2_io_out)
  );
  SevenSegDec sevenSegDec3 ( // @[DisplayMultiplexer.scala 31:28]
    .io_in(sevenSegDec3_io_in),
    .io_out(sevenSegDec3_io_out)
  );
  assign io_seg = ~sevSeg; // @[DisplayMultiplexer.scala 112:13]
  assign io_an = ~outReg; // @[DisplayMultiplexer.scala 113:12]
  assign sevenSegDec0_io_in = outReg2[3:0]; // @[DisplayMultiplexer.scala 49:32]
  assign sevenSegDec1_io_in = outReg2[7:4]; // @[DisplayMultiplexer.scala 50:32]
  assign sevenSegDec2_io_in = outReg2[11:8]; // @[DisplayMultiplexer.scala 51:32]
  assign sevenSegDec3_io_in = outReg2[15:12]; // @[DisplayMultiplexer.scala 52:32]
  always @(posedge clock) begin
    if (reset) begin // @[DisplayMultiplexer.scala 34:23]
      cntReg <= 32'h0; // @[DisplayMultiplexer.scala 34:23]
    end else if (cntReg == 32'h3e8) begin // @[DisplayMultiplexer.scala 41:28]
      cntReg <= 32'h0; // @[DisplayMultiplexer.scala 42:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[DisplayMultiplexer.scala 40:10]
    end
    if (reset) begin // @[DisplayMultiplexer.scala 35:23]
      outReg <= 4'h1; // @[DisplayMultiplexer.scala 35:23]
    end else if (cntReg == 32'h3e8) begin // @[DisplayMultiplexer.scala 41:28]
      outReg <= _outReg_T_2; // @[DisplayMultiplexer.scala 43:12]
    end
    if (reset) begin // @[DisplayMultiplexer.scala 36:24]
      outReg2 <= 16'h0; // @[DisplayMultiplexer.scala 36:24]
    end else if (cntReg == 32'h3e8) begin // @[DisplayMultiplexer.scala 41:28]
      outReg2 <= io_hex; // @[DisplayMultiplexer.scala 44:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  outReg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  outReg2 = _RAND_2[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module connection(
  input        clock,
  input        reset,
  output [6:0] io_seg,
  output [3:0] io_an,
  input  [3:0] io_sw,
  output [3:0] io_led
);
  wire  CPU_clock; // @[connection.scala 14:21]
  wire  CPU_reset; // @[connection.scala 14:21]
  wire [31:0] CPU_io_sevSegNum; // @[connection.scala 14:21]
  wire  SevenSeg_clock; // @[connection.scala 15:26]
  wire  SevenSeg_reset; // @[connection.scala 15:26]
  wire  SevenSeg_io_c5Full; // @[connection.scala 15:26]
  wire  SevenSeg_io_noCans; // @[connection.scala 15:26]
  wire  SevenSeg_io_iced; // @[connection.scala 15:26]
  wire [15:0] SevenSeg_io_hex; // @[connection.scala 15:26]
  wire [6:0] SevenSeg_io_seg; // @[connection.scala 15:26]
  wire [3:0] SevenSeg_io_an; // @[connection.scala 15:26]
  wire [15:0] _SevenSeg_io_hex_T_4 = io_sw[1] ? CPU_io_sevSegNum[31:16] : 16'h3111; // @[connection.scala 17:63]
  cpu CPU ( // @[connection.scala 14:21]
    .clock(CPU_clock),
    .reset(CPU_reset),
    .io_sevSegNum(CPU_io_sevSegNum)
  );
  DisplayMultiplexer SevenSeg ( // @[connection.scala 15:26]
    .clock(SevenSeg_clock),
    .reset(SevenSeg_reset),
    .io_c5Full(SevenSeg_io_c5Full),
    .io_noCans(SevenSeg_io_noCans),
    .io_iced(SevenSeg_io_iced),
    .io_hex(SevenSeg_io_hex),
    .io_seg(SevenSeg_io_seg),
    .io_an(SevenSeg_io_an)
  );
  assign io_seg = SevenSeg_io_seg; // @[connection.scala 24:12]
  assign io_an = SevenSeg_io_an; // @[connection.scala 25:11]
  assign io_led = io_sw; // @[connection.scala 27:12]
  assign CPU_clock = clock;
  assign CPU_reset = reset;
  assign SevenSeg_clock = clock;
  assign SevenSeg_reset = reset;
  assign SevenSeg_io_c5Full = io_sw[1] & io_sw[0]; // @[connection.scala 20:36]
  assign SevenSeg_io_noCans = io_sw[2]; // @[connection.scala 21:32]
  assign SevenSeg_io_iced = io_sw[3]; // @[connection.scala 22:30]
  assign SevenSeg_io_hex = io_sw[0] ? CPU_io_sevSegNum[15:0] : _SevenSeg_io_hex_T_4; // @[connection.scala 17:27]
endmodule
