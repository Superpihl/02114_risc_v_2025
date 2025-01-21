circuit connection :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    wire sevSeg : UInt @[SevenSegDec.scala 12:27]
    sevSeg <= UInt<1>("h0") @[SevenSegDec.scala 12:27]
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 16:17]
    when _T : @[SevenSegDec.scala 16:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 18:14]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 16:17]
      when _T_1 : @[SevenSegDec.scala 16:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 21:14]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 16:17]
        when _T_2 : @[SevenSegDec.scala 16:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 24:14]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 16:17]
          when _T_3 : @[SevenSegDec.scala 16:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 27:14]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 16:17]
            when _T_4 : @[SevenSegDec.scala 16:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 30:14]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 16:17]
              when _T_5 : @[SevenSegDec.scala 16:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 33:14]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 16:17]
                when _T_6 : @[SevenSegDec.scala 16:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 36:14]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 16:17]
                  when _T_7 : @[SevenSegDec.scala 16:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 39:14]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 16:17]
                    when _T_8 : @[SevenSegDec.scala 16:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 42:14]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 16:17]
                      when _T_9 : @[SevenSegDec.scala 16:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 45:14]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 16:17]
                        when _T_10 : @[SevenSegDec.scala 16:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 48:14]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 16:17]
                          when _T_11 : @[SevenSegDec.scala 16:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 51:14]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 16:17]
                            when _T_12 : @[SevenSegDec.scala 16:17]
                              sevSeg <= UInt<6>("h39") @[SevenSegDec.scala 54:14]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 16:17]
                              when _T_13 : @[SevenSegDec.scala 16:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 57:14]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 16:17]
                                when _T_14 : @[SevenSegDec.scala 16:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 60:14]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 16:17]
                                  when _T_15 : @[SevenSegDec.scala 16:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 63:14]
    io.out <= sevSeg @[SevenSegDec.scala 68:10]

  module SevenSegDec_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    wire sevSeg : UInt @[SevenSegDec.scala 12:27]
    sevSeg <= UInt<1>("h0") @[SevenSegDec.scala 12:27]
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 16:17]
    when _T : @[SevenSegDec.scala 16:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 18:14]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 16:17]
      when _T_1 : @[SevenSegDec.scala 16:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 21:14]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 16:17]
        when _T_2 : @[SevenSegDec.scala 16:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 24:14]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 16:17]
          when _T_3 : @[SevenSegDec.scala 16:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 27:14]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 16:17]
            when _T_4 : @[SevenSegDec.scala 16:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 30:14]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 16:17]
              when _T_5 : @[SevenSegDec.scala 16:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 33:14]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 16:17]
                when _T_6 : @[SevenSegDec.scala 16:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 36:14]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 16:17]
                  when _T_7 : @[SevenSegDec.scala 16:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 39:14]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 16:17]
                    when _T_8 : @[SevenSegDec.scala 16:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 42:14]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 16:17]
                      when _T_9 : @[SevenSegDec.scala 16:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 45:14]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 16:17]
                        when _T_10 : @[SevenSegDec.scala 16:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 48:14]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 16:17]
                          when _T_11 : @[SevenSegDec.scala 16:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 51:14]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 16:17]
                            when _T_12 : @[SevenSegDec.scala 16:17]
                              sevSeg <= UInt<6>("h39") @[SevenSegDec.scala 54:14]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 16:17]
                              when _T_13 : @[SevenSegDec.scala 16:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 57:14]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 16:17]
                                when _T_14 : @[SevenSegDec.scala 16:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 60:14]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 16:17]
                                  when _T_15 : @[SevenSegDec.scala 16:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 63:14]
    io.out <= sevSeg @[SevenSegDec.scala 68:10]

  module SevenSegDec_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    wire sevSeg : UInt @[SevenSegDec.scala 12:27]
    sevSeg <= UInt<1>("h0") @[SevenSegDec.scala 12:27]
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 16:17]
    when _T : @[SevenSegDec.scala 16:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 18:14]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 16:17]
      when _T_1 : @[SevenSegDec.scala 16:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 21:14]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 16:17]
        when _T_2 : @[SevenSegDec.scala 16:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 24:14]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 16:17]
          when _T_3 : @[SevenSegDec.scala 16:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 27:14]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 16:17]
            when _T_4 : @[SevenSegDec.scala 16:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 30:14]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 16:17]
              when _T_5 : @[SevenSegDec.scala 16:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 33:14]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 16:17]
                when _T_6 : @[SevenSegDec.scala 16:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 36:14]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 16:17]
                  when _T_7 : @[SevenSegDec.scala 16:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 39:14]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 16:17]
                    when _T_8 : @[SevenSegDec.scala 16:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 42:14]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 16:17]
                      when _T_9 : @[SevenSegDec.scala 16:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 45:14]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 16:17]
                        when _T_10 : @[SevenSegDec.scala 16:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 48:14]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 16:17]
                          when _T_11 : @[SevenSegDec.scala 16:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 51:14]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 16:17]
                            when _T_12 : @[SevenSegDec.scala 16:17]
                              sevSeg <= UInt<6>("h39") @[SevenSegDec.scala 54:14]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 16:17]
                              when _T_13 : @[SevenSegDec.scala 16:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 57:14]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 16:17]
                                when _T_14 : @[SevenSegDec.scala 16:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 60:14]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 16:17]
                                  when _T_15 : @[SevenSegDec.scala 16:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 63:14]
    io.out <= sevSeg @[SevenSegDec.scala 68:10]

  module SevenSegDec_3 :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>}

    wire sevSeg : UInt @[SevenSegDec.scala 12:27]
    sevSeg <= UInt<1>("h0") @[SevenSegDec.scala 12:27]
    node _T = eq(UInt<1>("h0"), io.in) @[SevenSegDec.scala 16:17]
    when _T : @[SevenSegDec.scala 16:17]
      sevSeg <= UInt<6>("h3f") @[SevenSegDec.scala 18:14]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[SevenSegDec.scala 16:17]
      when _T_1 : @[SevenSegDec.scala 16:17]
        sevSeg <= UInt<3>("h6") @[SevenSegDec.scala 21:14]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[SevenSegDec.scala 16:17]
        when _T_2 : @[SevenSegDec.scala 16:17]
          sevSeg <= UInt<7>("h5b") @[SevenSegDec.scala 24:14]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[SevenSegDec.scala 16:17]
          when _T_3 : @[SevenSegDec.scala 16:17]
            sevSeg <= UInt<7>("h4f") @[SevenSegDec.scala 27:14]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[SevenSegDec.scala 16:17]
            when _T_4 : @[SevenSegDec.scala 16:17]
              sevSeg <= UInt<7>("h66") @[SevenSegDec.scala 30:14]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[SevenSegDec.scala 16:17]
              when _T_5 : @[SevenSegDec.scala 16:17]
                sevSeg <= UInt<7>("h6d") @[SevenSegDec.scala 33:14]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[SevenSegDec.scala 16:17]
                when _T_6 : @[SevenSegDec.scala 16:17]
                  sevSeg <= UInt<7>("h7d") @[SevenSegDec.scala 36:14]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[SevenSegDec.scala 16:17]
                  when _T_7 : @[SevenSegDec.scala 16:17]
                    sevSeg <= UInt<3>("h7") @[SevenSegDec.scala 39:14]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[SevenSegDec.scala 16:17]
                    when _T_8 : @[SevenSegDec.scala 16:17]
                      sevSeg <= UInt<7>("h7f") @[SevenSegDec.scala 42:14]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[SevenSegDec.scala 16:17]
                      when _T_9 : @[SevenSegDec.scala 16:17]
                        sevSeg <= UInt<7>("h6f") @[SevenSegDec.scala 45:14]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[SevenSegDec.scala 16:17]
                        when _T_10 : @[SevenSegDec.scala 16:17]
                          sevSeg <= UInt<7>("h77") @[SevenSegDec.scala 48:14]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[SevenSegDec.scala 16:17]
                          when _T_11 : @[SevenSegDec.scala 16:17]
                            sevSeg <= UInt<7>("h7c") @[SevenSegDec.scala 51:14]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[SevenSegDec.scala 16:17]
                            when _T_12 : @[SevenSegDec.scala 16:17]
                              sevSeg <= UInt<6>("h39") @[SevenSegDec.scala 54:14]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[SevenSegDec.scala 16:17]
                              when _T_13 : @[SevenSegDec.scala 16:17]
                                sevSeg <= UInt<7>("h5e") @[SevenSegDec.scala 57:14]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[SevenSegDec.scala 16:17]
                                when _T_14 : @[SevenSegDec.scala 16:17]
                                  sevSeg <= UInt<7>("h79") @[SevenSegDec.scala 60:14]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[SevenSegDec.scala 16:17]
                                  when _T_15 : @[SevenSegDec.scala 16:17]
                                    sevSeg <= UInt<7>("h71") @[SevenSegDec.scala 63:14]
    io.out <= sevSeg @[SevenSegDec.scala 68:10]

  module DisplayMultiplexer :
    input clock : Clock
    input reset : Reset
    output io : { flip hex : UInt<16>, seg : UInt<7>, an : UInt<4>}

    wire sevSeg : UInt<7> @[DisplayMultiplexer.scala 14:27]
    sevSeg <= UInt<7>("h7f") @[DisplayMultiplexer.scala 14:27]
    wire select : UInt<4> @[DisplayMultiplexer.scala 15:27]
    select <= UInt<4>("h1") @[DisplayMultiplexer.scala 15:27]
    inst sevenSegDec0 of SevenSegDec @[DisplayMultiplexer.scala 18:28]
    sevenSegDec0.clock <= clock
    sevenSegDec0.reset <= reset
    inst sevenSegDec1 of SevenSegDec_1 @[DisplayMultiplexer.scala 19:28]
    sevenSegDec1.clock <= clock
    sevenSegDec1.reset <= reset
    inst sevenSegDec2 of SevenSegDec_2 @[DisplayMultiplexer.scala 20:28]
    sevenSegDec2.clock <= clock
    sevenSegDec2.reset <= reset
    inst sevenSegDec3 of SevenSegDec_3 @[DisplayMultiplexer.scala 21:28]
    sevenSegDec3.clock <= clock
    sevenSegDec3.reset <= reset
    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[DisplayMultiplexer.scala 24:23]
    reg outReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h1")) @[DisplayMultiplexer.scala 25:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[DisplayMultiplexer.scala 29:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[DisplayMultiplexer.scala 29:20]
    cntReg <= _cntReg_T_1 @[DisplayMultiplexer.scala 29:10]
    node _T = eq(cntReg, UInt<4>("ha")) @[DisplayMultiplexer.scala 30:15]
    when _T : @[DisplayMultiplexer.scala 30:28]
      cntReg <= UInt<1>("h0") @[DisplayMultiplexer.scala 31:12]
      node _outReg_T = bits(outReg, 0, 0) @[DisplayMultiplexer.scala 32:21]
      node _outReg_T_1 = bits(outReg, 3, 1) @[DisplayMultiplexer.scala 32:34]
      node _outReg_T_2 = cat(_outReg_T, _outReg_T_1) @[DisplayMultiplexer.scala 32:25]
      outReg <= _outReg_T_2 @[DisplayMultiplexer.scala 32:12]
    select <= outReg @[DisplayMultiplexer.scala 34:10]
    node _sevenSegDec0_io_in_T = bits(io.hex, 3, 0) @[DisplayMultiplexer.scala 37:31]
    sevenSegDec0.io.in <= _sevenSegDec0_io_in_T @[DisplayMultiplexer.scala 37:22]
    node _sevenSegDec1_io_in_T = bits(io.hex, 7, 4) @[DisplayMultiplexer.scala 38:31]
    sevenSegDec1.io.in <= _sevenSegDec1_io_in_T @[DisplayMultiplexer.scala 38:22]
    node _sevenSegDec2_io_in_T = bits(io.hex, 11, 8) @[DisplayMultiplexer.scala 39:31]
    sevenSegDec2.io.in <= _sevenSegDec2_io_in_T @[DisplayMultiplexer.scala 39:22]
    node _sevenSegDec3_io_in_T = bits(io.hex, 15, 12) @[DisplayMultiplexer.scala 40:31]
    sevenSegDec3.io.in <= _sevenSegDec3_io_in_T @[DisplayMultiplexer.scala 40:22]
    node _T_1 = eq(UInt<1>("h1"), select) @[DisplayMultiplexer.scala 43:18]
    when _T_1 : @[DisplayMultiplexer.scala 43:18]
      sevSeg <= sevenSegDec0.io.out @[DisplayMultiplexer.scala 45:14]
    else :
      node _T_2 = eq(UInt<2>("h2"), select) @[DisplayMultiplexer.scala 43:18]
      when _T_2 : @[DisplayMultiplexer.scala 43:18]
        sevSeg <= sevenSegDec1.io.out @[DisplayMultiplexer.scala 48:16]
      else :
        node _T_3 = eq(UInt<3>("h4"), select) @[DisplayMultiplexer.scala 43:18]
        when _T_3 : @[DisplayMultiplexer.scala 43:18]
          sevSeg <= sevenSegDec2.io.out @[DisplayMultiplexer.scala 51:16]
        else :
          node _T_4 = eq(UInt<4>("h8"), select) @[DisplayMultiplexer.scala 43:18]
          when _T_4 : @[DisplayMultiplexer.scala 43:18]
            sevSeg <= sevenSegDec3.io.out @[DisplayMultiplexer.scala 54:16]
    node _io_seg_T = not(sevSeg) @[DisplayMultiplexer.scala 59:13]
    io.seg <= _io_seg_T @[DisplayMultiplexer.scala 59:10]
    node _io_an_T = not(select) @[DisplayMultiplexer.scala 60:12]
    io.an <= _io_an_T @[DisplayMultiplexer.scala 60:9]

  module connection :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg : UInt<7>, an : UInt<4>, flip sw : UInt<4>, led : UInt<4>}

    inst SevenSeg of DisplayMultiplexer @[connection.scala 15:26]
    SevenSeg.clock <= clock
    SevenSeg.reset <= reset
    SevenSeg.io.hex <= UInt<13>("h1234") @[connection.scala 17:21]
    io.seg <= SevenSeg.io.seg @[connection.scala 19:12]
    io.an <= SevenSeg.io.an @[connection.scala 20:11]
    io.led <= io.sw @[connection.scala 22:12]

