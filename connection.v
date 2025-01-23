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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
`endif // RANDOMIZE_REG_INIT
  reg [7:0] DataMemory [0:257]; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_0_MPORT_en; // @[memory.scala 21:31]
  wire [8:0] DataMemory_tempOut_0_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_0_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_1_MPORT_en; // @[memory.scala 21:31]
  wire [8:0] DataMemory_tempOut_1_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_1_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_2_MPORT_en; // @[memory.scala 21:31]
  wire [8:0] DataMemory_tempOut_2_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_2_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_tempOut_3_MPORT_en; // @[memory.scala 21:31]
  wire [8:0] DataMemory_tempOut_3_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_tempOut_3_MPORT_data; // @[memory.scala 21:31]
  wire  DataMemory_io_hex_MPORT_en; // @[memory.scala 21:31]
  wire [8:0] DataMemory_io_hex_MPORT_addr; // @[memory.scala 21:31]
  wire [7:0] DataMemory_io_hex_MPORT_data; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_data; // @[memory.scala 21:31]
  wire [8:0] DataMemory_MPORT_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_1_data; // @[memory.scala 21:31]
  wire [8:0] DataMemory_MPORT_1_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_1_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_1_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_2_data; // @[memory.scala 21:31]
  wire [8:0] DataMemory_MPORT_2_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_2_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_2_en; // @[memory.scala 21:31]
  wire [7:0] DataMemory_MPORT_3_data; // @[memory.scala 21:31]
  wire [8:0] DataMemory_MPORT_3_addr; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_3_mask; // @[memory.scala 21:31]
  wire  DataMemory_MPORT_3_en; // @[memory.scala 21:31]
  reg  DataMemory_tempOut_0_MPORT_en_pipe_0;
  reg [8:0] DataMemory_tempOut_0_MPORT_addr_pipe_0;
  reg  DataMemory_tempOut_1_MPORT_en_pipe_0;
  reg [8:0] DataMemory_tempOut_1_MPORT_addr_pipe_0;
  reg  DataMemory_tempOut_2_MPORT_en_pipe_0;
  reg [8:0] DataMemory_tempOut_2_MPORT_addr_pipe_0;
  reg  DataMemory_tempOut_3_MPORT_en_pipe_0;
  reg [8:0] DataMemory_tempOut_3_MPORT_addr_pipe_0;
  reg  DataMemory_io_hex_MPORT_en_pipe_0;
  reg [8:0] DataMemory_io_hex_MPORT_addr_pipe_0;
  wire  _T = 2'h0 < io_Length; // @[memory.scala 27:12]
  wire  _GEN_5 = io_memWr ? 1'h0 : 1'h1; // @[memory.scala 28:19 21:31 31:31]
  wire [7:0] _GEN_8 = io_memWr ? 8'h0 : DataMemory_tempOut_0_MPORT_data; // @[memory.scala 28:19 23:24 31:18]
  wire [7:0] tempOut_0 = 2'h0 < io_Length ? _GEN_8 : 8'h0; // @[memory.scala 23:24 27:24]
  wire  _T_3 = 2'h1 < io_Length; // @[memory.scala 34:12]
  wire [31:0] _T_5 = io_Addr + 32'h1; // @[memory.scala 36:25]
  wire [7:0] _GEN_21 = io_memWr ? 8'h0 : DataMemory_tempOut_1_MPORT_data; // @[memory.scala 35:19 23:24 38:18]
  wire [7:0] tempOut_1 = 2'h1 < io_Length ? _GEN_21 : 8'h0; // @[memory.scala 23:24 34:24]
  wire  _T_8 = 2'h2 < io_Length; // @[memory.scala 41:12]
  wire [31:0] _T_10 = io_Addr + 32'h2; // @[memory.scala 43:25]
  wire [31:0] _T_14 = io_Addr + 32'h3; // @[memory.scala 44:25]
  wire [7:0] _GEN_36 = io_memWr ? 8'h0 : DataMemory_tempOut_2_MPORT_data; // @[memory.scala 42:19 23:24 46:18]
  wire [7:0] _GEN_38 = io_memWr ? 8'h0 : DataMemory_tempOut_3_MPORT_data; // @[memory.scala 42:19 23:24 47:18]
  wire [7:0] tempOut_2 = 2'h2 < io_Length ? _GEN_36 : 8'h0; // @[memory.scala 23:24 41:24]
  wire [7:0] tempOut_3 = 2'h2 < io_Length ? _GEN_38 : 8'h0; // @[memory.scala 23:24 41:24]
  wire  _T_18 = ~io_sign; // @[memory.scala 55:29]
  wire [7:0] _T_20 = tempOut_0 & 8'h80; // @[memory.scala 55:53]
  wire [31:0] _io_DataOut_T = {24'hffffff,tempOut_0}; // @[memory.scala 56:30]
  wire [7:0] _T_26 = tempOut_1 & 8'h80; // @[memory.scala 57:59]
  wire [31:0] _io_DataOut_T_2 = {16'hffff,tempOut_1,tempOut_0}; // @[memory.scala 58:42]
  wire [31:0] _io_DataOut_T_5 = {tempOut_3,tempOut_2,tempOut_1,tempOut_0}; // @[memory.scala 60:58]
  wire [31:0] _GEN_52 = io_Length == 2'h2 & _T_18 & _T_26 == 8'h80 ? _io_DataOut_T_2 : _io_DataOut_T_5; // @[memory.scala 57:80 58:16 60:16]
  assign DataMemory_tempOut_0_MPORT_en = DataMemory_tempOut_0_MPORT_en_pipe_0;
  assign DataMemory_tempOut_0_MPORT_addr = DataMemory_tempOut_0_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_0_MPORT_data = DataMemory[DataMemory_tempOut_0_MPORT_addr]; // @[memory.scala 21:31]
  `else
  assign DataMemory_tempOut_0_MPORT_data = DataMemory_tempOut_0_MPORT_addr >= 9'h102 ? _RAND_1[7:0] :
    DataMemory[DataMemory_tempOut_0_MPORT_addr]; // @[memory.scala 21:31]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_1_MPORT_en = DataMemory_tempOut_1_MPORT_en_pipe_0;
  assign DataMemory_tempOut_1_MPORT_addr = DataMemory_tempOut_1_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_1_MPORT_data = DataMemory[DataMemory_tempOut_1_MPORT_addr]; // @[memory.scala 21:31]
  `else
  assign DataMemory_tempOut_1_MPORT_data = DataMemory_tempOut_1_MPORT_addr >= 9'h102 ? _RAND_2[7:0] :
    DataMemory[DataMemory_tempOut_1_MPORT_addr]; // @[memory.scala 21:31]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_2_MPORT_en = DataMemory_tempOut_2_MPORT_en_pipe_0;
  assign DataMemory_tempOut_2_MPORT_addr = DataMemory_tempOut_2_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_2_MPORT_data = DataMemory[DataMemory_tempOut_2_MPORT_addr]; // @[memory.scala 21:31]
  `else
  assign DataMemory_tempOut_2_MPORT_data = DataMemory_tempOut_2_MPORT_addr >= 9'h102 ? _RAND_3[7:0] :
    DataMemory[DataMemory_tempOut_2_MPORT_addr]; // @[memory.scala 21:31]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_3_MPORT_en = DataMemory_tempOut_3_MPORT_en_pipe_0;
  assign DataMemory_tempOut_3_MPORT_addr = DataMemory_tempOut_3_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_tempOut_3_MPORT_data = DataMemory[DataMemory_tempOut_3_MPORT_addr]; // @[memory.scala 21:31]
  `else
  assign DataMemory_tempOut_3_MPORT_data = DataMemory_tempOut_3_MPORT_addr >= 9'h102 ? _RAND_4[7:0] :
    DataMemory[DataMemory_tempOut_3_MPORT_addr]; // @[memory.scala 21:31]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_io_hex_MPORT_en = DataMemory_io_hex_MPORT_en_pipe_0;
  assign DataMemory_io_hex_MPORT_addr = DataMemory_io_hex_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_io_hex_MPORT_data = DataMemory[DataMemory_io_hex_MPORT_addr]; // @[memory.scala 21:31]
  `else
  assign DataMemory_io_hex_MPORT_data = DataMemory_io_hex_MPORT_addr >= 9'h102 ? _RAND_5[7:0] :
    DataMemory[DataMemory_io_hex_MPORT_addr]; // @[memory.scala 21:31]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign DataMemory_MPORT_data = io_DataIn[7:0];
  assign DataMemory_MPORT_addr = io_Addr[8:0];
  assign DataMemory_MPORT_mask = 1'h1;
  assign DataMemory_MPORT_en = _T & io_memWr;
  assign DataMemory_MPORT_1_data = io_DataIn[15:8];
  assign DataMemory_MPORT_1_addr = _T_5[8:0];
  assign DataMemory_MPORT_1_mask = 1'h1;
  assign DataMemory_MPORT_1_en = _T_3 & io_memWr;
  assign DataMemory_MPORT_2_data = io_DataIn[23:16];
  assign DataMemory_MPORT_2_addr = _T_10[8:0];
  assign DataMemory_MPORT_2_mask = 1'h1;
  assign DataMemory_MPORT_2_en = _T_8 & io_memWr;
  assign DataMemory_MPORT_3_data = io_DataIn[31:24];
  assign DataMemory_MPORT_3_addr = _T_14[8:0];
  assign DataMemory_MPORT_3_mask = 1'h1;
  assign DataMemory_MPORT_3_en = _T_8 & io_memWr;
  assign io_DataOut = io_Length == 2'h1 & ~io_sign & _T_20 == 8'h80 ? _io_DataOut_T : _GEN_52; // @[memory.scala 55:74 56:16]
  assign io_hex = {DataMemory_io_hex_MPORT_data,8'h0}; // @[memory.scala 52:39]
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
    DataMemory_tempOut_0_MPORT_en_pipe_0 <= _T & _GEN_5;
    if (_T & _GEN_5) begin
      DataMemory_tempOut_0_MPORT_addr_pipe_0 <= io_Addr[8:0];
    end
    DataMemory_tempOut_1_MPORT_en_pipe_0 <= _T_3 & _GEN_5;
    if (_T_3 & _GEN_5) begin
      DataMemory_tempOut_1_MPORT_addr_pipe_0 <= _T_5[8:0];
    end
    DataMemory_tempOut_2_MPORT_en_pipe_0 <= _T_8 & _GEN_5;
    if (_T_8 & _GEN_5) begin
      DataMemory_tempOut_2_MPORT_addr_pipe_0 <= _T_10[8:0];
    end
    DataMemory_tempOut_3_MPORT_en_pipe_0 <= _T_8 & _GEN_5;
    if (_T_8 & _GEN_5) begin
      DataMemory_tempOut_3_MPORT_addr_pipe_0 <= _T_14[8:0];
    end
    DataMemory_io_hex_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      DataMemory_io_hex_MPORT_addr_pipe_0 <= 9'h101;
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 258; initvar = initvar+1)
    DataMemory[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  DataMemory_tempOut_0_MPORT_en_pipe_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  DataMemory_tempOut_0_MPORT_addr_pipe_0 = _RAND_7[8:0];
  _RAND_8 = {1{`RANDOM}};
  DataMemory_tempOut_1_MPORT_en_pipe_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  DataMemory_tempOut_1_MPORT_addr_pipe_0 = _RAND_9[8:0];
  _RAND_10 = {1{`RANDOM}};
  DataMemory_tempOut_2_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  DataMemory_tempOut_2_MPORT_addr_pipe_0 = _RAND_11[8:0];
  _RAND_12 = {1{`RANDOM}};
  DataMemory_tempOut_3_MPORT_en_pipe_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  DataMemory_tempOut_3_MPORT_addr_pipe_0 = _RAND_13[8:0];
  _RAND_14 = {1{`RANDOM}};
  DataMemory_io_hex_MPORT_en_pipe_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  DataMemory_io_hex_MPORT_addr_pipe_0 = _RAND_15[8:0];
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
  wire [6:0] opcode = io_instr[6:0]; // @[decode.scala 28:24]
  wire [11:0] _io_imm_T_4 = {io_instr[31:25],io_instr[11:7]}; // @[decode.scala 52:33]
  wire [20:0] _io_imm_T_12 = {io_instr[31],io_instr[19:12],io_instr[20],io_instr[30:21],1'h0}; // @[decode.scala 56:84]
  wire [9:0] _io_func10_T_2 = {io_instr[14:12],io_instr[31:25]}; // @[decode.scala 60:36]
  wire [12:0] temp = {io_instr[31],io_instr[7],io_instr[30:25],io_instr[11:8],1'h0}; // @[decode.scala 72:84]
  wire [4:0] _GEN_0 = 7'h67 == opcode ? io_instr[11:7] : 5'h0; // @[decode.scala 31:18 76:13 21:9]
  wire [2:0] _GEN_1 = 7'h67 == opcode ? io_instr[14:12] : 3'h0; // @[decode.scala 22:12 31:18 77:16]
  wire [4:0] _GEN_2 = 7'h67 == opcode ? io_instr[19:15] : 5'h0; // @[decode.scala 19:10 31:18 78:14]
  wire [11:0] _GEN_3 = 7'h67 == opcode ? io_instr[31:20] : 12'h0; // @[decode.scala 24:10 31:18 79:14]
  wire [2:0] _GEN_4 = 7'h63 == opcode ? io_instr[14:12] : _GEN_1; // @[decode.scala 31:18 69:16]
  wire [4:0] _GEN_5 = 7'h63 == opcode ? io_instr[19:15] : _GEN_2; // @[decode.scala 31:18 70:14]
  wire [4:0] _GEN_6 = 7'h63 == opcode ? io_instr[24:20] : 5'h0; // @[decode.scala 20:10 31:18 71:14]
  wire [11:0] _GEN_7 = 7'h63 == opcode ? temp[11:0] : _GEN_3; // @[decode.scala 31:18 73:14]
  wire [4:0] _GEN_8 = 7'h63 == opcode ? 5'h0 : _GEN_0; // @[decode.scala 31:18 21:9]
  wire [4:0] _GEN_9 = 7'h37 == opcode ? io_instr[11:7] : _GEN_8; // @[decode.scala 31:18 65:13]
  wire [19:0] _GEN_10 = 7'h37 == opcode ? io_instr[31:12] : 20'h0; // @[decode.scala 25:12 31:18 66:16]
  wire [2:0] _GEN_11 = 7'h37 == opcode ? 3'h0 : _GEN_4; // @[decode.scala 22:12 31:18]
  wire [4:0] _GEN_12 = 7'h37 == opcode ? 5'h0 : _GEN_5; // @[decode.scala 19:10 31:18]
  wire [4:0] _GEN_13 = 7'h37 == opcode ? 5'h0 : _GEN_6; // @[decode.scala 20:10 31:18]
  wire [11:0] _GEN_14 = 7'h37 == opcode ? 12'h0 : _GEN_7; // @[decode.scala 24:10 31:18]
  wire [4:0] _GEN_15 = 7'h33 == opcode ? io_instr[11:7] : _GEN_9; // @[decode.scala 31:18 59:13]
  wire [9:0] _GEN_16 = 7'h33 == opcode ? _io_func10_T_2 : 10'h0; // @[decode.scala 23:13 31:18 60:17]
  wire [4:0] _GEN_17 = 7'h33 == opcode ? io_instr[19:15] : _GEN_12; // @[decode.scala 31:18 61:14]
  wire [4:0] _GEN_18 = 7'h33 == opcode ? io_instr[24:20] : _GEN_13; // @[decode.scala 31:18 62:14]
  wire [19:0] _GEN_19 = 7'h33 == opcode ? 20'h0 : _GEN_10; // @[decode.scala 25:12 31:18]
  wire [2:0] _GEN_20 = 7'h33 == opcode ? 3'h0 : _GEN_11; // @[decode.scala 22:12 31:18]
  wire [11:0] _GEN_21 = 7'h33 == opcode ? 12'h0 : _GEN_14; // @[decode.scala 24:10 31:18]
  wire [4:0] _GEN_22 = 7'h6f == opcode ? io_instr[11:7] : _GEN_15; // @[decode.scala 31:18 55:13]
  wire [20:0] _GEN_23 = 7'h6f == opcode ? _io_imm_T_12 : {{9'd0}, _GEN_21}; // @[decode.scala 31:18 56:14]
  wire [9:0] _GEN_24 = 7'h6f == opcode ? 10'h0 : _GEN_16; // @[decode.scala 23:13 31:18]
  wire [4:0] _GEN_25 = 7'h6f == opcode ? 5'h0 : _GEN_17; // @[decode.scala 19:10 31:18]
  wire [4:0] _GEN_26 = 7'h6f == opcode ? 5'h0 : _GEN_18; // @[decode.scala 20:10 31:18]
  wire [19:0] _GEN_27 = 7'h6f == opcode ? 20'h0 : _GEN_19; // @[decode.scala 25:12 31:18]
  wire [2:0] _GEN_28 = 7'h6f == opcode ? 3'h0 : _GEN_20; // @[decode.scala 22:12 31:18]
  wire [2:0] _GEN_29 = 7'h23 == opcode ? io_instr[14:12] : _GEN_28; // @[decode.scala 31:18 49:16]
  wire [4:0] _GEN_30 = 7'h23 == opcode ? io_instr[19:15] : _GEN_25; // @[decode.scala 31:18 50:14]
  wire [4:0] _GEN_31 = 7'h23 == opcode ? io_instr[24:20] : _GEN_26; // @[decode.scala 31:18 51:14]
  wire [20:0] _GEN_32 = 7'h23 == opcode ? {{9'd0}, _io_imm_T_4} : _GEN_23; // @[decode.scala 31:18 52:14]
  wire [4:0] _GEN_33 = 7'h23 == opcode ? 5'h0 : _GEN_22; // @[decode.scala 31:18 21:9]
  wire [9:0] _GEN_34 = 7'h23 == opcode ? 10'h0 : _GEN_24; // @[decode.scala 23:13 31:18]
  wire [19:0] _GEN_35 = 7'h23 == opcode ? 20'h0 : _GEN_27; // @[decode.scala 25:12 31:18]
  wire [4:0] _GEN_36 = 7'h17 == opcode ? io_instr[11:7] : _GEN_33; // @[decode.scala 31:18 45:13]
  wire [19:0] _GEN_37 = 7'h17 == opcode ? io_instr[31:12] : _GEN_35; // @[decode.scala 31:18 46:16]
  wire [2:0] _GEN_38 = 7'h17 == opcode ? 3'h0 : _GEN_29; // @[decode.scala 22:12 31:18]
  wire [4:0] _GEN_39 = 7'h17 == opcode ? 5'h0 : _GEN_30; // @[decode.scala 19:10 31:18]
  wire [4:0] _GEN_40 = 7'h17 == opcode ? 5'h0 : _GEN_31; // @[decode.scala 20:10 31:18]
  wire [20:0] _GEN_41 = 7'h17 == opcode ? 21'h0 : _GEN_32; // @[decode.scala 24:10 31:18]
  wire [9:0] _GEN_42 = 7'h17 == opcode ? 10'h0 : _GEN_34; // @[decode.scala 23:13 31:18]
  wire [4:0] _GEN_43 = 7'h13 == opcode ? io_instr[11:7] : _GEN_36; // @[decode.scala 31:18 39:13]
  wire [2:0] _GEN_44 = 7'h13 == opcode ? io_instr[14:12] : _GEN_38; // @[decode.scala 31:18 40:16]
  wire [4:0] _GEN_45 = 7'h13 == opcode ? io_instr[19:15] : _GEN_39; // @[decode.scala 31:18 41:14]
  wire [20:0] _GEN_46 = 7'h13 == opcode ? {{9'd0}, io_instr[31:20]} : _GEN_41; // @[decode.scala 31:18 42:14]
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
  wire  _T = 7'h3 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _GEN_62 = {{20'd0}, io_imm}; // @[execution.scala 136:24]
  wire [31:0] _io_res_T_1 = io_rs1 + _GEN_62; // @[execution.scala 136:24]
  wire  _T_1 = 3'h0 == io_func3; // @[execution.scala 137:23]
  wire  _T_2 = 3'h1 == io_func3; // @[execution.scala 137:23]
  wire  _T_3 = 3'h2 == io_func3; // @[execution.scala 137:23]
  wire  _T_4 = 3'h4 == io_func3; // @[execution.scala 137:23]
  wire  _T_5 = 3'h5 == io_func3; // @[execution.scala 137:23]
  wire [1:0] _GEN_0 = 3'h5 == io_func3 ? 2'h2 : 2'h0; // @[execution.scala 130:13 137:23 152:21]
  wire [1:0] _GEN_2 = 3'h4 == io_func3 ? 2'h1 : _GEN_0; // @[execution.scala 137:23 148:21]
  wire  _GEN_3 = 3'h4 == io_func3 | 3'h5 == io_func3; // @[execution.scala 137:23 149:19]
  wire [1:0] _GEN_4 = 3'h2 == io_func3 ? 2'h3 : _GEN_2; // @[execution.scala 137:23 145:21]
  wire  _GEN_5 = 3'h2 == io_func3 ? 1'h0 : _GEN_3; // @[execution.scala 131:11 137:23]
  wire [1:0] _GEN_6 = 3'h1 == io_func3 ? 2'h2 : _GEN_4; // @[execution.scala 137:23 142:21]
  wire  _GEN_7 = 3'h1 == io_func3 ? 1'h0 : _GEN_5; // @[execution.scala 131:11 137:23]
  wire [1:0] _GEN_8 = 3'h0 == io_func3 ? 2'h1 : _GEN_6; // @[execution.scala 137:23 139:21]
  wire  _GEN_9 = 3'h0 == io_func3 ? 1'h0 : _GEN_7; // @[execution.scala 131:11 137:23]
  wire  _T_6 = 7'h13 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _io_res_res_T = io_rs1; // @[execution.scala 68:21]
  wire [11:0] _io_res_res_T_1 = io_imm; // @[execution.scala 68:34]
  wire [31:0] _GEN_63 = {{20{_io_res_res_T_1[11]}},_io_res_res_T_1}; // @[execution.scala 68:28]
  wire [31:0] _io_res_res_T_5 = $signed(io_rs1) + $signed(_GEN_63); // @[execution.scala 68:42]
  wire [31:0] _io_res_res_T_10 = io_rs1 ^ _GEN_62; // @[execution.scala 77:20]
  wire  _io_res_T_6 = 3'h6 == io_func3; // @[execution.scala 66:19]
  wire [31:0] _io_res_res_T_11 = io_rs1 | _GEN_62; // @[execution.scala 80:20]
  wire  _io_res_T_7 = 3'h7 == io_func3; // @[execution.scala 66:19]
  wire [31:0] _io_res_res_T_12 = io_rs1 & _GEN_62; // @[execution.scala 83:20]
  wire [62:0] _GEN_1 = {{31'd0}, io_rs1}; // @[execution.scala 86:20]
  wire [62:0] _io_res_res_T_14 = _GEN_1 << io_imm[4:0]; // @[execution.scala 86:20]
  wire [62:0] _GEN_10 = _T_2 ? _io_res_res_T_14 : 63'h0; // @[execution.scala 66:19 86:13 65:9]
  wire [62:0] _GEN_11 = 3'h7 == io_func3 ? {{31'd0}, _io_res_res_T_12} : _GEN_10; // @[execution.scala 66:19 83:13]
  wire [62:0] _GEN_12 = 3'h6 == io_func3 ? {{31'd0}, _io_res_res_T_11} : _GEN_11; // @[execution.scala 66:19 80:13]
  wire [62:0] _GEN_13 = _T_4 ? {{31'd0}, _io_res_res_T_10} : _GEN_12; // @[execution.scala 66:19 77:13]
  wire [62:0] _GEN_14 = 3'h3 == io_func3 ? {{62'd0}, io_rs1 < _GEN_62} : _GEN_13; // @[execution.scala 66:19 74:13]
  wire [62:0] _GEN_15 = _T_3 ? {{62'd0}, $signed(_io_res_res_T) < $signed(_GEN_63)} : _GEN_14; // @[execution.scala 66:19 71:13]
  wire [62:0] _GEN_16 = _T_1 ? {{31'd0}, _io_res_res_T_5} : _GEN_15; // @[execution.scala 66:19 68:13]
  wire  _T_7 = 7'h17 == io_opcode; // @[execution.scala 134:21]
  wire [19:0] _io_res_T_19 = io_imm20; // @[execution.scala 161:42]
  wire [31:0] _GEN_69 = {{12{_io_res_T_19[19]}},_io_res_T_19}; // @[execution.scala 161:31]
  wire [31:0] _io_res_T_23 = $signed(io_pc) + $signed(_GEN_69); // @[execution.scala 161:50]
  wire  _T_8 = 7'h23 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _GEN_17 = _T_3 ? io_rs2 : 32'h0; // @[execution.scala 128:10 165:23 175:18]
  wire [1:0] _GEN_18 = _T_3 ? 2'h3 : 2'h0; // @[execution.scala 130:13 165:23 176:21]
  wire [31:0] _GEN_19 = _T_2 ? {{16'd0}, io_rs2[15:0]} : _GEN_17; // @[execution.scala 165:23 171:18]
  wire [1:0] _GEN_20 = _T_2 ? 2'h2 : _GEN_18; // @[execution.scala 165:23 172:21]
  wire [31:0] _GEN_21 = _T_1 ? {{24'd0}, io_rs2[7:0]} : _GEN_19; // @[execution.scala 165:23 167:18]
  wire [1:0] _GEN_22 = _T_1 ? 2'h1 : _GEN_20; // @[execution.scala 165:23 168:21]
  wire  _T_12 = 7'h6f == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _io_res_T_27 = io_pc + 32'h4; // @[execution.scala 181:23]
  wire  _T_13 = 7'h33 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _io_res_res_T_16 = io_rs1 + io_rs2; // @[execution.scala 29:20]
  wire [31:0] _io_res_res_T_18 = io_rs1 - io_rs2; // @[execution.scala 32:20]
  wire [62:0] _GEN_38 = {{31'd0}, io_rs1}; // @[execution.scala 35:20]
  wire [62:0] _io_res_res_T_20 = _GEN_38 << io_rs2[4:0]; // @[execution.scala 35:20]
  wire [31:0] _io_res_res_T_22 = io_rs2; // @[execution.scala 38:34]
  wire  _io_res_res_T_23 = $signed(io_rs1) < $signed(io_rs2); // @[execution.scala 38:28]
  wire  _io_res_res_T_24 = io_rs1 < io_rs2; // @[execution.scala 41:21]
  wire [31:0] _io_res_res_T_25 = io_rs1 ^ io_rs2; // @[execution.scala 44:20]
  wire [31:0] _io_res_res_T_27 = io_rs1 >> io_rs2[4:0]; // @[execution.scala 47:20]
  wire [31:0] _io_res_res_T_31 = $signed(io_rs1) >>> io_rs2[4:0]; // @[execution.scala 50:42]
  wire [31:0] _io_res_res_T_32 = io_rs1 | io_rs2; // @[execution.scala 53:20]
  wire [31:0] _io_res_res_T_33 = io_rs1 & io_rs2; // @[execution.scala 56:20]
  wire [31:0] _GEN_23 = 10'h7 == io_func10 ? _io_res_res_T_33 : 32'h0; // @[execution.scala 27:20 56:13 26:9]
  wire [31:0] _GEN_24 = 10'h6 == io_func10 ? _io_res_res_T_32 : _GEN_23; // @[execution.scala 27:20 53:13]
  wire [31:0] _GEN_25 = 10'h105 == io_func10 ? _io_res_res_T_31 : _GEN_24; // @[execution.scala 27:20 50:13]
  wire [31:0] _GEN_26 = 10'h5 == io_func10 ? _io_res_res_T_27 : _GEN_25; // @[execution.scala 27:20 47:13]
  wire [31:0] _GEN_27 = 10'h4 == io_func10 ? _io_res_res_T_25 : _GEN_26; // @[execution.scala 27:20 44:13]
  wire [31:0] _GEN_28 = 10'h3 == io_func10 ? {{31'd0}, io_rs1 < io_rs2} : _GEN_27; // @[execution.scala 27:20 41:13]
  wire [31:0] _GEN_29 = 10'h2 == io_func10 ? {{31'd0}, $signed(_io_res_res_T) < $signed(_io_res_res_T_22)} : _GEN_28; // @[execution.scala 27:20 38:13]
  wire [62:0] _GEN_30 = 10'h1 == io_func10 ? _io_res_res_T_20 : {{31'd0}, _GEN_29}; // @[execution.scala 27:20 35:13]
  wire [62:0] _GEN_31 = 10'h100 == io_func10 ? {{31'd0}, _io_res_res_T_18} : _GEN_30; // @[execution.scala 27:20 32:13]
  wire [62:0] _GEN_32 = 10'h0 == io_func10 ? {{31'd0}, _io_res_res_T_16} : _GEN_31; // @[execution.scala 27:20 29:13]
  wire  _T_14 = 7'h37 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _io_res_T_38 = {io_imm20, 12'h0}; // @[execution.scala 188:26]
  wire  _T_15 = 7'h63 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _io_res_T_44 = $signed(io_pc) + $signed(_GEN_63); // @[execution.scala 191:48]
  wire  _GEN_33 = _io_res_T_7 & io_rs1 >= io_rs2; // @[execution.scala 102:12 103:19 121:16]
  wire  _GEN_34 = _io_res_T_6 ? _io_res_res_T_24 : _GEN_33; // @[execution.scala 103:19 118:16]
  wire  _GEN_35 = _T_5 ? $signed(io_rs1) >= $signed(io_rs2) : _GEN_34; // @[execution.scala 103:19 115:16]
  wire  _GEN_36 = _T_4 ? _io_res_res_T_23 : _GEN_35; // @[execution.scala 103:19 111:16]
  wire  _GEN_37 = _T_2 ? io_rs1 != io_rs2 : _GEN_36; // @[execution.scala 103:19 108:16]
  wire  io_branch_branch = _T_1 ? io_rs1 == io_rs2 : _GEN_37; // @[execution.scala 103:19 105:16]
  wire  _T_16 = 7'h67 == io_opcode; // @[execution.scala 134:21]
  wire  _T_17 = 7'h73 == io_opcode; // @[execution.scala 134:21]
  wire [31:0] _GEN_39 = 7'h67 == io_opcode ? _io_res_T_27 : 32'h0; // @[execution.scala 128:10 134:21 195:14]
  wire [31:0] _GEN_41 = 7'h63 == io_opcode ? _io_res_T_44 : _GEN_39; // @[execution.scala 134:21 191:14]
  wire  _GEN_42 = 7'h63 == io_opcode ? io_branch_branch : 7'h67 == io_opcode; // @[execution.scala 134:21 192:17]
  wire [31:0] _GEN_43 = 7'h37 == io_opcode ? _io_res_T_38 : _GEN_41; // @[execution.scala 134:21 188:14]
  wire  _GEN_44 = 7'h37 == io_opcode ? 1'h0 : _GEN_42; // @[execution.scala 129:13 134:21]
  wire [31:0] io_res_res_1 = _GEN_32[31:0]; // @[execution.scala 25:19]
  wire [31:0] _GEN_45 = 7'h33 == io_opcode ? io_res_res_1 : _GEN_43; // @[execution.scala 134:21 185:14]
  wire  _GEN_46 = 7'h33 == io_opcode ? 1'h0 : _GEN_44; // @[execution.scala 129:13 134:21]
  wire [31:0] _GEN_47 = 7'h6f == io_opcode ? _io_res_T_27 : _GEN_45; // @[execution.scala 134:21 181:14]
  wire  _GEN_48 = 7'h6f == io_opcode | _GEN_46; // @[execution.scala 134:21 182:17]
  wire [31:0] _GEN_49 = 7'h23 == io_opcode ? _GEN_21 : _GEN_47; // @[execution.scala 134:21]
  wire [1:0] _GEN_50 = 7'h23 == io_opcode ? _GEN_22 : 2'h0; // @[execution.scala 130:13 134:21]
  wire  _GEN_51 = 7'h23 == io_opcode ? 1'h0 : _GEN_48; // @[execution.scala 129:13 134:21]
  wire [31:0] _GEN_52 = 7'h17 == io_opcode ? _io_res_T_23 : _GEN_49; // @[execution.scala 134:21 161:14]
  wire  _GEN_53 = 7'h17 == io_opcode | _GEN_51; // @[execution.scala 134:21 162:17]
  wire [1:0] _GEN_54 = 7'h17 == io_opcode ? 2'h0 : _GEN_50; // @[execution.scala 130:13 134:21]
  wire [31:0] io_res_res = _GEN_16[31:0]; // @[execution.scala 64:19]
  wire [31:0] _GEN_55 = 7'h13 == io_opcode ? io_res_res : _GEN_52; // @[execution.scala 134:21 158:14]
  wire  _GEN_56 = 7'h13 == io_opcode ? 1'h0 : _GEN_53; // @[execution.scala 129:13 134:21]
  wire [1:0] _GEN_57 = 7'h13 == io_opcode ? 2'h0 : _GEN_54; // @[execution.scala 130:13 134:21]
  assign io_res = 7'h3 == io_opcode ? _io_res_T_1 : _GEN_55; // @[execution.scala 134:21 136:14]
  assign io_branch = 7'h3 == io_opcode ? 1'h0 : _GEN_56; // @[execution.scala 129:13 134:21]
  assign io_memLen = 7'h3 == io_opcode ? _GEN_8 : _GEN_57; // @[execution.scala 134:21]
  assign io_sign = 7'h3 == io_opcode & _GEN_9; // @[execution.scala 131:11 134:21]
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
  output [15:0] io_sevSegNum,
  output [31:0] io_instr,
  output [31:0] io_pc
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
  reg [31:0] _RAND_58;
