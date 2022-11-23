**VLSI Design Middle project**

.inc "D:\1111\VLSI_Design\ptm90.l"
.global vdd gnd

$ circuit describe

$$ main-circuit describe

$ clk div by 3


$ clk div by 6


$ clk div by 8


$ test input buffer
Xinv vclk vclk_in input_buffer


$ voltage soure and other setting
vdd  vdd gnd DC 1V
vclk vclk gnd pulse( 0 1  0n 0.01n 0.01n 0.1n  0.2n)

$ inverter module 
.subckt inv in out
	Mp1 out in vdd vdd pmos w=0.6u l=0.09u
	Mn1 out in gnd gnd nmos w=0.2u l=0.09u
.ends

$ input-buffer module
.subckt input_buffer in out
	Xinv1   in net1 inv
	Xinv2 net1 net2 inv
	Xinv3 net2 net3 inv
	Xinv4 net3 net4 inv
	Xinv5 net4 net5 inv
	Xinv6 net5 net6 inv
	Xinv7 net6 net7 inv
	Xinv8 net7  out inv
.ends input_buffer

$ transmission gate module
.subckt tran_gate in out en_p en_n
	Mp out en_p  in  vdd pmos W=0.6u L=0.09u
	Mn in  en_n out  gnd nmos W=0.2u L=0.09u
	
	Xinv en en_b vdd gnd inv
.ends

.tran 0.01ns 6ns
.option post

.probe v1(vclk_in)

.end

**end**
