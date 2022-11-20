*** VLSI Design Middle project ***

.inc  "D:\1111\VLSI_Design\ptm90.l"

.global vdd vss

$$ main-circuit describe

$ clk div by 3


$ clk div by 6


$ clk div by 8


$ test input buffer
Xin_buff  vclk vin input_buffer

$$ voltage source and other setting

vdd   vdd   vss  DC 1V
vclk vclk vss  pulse(0 1 0n 0.01n 0.01n 0.1n 0.2n)


.temp 40
.option post
.tran 0.1ns 2ns



$$ sub-circuit describe 

$ inverter module
.subckt inv in out
	Mp1 out in vdd vdd pmos w=0.5u l=0.09u
	Mn1 out in vss vss nmos w=0.2u l=0.09u
.ends inv

$ transmission gate module
.subckt TG in out en
	Mp out en   in vdd pmos w=0.5u l=0.09u
	Mn out en_b out vss nmos w=0.2u l=0.09u
	Xinv en en_b inv
.ends TG

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


.probe v1(vin)
.end

**end**