`endif // RANDOMIZE_REG_INIT
  wire  DataMem_clock; // @[cpu.scala 50:23]
  wire [31:0] DataMem_io_Addr; // @[cpu.scala 50:23]
  wire [31:0] DataMem_io_DataIn; // @[cpu.scala 50:23]
  wire [1:0] DataMem_io_Length; // @[cpu.scala 50:23]
  wire  DataMem_io_memWr; // @[cpu.scala 50:23]
  wire  DataMem_io_sign; // @[cpu.scala 50:23]
  wire [31:0] DataMem_io_DataOut; // @[cpu.scala 50:23]
  wire [15:0] DataMem_io_hex; // @[cpu.scala 50:23]
  wire [31:0] decoder_io_instr; // @[cpu.scala 83:23]
  wire [4:0] decoder_io_rs1; // @[cpu.scala 83:23]
  wire [4:0] decoder_io_rs2; // @[cpu.scala 83:23]
  wire [4:0] decoder_io_rd; // @[cpu.scala 83:23]
  wire [2:0] decoder_io_func3; // @[cpu.scala 83:23]
  wire [9:0] decoder_io_func10; // @[cpu.scala 83:23]
  wire [11:0] decoder_io_imm; // @[cpu.scala 83:23]
  wire [19:0] decoder_io_imm20; // @[cpu.scala 83:23]
  wire  exe_clock; // @[cpu.scala 86:19]
  wire  exe_reset; // @[cpu.scala 86:19]
  wire [6:0] exe_io_opcode; // @[cpu.scala 86:19]
  wire [31:0] exe_io_rs1; // @[cpu.scala 86:19]
  wire [31:0] exe_io_rs2; // @[cpu.scala 86:19]
  wire [31:0] exe_io_rd; // @[cpu.scala 86:19]
  wire [2:0] exe_io_func3; // @[cpu.scala 86:19]
  wire [9:0] exe_io_func10; // @[cpu.scala 86:19]
  wire [11:0] exe_io_imm; // @[cpu.scala 86:19]
  wire [19:0] exe_io_imm20; // @[cpu.scala 86:19]
  wire [31:0] exe_io_pc; // @[cpu.scala 86:19]
  wire [31:0] exe_io_res; // @[cpu.scala 86:19]
  wire  exe_io_branch; // @[cpu.scala 86:19]
  wire [1:0] exe_io_memLen; // @[cpu.scala 86:19]
  wire  exe_io_sign; // @[cpu.scala 86:19]
  reg [31:0] reg_0; // @[cpu.scala 48:52]
  reg [31:0] reg_1; // @[cpu.scala 48:52]
  reg [31:0] reg_2; // @[cpu.scala 48:52]
  reg [31:0] reg_3; // @[cpu.scala 48:52]
  reg [31:0] reg_4; // @[cpu.scala 48:52]
  reg [31:0] reg_5; // @[cpu.scala 48:52]
  reg [31:0] reg_6; // @[cpu.scala 48:52]
  reg [31:0] reg_7; // @[cpu.scala 48:52]
  reg [31:0] reg_8; // @[cpu.scala 48:52]
  reg [31:0] reg_9; // @[cpu.scala 48:52]
  reg [31:0] reg_10; // @[cpu.scala 48:52]
  reg [31:0] reg_11; // @[cpu.scala 48:52]
  reg [31:0] reg_12; // @[cpu.scala 48:52]
  reg [31:0] reg_13; // @[cpu.scala 48:52]
  reg [31:0] reg_14; // @[cpu.scala 48:52]
  reg [31:0] reg_15; // @[cpu.scala 48:52]
  reg [31:0] reg_16; // @[cpu.scala 48:52]
  reg [31:0] reg_17; // @[cpu.scala 48:52]
  reg [31:0] reg_18; // @[cpu.scala 48:52]
  reg [31:0] reg_19; // @[cpu.scala 48:52]
  reg [31:0] reg_20; // @[cpu.scala 48:52]
  reg [31:0] reg_21; // @[cpu.scala 48:52]
  reg [31:0] reg_22; // @[cpu.scala 48:52]
  reg [31:0] reg_23; // @[cpu.scala 48:52]
  reg [31:0] reg_24; // @[cpu.scala 48:52]
  reg [31:0] reg_25; // @[cpu.scala 48:52]
  reg [31:0] reg_26; // @[cpu.scala 48:52]
  reg [31:0] reg_27; // @[cpu.scala 48:52]
  reg [31:0] reg_28; // @[cpu.scala 48:52]
  reg [31:0] reg_29; // @[cpu.scala 48:52]
  reg [31:0] reg_30; // @[cpu.scala 48:52]
  reg [31:0] reg_31; // @[cpu.scala 48:52]
  reg [6:0] decExReg_opcode; // @[cpu.scala 87:25]
  reg [31:0] decExReg_rs1; // @[cpu.scala 87:25]
  reg [31:0] decExReg_rs2; // @[cpu.scala 87:25]
  reg [4:0] decExReg_rd; // @[cpu.scala 87:25]
  reg [2:0] decExReg_func3; // @[cpu.scala 87:25]
  reg [9:0] decExReg_func10; // @[cpu.scala 87:25]
  reg [11:0] decExReg_imm; // @[cpu.scala 87:25]
  reg [19:0] decExReg_imm20; // @[cpu.scala 87:25]
  reg [31:0] decExReg_pc; // @[cpu.scala 87:25]
  reg  decExReg_valid; // @[cpu.scala 87:25]
  reg [4:0] memReg_rd; // @[cpu.scala 88:23]
  reg [31:0] memReg_regData; // @[cpu.scala 88:23]
  reg [31:0] memReg_Addr; // @[cpu.scala 88:23]
  reg [1:0] memReg_Len; // @[cpu.scala 88:23]
  reg  memReg_memWr; // @[cpu.scala 88:23]
  reg  memReg_sign; // @[cpu.scala 88:23]
  reg  memReg_valid; // @[cpu.scala 88:23]
  reg [4:0] wbReg_rd; // @[cpu.scala 89:22]
  reg [31:0] wbReg_regData; // @[cpu.scala 89:22]
  reg [31:0] wbReg_memData; // @[cpu.scala 89:22]
  reg [1:0] wbReg_Len; // @[cpu.scala 89:22]
  reg  wbReg_memWr; // @[cpu.scala 89:22]
  reg  wbReg_valid; // @[cpu.scala 89:22]
  reg [31:0] cntReg; // @[cpu.scala 97:23]
  reg [31:0] pcRegReg; // @[cpu.scala 98:25]
  reg [31:0] pcReg; // @[cpu.scala 102:22]
  reg [31:0] instrReg; // @[cpu.scala 103:25]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[cpu.scala 105:20]
  wire [31:0] _pcNext_T_1 = pcReg + 32'h4; // @[cpu.scala 110:52]
  wire  doBranch = exe_io_branch & decExReg_valid; // @[cpu.scala 176:29]
  wire [11:0] _branchTarget_T_2 = decExReg_imm; // @[cpu.scala 175:82]
  wire [31:0] _GEN_174 = {{20{_branchTarget_T_2[11]}},_branchTarget_T_2}; // @[cpu.scala 175:67]
  wire [31:0] _branchTarget_T_6 = $signed(exe_io_rs1) + $signed(_GEN_174); // @[cpu.scala 175:90]
  wire [19:0] _branchTarget_T_11 = exe_io_opcode == 7'h17 ? $signed(decExReg_imm20) : $signed({{8{_branchTarget_T_2[11
    ]}},_branchTarget_T_2}); // @[cpu.scala 175:122]
  wire [31:0] _GEN_175 = {{12{_branchTarget_T_11[19]}},_branchTarget_T_11}; // @[cpu.scala 175:117]
  wire [31:0] _branchTarget_T_15 = $signed(decExReg_pc) + $signed(_GEN_175); // @[cpu.scala 175:192]
  wire [31:0] _GEN_1 = 4'h1 == pcReg[5:2] ? 32'hfc00313 : 32'h10000293; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_2 = 4'h2 == pcReg[5:2] ? 32'h6400513 : _GEN_1; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_3 = 4'h3 == pcReg[5:2] ? 32'hfff50513 : _GEN_2; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_4 = 4'h4 == pcReg[5:2] ? 32'ha280a3 : _GEN_3; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_5 = 4'h5 == pcReg[5:2] ? 32'hfea04ce3 : _GEN_4; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_6 = 4'h6 == pcReg[5:2] ? 32'h150513 : _GEN_5; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_7 = 4'h7 == pcReg[5:2] ? 32'h258593 : _GEN_6; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_8 = 4'h8 == pcReg[5:2] ? 32'h150513 : _GEN_7; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_9 = 4'h9 == pcReg[5:2] ? 32'ha280a3 : _GEN_8; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_10 = 4'ha == pcReg[5:2] ? 32'hb28123 : _GEN_9; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_11 = 4'hb == pcReg[5:2] ? 32'hfe65c8e3 : _GEN_10; // @[cpu.scala 120:{20,20}]
  wire [31:0] _GEN_12 = 4'hc == pcReg[5:2] ? 32'ha00893 : _GEN_11; // @[cpu.scala 120:{20,20}]
  wire [31:0] _memReg_rd_T = decExReg_valid ? exe_io_rd : 32'h0; // @[cpu.scala 128:21]
  wire [31:0] _GEN_176 = {{20'd0}, exe_io_imm}; // @[cpu.scala 129:31]
  wire [31:0] _memReg_Addr_T_1 = exe_io_rs1 + _GEN_176; // @[cpu.scala 129:31]
  wire [6:0] decOut_opcode = instrReg[6:0]; // @[cpu.scala 147:28]
  wire [31:0] decOut_rs1 = {{27'd0}, decoder_io_rs1}; // @[cpu.scala 148:14 84:20]
  wire [31:0] decOut_rs2 = {{27'd0}, decoder_io_rs2}; // @[cpu.scala 149:14 84:20]
  wire [4:0] decOut_rd = decoder_io_rd; // @[cpu.scala 150:13 84:20]
  wire [2:0] decOut_func3 = decoder_io_func3; // @[cpu.scala 151:16 84:20]
  wire [9:0] decOut_func10 = decoder_io_func10; // @[cpu.scala 152:17 84:20]
  wire [11:0] decOut_imm = decoder_io_imm; // @[cpu.scala 153:14 84:20]
  wire [19:0] decOut_imm20 = decoder_io_imm20; // @[cpu.scala 154:16 84:20]
  wire  decOut_valid = ~doBranch; // @[cpu.scala 156:19]
  wire [31:0] _GEN_29 = cntReg == 32'h2faf07f ? _memReg_rd_T : {{27'd0}, memReg_rd}; // @[cpu.scala 106:28 128:15 88:23]
  wire [31:0] _GEN_177 = {{27'd0}, memReg_rd}; // @[cpu.scala 160:32]
  wire [31:0] _GEN_178 = {{27'd0}, wbReg_rd}; // @[cpu.scala 161:19]
  wire [31:0] _GEN_44 = 5'h1 == decExReg_rs1[4:0] ? reg_1 : reg_0; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_45 = 5'h2 == decExReg_rs1[4:0] ? reg_2 : _GEN_44; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_46 = 5'h3 == decExReg_rs1[4:0] ? reg_3 : _GEN_45; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_47 = 5'h4 == decExReg_rs1[4:0] ? reg_4 : _GEN_46; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_48 = 5'h5 == decExReg_rs1[4:0] ? reg_5 : _GEN_47; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_49 = 5'h6 == decExReg_rs1[4:0] ? reg_6 : _GEN_48; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_50 = 5'h7 == decExReg_rs1[4:0] ? reg_7 : _GEN_49; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_51 = 5'h8 == decExReg_rs1[4:0] ? reg_8 : _GEN_50; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_52 = 5'h9 == decExReg_rs1[4:0] ? reg_9 : _GEN_51; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_53 = 5'ha == decExReg_rs1[4:0] ? reg_10 : _GEN_52; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_54 = 5'hb == decExReg_rs1[4:0] ? reg_11 : _GEN_53; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_55 = 5'hc == decExReg_rs1[4:0] ? reg_12 : _GEN_54; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_56 = 5'hd == decExReg_rs1[4:0] ? reg_13 : _GEN_55; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_57 = 5'he == decExReg_rs1[4:0] ? reg_14 : _GEN_56; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_58 = 5'hf == decExReg_rs1[4:0] ? reg_15 : _GEN_57; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_59 = 5'h10 == decExReg_rs1[4:0] ? reg_16 : _GEN_58; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_60 = 5'h11 == decExReg_rs1[4:0] ? reg_17 : _GEN_59; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_61 = 5'h12 == decExReg_rs1[4:0] ? reg_18 : _GEN_60; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_62 = 5'h13 == decExReg_rs1[4:0] ? reg_19 : _GEN_61; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_63 = 5'h14 == decExReg_rs1[4:0] ? reg_20 : _GEN_62; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_64 = 5'h15 == decExReg_rs1[4:0] ? reg_21 : _GEN_63; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_65 = 5'h16 == decExReg_rs1[4:0] ? reg_22 : _GEN_64; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_66 = 5'h17 == decExReg_rs1[4:0] ? reg_23 : _GEN_65; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_67 = 5'h18 == decExReg_rs1[4:0] ? reg_24 : _GEN_66; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_68 = 5'h19 == decExReg_rs1[4:0] ? reg_25 : _GEN_67; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_69 = 5'h1a == decExReg_rs1[4:0] ? reg_26 : _GEN_68; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_70 = 5'h1b == decExReg_rs1[4:0] ? reg_27 : _GEN_69; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_71 = 5'h1c == decExReg_rs1[4:0] ? reg_28 : _GEN_70; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_72 = 5'h1d == decExReg_rs1[4:0] ? reg_29 : _GEN_71; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_73 = 5'h1e == decExReg_rs1[4:0] ? reg_30 : _GEN_72; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_74 = 5'h1f == decExReg_rs1[4:0] ? reg_31 : _GEN_73; // @[cpu.scala 161:{8,8}]
  wire [31:0] _GEN_107 = wbReg_Len > 2'h0 ? wbReg_memData : wbReg_regData; // @[cpu.scala 193:26 194:14 196:14]
  wire [31:0] _GEN_108 = wbReg_rd == 5'h0 ? 32'h0 : _GEN_107; // @[cpu.scala 198:27 199:14]
  wire [31:0] wbData = ~wbReg_memWr & wbReg_valid ? _GEN_108 : 32'h0; // @[cpu.scala 192:36 90:27]
  wire [31:0] _exe_io_rs1_T_7 = _GEN_178 == decExReg_rs1 & wbReg_valid ? wbData : _GEN_74; // @[cpu.scala 161:8]
  wire [31:0] _GEN_76 = 5'h1 == decExReg_rs2[4:0] ? reg_1 : reg_0; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_77 = 5'h2 == decExReg_rs2[4:0] ? reg_2 : _GEN_76; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_78 = 5'h3 == decExReg_rs2[4:0] ? reg_3 : _GEN_77; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_79 = 5'h4 == decExReg_rs2[4:0] ? reg_4 : _GEN_78; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_80 = 5'h5 == decExReg_rs2[4:0] ? reg_5 : _GEN_79; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_81 = 5'h6 == decExReg_rs2[4:0] ? reg_6 : _GEN_80; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_82 = 5'h7 == decExReg_rs2[4:0] ? reg_7 : _GEN_81; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_83 = 5'h8 == decExReg_rs2[4:0] ? reg_8 : _GEN_82; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_84 = 5'h9 == decExReg_rs2[4:0] ? reg_9 : _GEN_83; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_85 = 5'ha == decExReg_rs2[4:0] ? reg_10 : _GEN_84; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_86 = 5'hb == decExReg_rs2[4:0] ? reg_11 : _GEN_85; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_87 = 5'hc == decExReg_rs2[4:0] ? reg_12 : _GEN_86; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_88 = 5'hd == decExReg_rs2[4:0] ? reg_13 : _GEN_87; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_89 = 5'he == decExReg_rs2[4:0] ? reg_14 : _GEN_88; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_90 = 5'hf == decExReg_rs2[4:0] ? reg_15 : _GEN_89; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_91 = 5'h10 == decExReg_rs2[4:0] ? reg_16 : _GEN_90; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_92 = 5'h11 == decExReg_rs2[4:0] ? reg_17 : _GEN_91; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_93 = 5'h12 == decExReg_rs2[4:0] ? reg_18 : _GEN_92; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_94 = 5'h13 == decExReg_rs2[4:0] ? reg_19 : _GEN_93; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_95 = 5'h14 == decExReg_rs2[4:0] ? reg_20 : _GEN_94; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_96 = 5'h15 == decExReg_rs2[4:0] ? reg_21 : _GEN_95; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_97 = 5'h16 == decExReg_rs2[4:0] ? reg_22 : _GEN_96; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_98 = 5'h17 == decExReg_rs2[4:0] ? reg_23 : _GEN_97; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_99 = 5'h18 == decExReg_rs2[4:0] ? reg_24 : _GEN_98; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_100 = 5'h19 == decExReg_rs2[4:0] ? reg_25 : _GEN_99; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_101 = 5'h1a == decExReg_rs2[4:0] ? reg_26 : _GEN_100; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_102 = 5'h1b == decExReg_rs2[4:0] ? reg_27 : _GEN_101; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_103 = 5'h1c == decExReg_rs2[4:0] ? reg_28 : _GEN_102; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_104 = 5'h1d == decExReg_rs2[4:0] ? reg_29 : _GEN_103; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_105 = 5'h1e == decExReg_rs2[4:0] ? reg_30 : _GEN_104; // @[cpu.scala 163:{8,8}]
  wire [31:0] _GEN_106 = 5'h1f == decExReg_rs2[4:0] ? reg_31 : _GEN_105; // @[cpu.scala 163:{8,8}]
  wire [31:0] _exe_io_rs2_T_3 = _GEN_178 == decExReg_rs2 ? wbData : _GEN_106; // @[cpu.scala 163:8]
  wire [31:0] _GEN_181 = reset ? 32'h0 : _GEN_29; // @[cpu.scala 88:{23,23}]
  memory DataMem ( // @[cpu.scala 50:23]
    .clock(DataMem_clock),
    .io_Addr(DataMem_io_Addr),
    .io_DataIn(DataMem_io_DataIn),
    .io_Length(DataMem_io_Length),
    .io_memWr(DataMem_io_memWr),
    .io_sign(DataMem_io_sign),
    .io_DataOut(DataMem_io_DataOut),
    .io_hex(DataMem_io_hex)
  );
  decode decoder ( // @[cpu.scala 83:23]
    .io_instr(decoder_io_instr),
    .io_rs1(decoder_io_rs1),
    .io_rs2(decoder_io_rs2),
    .io_rd(decoder_io_rd),
    .io_func3(decoder_io_func3),
    .io_func10(decoder_io_func10),
    .io_imm(decoder_io_imm),
    .io_imm20(decoder_io_imm20)
  );
  execution exe ( // @[cpu.scala 86:19]
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
  assign io_sevSegNum = DataMem_io_hex; // @[cpu.scala 141:16]
  assign io_instr = instrReg; // @[cpu.scala 142:12]
  assign io_pc = pcReg; // @[cpu.scala 143:9]
  assign DataMem_clock = clock;
  assign DataMem_io_Addr = memReg_Addr; // @[cpu.scala 186:19]
  assign DataMem_io_DataIn = memReg_regData; // @[cpu.scala 184:21]
  assign DataMem_io_Length = memReg_Len; // @[cpu.scala 187:21]
  assign DataMem_io_memWr = memReg_memWr; // @[cpu.scala 188:20]
  assign DataMem_io_sign = memReg_sign; // @[cpu.scala 189:19]
  assign decoder_io_instr = instrReg; // @[cpu.scala 146:20]
  assign exe_clock = clock;
  assign exe_reset = reset;
  assign exe_io_opcode = decExReg_opcode; // @[cpu.scala 159:17]
  assign exe_io_rs1 = _GEN_177 == decExReg_rs1 & memReg_valid & ~memReg_memWr ? memReg_regData : _exe_io_rs1_T_7; // @[cpu.scala 160:20]
  assign exe_io_rs2 = _GEN_177 == decExReg_rs2 ? memReg_regData : _exe_io_rs2_T_3; // @[cpu.scala 162:20]
  assign exe_io_rd = {{27'd0}, decExReg_rd}; // @[cpu.scala 167:13]
  assign exe_io_func3 = decExReg_func3; // @[cpu.scala 168:16]
  assign exe_io_func10 = decExReg_func10; // @[cpu.scala 169:17]
  assign exe_io_imm = decExReg_imm; // @[cpu.scala 170:14]
  assign exe_io_imm20 = decExReg_imm20; // @[cpu.scala 171:16]
  assign exe_io_pc = decExReg_pc; // @[cpu.scala 172:13]
  always @(posedge clock) begin
    if (reset) begin // @[cpu.scala 48:52]
      reg_0 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h0 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_0 <= _GEN_108;
        end else begin
          reg_0 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_1 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_1 <= _GEN_108;
        end else begin
          reg_1 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_2 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h2 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_2 <= _GEN_108;
        end else begin
          reg_2 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_3 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h3 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_3 <= _GEN_108;
        end else begin
          reg_3 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_4 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h4 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_4 <= _GEN_108;
        end else begin
          reg_4 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_5 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h5 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_5 <= _GEN_108;
        end else begin
          reg_5 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_6 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h6 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_6 <= _GEN_108;
        end else begin
          reg_6 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_7 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h7 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_7 <= _GEN_108;
        end else begin
          reg_7 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_8 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h8 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_8 <= _GEN_108;
        end else begin
          reg_8 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_9 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h9 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_9 <= _GEN_108;
        end else begin
          reg_9 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_10 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'ha == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_10 <= _GEN_108;
        end else begin
          reg_10 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_11 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'hb == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_11 <= _GEN_108;
        end else begin
          reg_11 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_12 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'hc == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_12 <= _GEN_108;
        end else begin
          reg_12 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_13 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'hd == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_13 <= _GEN_108;
        end else begin
          reg_13 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_14 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'he == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_14 <= _GEN_108;
        end else begin
          reg_14 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_15 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'hf == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_15 <= _GEN_108;
        end else begin
          reg_15 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_16 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h10 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_16 <= _GEN_108;
        end else begin
          reg_16 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_17 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h11 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_17 <= _GEN_108;
        end else begin
          reg_17 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_18 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h12 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_18 <= _GEN_108;
        end else begin
          reg_18 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_19 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h13 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_19 <= _GEN_108;
        end else begin
          reg_19 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_20 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h14 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_20 <= _GEN_108;
        end else begin
          reg_20 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_21 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h15 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_21 <= _GEN_108;
        end else begin
          reg_21 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_22 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h16 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_22 <= _GEN_108;
        end else begin
          reg_22 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_23 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h17 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_23 <= _GEN_108;
        end else begin
          reg_23 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_24 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h18 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_24 <= _GEN_108;
        end else begin
          reg_24 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_25 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h19 == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_25 <= _GEN_108;
        end else begin
          reg_25 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_26 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1a == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_26 <= _GEN_108;
        end else begin
          reg_26 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_27 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1b == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_27 <= _GEN_108;
        end else begin
          reg_27 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_28 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1c == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_28 <= _GEN_108;
        end else begin
          reg_28 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_29 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1d == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_29 <= _GEN_108;
        end else begin
          reg_29 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_30 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1e == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_30 <= _GEN_108;
        end else begin
          reg_30 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 48:52]
      reg_31 <= 32'h0; // @[cpu.scala 48:52]
    end else if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
      if (5'h1f == wbReg_rd) begin // @[cpu.scala 201:19]
        if (~wbReg_memWr & wbReg_valid) begin // @[cpu.scala 192:36]
          reg_31 <= _GEN_108;
        end else begin
          reg_31 <= 32'h0; // @[cpu.scala 90:27]
        end
      end
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_opcode <= 7'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_opcode <= decOut_opcode; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_rs1 <= 32'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_rs1 <= decOut_rs1; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_rs2 <= 32'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_rs2 <= decOut_rs2; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_rd <= 5'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_rd <= decOut_rd; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_func3 <= 3'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_func3 <= decOut_func3; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_func10 <= 10'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_func10 <= decOut_func10; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_imm <= 12'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_imm <= decOut_imm; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_imm20 <= 20'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_imm20 <= decOut_imm20; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_pc <= 32'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_pc <= pcRegReg; // @[cpu.scala 124:14]
    end
    if (reset) begin // @[cpu.scala 87:25]
      decExReg_valid <= 1'h0; // @[cpu.scala 87:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      decExReg_valid <= decOut_valid; // @[cpu.scala 124:14]
    end
    memReg_rd <= _GEN_181[4:0]; // @[cpu.scala 88:{23,23}]
    if (reset) begin // @[cpu.scala 88:23]
      memReg_regData <= 32'h0; // @[cpu.scala 88:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      if (decExReg_valid) begin // @[cpu.scala 127:26]
        memReg_regData <= exe_io_res;
      end else begin
        memReg_regData <= 32'h0;
      end
    end
    if (reset) begin // @[cpu.scala 88:23]
      memReg_Addr <= 32'h0; // @[cpu.scala 88:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      memReg_Addr <= _memReg_Addr_T_1; // @[cpu.scala 129:17]
    end
    if (reset) begin // @[cpu.scala 88:23]
      memReg_Len <= 2'h0; // @[cpu.scala 88:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      if (decExReg_valid) begin // @[cpu.scala 131:23]
        memReg_Len <= exe_io_memLen;
      end else begin
        memReg_Len <= 2'h0;
      end
    end
    if (reset) begin // @[cpu.scala 88:23]
      memReg_memWr <= 1'h0; // @[cpu.scala 88:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      memReg_memWr <= exe_io_memLen > 2'h0 & exe_io_opcode == 7'h23; // @[cpu.scala 130:18]
    end
    if (reset) begin // @[cpu.scala 88:23]
      memReg_sign <= 1'h0; // @[cpu.scala 88:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      memReg_sign <= exe_io_sign; // @[cpu.scala 132:17]
    end
    if (reset) begin // @[cpu.scala 88:23]
      memReg_valid <= 1'h0; // @[cpu.scala 88:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      memReg_valid <= exe_io_opcode != 7'h63 & decExReg_valid; // @[cpu.scala 133:18]
    end
    if (reset) begin // @[cpu.scala 89:22]
      wbReg_rd <= 5'h0; // @[cpu.scala 89:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      wbReg_rd <= memReg_rd; // @[cpu.scala 136:11]
    end
    if (reset) begin // @[cpu.scala 89:22]
      wbReg_regData <= 32'h0; // @[cpu.scala 89:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      wbReg_regData <= memReg_regData; // @[cpu.scala 136:11]
    end
    if (reset) begin // @[cpu.scala 89:22]
      wbReg_memData <= 32'h0; // @[cpu.scala 89:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      wbReg_memData <= DataMem_io_DataOut; // @[cpu.scala 137:19]
    end
    if (reset) begin // @[cpu.scala 89:22]
      wbReg_Len <= 2'h0; // @[cpu.scala 89:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      wbReg_Len <= memReg_Len; // @[cpu.scala 136:11]
    end
    if (reset) begin // @[cpu.scala 89:22]
      wbReg_memWr <= 1'h0; // @[cpu.scala 89:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      wbReg_memWr <= memReg_memWr; // @[cpu.scala 136:11]
    end
    if (reset) begin // @[cpu.scala 89:22]
      wbReg_valid <= 1'h0; // @[cpu.scala 89:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      wbReg_valid <= memReg_valid; // @[cpu.scala 136:11]
    end
    if (reset) begin // @[cpu.scala 97:23]
      cntReg <= 32'h0; // @[cpu.scala 97:23]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      cntReg <= 32'h0; // @[cpu.scala 107:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[cpu.scala 105:10]
    end
    if (reset) begin // @[cpu.scala 98:25]
      pcRegReg <= 32'h0; // @[cpu.scala 98:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      pcRegReg <= pcReg; // @[cpu.scala 112:14]
    end
    if (reset) begin // @[cpu.scala 102:22]
      pcReg <= 32'h0; // @[cpu.scala 102:22]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      if (doBranch) begin // @[cpu.scala 110:21]
        if (exe_io_opcode == 7'h67) begin // @[cpu.scala 175:22]
          pcReg <= _branchTarget_T_6;
        end else begin
          pcReg <= _branchTarget_T_15;
        end
      end else begin
        pcReg <= _pcNext_T_1;
      end
    end
    if (reset) begin // @[cpu.scala 103:25]
      instrReg <= 32'h33; // @[cpu.scala 103:25]
    end else if (cntReg == 32'h2faf07f) begin // @[cpu.scala 106:28]
      if (doBranch) begin // @[cpu.scala 120:20]
        instrReg <= 32'h33;
      end else if (4'hd == pcReg[5:2]) begin // @[cpu.scala 120:20]
        instrReg <= 32'h73; // @[cpu.scala 120:20]
      end else begin
        instrReg <= _GEN_12;
      end
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
  cntReg = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  pcRegReg = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  pcReg = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  instrReg = _RAND_58[31:0];
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
  input         io_none,
  input         io_full,
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
  wire [6:0] _GEN_3 = io_none ? 7'h0 : sevenSegDec0_io_out; // @[DisplayMultiplexer.scala 64:27 65:16 67:16]
  wire [6:0] _GEN_6 = io_full ? 7'h7f : _GEN_3; // @[DisplayMultiplexer.scala 58:21 59:16]
  wire [6:0] _GEN_7 = io_none ? 7'h0 : sevenSegDec1_io_out; // @[DisplayMultiplexer.scala 77:27 78:16 80:16]
  wire [6:0] _GEN_10 = io_full ? 7'h7f : _GEN_7; // @[DisplayMultiplexer.scala 71:21 72:16]
  wire [6:0] _GEN_11 = io_none ? 7'h0 : sevenSegDec2_io_out; // @[DisplayMultiplexer.scala 90:27 91:16 93:16]
  wire [6:0] _GEN_14 = io_full ? 7'h7f : _GEN_11; // @[DisplayMultiplexer.scala 84:21 85:16]
  wire [6:0] _GEN_15 = io_none ? 7'h0 : sevenSegDec3_io_out; // @[DisplayMultiplexer.scala 103:27 104:16 106:16]
  wire [6:0] _GEN_18 = io_full ? 7'h7f : _GEN_15; // @[DisplayMultiplexer.scala 97:21 98:16]
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
  wire [15:0] CPU_io_sevSegNum; // @[connection.scala 14:21]
  wire [31:0] CPU_io_instr; // @[connection.scala 14:21]
  wire [31:0] CPU_io_pc; // @[connection.scala 14:21]
  wire  SevenSeg_clock; // @[connection.scala 15:26]
  wire  SevenSeg_reset; // @[connection.scala 15:26]
  wire  SevenSeg_io_none; // @[connection.scala 15:26]
  wire  SevenSeg_io_full; // @[connection.scala 15:26]
  wire [15:0] SevenSeg_io_hex; // @[connection.scala 15:26]
  wire [6:0] SevenSeg_io_seg; // @[connection.scala 15:26]
  wire [3:0] SevenSeg_io_an; // @[connection.scala 15:26]
  wire [15:0] _SevenSeg_io_hex_T_4 = io_sw[1] ? CPU_io_pc[15:0] : CPU_io_instr[15:0]; // @[connection.scala 17:40]
  cpu CPU ( // @[connection.scala 14:21]
    .clock(CPU_clock),
    .reset(CPU_reset),
    .io_sevSegNum(CPU_io_sevSegNum),
    .io_instr(CPU_io_instr),
    .io_pc(CPU_io_pc)
  );
  DisplayMultiplexer SevenSeg ( // @[connection.scala 15:26]
    .clock(SevenSeg_clock),
    .reset(SevenSeg_reset),
    .io_none(SevenSeg_io_none),
    .io_full(SevenSeg_io_full),
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
  assign SevenSeg_io_none = io_sw[2]; // @[connection.scala 21:30]
  assign SevenSeg_io_full = io_sw[3]; // @[connection.scala 22:30]
  assign SevenSeg_io_hex = io_sw[0] ? _SevenSeg_io_hex_T_4 : CPU_io_sevSegNum; // @[connection.scala 17:27]
endmodule
