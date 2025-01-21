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
  input        clock,
  input        reset,
  output [6:0] io_seg,
  output [3:0] io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] sevenSegDec0_io_in; // @[DisplayMultiplexer.scala 18:28]
  wire [6:0] sevenSegDec0_io_out; // @[DisplayMultiplexer.scala 18:28]
  wire [3:0] sevenSegDec1_io_in; // @[DisplayMultiplexer.scala 19:28]
  wire [6:0] sevenSegDec1_io_out; // @[DisplayMultiplexer.scala 19:28]
  wire [3:0] sevenSegDec2_io_in; // @[DisplayMultiplexer.scala 20:28]
  wire [6:0] sevenSegDec2_io_out; // @[DisplayMultiplexer.scala 20:28]
  wire [3:0] sevenSegDec3_io_in; // @[DisplayMultiplexer.scala 21:28]
  wire [6:0] sevenSegDec3_io_out; // @[DisplayMultiplexer.scala 21:28]
  reg [31:0] cntReg; // @[DisplayMultiplexer.scala 24:23]
  reg [3:0] outReg; // @[DisplayMultiplexer.scala 25:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[DisplayMultiplexer.scala 29:20]
  wire [3:0] _outReg_T_2 = {outReg[0],outReg[3:1]}; // @[DisplayMultiplexer.scala 32:25]
  wire [6:0] _GEN_2 = 4'h8 == outReg ? sevenSegDec3_io_out : 7'h7f; // @[DisplayMultiplexer.scala 43:18 54:16 14:27]
  wire [6:0] _GEN_3 = 4'h4 == outReg ? sevenSegDec2_io_out : _GEN_2; // @[DisplayMultiplexer.scala 43:18 51:16]
  wire [6:0] _GEN_4 = 4'h2 == outReg ? sevenSegDec1_io_out : _GEN_3; // @[DisplayMultiplexer.scala 43:18 48:16]
  wire [6:0] sevSeg = 4'h1 == outReg ? sevenSegDec0_io_out : _GEN_4; // @[DisplayMultiplexer.scala 43:18 45:14]
  SevenSegDec sevenSegDec0 ( // @[DisplayMultiplexer.scala 18:28]
    .io_in(sevenSegDec0_io_in),
    .io_out(sevenSegDec0_io_out)
  );
  SevenSegDec sevenSegDec1 ( // @[DisplayMultiplexer.scala 19:28]
    .io_in(sevenSegDec1_io_in),
    .io_out(sevenSegDec1_io_out)
  );
  SevenSegDec sevenSegDec2 ( // @[DisplayMultiplexer.scala 20:28]
    .io_in(sevenSegDec2_io_in),
    .io_out(sevenSegDec2_io_out)
  );
  SevenSegDec sevenSegDec3 ( // @[DisplayMultiplexer.scala 21:28]
    .io_in(sevenSegDec3_io_in),
    .io_out(sevenSegDec3_io_out)
  );
  assign io_seg = ~sevSeg; // @[DisplayMultiplexer.scala 59:13]
  assign io_an = ~outReg; // @[DisplayMultiplexer.scala 60:12]
  assign sevenSegDec0_io_in = 4'h4; // @[DisplayMultiplexer.scala 37:31]
  assign sevenSegDec1_io_in = 4'h3; // @[DisplayMultiplexer.scala 38:31]
  assign sevenSegDec2_io_in = 4'h2; // @[DisplayMultiplexer.scala 39:31]
  assign sevenSegDec3_io_in = 4'h1; // @[DisplayMultiplexer.scala 40:31]
  always @(posedge clock) begin
    if (reset) begin // @[DisplayMultiplexer.scala 24:23]
      cntReg <= 32'h0; // @[DisplayMultiplexer.scala 24:23]
    end else if (cntReg == 32'ha) begin // @[DisplayMultiplexer.scala 30:28]
      cntReg <= 32'h0; // @[DisplayMultiplexer.scala 31:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[DisplayMultiplexer.scala 29:10]
    end
    if (reset) begin // @[DisplayMultiplexer.scala 25:23]
      outReg <= 4'h1; // @[DisplayMultiplexer.scala 25:23]
    end else if (cntReg == 32'ha) begin // @[DisplayMultiplexer.scala 30:28]
      outReg <= _outReg_T_2; // @[DisplayMultiplexer.scala 32:12]
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
  wire  SevenSeg_clock; // @[connection.scala 15:26]
  wire  SevenSeg_reset; // @[connection.scala 15:26]
  wire [6:0] SevenSeg_io_seg; // @[connection.scala 15:26]
  wire [3:0] SevenSeg_io_an; // @[connection.scala 15:26]
  DisplayMultiplexer SevenSeg ( // @[connection.scala 15:26]
    .clock(SevenSeg_clock),
    .reset(SevenSeg_reset),
    .io_seg(SevenSeg_io_seg),
    .io_an(SevenSeg_io_an)
  );
  assign io_seg = SevenSeg_io_seg; // @[connection.scala 19:12]
  assign io_an = SevenSeg_io_an; // @[connection.scala 20:11]
  assign io_led = io_sw; // @[connection.scala 22:12]
  assign SevenSeg_clock = clock;
  assign SevenSeg_reset = reset;
endmodule
