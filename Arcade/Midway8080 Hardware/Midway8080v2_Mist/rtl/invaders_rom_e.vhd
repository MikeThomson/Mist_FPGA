-- generated with romgen v3.0 by MikeJ
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.std_logic_unsigned.all;
  use ieee.numeric_std.all;

entity INVADERS_ROM_E is
  port (
    CLK         : in    std_logic;
    ENA         : in    std_logic;
    ADDR        : in    std_logic_vector(10 downto 0);
    DATA        : out   std_logic_vector(7 downto 0)
    );
end;

architecture RTL of INVADERS_ROM_E is


  type ROM_ARRAY is array(0 to 2047) of std_logic_vector(7 downto 0);
  constant ROM : ROM_ARRAY := (
    x"20",x"C3",x"C9",x"16",x"21",x"84",x"20",x"7E", -- 0x0000
    x"A7",x"CA",x"07",x"07",x"23",x"7E",x"A7",x"C0", -- 0x0008
    x"06",x"01",x"C3",x"FA",x"18",x"21",x"10",x"28", -- 0x0010
    x"11",x"A3",x"1C",x"0E",x"15",x"CD",x"F3",x"08", -- 0x0018
    x"3E",x"0A",x"32",x"6C",x"20",x"01",x"BE",x"1D", -- 0x0020
    x"CD",x"56",x"18",x"DA",x"37",x"18",x"CD",x"44", -- 0x0028
    x"18",x"C3",x"28",x"18",x"CD",x"B1",x"0A",x"01", -- 0x0030
    x"CF",x"1D",x"CD",x"56",x"18",x"D8",x"CD",x"4C", -- 0x0038
    x"18",x"C3",x"3A",x"18",x"C5",x"06",x"10",x"CD", -- 0x0040
    x"39",x"14",x"C1",x"C9",x"C5",x"3A",x"6C",x"20", -- 0x0048
    x"4F",x"CD",x"93",x"0A",x"C1",x"C9",x"0A",x"FE", -- 0x0050
    x"FF",x"37",x"C8",x"6F",x"03",x"0A",x"67",x"03", -- 0x0058
    x"0A",x"5F",x"03",x"0A",x"57",x"03",x"A7",x"C9", -- 0x0060
    x"21",x"C2",x"20",x"34",x"23",x"4E",x"CD",x"D9", -- 0x0068
    x"01",x"47",x"3A",x"CA",x"20",x"B8",x"CA",x"98", -- 0x0070
    x"18",x"3A",x"C2",x"20",x"E6",x"04",x"2A",x"CC", -- 0x0078
    x"20",x"C2",x"88",x"18",x"11",x"30",x"00",x"19", -- 0x0080
    x"22",x"C7",x"20",x"21",x"C5",x"20",x"CD",x"3B", -- 0x0088
    x"1A",x"EB",x"C3",x"D3",x"15",x"00",x"00",x"00", -- 0x0090
    x"3E",x"01",x"32",x"CB",x"20",x"C9",x"21",x"50", -- 0x0098
    x"20",x"11",x"C0",x"1B",x"06",x"10",x"CD",x"32", -- 0x00A0
    x"1A",x"3E",x"02",x"32",x"80",x"20",x"3E",x"FF", -- 0x00A8
    x"32",x"7E",x"20",x"3E",x"04",x"32",x"C1",x"20", -- 0x00B0
    x"3A",x"55",x"20",x"E6",x"01",x"CA",x"B8",x"18", -- 0x00B8
    x"3A",x"55",x"20",x"E6",x"01",x"C2",x"C0",x"18", -- 0x00C0
    x"21",x"11",x"33",x"3E",x"26",x"00",x"CD",x"FF", -- 0x00C8
    x"08",x"C3",x"B6",x"0A",x"31",x"00",x"24",x"06", -- 0x00D0
    x"00",x"CD",x"E6",x"01",x"CD",x"56",x"19",x"3E", -- 0x00D8
    x"08",x"32",x"CF",x"20",x"C3",x"EA",x"0A",x"3A", -- 0x00E0
    x"67",x"20",x"21",x"E7",x"20",x"0F",x"D0",x"23", -- 0x00E8
    x"C9",x"06",x"02",x"3A",x"82",x"20",x"3D",x"C0", -- 0x00F0
    x"04",x"C9",x"3A",x"94",x"20",x"B0",x"32",x"94", -- 0x00F8
    x"20",x"D3",x"03",x"C9",x"21",x"00",x"22",x"C3", -- 0x0100
    x"C3",x"01",x"CD",x"D8",x"14",x"C3",x"97",x"15", -- 0x0108
    x"21",x"E7",x"20",x"3A",x"67",x"20",x"0F",x"D8", -- 0x0110
    x"23",x"C9",x"0E",x"1C",x"21",x"1E",x"24",x"11", -- 0x0118
    x"E4",x"1A",x"C3",x"F3",x"08",x"21",x"F8",x"20", -- 0x0120
    x"C3",x"31",x"19",x"21",x"FC",x"20",x"C3",x"31", -- 0x0128
    x"19",x"5E",x"23",x"56",x"23",x"7E",x"23",x"66", -- 0x0130
    x"6F",x"C3",x"AD",x"09",x"0E",x"07",x"21",x"01", -- 0x0138
    x"35",x"11",x"A9",x"1F",x"C3",x"F3",x"08",x"3A", -- 0x0140
    x"EB",x"20",x"21",x"01",x"3C",x"C3",x"B2",x"09", -- 0x0148
    x"21",x"F4",x"20",x"C3",x"31",x"19",x"CD",x"5C", -- 0x0150
    x"1A",x"CD",x"1A",x"19",x"CD",x"25",x"19",x"CD", -- 0x0158
    x"2B",x"19",x"CD",x"50",x"19",x"CD",x"3C",x"19", -- 0x0160
    x"C3",x"47",x"19",x"CD",x"DC",x"19",x"C3",x"71", -- 0x0168
    x"16",x"3E",x"01",x"32",x"6D",x"20",x"C3",x"E6", -- 0x0170
    x"16",x"CD",x"D7",x"19",x"CD",x"47",x"19",x"C3", -- 0x0178
    x"3C",x"19",x"32",x"C1",x"20",x"C9",x"8B",x"19", -- 0x0180
    x"C3",x"D6",x"09",x"21",x"03",x"28",x"11",x"BE", -- 0x0188
    x"19",x"0E",x"13",x"C3",x"F3",x"08",x"00",x"00", -- 0x0190
    x"00",x"00",x"3A",x"1E",x"20",x"A7",x"C2",x"AC", -- 0x0198
    x"19",x"DB",x"01",x"E6",x"76",x"D6",x"72",x"C0", -- 0x01A0
    x"3C",x"32",x"1E",x"20",x"DB",x"01",x"E6",x"76", -- 0x01A8
    x"FE",x"34",x"C0",x"21",x"1B",x"2E",x"11",x"F7", -- 0x01B0
    x"0B",x"0E",x"09",x"C3",x"F3",x"08",x"28",x"13", -- 0x01B8
    x"00",x"08",x"13",x"0E",x"26",x"02",x"0E",x"11", -- 0x01C0
    x"0F",x"0E",x"11",x"00",x"13",x"08",x"0E",x"0D", -- 0x01C8
    x"28",x"3E",x"01",x"32",x"E9",x"20",x"C9",x"AF", -- 0x01D0
    x"C3",x"D3",x"19",x"00",x"3A",x"94",x"20",x"A0", -- 0x01D8
    x"32",x"94",x"20",x"D3",x"03",x"C9",x"21",x"01", -- 0x01E0
    x"27",x"CA",x"FA",x"19",x"11",x"60",x"1C",x"06", -- 0x01E8
    x"10",x"4F",x"CD",x"39",x"14",x"79",x"3D",x"C2", -- 0x01F0
    x"EC",x"19",x"06",x"10",x"CD",x"CB",x"14",x"7C", -- 0x01F8
    x"FE",x"35",x"C2",x"FA",x"19",x"C9",x"21",x"72", -- 0x0200
    x"20",x"46",x"1A",x"E6",x"80",x"A8",x"C0",x"37", -- 0x0208
    x"C9",x"32",x"2B",x"24",x"1C",x"16",x"11",x"0D", -- 0x0210
    x"0A",x"08",x"07",x"06",x"05",x"04",x"03",x"02", -- 0x0218
    x"01",x"34",x"2E",x"27",x"22",x"1C",x"18",x"15", -- 0x0220
    x"13",x"10",x"0E",x"0D",x"0C",x"0B",x"09",x"07", -- 0x0228
    x"05",x"FF",x"1A",x"77",x"23",x"13",x"05",x"C2", -- 0x0230
    x"32",x"1A",x"C9",x"5E",x"23",x"56",x"23",x"7E", -- 0x0238
    x"23",x"4E",x"23",x"46",x"61",x"6F",x"C9",x"C5", -- 0x0240
    x"06",x"03",x"7C",x"1F",x"67",x"7D",x"1F",x"6F", -- 0x0248
    x"05",x"C2",x"4A",x"1A",x"7C",x"E6",x"3F",x"F6", -- 0x0250
    x"20",x"67",x"C1",x"C9",x"21",x"00",x"24",x"36", -- 0x0258
    x"00",x"23",x"7C",x"FE",x"40",x"C2",x"5F",x"1A", -- 0x0260
    x"C9",x"C5",x"E5",x"1A",x"B6",x"77",x"13",x"23", -- 0x0268
    x"0D",x"C2",x"6B",x"1A",x"E1",x"01",x"20",x"00", -- 0x0270
    x"09",x"C1",x"05",x"C2",x"69",x"1A",x"C9",x"CD", -- 0x0278
    x"2E",x"09",x"A7",x"C8",x"F5",x"3D",x"77",x"CD", -- 0x0280
    x"E6",x"19",x"F1",x"21",x"01",x"25",x"E6",x"0F", -- 0x0288
    x"C3",x"C5",x"09",x"00",x"00",x"00",x"00",x"FF", -- 0x0290
    x"B8",x"FE",x"20",x"1C",x"10",x"9E",x"00",x"20", -- 0x0298
    x"1C",x"30",x"10",x"0B",x"08",x"07",x"06",x"00", -- 0x02A0
    x"0C",x"04",x"26",x"0E",x"15",x"04",x"11",x"26", -- 0x02A8
    x"26",x"0F",x"0B",x"00",x"18",x"04",x"11",x"24", -- 0x02B0
    x"26",x"25",x"1B",x"26",x"0E",x"11",x"26",x"1C", -- 0x02B8
    x"0F",x"0B",x"00",x"18",x"04",x"11",x"12",x"26", -- 0x02C0
    x"01",x"14",x"13",x"13",x"0E",x"0D",x"26",x"0E", -- 0x02C8
    x"0D",x"0B",x"18",x"26",x"1B",x"0F",x"0B",x"00", -- 0x02D0
    x"18",x"04",x"11",x"26",x"26",x"01",x"14",x"13", -- 0x02D8
    x"13",x"0E",x"0D",x"26",x"26",x"12",x"02",x"0E", -- 0x02E0
    x"11",x"04",x"24",x"1B",x"25",x"26",x"07",x"08", -- 0x02E8
    x"3F",x"12",x"02",x"0E",x"11",x"04",x"26",x"12", -- 0x02F0
    x"02",x"0E",x"11",x"04",x"24",x"1C",x"25",x"26", -- 0x02F8
    x"01",x"00",x"00",x"10",x"00",x"00",x"00",x"00", -- 0x0300
    x"02",x"78",x"38",x"78",x"38",x"00",x"F8",x"00", -- 0x0308
    x"00",x"80",x"00",x"8E",x"02",x"FF",x"05",x"0C", -- 0x0310
    x"60",x"1C",x"20",x"30",x"10",x"01",x"00",x"00", -- 0x0318
    x"00",x"00",x"00",x"BB",x"03",x"00",x"10",x"90", -- 0x0320
    x"1C",x"28",x"30",x"01",x"04",x"00",x"FF",x"FF", -- 0x0328
    x"00",x"00",x"02",x"76",x"04",x"00",x"00",x"00", -- 0x0330
    x"00",x"00",x"04",x"EE",x"1C",x"00",x"00",x"03", -- 0x0338
    x"00",x"00",x"00",x"B6",x"04",x"00",x"00",x"01", -- 0x0340
    x"00",x"1D",x"04",x"E2",x"1C",x"00",x"00",x"03", -- 0x0348
    x"00",x"00",x"00",x"82",x"06",x"00",x"00",x"01", -- 0x0350
    x"06",x"1D",x"04",x"D0",x"1C",x"00",x"00",x"03", -- 0x0358
    x"FF",x"00",x"C0",x"1C",x"00",x"00",x"10",x"21", -- 0x0360
    x"01",x"00",x"30",x"00",x"12",x"00",x"00",x"00", -- 0x0368
    x"0F",x"0B",x"00",x"18",x"26",x"0F",x"0B",x"00", -- 0x0370
    x"18",x"04",x"11",x"24",x"1B",x"25",x"FC",x"00", -- 0x0378
    x"01",x"FF",x"FF",x"00",x"00",x"00",x"20",x"64", -- 0x0380
    x"1D",x"D0",x"29",x"18",x"02",x"54",x"1D",x"00", -- 0x0388
    x"08",x"00",x"06",x"00",x"00",x"01",x"40",x"00", -- 0x0390
    x"01",x"00",x"00",x"10",x"9E",x"00",x"20",x"1C", -- 0x0398
    x"00",x"03",x"04",x"78",x"14",x"13",x"08",x"1A", -- 0x03A0
    x"3D",x"68",x"FC",x"FC",x"68",x"3D",x"1A",x"00", -- 0x03A8
    x"00",x"00",x"01",x"B8",x"98",x"A0",x"1B",x"10", -- 0x03B0
    x"FF",x"00",x"A0",x"1B",x"00",x"00",x"00",x"00", -- 0x03B8
    x"00",x"10",x"00",x"0E",x"05",x"00",x"00",x"00", -- 0x03C0
    x"00",x"00",x"07",x"D0",x"1C",x"C8",x"9B",x"03", -- 0x03C8
    x"00",x"00",x"03",x"04",x"78",x"14",x"0B",x"19", -- 0x03D0
    x"3A",x"6D",x"FA",x"FA",x"6D",x"3A",x"19",x"00", -- 0x03D8
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x03E0
    x"00",x"01",x"00",x"00",x"01",x"74",x"1F",x"00", -- 0x03E8
    x"80",x"00",x"00",x"00",x"00",x"00",x"1C",x"2F", -- 0x03F0
    x"00",x"00",x"1C",x"27",x"00",x"00",x"1C",x"39", -- 0x03F8
    x"00",x"00",x"39",x"79",x"7A",x"6E",x"EC",x"FA", -- 0x0400
    x"FA",x"EC",x"6E",x"7A",x"79",x"39",x"00",x"00", -- 0x0408
    x"00",x"00",x"00",x"78",x"1D",x"BE",x"6C",x"3C", -- 0x0410
    x"3C",x"3C",x"6C",x"BE",x"1D",x"78",x"00",x"00", -- 0x0418
    x"00",x"00",x"00",x"00",x"19",x"3A",x"6D",x"FA", -- 0x0420
    x"FA",x"6D",x"3A",x"19",x"00",x"00",x"00",x"00", -- 0x0428
    x"00",x"00",x"38",x"7A",x"7F",x"6D",x"EC",x"FA", -- 0x0430
    x"FA",x"EC",x"6D",x"7F",x"7A",x"38",x"00",x"00", -- 0x0438
    x"00",x"00",x"00",x"0E",x"18",x"BE",x"6D",x"3D", -- 0x0440
    x"3C",x"3D",x"6D",x"BE",x"18",x"0E",x"00",x"00", -- 0x0448
    x"00",x"00",x"00",x"00",x"1A",x"3D",x"68",x"FC", -- 0x0450
    x"FC",x"68",x"3D",x"1A",x"00",x"00",x"00",x"00", -- 0x0458
    x"00",x"00",x"0F",x"1F",x"1F",x"1F",x"1F",x"7F", -- 0x0460
    x"FF",x"7F",x"1F",x"1F",x"1F",x"1F",x"0F",x"00", -- 0x0468
    x"00",x"04",x"01",x"13",x"03",x"07",x"B3",x"0F", -- 0x0470
    x"2F",x"03",x"2F",x"49",x"04",x"03",x"00",x"01", -- 0x0478
    x"40",x"08",x"05",x"A3",x"0A",x"03",x"5B",x"0F", -- 0x0480
    x"27",x"27",x"0B",x"4B",x"40",x"84",x"11",x"48", -- 0x0488
    x"0F",x"99",x"3C",x"7E",x"3D",x"BC",x"3E",x"7C", -- 0x0490
    x"99",x"27",x"1B",x"1A",x"26",x"0F",x"0E",x"08", -- 0x0498
    x"0D",x"13",x"12",x"28",x"12",x"02",x"0E",x"11", -- 0x04A0
    x"04",x"26",x"00",x"03",x"15",x"00",x"0D",x"02", -- 0x04A8
    x"04",x"26",x"13",x"00",x"01",x"0B",x"04",x"28", -- 0x04B0
    x"02",x"10",x"20",x"30",x"13",x"08",x"0B",x"13", -- 0x04B8
    x"00",x"08",x"49",x"22",x"14",x"81",x"42",x"00", -- 0x04C0
    x"42",x"81",x"14",x"22",x"49",x"08",x"00",x"00", -- 0x04C8
    x"44",x"AA",x"10",x"88",x"54",x"22",x"10",x"AA", -- 0x04D0
    x"44",x"22",x"54",x"88",x"4A",x"15",x"BE",x"3F", -- 0x04D8
    x"5E",x"25",x"04",x"FC",x"04",x"10",x"FC",x"10", -- 0x04E0
    x"20",x"FC",x"20",x"80",x"FC",x"80",x"00",x"FE", -- 0x04E8
    x"00",x"24",x"FE",x"12",x"00",x"FE",x"00",x"48", -- 0x04F0
    x"FE",x"90",x"0F",x"0B",x"00",x"29",x"00",x"00", -- 0x04F8
    x"01",x"07",x"01",x"01",x"01",x"04",x"0B",x"01", -- 0x0500
    x"06",x"03",x"01",x"01",x"0B",x"09",x"02",x"08", -- 0x0508
    x"02",x"0B",x"04",x"07",x"0A",x"05",x"02",x"05", -- 0x0510
    x"04",x"06",x"07",x"08",x"0A",x"06",x"0A",x"03", -- 0x0518
    x"FF",x"0F",x"FF",x"1F",x"FF",x"3F",x"FF",x"7F", -- 0x0520
    x"FF",x"FF",x"FC",x"FF",x"F8",x"FF",x"F0",x"FF", -- 0x0528
    x"F0",x"FF",x"F0",x"FF",x"F0",x"FF",x"F0",x"FF", -- 0x0530
    x"F0",x"FF",x"F0",x"FF",x"F8",x"FF",x"FC",x"FF", -- 0x0538
    x"FF",x"FF",x"FF",x"FF",x"FF",x"7F",x"FF",x"3F", -- 0x0540
    x"FF",x"1F",x"FF",x"0F",x"05",x"10",x"15",x"30", -- 0x0548
    x"94",x"97",x"9A",x"9D",x"10",x"05",x"05",x"10", -- 0x0550
    x"15",x"10",x"10",x"05",x"30",x"10",x"10",x"10", -- 0x0558
    x"05",x"15",x"10",x"05",x"00",x"00",x"00",x"00", -- 0x0560
    x"04",x"0C",x"1E",x"37",x"3E",x"7C",x"74",x"7E", -- 0x0568
    x"7E",x"74",x"7C",x"3E",x"37",x"1E",x"0C",x"04", -- 0x0570
    x"00",x"00",x"00",x"00",x"00",x"22",x"00",x"A5", -- 0x0578
    x"40",x"08",x"98",x"3D",x"B6",x"3C",x"36",x"1D", -- 0x0580
    x"10",x"48",x"62",x"B6",x"1D",x"98",x"08",x"42", -- 0x0588
    x"90",x"08",x"00",x"00",x"26",x"1F",x"1A",x"1B", -- 0x0590
    x"1A",x"1A",x"1B",x"1F",x"1A",x"1D",x"1A",x"1A", -- 0x0598
    x"10",x"20",x"30",x"60",x"50",x"48",x"48",x"48", -- 0x05A0
    x"40",x"40",x"40",x"0F",x"0B",x"00",x"18",x"12", -- 0x05A8
    x"0F",x"00",x"02",x"04",x"26",x"26",x"08",x"0D", -- 0x05B0
    x"15",x"00",x"03",x"04",x"11",x"12",x"0E",x"2C", -- 0x05B8
    x"68",x"1D",x"0C",x"2C",x"20",x"1C",x"0A",x"2C", -- 0x05C0
    x"40",x"1C",x"08",x"2C",x"00",x"1C",x"FF",x"0E", -- 0x05C8
    x"2E",x"E0",x"1D",x"0C",x"2E",x"EA",x"1D",x"0A", -- 0x05D0
    x"2E",x"F4",x"1D",x"08",x"2E",x"99",x"1C",x"FF", -- 0x05D8
    x"27",x"38",x"26",x"0C",x"18",x"12",x"13",x"04", -- 0x05E0
    x"11",x"18",x"27",x"1D",x"1A",x"26",x"0F",x"0E", -- 0x05E8
    x"08",x"0D",x"13",x"12",x"27",x"1C",x"1A",x"26", -- 0x05F0
    x"0F",x"0E",x"08",x"0D",x"13",x"12",x"00",x"00", -- 0x05F8
    x"00",x"1F",x"24",x"44",x"24",x"1F",x"00",x"00", -- 0x0600
    x"00",x"7F",x"49",x"49",x"49",x"36",x"00",x"00", -- 0x0608
    x"00",x"3E",x"41",x"41",x"41",x"22",x"00",x"00", -- 0x0610
    x"00",x"7F",x"41",x"41",x"41",x"3E",x"00",x"00", -- 0x0618
    x"00",x"7F",x"49",x"49",x"49",x"41",x"00",x"00", -- 0x0620
    x"00",x"7F",x"48",x"48",x"48",x"40",x"00",x"00", -- 0x0628
    x"00",x"3E",x"41",x"41",x"45",x"47",x"00",x"00", -- 0x0630
    x"00",x"7F",x"08",x"08",x"08",x"7F",x"00",x"00", -- 0x0638
    x"00",x"00",x"41",x"7F",x"41",x"00",x"00",x"00", -- 0x0640
    x"00",x"02",x"01",x"01",x"01",x"7E",x"00",x"00", -- 0x0648
    x"00",x"7F",x"08",x"14",x"22",x"41",x"00",x"00", -- 0x0650
    x"00",x"7F",x"01",x"01",x"01",x"01",x"00",x"00", -- 0x0658
    x"00",x"7F",x"20",x"18",x"20",x"7F",x"00",x"00", -- 0x0660
    x"00",x"7F",x"10",x"08",x"04",x"7F",x"00",x"00", -- 0x0668
    x"00",x"3E",x"41",x"41",x"41",x"3E",x"00",x"00", -- 0x0670
    x"00",x"7F",x"48",x"48",x"48",x"30",x"00",x"00", -- 0x0678
    x"00",x"3E",x"41",x"45",x"42",x"3D",x"00",x"00", -- 0x0680
    x"00",x"7F",x"48",x"4C",x"4A",x"31",x"00",x"00", -- 0x0688
    x"00",x"32",x"49",x"49",x"49",x"26",x"00",x"00", -- 0x0690
    x"00",x"40",x"40",x"7F",x"40",x"40",x"00",x"00", -- 0x0698
    x"00",x"7E",x"01",x"01",x"01",x"7E",x"00",x"00", -- 0x06A0
    x"00",x"7C",x"02",x"01",x"02",x"7C",x"00",x"00", -- 0x06A8
    x"00",x"7F",x"02",x"0C",x"02",x"7F",x"00",x"00", -- 0x06B0
    x"00",x"63",x"14",x"08",x"14",x"63",x"00",x"00", -- 0x06B8
    x"00",x"60",x"10",x"0F",x"10",x"60",x"00",x"00", -- 0x06C0
    x"00",x"43",x"45",x"49",x"51",x"61",x"00",x"00", -- 0x06C8
    x"00",x"3E",x"45",x"49",x"51",x"3E",x"00",x"00", -- 0x06D0
    x"00",x"00",x"21",x"7F",x"01",x"00",x"00",x"00", -- 0x06D8
    x"00",x"23",x"45",x"49",x"49",x"31",x"00",x"00", -- 0x06E0
    x"00",x"42",x"41",x"49",x"59",x"66",x"00",x"00", -- 0x06E8
    x"00",x"0C",x"14",x"24",x"7F",x"04",x"00",x"00", -- 0x06F0
    x"00",x"72",x"51",x"51",x"51",x"4E",x"00",x"00", -- 0x06F8
    x"00",x"1E",x"29",x"49",x"49",x"46",x"00",x"00", -- 0x0700
    x"00",x"40",x"47",x"48",x"50",x"60",x"00",x"00", -- 0x0708
    x"00",x"36",x"49",x"49",x"49",x"36",x"00",x"00", -- 0x0710
    x"00",x"31",x"49",x"49",x"4A",x"3C",x"00",x"00", -- 0x0718
    x"00",x"08",x"14",x"22",x"41",x"00",x"00",x"00", -- 0x0720
    x"00",x"00",x"41",x"22",x"14",x"08",x"00",x"00", -- 0x0728
    x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00", -- 0x0730
    x"00",x"14",x"14",x"14",x"14",x"14",x"00",x"00", -- 0x0738
    x"00",x"22",x"14",x"7F",x"14",x"22",x"00",x"00", -- 0x0740
    x"00",x"03",x"04",x"78",x"04",x"03",x"00",x"00", -- 0x0748
    x"24",x"1B",x"26",x"0E",x"11",x"26",x"1C",x"26", -- 0x0750
    x"0F",x"0B",x"00",x"18",x"04",x"11",x"12",x"25", -- 0x0758
    x"26",x"26",x"28",x"1B",x"26",x"0F",x"0B",x"00", -- 0x0760
    x"18",x"04",x"11",x"26",x"26",x"1B",x"26",x"02", -- 0x0768
    x"0E",x"08",x"0D",x"26",x"01",x"01",x"00",x"00", -- 0x0770
    x"01",x"00",x"02",x"01",x"00",x"02",x"01",x"00", -- 0x0778
    x"60",x"10",x"0F",x"10",x"60",x"30",x"18",x"1A", -- 0x0780
    x"3D",x"68",x"FC",x"FC",x"68",x"3D",x"1A",x"00", -- 0x0788
    x"08",x"0D",x"12",x"04",x"11",x"13",x"26",x"26", -- 0x0790
    x"02",x"0E",x"08",x"0D",x"0D",x"2A",x"50",x"1F", -- 0x0798
    x"0A",x"2A",x"62",x"1F",x"07",x"2A",x"E1",x"1F", -- 0x07A0
    x"FF",x"02",x"11",x"04",x"03",x"08",x"13",x"26", -- 0x07A8
    x"00",x"60",x"10",x"0F",x"10",x"60",x"38",x"19", -- 0x07B0
    x"3A",x"6D",x"FA",x"FA",x"6D",x"3A",x"19",x"00", -- 0x07B8
    x"00",x"20",x"40",x"4D",x"50",x"20",x"00",x"00", -- 0x07C0
    x"00",x"00",x"00",x"FF",x"B8",x"FF",x"80",x"1F", -- 0x07C8
    x"10",x"97",x"00",x"80",x"1F",x"00",x"00",x"01", -- 0x07D0
    x"D0",x"22",x"20",x"1C",x"10",x"94",x"00",x"20", -- 0x07D8
    x"1C",x"28",x"1C",x"26",x"0F",x"0B",x"00",x"18", -- 0x07E0
    x"04",x"11",x"12",x"26",x"1C",x"26",x"02",x"0E", -- 0x07E8
    x"08",x"0D",x"12",x"0F",x"14",x"12",x"07",x"26", -- 0x07F0
    x"00",x"08",x"08",x"08",x"08",x"08",x"00",x"00"  -- 0x07F8
  );

begin

  p_rom : process
  begin
    wait until rising_edge(CLK);
    if (ENA = '1') then
       DATA <= ROM(to_integer(unsigned(ADDR)));
    end if;
  end process;
end RTL;
