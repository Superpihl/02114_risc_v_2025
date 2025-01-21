module memory(
  input         clock,
  input  [31:0] io_Addr,
  input  [31:0] io_DataIn,
  input  [1:0]  io_Length,
  input         io_memWr,
  input         io_sign,
  output [31:0] io_DataOut,
  output [15:0] io_hex
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
  wire [7:0] _GEN_0 = io_Addr == 32'h101 ? io_DataIn[7:0] : 8'h0; // @[memory.scala 30:46 31:20 24:24]
  wire  _GEN_3 = io_Addr == 32'h101 ? 1'h0 : 1'h1; // @[memory.scala 21:31 30:46 33:19]
  wire [7:0] _GEN_6 = io_Addr == 32'h100 ? io_DataIn[7:0] : 8'h0; // @[memory.scala 28:34 29:20 24:24]
  wire [7:0] _GEN_7 = io_Addr == 32'h100 ? 8'h0 : _GEN_0; // @[memory.scala 24:24 28:34]
  wire  _GEN_10 = io_Addr == 32'h100 ? 1'h0 : _GEN_3; // @[memory.scala 21:31 28:34]
  wire [7:0] _GEN_13 = io_memWr ? _GEN_6 : 8'h0; // @[memory.scala 27:19 24:24]
  wire [7:0] _GEN_14 = io_memWr ? _GEN_7 : 8'h0; // @[memory.scala 27:19 24:24]
  wire  _GEN_17 = io_memWr & _GEN_10; // @[memory.scala 27:19 21:31]
  wire  _GEN_20 = io_memWr ? 1'h0 : 1'h1; // @[memory.scala 27:19 21:31 37:31]
  wire [7:0] _GEN_23 = io_memWr ? 8'h0 : DataMemory_tempOut_0_MPORT_data; // @[memory.scala 27:19 23:24 37:18]
  wire [7:0] _GEN_24 = 2'h0 < io_Length ? _GEN_13 : 8'h0; // @[memory.scala 24:24 26:24]
  wire [7:0] _GEN_25 = 2'h0 < io_Length ? _GEN_14 : 8'h0; // @[memory.scala 24:24 26:24]
  wire [7:0] tempOut_0 = 2'h0 < io_Length ? _GEN_23 : 8'h0; // @[memory.scala 23:24 26:24]
  wire  _T_5 = 2'h1 < io_Length; // @[memory.scala 41:12]
  wire [31:0] _T_7 = io_Addr + 32'h1; // @[memory.scala 43:20]
  wire [31:0] _T_10 = io_Addr + 32'h2; // @[memory.scala 45:26]
  wire  _T_11 = _T_10 == 32'h100; // @[memory.scala 45:32]
  wire [7:0] _GEN_35 = _T_10 == 32'h100 ? io_DataIn[15:8] : _GEN_25; // @[memory.scala 45:46 46:20]
  wire  _GEN_38 = _T_10 == 32'h100 ? 1'h0 : 1'h1; // @[memory.scala 21:31 45:46 48:19]
  wire [7:0] _GEN_41 = _T_7 == 32'h100 ? io_DataIn[15:8] : _GEN_24; // @[memory.scala 43:40 44:20]
  wire [7:0] _GEN_42 = _T_7 == 32'h100 ? _GEN_25 : _GEN_35; // @[memory.scala 43:40]
  wire  _GEN_45 = _T_7 == 32'h100 ? 1'h0 : _GEN_38; // @[memory.scala 21:31 43:40]
  wire [7:0] _GEN_48 = io_memWr ? _GEN_41 : _GEN_24; // @[memory.scala 42:19]
  wire [7:0] _GEN_49 = io_memWr ? _GEN_42 : _GEN_25; // @[memory.scala 42:19]
  wire  _GEN_52 = io_memWr & _GEN_45; // @[memory.scala 42:19 21:31]
  wire [7:0] _GEN_56 = io_memWr ? 8'h0 : DataMemory_tempOut_1_MPORT_data; // @[memory.scala 42:19 23:24 51:18]
  wire [7:0] _GEN_57 = 2'h1 < io_Length ? _GEN_48 : _GEN_24; // @[memory.scala 41:24]
  wire [7:0] _GEN_58 = 2'h1 < io_Length ? _GEN_49 : _GEN_25; // @[memory.scala 41:24]
  wire [7:0] tempOut_1 = 2'h1 < io_Length ? _GEN_56 : 8'h0; // @[memory.scala 23:24 41:24]
  wire  _T_16 = 2'h2 < io_Length; // @[memory.scala 54:12]
  wire [31:0] _T_25 = io_Addr + 32'h3; // @[memory.scala 61:27]
  wire [7:0] _GEN_68 = _T_11 ? io_DataIn[23:16] : _GEN_57; // @[memory.scala 56:40 57:20]
  wire [7:0] _GEN_69 = _T_11 ? io_DataIn[31:24] : _GEN_58; // @[memory.scala 56:40 58:20]
  wire [7:0] _GEN_77 = io_memWr ? _GEN_68 : _GEN_57; // @[memory.scala 55:19]
  wire [7:0] _GEN_78 = io_memWr ? _GEN_69 : _GEN_58; // @[memory.scala 55:19]
  wire  _GEN_81 = io_memWr & _GEN_38; // @[memory.scala 55:19 21:31]
  wire [7:0] _GEN_87 = io_memWr ? 8'h0 : DataMemory_tempOut_2_MPORT_data; // @[memory.scala 55:19 23:24 64:18]
  wire [7:0] _GEN_89 = io_memWr ? 8'h0 : DataMemory_tempOut_3_MPORT_data; // @[memory.scala 55:19 23:24 65:18]
  wire [7:0] tempSeg_0 = 2'h2 < io_Length ? _GEN_77 : _GEN_57; // @[memory.scala 54:24]
  wire [7:0] tempSeg_1 = 2'h2 < io_Length ? _GEN_78 : _GEN_58; // @[memory.scala 54:24]
  wire [7:0] tempOut_2 = 2'h2 < io_Length ? _GEN_87 : 8'h0; // @[memory.scala 23:24 54:24]
  wire [7:0] tempOut_3 = 2'h2 < io_Length ? _GEN_89 : 8'h0; // @[memory.scala 23:24 54:24]
  wire  _T_29 = ~io_sign; // @[memory.scala 71:29]
  wire [7:0] _T_31 = tempOut_0 & 8'h80; // @[memory.scala 71:53]
  wire [31:0] _io_DataOut_T = {24'hffffff,tempOut_0}; // @[memory.scala 72:30]
  wire [7:0] _T_37 = tempOut_1 & 8'h80; // @[memory.scala 73:59]
  wire [31:0] _io_DataOut_T_2 = {16'hffff,tempOut_1,tempOut_0}; // @[memory.scala 74:42]
  wire [31:0] _io_DataOut_T_5 = {tempOut_3,tempOut_2,tempOut_1,tempOut_0}; // @[memory.scala 76:58]
  wire [31:0] _GEN_105 = io_Length == 2'h2 & _T_29 & _T_37 == 8'h80 ? _io_DataOut_T_2 : _io_DataOut_T_5; // @[memory.scala 73:80 74:16 76:16]
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
  assign DataMemory_MPORT_1_addr = _T_7[7:0];
  assign DataMemory_MPORT_1_mask = 1'h1;
  assign DataMemory_MPORT_1_en = _T_5 & _GEN_52;
  assign DataMemory_MPORT_2_data = io_DataIn[23:16];
  assign DataMemory_MPORT_2_addr = _T_10[7:0];
  assign DataMemory_MPORT_2_mask = 1'h1;
  assign DataMemory_MPORT_2_en = _T_16 & _GEN_81;
  assign DataMemory_MPORT_3_data = io_DataIn[31:24];
  assign DataMemory_MPORT_3_addr = _T_25[7:0];
  assign DataMemory_MPORT_3_mask = 1'h1;
  assign DataMemory_MPORT_3_en = _T_16 & _GEN_81;
  assign io_DataOut = io_Length == 2'h1 & ~io_sign & _T_31 == 8'h80 ? _io_DataOut_T : _GEN_105; // @[memory.scala 71:74 72:16]
  assign io_hex = {tempSeg_1,tempSeg_0}; // @[memory.scala 69:24]
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
    DataMemory_tempOut_1_MPORT_en_pipe_0 <= _T_5 & _GEN_20;
    if (_T_5 & _GEN_20) begin
      DataMemory_tempOut_1_MPORT_addr_pipe_0 <= _T_7[7:0];
    end
    DataMemory_tempOut_2_MPORT_en_pipe_0 <= _T_16 & _GEN_20;
    if (_T_16 & _GEN_20) begin
      DataMemory_tempOut_2_MPORT_addr_pipe_0 <= _T_10[7:0];
    end
    DataMemory_tempOut_3_MPORT_en_pipe_0 <= _T_16 & _GEN_20;
    if (_T_16 & _GEN_20) begin
      DataMemory_tempOut_3_MPORT_addr_pipe_0 <= _T_25[7:0];
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
  wire  _T = 7'h3 == io_opcode; // @[execution.scala 130:21]
  wire [31:0] _GEN_62 = {{20'd0}, io_imm}; // @[execution.scala 132:24]
  wire [31:0] _io_res_T_1 = io_rs1 + _GEN_62; // @[execution.scala 132:24]
  wire  _T_1 = 3'h0 == io_func3; // @[execution.scala 133:23]
  wire  _T_2 = 3'h1 == io_func3; // @[execution.scala 133:23]
  wire  _T_3 = 3'h2 == io_func3; // @[execution.scala 133:23]
  wire  _T_4 = 3'h4 == io_func3; // @[execution.scala 133:23]
  wire  _T_5 = 3'h5 == io_func3; // @[execution.scala 133:23]
  wire [1:0] _GEN_0 = 3'h5 == io_func3 ? 2'h2 : 2'h0; // @[execution.scala 128:13 133:23 148:21]
  wire [1:0] _GEN_2 = 3'h4 == io_func3 ? 2'h1 : _GEN_0; // @[execution.scala 133:23 144:21]
  wire  _GEN_3 = 3'h4 == io_func3 | 3'h5 == io_func3; // @[execution.scala 133:23 145:19]
  wire [1:0] _GEN_4 = 3'h2 == io_func3 ? 2'h3 : _GEN_2; // @[execution.scala 133:23 141:21]
  wire  _GEN_5 = 3'h2 == io_func3 ? 1'h0 : _GEN_3; // @[execution.scala 129:11 133:23]
  wire [1:0] _GEN_6 = 3'h1 == io_func3 ? 2'h2 : _GEN_4; // @[execution.scala 133:23 138:21]
  wire  _GEN_7 = 3'h1 == io_func3 ? 1'h0 : _GEN_5; // @[execution.scala 129:11 133:23]
  wire [1:0] _GEN_8 = 3'h0 == io_func3 ? 2'h1 : _GEN_6; // @[execution.scala 133:23 135:21]
  wire  _GEN_9 = 3'h0 == io_func3 ? 1'h0 : _GEN_7; // @[execution.scala 129:11 133:23]
  wire  _T_6 = 7'h13 == io_opcode; // @[execution.scala 130:21]
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
  wire  _T_7 = 7'h17 == io_opcode; // @[execution.scala 130:21]
  wire [19:0] _io_res_T_19 = io_imm20; // @[execution.scala 157:42]
  wire [31:0] _GEN_69 = {{12{_io_res_T_19[19]}},_io_res_T_19}; // @[execution.scala 157:31]
  wire [31:0] _io_res_T_23 = $signed(io_pc) + $signed(_GEN_69); // @[execution.scala 157:50]
  wire  _T_8 = 7'h23 == io_opcode; // @[execution.scala 130:21]
  wire [31:0] _GEN_17 = _T_3 ? io_rs2 : 32'h0; // @[execution.scala 126:10 161:23 171:18]
  wire [1:0] _GEN_18 = _T_3 ? 2'h3 : 2'h0; // @[execution.scala 128:13 161:23 172:21]
  wire [31:0] _GEN_19 = _T_2 ? {{16'd0}, io_rs2[15:0]} : _GEN_17; // @[execution.scala 161:23 167:18]
  wire [1:0] _GEN_20 = _T_2 ? 2'h2 : _GEN_18; // @[execution.scala 161:23 168:21]
  wire [31:0] _GEN_21 = _T_1 ? {{24'd0}, io_rs2[7:0]} : _GEN_19; // @[execution.scala 161:23 163:18]
  wire [1:0] _GEN_22 = _T_1 ? 2'h1 : _GEN_20; // @[execution.scala 161:23 164:21]
  wire  _T_12 = 7'h6f == io_opcode; // @[execution.scala 130:21]
  wire [31:0] _io_res_T_27 = io_pc + 32'h4; // @[execution.scala 178:23]
  wire  _T_13 = 7'h33 == io_opcode; // @[execution.scala 130:21]
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
  wire  _T_14 = 7'h37 == io_opcode; // @[execution.scala 130:21]
  wire [31:0] _io_res_T_38 = {io_imm20, 12'h0}; // @[execution.scala 187:26]
  wire  _T_15 = 7'h63 == io_opcode; // @[execution.scala 130:21]
  wire [31:0] _io_res_T_44 = $signed(io_pc) + $signed(_GEN_63); // @[execution.scala 190:48]
  wire  _GEN_33 = _io_res_T_7 & io_rs1 >= io_rs2; // @[execution.scala 102:12 103:19 120:16]
  wire  _GEN_34 = _io_res_T_6 ? _io_res_res_T_24 : _GEN_33; // @[execution.scala 103:19 117:16]
  wire  _GEN_35 = _T_5 ? $signed(io_rs1) >= $signed(io_rs2) : _GEN_34; // @[execution.scala 103:19 114:16]
  wire  _GEN_36 = _T_4 ? _io_res_res_T_23 : _GEN_35; // @[execution.scala 103:19 111:16]
  wire  _GEN_37 = _T_2 ? io_rs1 != io_rs2 : _GEN_36; // @[execution.scala 103:19 108:16]
  wire  io_branch_branch = _T_1 ? io_rs1 == io_rs2 : _GEN_37; // @[execution.scala 103:19 105:16]
  wire  _T_16 = 7'h67 == io_opcode; // @[execution.scala 130:21]
  wire  _T_17 = 7'h73 == io_opcode; // @[execution.scala 130:21]
  wire [31:0] _GEN_39 = 7'h67 == io_opcode ? _io_res_T_27 : 32'h0; // @[execution.scala 126:10 130:21 194:14]
  wire [31:0] _GEN_41 = 7'h63 == io_opcode ? _io_res_T_44 : _GEN_39; // @[execution.scala 130:21 190:14]
  wire  _GEN_42 = 7'h63 == io_opcode ? io_branch_branch : 7'h67 == io_opcode; // @[execution.scala 130:21 191:17]
  wire [31:0] _GEN_43 = 7'h37 == io_opcode ? _io_res_T_38 : _GEN_41; // @[execution.scala 130:21 187:14]
  wire  _GEN_44 = 7'h37 == io_opcode ? 1'h0 : _GEN_42; // @[execution.scala 127:13 130:21]
  wire [31:0] io_res_res_1 = _GEN_32[31:0]; // @[execution.scala 24:19]
  wire [31:0] _GEN_45 = 7'h33 == io_opcode ? io_res_res_1 : _GEN_43; // @[execution.scala 130:21 182:14]
  wire  _GEN_46 = 7'h33 == io_opcode ? 1'h0 : _GEN_44; // @[execution.scala 127:13 130:21]
  wire [31:0] _GEN_47 = 7'h6f == io_opcode ? _io_res_T_27 : _GEN_45; // @[execution.scala 130:21 178:14]
  wire  _GEN_48 = 7'h6f == io_opcode | _GEN_46; // @[execution.scala 130:21 179:17]
  wire [31:0] _GEN_49 = 7'h23 == io_opcode ? _GEN_21 : _GEN_47; // @[execution.scala 130:21]
  wire [1:0] _GEN_50 = 7'h23 == io_opcode ? _GEN_22 : 2'h0; // @[execution.scala 128:13 130:21]
  wire  _GEN_51 = 7'h23 == io_opcode ? 1'h0 : _GEN_48; // @[execution.scala 127:13 130:21]
  wire [31:0] _GEN_52 = 7'h17 == io_opcode ? _io_res_T_23 : _GEN_49; // @[execution.scala 130:21 157:14]
  wire  _GEN_53 = 7'h17 == io_opcode | _GEN_51; // @[execution.scala 130:21 158:17]
  wire [1:0] _GEN_54 = 7'h17 == io_opcode ? 2'h0 : _GEN_50; // @[execution.scala 128:13 130:21]
  wire [31:0] io_res_res = _GEN_16[31:0]; // @[execution.scala 64:19]
  wire [31:0] _GEN_55 = 7'h13 == io_opcode ? io_res_res : _GEN_52; // @[execution.scala 130:21 154:14]
  wire  _GEN_56 = 7'h13 == io_opcode ? 1'h0 : _GEN_53; // @[execution.scala 127:13 130:21]
  wire [1:0] _GEN_57 = 7'h13 == io_opcode ? 2'h0 : _GEN_54; // @[execution.scala 128:13 130:21]
  assign io_res = 7'h3 == io_opcode ? _io_res_T_1 : _GEN_55; // @[execution.scala 130:21 132:14]
  assign io_branch = 7'h3 == io_opcode ? 1'h0 : _GEN_56; // @[execution.scala 127:13 130:21]
  assign io_memLen = 7'h3 == io_opcode ? _GEN_8 : _GEN_57; // @[execution.scala 130:21]
  assign io_sign = 7'h3 == io_opcode & _GEN_9; // @[execution.scala 129:11 130:21]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T & ~_T_6 & ~_T_7 & ~_T_8 & ~_T_12 & ~_T_13 & ~_T_14 & ~_T_15 & ~_T_16 & _T_17 & ~reset) begin
          $fwrite(32'h80000002,"\nEcall got damn\n"); // @[execution.scala 199:13]
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
  output [15:0] io_sevSegNum
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
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_ [0:31]; // @[cpu.scala 47:24]
  wire  reg__exe_io_rs1_MPORT_en; // @[cpu.scala 47:24]
  wire [4:0] reg__exe_io_rs1_MPORT_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__exe_io_rs1_MPORT_data; // @[cpu.scala 47:24]
  wire  reg__exe_io_rs2_MPORT_en; // @[cpu.scala 47:24]
  wire [4:0] reg__exe_io_rs2_MPORT_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__exe_io_rs2_MPORT_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_1_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_1_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_1_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_2_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_2_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_2_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_3_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_3_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_3_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_4_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_4_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_4_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_5_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_5_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_5_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_6_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_6_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_6_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_7_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_7_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_7_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_8_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_8_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_8_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_9_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_9_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_9_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_10_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_10_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_10_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_11_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_11_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_11_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_12_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_12_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_12_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_13_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_13_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_13_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_14_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_14_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_14_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_15_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_15_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_15_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_16_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_16_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_16_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_17_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_17_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_17_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_18_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_18_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_18_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_19_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_19_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_19_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_20_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_20_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_20_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_21_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_21_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_21_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_22_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_22_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_22_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_23_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_23_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_23_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_24_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_24_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_24_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_25_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_25_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_25_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_26_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_26_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_26_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_27_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_27_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_27_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_28_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_28_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_28_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_29_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_29_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_29_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_30_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_30_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_30_data; // @[cpu.scala 47:24]
  wire  reg__MPORT_31_en; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_31_addr; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_31_data; // @[cpu.scala 47:24]
  wire [31:0] reg__MPORT_32_data; // @[cpu.scala 47:24]
  wire [4:0] reg__MPORT_32_addr; // @[cpu.scala 47:24]
  wire  reg__MPORT_32_mask; // @[cpu.scala 47:24]
  wire  reg__MPORT_32_en; // @[cpu.scala 47:24]
  reg  reg_exe_io_rs1_MPORT_en_pipe_0;
  reg [4:0] reg_exe_io_rs1_MPORT_addr_pipe_0;
  reg  reg_exe_io_rs2_MPORT_en_pipe_0;
  reg [4:0] reg_exe_io_rs2_MPORT_addr_pipe_0;
  reg  reg_MPORT_en_pipe_0;
  reg [4:0] reg_MPORT_addr_pipe_0;
  reg  reg_MPORT_1_en_pipe_0;
  reg [4:0] reg_MPORT_1_addr_pipe_0;
  reg  reg_MPORT_2_en_pipe_0;
  reg [4:0] reg_MPORT_2_addr_pipe_0;
  reg  reg_MPORT_3_en_pipe_0;
  reg [4:0] reg_MPORT_3_addr_pipe_0;
  reg  reg_MPORT_4_en_pipe_0;
  reg [4:0] reg_MPORT_4_addr_pipe_0;
  reg  reg_MPORT_5_en_pipe_0;
  reg [4:0] reg_MPORT_5_addr_pipe_0;
  reg  reg_MPORT_6_en_pipe_0;
  reg [4:0] reg_MPORT_6_addr_pipe_0;
  reg  reg_MPORT_7_en_pipe_0;
  reg [4:0] reg_MPORT_7_addr_pipe_0;
  reg  reg_MPORT_8_en_pipe_0;
  reg [4:0] reg_MPORT_8_addr_pipe_0;
  reg  reg_MPORT_9_en_pipe_0;
  reg [4:0] reg_MPORT_9_addr_pipe_0;
  reg  reg_MPORT_10_en_pipe_0;
  reg [4:0] reg_MPORT_10_addr_pipe_0;
  reg  reg_MPORT_11_en_pipe_0;
  reg [4:0] reg_MPORT_11_addr_pipe_0;
  reg  reg_MPORT_12_en_pipe_0;
  reg [4:0] reg_MPORT_12_addr_pipe_0;
  reg  reg_MPORT_13_en_pipe_0;
  reg [4:0] reg_MPORT_13_addr_pipe_0;
  reg  reg_MPORT_14_en_pipe_0;
  reg [4:0] reg_MPORT_14_addr_pipe_0;
  reg  reg_MPORT_15_en_pipe_0;
  reg [4:0] reg_MPORT_15_addr_pipe_0;
  reg  reg_MPORT_16_en_pipe_0;
  reg [4:0] reg_MPORT_16_addr_pipe_0;
  reg  reg_MPORT_17_en_pipe_0;
  reg [4:0] reg_MPORT_17_addr_pipe_0;
  reg  reg_MPORT_18_en_pipe_0;
  reg [4:0] reg_MPORT_18_addr_pipe_0;
  reg  reg_MPORT_19_en_pipe_0;
  reg [4:0] reg_MPORT_19_addr_pipe_0;
  reg  reg_MPORT_20_en_pipe_0;
  reg [4:0] reg_MPORT_20_addr_pipe_0;
  reg  reg_MPORT_21_en_pipe_0;
  reg [4:0] reg_MPORT_21_addr_pipe_0;
  reg  reg_MPORT_22_en_pipe_0;
  reg [4:0] reg_MPORT_22_addr_pipe_0;
  reg  reg_MPORT_23_en_pipe_0;
  reg [4:0] reg_MPORT_23_addr_pipe_0;
  reg  reg_MPORT_24_en_pipe_0;
  reg [4:0] reg_MPORT_24_addr_pipe_0;
  reg  reg_MPORT_25_en_pipe_0;
  reg [4:0] reg_MPORT_25_addr_pipe_0;
  reg  reg_MPORT_26_en_pipe_0;
  reg [4:0] reg_MPORT_26_addr_pipe_0;
  reg  reg_MPORT_27_en_pipe_0;
  reg [4:0] reg_MPORT_27_addr_pipe_0;
  reg  reg_MPORT_28_en_pipe_0;
  reg [4:0] reg_MPORT_28_addr_pipe_0;
  reg  reg_MPORT_29_en_pipe_0;
  reg [4:0] reg_MPORT_29_addr_pipe_0;
  reg  reg_MPORT_30_en_pipe_0;
  reg [4:0] reg_MPORT_30_addr_pipe_0;
  reg  reg_MPORT_31_en_pipe_0;
  reg [4:0] reg_MPORT_31_addr_pipe_0;
  wire  DataMem_clock; // @[cpu.scala 49:23]
  wire [31:0] DataMem_io_Addr; // @[cpu.scala 49:23]
  wire [31:0] DataMem_io_DataIn; // @[cpu.scala 49:23]
  wire [1:0] DataMem_io_Length; // @[cpu.scala 49:23]
  wire  DataMem_io_memWr; // @[cpu.scala 49:23]
  wire  DataMem_io_sign; // @[cpu.scala 49:23]
  wire [31:0] DataMem_io_DataOut; // @[cpu.scala 49:23]
  wire [15:0] DataMem_io_hex; // @[cpu.scala 49:23]
  wire [31:0] decoder_io_instr; // @[cpu.scala 65:23]
  wire [4:0] decoder_io_rs1; // @[cpu.scala 65:23]
  wire [4:0] decoder_io_rs2; // @[cpu.scala 65:23]
  wire [4:0] decoder_io_rd; // @[cpu.scala 65:23]
  wire [2:0] decoder_io_func3; // @[cpu.scala 65:23]
  wire [9:0] decoder_io_func10; // @[cpu.scala 65:23]
  wire [11:0] decoder_io_imm; // @[cpu.scala 65:23]
  wire [19:0] decoder_io_imm20; // @[cpu.scala 65:23]
  wire  exe_clock; // @[cpu.scala 68:19]
  wire  exe_reset; // @[cpu.scala 68:19]
  wire [6:0] exe_io_opcode; // @[cpu.scala 68:19]
  wire [31:0] exe_io_rs1; // @[cpu.scala 68:19]
  wire [31:0] exe_io_rs2; // @[cpu.scala 68:19]
  wire [31:0] exe_io_rd; // @[cpu.scala 68:19]
  wire [2:0] exe_io_func3; // @[cpu.scala 68:19]
  wire [9:0] exe_io_func10; // @[cpu.scala 68:19]
  wire [11:0] exe_io_imm; // @[cpu.scala 68:19]
  wire [19:0] exe_io_imm20; // @[cpu.scala 68:19]
  wire [31:0] exe_io_pc; // @[cpu.scala 68:19]
  wire [31:0] exe_io_res; // @[cpu.scala 68:19]
  wire  exe_io_branch; // @[cpu.scala 68:19]
  wire [1:0] exe_io_memLen; // @[cpu.scala 68:19]
  wire  exe_io_sign; // @[cpu.scala 68:19]
  reg [6:0] decExReg_opcode; // @[cpu.scala 69:25]
  reg [31:0] decExReg_rs1; // @[cpu.scala 69:25]
  reg [31:0] decExReg_rs2; // @[cpu.scala 69:25]
  reg [4:0] decExReg_rd; // @[cpu.scala 69:25]
  reg [2:0] decExReg_func3; // @[cpu.scala 69:25]
  reg [9:0] decExReg_func10; // @[cpu.scala 69:25]
  reg [11:0] decExReg_imm; // @[cpu.scala 69:25]
  reg [19:0] decExReg_imm20; // @[cpu.scala 69:25]
  reg [31:0] decExReg_pc; // @[cpu.scala 69:25]
  reg  decExReg_valid; // @[cpu.scala 69:25]
  reg [4:0] memReg_rd; // @[cpu.scala 70:23]
  reg [31:0] memReg_regData; // @[cpu.scala 70:23]
  reg [31:0] memReg_Addr; // @[cpu.scala 70:23]
  reg [1:0] memReg_Len; // @[cpu.scala 70:23]
  reg  memReg_memWr; // @[cpu.scala 70:23]
  reg  memReg_sign; // @[cpu.scala 70:23]
  reg  memReg_valid; // @[cpu.scala 70:23]
  reg [4:0] wbReg_rd; // @[cpu.scala 71:22]
  reg [31:0] wbReg_regData; // @[cpu.scala 71:22]
  reg [31:0] wbReg_memData; // @[cpu.scala 71:22]
  reg [1:0] wbReg_Len; // @[cpu.scala 71:22]
  reg  wbReg_memWr; // @[cpu.scala 71:22]
  reg  wbReg_valid; // @[cpu.scala 71:22]
  reg [31:0] pcReg; // @[cpu.scala 77:22]
  wire [31:0] _pcNext_T_1 = pcReg + 32'h4; // @[cpu.scala 78:50]
  wire  doBranch = exe_io_branch & decExReg_valid; // @[cpu.scala 133:29]
  wire [11:0] _branchTarget_T_2 = decExReg_imm; // @[cpu.scala 132:82]
  wire [31:0] _GEN_65 = {{20{_branchTarget_T_2[11]}},_branchTarget_T_2}; // @[cpu.scala 132:67]
  wire [31:0] _branchTarget_T_6 = $signed(exe_io_rs1) + $signed(_GEN_65); // @[cpu.scala 132:90]
  wire [19:0] _branchTarget_T_11 = exe_io_opcode == 7'h17 ? $signed(decExReg_imm20) : $signed({{8{_branchTarget_T_2[11
    ]}},_branchTarget_T_2}); // @[cpu.scala 132:122]
  wire [31:0] _GEN_66 = {{12{_branchTarget_T_11[19]}},_branchTarget_T_11}; // @[cpu.scala 132:117]
  wire [31:0] _branchTarget_T_15 = $signed(decExReg_pc) + $signed(_GEN_66); // @[cpu.scala 132:192]
  reg [31:0] pcRegReg; // @[cpu.scala 83:25]
  wire  _T_1 = ~reset; // @[cpu.scala 86:9]
  reg [31:0] instrReg; // @[cpu.scala 88:25]
  wire [31:0] _GEN_1 = 5'h1 == pcReg[6:2] ? 32'h38000ef : 32'h10000293; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_2 = 5'h2 == pcReg[6:2] ? 32'hfff50513 : _GEN_1; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_3 = 5'h3 == pcReg[6:2] ? 32'ha04663 : _GEN_2; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_4 = 5'h4 == pcReg[6:2] ? 32'h100793 : _GEN_3; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_5 = 5'h5 == pcReg[6:2] ? 32'h180006f : _GEN_4; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_6 = 5'h6 == pcReg[6:2] ? 32'hfff50513 : _GEN_5; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_7 = 5'h7 == pcReg[6:2] ? 32'ha28023 : _GEN_6; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_8 = 5'h8 == pcReg[6:2] ? 32'h97 : _GEN_7; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_9 = 5'h9 == pcReg[6:2] ? 32'hfe8080e7 : _GEN_8; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_10 = 5'ha == pcReg[6:2] ? 32'h150513 : _GEN_9; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_11 = 5'hb == pcReg[6:2] ? 32'h258593 : _GEN_10; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_12 = 5'hc == pcReg[6:2] ? 32'hb280a3 : _GEN_11; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_13 = 5'hd == pcReg[6:2] ? 32'h2b2c063 : _GEN_12; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_14 = 5'he == pcReg[6:2] ? 32'h8067 : _GEN_13; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_15 = 5'hf == pcReg[6:2] ? 32'h6400513 : _GEN_14; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_16 = 5'h10 == pcReg[6:2] ? 32'h97 : _GEN_15; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_17 = 5'h11 == pcReg[6:2] ? 32'hfc8080e7 : _GEN_16; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_18 = 5'h12 == pcReg[6:2] ? 32'h50793 : _GEN_17; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_19 = 5'h13 == pcReg[6:2] ? 32'h78513 : _GEN_18; // @[cpu.scala 89:{18,18}]
  wire [31:0] _GEN_20 = 5'h14 == pcReg[6:2] ? 32'h8067 : _GEN_19; // @[cpu.scala 89:{18,18}]
  wire [6:0] decOut_opcode = instrReg[6:0]; // @[cpu.scala 96:28]
  wire  decOut_valid = ~doBranch; // @[cpu.scala 105:19]
  wire [31:0] _GEN_67 = {{27'd0}, memReg_rd}; // @[cpu.scala 116:32]
  wire [31:0] _GEN_68 = {{27'd0}, wbReg_rd}; // @[cpu.scala 117:19]
  wire  _T_5 = ~wbReg_memWr; // @[cpu.scala 178:8]
  wire  _T_6 = ~wbReg_memWr & wbReg_valid; // @[cpu.scala 178:21]
  wire [31:0] _GEN_57 = wbReg_Len > 2'h0 ? wbReg_memData : wbReg_regData; // @[cpu.scala 179:26 180:14 182:14]
  wire [31:0] _GEN_58 = wbReg_rd == 5'h0 ? 32'h0 : _GEN_57; // @[cpu.scala 184:27 185:14]
  wire [31:0] wbData = ~wbReg_memWr & wbReg_valid ? _GEN_58 : 32'h0; // @[cpu.scala 178:36 72:27]
  wire [31:0] _exe_io_rs1_T_5 = _GEN_68 == decExReg_rs1 & wbReg_valid ? wbData : reg__exe_io_rs1_MPORT_data; // @[cpu.scala 117:8]
  wire [31:0] _exe_io_rs2_T_3 = _GEN_68 == decExReg_rs2 ? wbData : reg__exe_io_rs2_MPORT_data; // @[cpu.scala 119:8]
  wire  _T_2 = exe_io_opcode == 7'h73; // @[cpu.scala 143:22]
  wire [31:0] _memReg_rd_T = decExReg_valid ? exe_io_rd : 32'h0; // @[cpu.scala 148:19]
  wire [31:0] _GEN_71 = {{20'd0}, exe_io_imm}; // @[cpu.scala 152:29]
  wire [31:0] _memReg_Addr_T_1 = exe_io_rs1 + _GEN_71; // @[cpu.scala 152:29]
  wire [31:0] decOut_rs1 = {{27'd0}, decoder_io_rs1}; // @[cpu.scala 66:20 97:14]
  wire [31:0] decOut_rs2 = {{27'd0}, decoder_io_rs2}; // @[cpu.scala 66:20 98:14]
  wire [4:0] decOut_rd = decoder_io_rd; // @[cpu.scala 66:20 99:13]
  wire [2:0] decOut_func3 = decoder_io_func3; // @[cpu.scala 100:16 66:20]
  wire [9:0] decOut_func10 = decoder_io_func10; // @[cpu.scala 101:17 66:20]
  wire [11:0] decOut_imm = decoder_io_imm; // @[cpu.scala 102:14 66:20]
  wire [19:0] decOut_imm20 = decoder_io_imm20; // @[cpu.scala 103:16 66:20]
  wire [31:0] _GEN_72 = reset ? 32'h0 : _memReg_rd_T; // @[cpu.scala 148:13 70:{23,23}]
  memory DataMem ( // @[cpu.scala 49:23]
    .clock(DataMem_clock),
    .io_Addr(DataMem_io_Addr),
    .io_DataIn(DataMem_io_DataIn),
    .io_Length(DataMem_io_Length),
    .io_memWr(DataMem_io_memWr),
    .io_sign(DataMem_io_sign),
    .io_DataOut(DataMem_io_DataOut),
    .io_hex(DataMem_io_hex)
  );
  decode decoder ( // @[cpu.scala 65:23]
    .io_instr(decoder_io_instr),
    .io_rs1(decoder_io_rs1),
    .io_rs2(decoder_io_rs2),
    .io_rd(decoder_io_rd),
    .io_func3(decoder_io_func3),
    .io_func10(decoder_io_func10),
    .io_imm(decoder_io_imm),
    .io_imm20(decoder_io_imm20)
  );
  execution exe ( // @[cpu.scala 68:19]
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
  assign reg__exe_io_rs1_MPORT_en = reg_exe_io_rs1_MPORT_en_pipe_0;
  assign reg__exe_io_rs1_MPORT_addr = reg_exe_io_rs1_MPORT_addr_pipe_0;
  assign reg__exe_io_rs1_MPORT_data = reg_[reg__exe_io_rs1_MPORT_addr]; // @[cpu.scala 47:24]
  assign reg__exe_io_rs2_MPORT_en = reg_exe_io_rs2_MPORT_en_pipe_0;
  assign reg__exe_io_rs2_MPORT_addr = reg_exe_io_rs2_MPORT_addr_pipe_0;
  assign reg__exe_io_rs2_MPORT_data = reg_[reg__exe_io_rs2_MPORT_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_en = reg_MPORT_en_pipe_0;
  assign reg__MPORT_addr = reg_MPORT_addr_pipe_0;
  assign reg__MPORT_data = reg_[reg__MPORT_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_1_en = reg_MPORT_1_en_pipe_0;
  assign reg__MPORT_1_addr = reg_MPORT_1_addr_pipe_0;
  assign reg__MPORT_1_data = reg_[reg__MPORT_1_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_2_en = reg_MPORT_2_en_pipe_0;
  assign reg__MPORT_2_addr = reg_MPORT_2_addr_pipe_0;
  assign reg__MPORT_2_data = reg_[reg__MPORT_2_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_3_en = reg_MPORT_3_en_pipe_0;
  assign reg__MPORT_3_addr = reg_MPORT_3_addr_pipe_0;
  assign reg__MPORT_3_data = reg_[reg__MPORT_3_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_4_en = reg_MPORT_4_en_pipe_0;
  assign reg__MPORT_4_addr = reg_MPORT_4_addr_pipe_0;
  assign reg__MPORT_4_data = reg_[reg__MPORT_4_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_5_en = reg_MPORT_5_en_pipe_0;
  assign reg__MPORT_5_addr = reg_MPORT_5_addr_pipe_0;
  assign reg__MPORT_5_data = reg_[reg__MPORT_5_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_6_en = reg_MPORT_6_en_pipe_0;
  assign reg__MPORT_6_addr = reg_MPORT_6_addr_pipe_0;
  assign reg__MPORT_6_data = reg_[reg__MPORT_6_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_7_en = reg_MPORT_7_en_pipe_0;
  assign reg__MPORT_7_addr = reg_MPORT_7_addr_pipe_0;
  assign reg__MPORT_7_data = reg_[reg__MPORT_7_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_8_en = reg_MPORT_8_en_pipe_0;
  assign reg__MPORT_8_addr = reg_MPORT_8_addr_pipe_0;
  assign reg__MPORT_8_data = reg_[reg__MPORT_8_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_9_en = reg_MPORT_9_en_pipe_0;
  assign reg__MPORT_9_addr = reg_MPORT_9_addr_pipe_0;
  assign reg__MPORT_9_data = reg_[reg__MPORT_9_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_10_en = reg_MPORT_10_en_pipe_0;
  assign reg__MPORT_10_addr = reg_MPORT_10_addr_pipe_0;
  assign reg__MPORT_10_data = reg_[reg__MPORT_10_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_11_en = reg_MPORT_11_en_pipe_0;
  assign reg__MPORT_11_addr = reg_MPORT_11_addr_pipe_0;
  assign reg__MPORT_11_data = reg_[reg__MPORT_11_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_12_en = reg_MPORT_12_en_pipe_0;
  assign reg__MPORT_12_addr = reg_MPORT_12_addr_pipe_0;
  assign reg__MPORT_12_data = reg_[reg__MPORT_12_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_13_en = reg_MPORT_13_en_pipe_0;
  assign reg__MPORT_13_addr = reg_MPORT_13_addr_pipe_0;
  assign reg__MPORT_13_data = reg_[reg__MPORT_13_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_14_en = reg_MPORT_14_en_pipe_0;
  assign reg__MPORT_14_addr = reg_MPORT_14_addr_pipe_0;
  assign reg__MPORT_14_data = reg_[reg__MPORT_14_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_15_en = reg_MPORT_15_en_pipe_0;
  assign reg__MPORT_15_addr = reg_MPORT_15_addr_pipe_0;
  assign reg__MPORT_15_data = reg_[reg__MPORT_15_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_16_en = reg_MPORT_16_en_pipe_0;
  assign reg__MPORT_16_addr = reg_MPORT_16_addr_pipe_0;
  assign reg__MPORT_16_data = reg_[reg__MPORT_16_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_17_en = reg_MPORT_17_en_pipe_0;
  assign reg__MPORT_17_addr = reg_MPORT_17_addr_pipe_0;
  assign reg__MPORT_17_data = reg_[reg__MPORT_17_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_18_en = reg_MPORT_18_en_pipe_0;
  assign reg__MPORT_18_addr = reg_MPORT_18_addr_pipe_0;
  assign reg__MPORT_18_data = reg_[reg__MPORT_18_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_19_en = reg_MPORT_19_en_pipe_0;
  assign reg__MPORT_19_addr = reg_MPORT_19_addr_pipe_0;
  assign reg__MPORT_19_data = reg_[reg__MPORT_19_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_20_en = reg_MPORT_20_en_pipe_0;
  assign reg__MPORT_20_addr = reg_MPORT_20_addr_pipe_0;
  assign reg__MPORT_20_data = reg_[reg__MPORT_20_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_21_en = reg_MPORT_21_en_pipe_0;
  assign reg__MPORT_21_addr = reg_MPORT_21_addr_pipe_0;
  assign reg__MPORT_21_data = reg_[reg__MPORT_21_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_22_en = reg_MPORT_22_en_pipe_0;
  assign reg__MPORT_22_addr = reg_MPORT_22_addr_pipe_0;
  assign reg__MPORT_22_data = reg_[reg__MPORT_22_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_23_en = reg_MPORT_23_en_pipe_0;
  assign reg__MPORT_23_addr = reg_MPORT_23_addr_pipe_0;
  assign reg__MPORT_23_data = reg_[reg__MPORT_23_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_24_en = reg_MPORT_24_en_pipe_0;
  assign reg__MPORT_24_addr = reg_MPORT_24_addr_pipe_0;
  assign reg__MPORT_24_data = reg_[reg__MPORT_24_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_25_en = reg_MPORT_25_en_pipe_0;
  assign reg__MPORT_25_addr = reg_MPORT_25_addr_pipe_0;
  assign reg__MPORT_25_data = reg_[reg__MPORT_25_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_26_en = reg_MPORT_26_en_pipe_0;
  assign reg__MPORT_26_addr = reg_MPORT_26_addr_pipe_0;
  assign reg__MPORT_26_data = reg_[reg__MPORT_26_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_27_en = reg_MPORT_27_en_pipe_0;
  assign reg__MPORT_27_addr = reg_MPORT_27_addr_pipe_0;
  assign reg__MPORT_27_data = reg_[reg__MPORT_27_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_28_en = reg_MPORT_28_en_pipe_0;
  assign reg__MPORT_28_addr = reg_MPORT_28_addr_pipe_0;
  assign reg__MPORT_28_data = reg_[reg__MPORT_28_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_29_en = reg_MPORT_29_en_pipe_0;
  assign reg__MPORT_29_addr = reg_MPORT_29_addr_pipe_0;
  assign reg__MPORT_29_data = reg_[reg__MPORT_29_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_30_en = reg_MPORT_30_en_pipe_0;
  assign reg__MPORT_30_addr = reg_MPORT_30_addr_pipe_0;
  assign reg__MPORT_30_data = reg_[reg__MPORT_30_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_31_en = reg_MPORT_31_en_pipe_0;
  assign reg__MPORT_31_addr = reg_MPORT_31_addr_pipe_0;
  assign reg__MPORT_31_data = reg_[reg__MPORT_31_addr]; // @[cpu.scala 47:24]
  assign reg__MPORT_32_data = _T_6 ? _GEN_58 : 32'h0;
  assign reg__MPORT_32_addr = wbReg_rd;
  assign reg__MPORT_32_mask = 1'h1;
  assign reg__MPORT_32_en = _T_5 & wbReg_valid;
  assign io_sevSegNum = DataMem_io_hex; // @[cpu.scala 172:16]
  assign DataMem_clock = clock;
  assign DataMem_io_Addr = memReg_Addr; // @[cpu.scala 164:19]
  assign DataMem_io_DataIn = memReg_regData; // @[cpu.scala 162:21]
  assign DataMem_io_Length = memReg_Len; // @[cpu.scala 165:21]
  assign DataMem_io_memWr = memReg_memWr; // @[cpu.scala 166:20]
  assign DataMem_io_sign = memReg_sign; // @[cpu.scala 167:19]
  assign decoder_io_instr = instrReg; // @[cpu.scala 95:20]
  assign exe_clock = clock;
  assign exe_reset = reset;
  assign exe_io_opcode = decExReg_opcode; // @[cpu.scala 112:17]
  assign exe_io_rs1 = _GEN_67 == decExReg_rs1 & memReg_valid ? memReg_regData : _exe_io_rs1_T_5; // @[cpu.scala 116:20]
  assign exe_io_rs2 = _GEN_67 == decExReg_rs2 ? memReg_regData : _exe_io_rs2_T_3; // @[cpu.scala 118:20]
  assign exe_io_rd = {{27'd0}, decExReg_rd}; // @[cpu.scala 121:13]
  assign exe_io_func3 = decExReg_func3; // @[cpu.scala 122:16]
  assign exe_io_func10 = decExReg_func10; // @[cpu.scala 123:17]
  assign exe_io_imm = decExReg_imm; // @[cpu.scala 124:14]
  assign exe_io_imm20 = decExReg_imm20; // @[cpu.scala 125:16]
  assign exe_io_pc = decExReg_pc; // @[cpu.scala 126:13]
  always @(posedge clock) begin
    if (reg__MPORT_32_en & reg__MPORT_32_mask) begin
      reg_[reg__MPORT_32_addr] <= reg__MPORT_32_data; // @[cpu.scala 47:24]
    end
    reg_exe_io_rs1_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      reg_exe_io_rs1_MPORT_addr_pipe_0 <= decExReg_rs1[4:0];
    end
    reg_exe_io_rs2_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      reg_exe_io_rs2_MPORT_addr_pipe_0 <= decExReg_rs2[4:0];
    end
    reg_MPORT_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_addr_pipe_0 <= 5'h0;
    end
    reg_MPORT_1_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_1_addr_pipe_0 <= 5'h1;
    end
    reg_MPORT_2_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_2_addr_pipe_0 <= 5'h2;
    end
    reg_MPORT_3_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_3_addr_pipe_0 <= 5'h3;
    end
    reg_MPORT_4_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_4_addr_pipe_0 <= 5'h4;
    end
    reg_MPORT_5_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_5_addr_pipe_0 <= 5'h5;
    end
    reg_MPORT_6_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_6_addr_pipe_0 <= 5'h6;
    end
    reg_MPORT_7_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_7_addr_pipe_0 <= 5'h7;
    end
    reg_MPORT_8_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_8_addr_pipe_0 <= 5'h8;
    end
    reg_MPORT_9_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_9_addr_pipe_0 <= 5'h9;
    end
    reg_MPORT_10_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_10_addr_pipe_0 <= 5'ha;
    end
    reg_MPORT_11_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_11_addr_pipe_0 <= 5'hb;
    end
    reg_MPORT_12_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_12_addr_pipe_0 <= 5'hc;
    end
    reg_MPORT_13_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_13_addr_pipe_0 <= 5'hd;
    end
    reg_MPORT_14_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_14_addr_pipe_0 <= 5'he;
    end
    reg_MPORT_15_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_15_addr_pipe_0 <= 5'hf;
    end
    reg_MPORT_16_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_16_addr_pipe_0 <= 5'h10;
    end
    reg_MPORT_17_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_17_addr_pipe_0 <= 5'h11;
    end
    reg_MPORT_18_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_18_addr_pipe_0 <= 5'h12;
    end
    reg_MPORT_19_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_19_addr_pipe_0 <= 5'h13;
    end
    reg_MPORT_20_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_20_addr_pipe_0 <= 5'h14;
    end
    reg_MPORT_21_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_21_addr_pipe_0 <= 5'h15;
    end
    reg_MPORT_22_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_22_addr_pipe_0 <= 5'h16;
    end
    reg_MPORT_23_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_23_addr_pipe_0 <= 5'h17;
    end
    reg_MPORT_24_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_24_addr_pipe_0 <= 5'h18;
    end
    reg_MPORT_25_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_25_addr_pipe_0 <= 5'h19;
    end
    reg_MPORT_26_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_26_addr_pipe_0 <= 5'h1a;
    end
    reg_MPORT_27_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_27_addr_pipe_0 <= 5'h1b;
    end
    reg_MPORT_28_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_28_addr_pipe_0 <= 5'h1c;
    end
    reg_MPORT_29_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_29_addr_pipe_0 <= 5'h1d;
    end
    reg_MPORT_30_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_30_addr_pipe_0 <= 5'h1e;
    end
    reg_MPORT_31_en_pipe_0 <= exe_io_opcode == 7'h73;
    if (exe_io_opcode == 7'h73) begin
      reg_MPORT_31_addr_pipe_0 <= 5'h1f;
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_opcode <= 7'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_opcode <= decOut_opcode; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_rs1 <= 32'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_rs1 <= decOut_rs1; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_rs2 <= 32'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_rs2 <= decOut_rs2; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_rd <= 5'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_rd <= decOut_rd; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_func3 <= 3'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_func3 <= decOut_func3; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_func10 <= 10'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_func10 <= decOut_func10; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_imm <= 12'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_imm <= decOut_imm; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_imm20 <= 20'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_imm20 <= decOut_imm20; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_pc <= 32'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_pc <= pcRegReg; // @[cpu.scala 110:12]
    end
    if (reset) begin // @[cpu.scala 69:25]
      decExReg_valid <= 1'h0; // @[cpu.scala 69:25]
    end else begin
      decExReg_valid <= decOut_valid; // @[cpu.scala 110:12]
    end
    memReg_rd <= _GEN_72[4:0]; // @[cpu.scala 148:13 70:{23,23}]
    if (reset) begin // @[cpu.scala 70:23]
      memReg_regData <= 32'h0; // @[cpu.scala 70:23]
    end else if (decExReg_valid) begin // @[cpu.scala 147:24]
      memReg_regData <= exe_io_res;
    end else begin
      memReg_regData <= 32'h0;
    end
    if (reset) begin // @[cpu.scala 70:23]
      memReg_Addr <= 32'h0; // @[cpu.scala 70:23]
    end else begin
      memReg_Addr <= _memReg_Addr_T_1; // @[cpu.scala 152:15]
    end
    if (reset) begin // @[cpu.scala 70:23]
      memReg_Len <= 2'h0; // @[cpu.scala 70:23]
    end else if (decExReg_valid) begin // @[cpu.scala 154:21]
      memReg_Len <= exe_io_memLen;
    end else begin
      memReg_Len <= 2'h0;
    end
    if (reset) begin // @[cpu.scala 70:23]
      memReg_memWr <= 1'h0; // @[cpu.scala 70:23]
    end else begin
      memReg_memWr <= exe_io_memLen > 2'h0 & exe_io_opcode == 7'h23; // @[cpu.scala 153:16]
    end
    if (reset) begin // @[cpu.scala 70:23]
      memReg_sign <= 1'h0; // @[cpu.scala 70:23]
    end else begin
      memReg_sign <= exe_io_sign; // @[cpu.scala 155:15]
    end
    if (reset) begin // @[cpu.scala 70:23]
      memReg_valid <= 1'h0; // @[cpu.scala 70:23]
    end else begin
      memReg_valid <= exe_io_opcode != 7'h63 & decExReg_valid; // @[cpu.scala 156:16]
    end
    if (reset) begin // @[cpu.scala 71:22]
      wbReg_rd <= 5'h0; // @[cpu.scala 71:22]
    end else begin
      wbReg_rd <= memReg_rd; // @[cpu.scala 170:9]
    end
    if (reset) begin // @[cpu.scala 71:22]
      wbReg_regData <= 32'h0; // @[cpu.scala 71:22]
    end else begin
      wbReg_regData <= memReg_regData; // @[cpu.scala 170:9]
    end
    if (reset) begin // @[cpu.scala 71:22]
      wbReg_memData <= 32'h0; // @[cpu.scala 71:22]
    end else begin
      wbReg_memData <= DataMem_io_DataOut; // @[cpu.scala 171:17]
    end
    if (reset) begin // @[cpu.scala 71:22]
      wbReg_Len <= 2'h0; // @[cpu.scala 71:22]
    end else begin
      wbReg_Len <= memReg_Len; // @[cpu.scala 170:9]
    end
    if (reset) begin // @[cpu.scala 71:22]
      wbReg_memWr <= 1'h0; // @[cpu.scala 71:22]
    end else begin
      wbReg_memWr <= memReg_memWr; // @[cpu.scala 170:9]
    end
    if (reset) begin // @[cpu.scala 71:22]
      wbReg_valid <= 1'h0; // @[cpu.scala 71:22]
    end else begin
      wbReg_valid <= memReg_valid; // @[cpu.scala 170:9]
    end
    if (reset) begin // @[cpu.scala 77:22]
      pcReg <= 32'h0; // @[cpu.scala 77:22]
    end else if (doBranch) begin // @[cpu.scala 78:19]
      if (exe_io_opcode == 7'h67) begin // @[cpu.scala 132:22]
        pcReg <= _branchTarget_T_6;
      end else begin
        pcReg <= _branchTarget_T_15;
      end
    end else begin
      pcReg <= _pcNext_T_1;
    end
    pcRegReg <= pcReg; // @[cpu.scala 83:25]
    if (reset) begin // @[cpu.scala 88:25]
      instrReg <= 32'h33; // @[cpu.scala 88:25]
    end else if (doBranch) begin // @[cpu.scala 89:18]
      instrReg <= 32'h33;
    end else if (5'h16 == pcReg[6:2]) begin // @[cpu.scala 89:18]
      instrReg <= 32'h73; // @[cpu.scala 89:18]
    end else if (5'h15 == pcReg[6:2]) begin // @[cpu.scala 89:18]
      instrReg <= 32'ha00893; // @[cpu.scala 89:18]
    end else begin
      instrReg <= _GEN_20;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"%x ",pcReg); // @[cpu.scala 86:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2 & _T_1) begin
          $fwrite(32'h80000002,
            "reg: \n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x\n%x"
            ,reg__MPORT_data,reg__MPORT_1_data,reg__MPORT_2_data,reg__MPORT_3_data,reg__MPORT_4_data,reg__MPORT_5_data,
            reg__MPORT_6_data,reg__MPORT_7_data,reg__MPORT_8_data,reg__MPORT_9_data,reg__MPORT_10_data,
            reg__MPORT_11_data,reg__MPORT_12_data,reg__MPORT_13_data,reg__MPORT_14_data,reg__MPORT_15_data,
            reg__MPORT_16_data,reg__MPORT_17_data,reg__MPORT_18_data,reg__MPORT_19_data,reg__MPORT_20_data,
            reg__MPORT_21_data,reg__MPORT_22_data,reg__MPORT_23_data,reg__MPORT_24_data,reg__MPORT_25_data,
            reg__MPORT_26_data,reg__MPORT_27_data,reg__MPORT_28_data,reg__MPORT_29_data,reg__MPORT_30_data,
            reg__MPORT_31_data); // @[cpu.scala 144:11]
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    reg_[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  reg_exe_io_rs1_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_exe_io_rs1_MPORT_addr_pipe_0 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  reg_exe_io_rs2_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_exe_io_rs2_MPORT_addr_pipe_0 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  reg_MPORT_en_pipe_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  reg_MPORT_addr_pipe_0 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  reg_MPORT_1_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  reg_MPORT_1_addr_pipe_0 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  reg_MPORT_2_en_pipe_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  reg_MPORT_2_addr_pipe_0 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  reg_MPORT_3_en_pipe_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reg_MPORT_3_addr_pipe_0 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  reg_MPORT_4_en_pipe_0 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  reg_MPORT_4_addr_pipe_0 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  reg_MPORT_5_en_pipe_0 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  reg_MPORT_5_addr_pipe_0 = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  reg_MPORT_6_en_pipe_0 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  reg_MPORT_6_addr_pipe_0 = _RAND_18[4:0];
  _RAND_19 = {1{`RANDOM}};
  reg_MPORT_7_en_pipe_0 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  reg_MPORT_7_addr_pipe_0 = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  reg_MPORT_8_en_pipe_0 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  reg_MPORT_8_addr_pipe_0 = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  reg_MPORT_9_en_pipe_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  reg_MPORT_9_addr_pipe_0 = _RAND_24[4:0];
  _RAND_25 = {1{`RANDOM}};
  reg_MPORT_10_en_pipe_0 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  reg_MPORT_10_addr_pipe_0 = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  reg_MPORT_11_en_pipe_0 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  reg_MPORT_11_addr_pipe_0 = _RAND_28[4:0];
  _RAND_29 = {1{`RANDOM}};
  reg_MPORT_12_en_pipe_0 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  reg_MPORT_12_addr_pipe_0 = _RAND_30[4:0];
  _RAND_31 = {1{`RANDOM}};
  reg_MPORT_13_en_pipe_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  reg_MPORT_13_addr_pipe_0 = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  reg_MPORT_14_en_pipe_0 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  reg_MPORT_14_addr_pipe_0 = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  reg_MPORT_15_en_pipe_0 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  reg_MPORT_15_addr_pipe_0 = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  reg_MPORT_16_en_pipe_0 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  reg_MPORT_16_addr_pipe_0 = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  reg_MPORT_17_en_pipe_0 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  reg_MPORT_17_addr_pipe_0 = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  reg_MPORT_18_en_pipe_0 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  reg_MPORT_18_addr_pipe_0 = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  reg_MPORT_19_en_pipe_0 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  reg_MPORT_19_addr_pipe_0 = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  reg_MPORT_20_en_pipe_0 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  reg_MPORT_20_addr_pipe_0 = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  reg_MPORT_21_en_pipe_0 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  reg_MPORT_21_addr_pipe_0 = _RAND_48[4:0];
  _RAND_49 = {1{`RANDOM}};
  reg_MPORT_22_en_pipe_0 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  reg_MPORT_22_addr_pipe_0 = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  reg_MPORT_23_en_pipe_0 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  reg_MPORT_23_addr_pipe_0 = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  reg_MPORT_24_en_pipe_0 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  reg_MPORT_24_addr_pipe_0 = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  reg_MPORT_25_en_pipe_0 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  reg_MPORT_25_addr_pipe_0 = _RAND_56[4:0];
  _RAND_57 = {1{`RANDOM}};
  reg_MPORT_26_en_pipe_0 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  reg_MPORT_26_addr_pipe_0 = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  reg_MPORT_27_en_pipe_0 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  reg_MPORT_27_addr_pipe_0 = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  reg_MPORT_28_en_pipe_0 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  reg_MPORT_28_addr_pipe_0 = _RAND_62[4:0];
  _RAND_63 = {1{`RANDOM}};
  reg_MPORT_29_en_pipe_0 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  reg_MPORT_29_addr_pipe_0 = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  reg_MPORT_30_en_pipe_0 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  reg_MPORT_30_addr_pipe_0 = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  reg_MPORT_31_en_pipe_0 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  reg_MPORT_31_addr_pipe_0 = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  decExReg_opcode = _RAND_69[6:0];
  _RAND_70 = {1{`RANDOM}};
  decExReg_rs1 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  decExReg_rs2 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  decExReg_rd = _RAND_72[4:0];
  _RAND_73 = {1{`RANDOM}};
  decExReg_func3 = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  decExReg_func10 = _RAND_74[9:0];
  _RAND_75 = {1{`RANDOM}};
  decExReg_imm = _RAND_75[11:0];
  _RAND_76 = {1{`RANDOM}};
  decExReg_imm20 = _RAND_76[19:0];
  _RAND_77 = {1{`RANDOM}};
  decExReg_pc = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  decExReg_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  memReg_rd = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  memReg_regData = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  memReg_Addr = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  memReg_Len = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  memReg_memWr = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  memReg_sign = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  memReg_valid = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  wbReg_rd = _RAND_86[4:0];
  _RAND_87 = {1{`RANDOM}};
  wbReg_regData = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  wbReg_memData = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  wbReg_Len = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  wbReg_memWr = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  wbReg_valid = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  pcReg = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  pcRegReg = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  instrReg = _RAND_94[31:0];
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
  input         io_c2Full,
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
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[DisplayMultiplexer.scala 39:20]
  wire [3:0] _outReg_T_2 = {outReg[0],outReg[3:1]}; // @[DisplayMultiplexer.scala 42:25]
  wire [6:0] _GEN_2 = io_noCans ? 7'h0 : sevenSegDec0_io_out; // @[DisplayMultiplexer.scala 62:29 63:16 65:16]
  wire [6:0] _GEN_3 = io_c5Full ? 7'h0 : _GEN_2; // @[DisplayMultiplexer.scala 60:28 61:16]
  wire [6:0] _GEN_4 = io_c2Full ? 7'h8 : _GEN_3; // @[DisplayMultiplexer.scala 58:28 59:16]
  wire [6:0] _GEN_5 = io_iced ? 7'h7f : _GEN_4; // @[DisplayMultiplexer.scala 56:21 57:16]
  wire [6:0] _GEN_6 = io_noCans ? 7'h0 : sevenSegDec1_io_out; // @[DisplayMultiplexer.scala 75:29 76:16 78:16]
  wire [6:0] _GEN_7 = io_c5Full ? 7'h40 : _GEN_6; // @[DisplayMultiplexer.scala 73:29 74:16]
  wire [6:0] _GEN_8 = io_c2Full ? 7'h4 : _GEN_7; // @[DisplayMultiplexer.scala 71:29 72:16]
  wire [6:0] _GEN_9 = io_iced ? 7'h7f : _GEN_8; // @[DisplayMultiplexer.scala 69:21 70:16]
  wire [6:0] _GEN_10 = io_noCans ? 7'h0 : sevenSegDec2_io_out; // @[DisplayMultiplexer.scala 88:29 89:16 91:16]
  wire [6:0] _GEN_11 = io_c5Full ? 7'h20 : _GEN_10; // @[DisplayMultiplexer.scala 86:29 87:16]
  wire [6:0] _GEN_12 = io_c2Full ? 7'h2 : _GEN_11; // @[DisplayMultiplexer.scala 84:29 85:16]
  wire [6:0] _GEN_13 = io_iced ? 7'h7f : _GEN_12; // @[DisplayMultiplexer.scala 82:21 83:16]
  wire [6:0] _GEN_14 = io_noCans ? 7'h0 : sevenSegDec3_io_out; // @[DisplayMultiplexer.scala 101:29 102:16 104:16]
  wire [6:0] _GEN_15 = io_c5Full ? 7'h10 : _GEN_14; // @[DisplayMultiplexer.scala 100:16 99:29]
  wire [6:0] _GEN_16 = io_c2Full ? 7'h1 : _GEN_15; // @[DisplayMultiplexer.scala 97:29 98:16]
  wire [6:0] _GEN_17 = io_iced ? 7'h7f : _GEN_16; // @[DisplayMultiplexer.scala 95:21 96:16]
  wire [6:0] _GEN_18 = 4'h8 == outReg ? _GEN_17 : 7'h7f; // @[DisplayMultiplexer.scala 53:18 18:27]
  wire [6:0] _GEN_19 = 4'h4 == outReg ? _GEN_13 : _GEN_18; // @[DisplayMultiplexer.scala 53:18]
  wire [6:0] _GEN_20 = 4'h2 == outReg ? _GEN_9 : _GEN_19; // @[DisplayMultiplexer.scala 53:18]
  wire [6:0] sevSeg = 4'h1 == outReg ? _GEN_5 : _GEN_20; // @[DisplayMultiplexer.scala 53:18]
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
  assign io_seg = ~sevSeg; // @[DisplayMultiplexer.scala 110:13]
  assign io_an = ~outReg; // @[DisplayMultiplexer.scala 111:12]
  assign sevenSegDec0_io_in = io_hex[3:0]; // @[DisplayMultiplexer.scala 47:31]
  assign sevenSegDec1_io_in = io_hex[7:4]; // @[DisplayMultiplexer.scala 48:31]
  assign sevenSegDec2_io_in = io_hex[11:8]; // @[DisplayMultiplexer.scala 49:31]
  assign sevenSegDec3_io_in = io_hex[15:12]; // @[DisplayMultiplexer.scala 50:31]
  always @(posedge clock) begin
    if (reset) begin // @[DisplayMultiplexer.scala 34:23]
      cntReg <= 32'h0; // @[DisplayMultiplexer.scala 34:23]
    end else if (cntReg == 32'h3e8) begin // @[DisplayMultiplexer.scala 40:28]
      cntReg <= 32'h0; // @[DisplayMultiplexer.scala 41:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[DisplayMultiplexer.scala 39:10]
    end
    if (reset) begin // @[DisplayMultiplexer.scala 35:23]
      outReg <= 4'h1; // @[DisplayMultiplexer.scala 35:23]
    end else if (cntReg == 32'h3e8) begin // @[DisplayMultiplexer.scala 40:28]
      outReg <= _outReg_T_2; // @[DisplayMultiplexer.scala 42:12]
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
  wire [15:0] CPU_io_sevSegNum; // @[connection.scala 14:21]
  wire  SevenSeg_clock; // @[connection.scala 15:26]
  wire  SevenSeg_reset; // @[connection.scala 15:26]
  wire  SevenSeg_io_c2Full; // @[connection.scala 15:26]
  wire  SevenSeg_io_c5Full; // @[connection.scala 15:26]
  wire  SevenSeg_io_noCans; // @[connection.scala 15:26]
  wire  SevenSeg_io_iced; // @[connection.scala 15:26]
  wire [15:0] SevenSeg_io_hex; // @[connection.scala 15:26]
  wire [6:0] SevenSeg_io_seg; // @[connection.scala 15:26]
  wire [3:0] SevenSeg_io_an; // @[connection.scala 15:26]
  cpu CPU ( // @[connection.scala 14:21]
    .clock(CPU_clock),
    .reset(CPU_reset),
    .io_sevSegNum(CPU_io_sevSegNum)
  );
  DisplayMultiplexer SevenSeg ( // @[connection.scala 15:26]
    .clock(SevenSeg_clock),
    .reset(SevenSeg_reset),
    .io_c2Full(SevenSeg_io_c2Full),
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
  assign SevenSeg_io_c2Full = io_sw[0]; // @[connection.scala 19:32]
  assign SevenSeg_io_c5Full = io_sw[1]; // @[connection.scala 20:32]
  assign SevenSeg_io_noCans = io_sw[2]; // @[connection.scala 21:32]
  assign SevenSeg_io_iced = io_sw[3]; // @[connection.scala 22:30]
  assign SevenSeg_io_hex = CPU_io_sevSegNum; // @[connection.scala 17:21]
endmodule
