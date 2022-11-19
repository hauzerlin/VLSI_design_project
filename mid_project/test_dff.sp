**Test dff**


.inc "D:\1111\VLSI_Design\ptm90.l"
.global vdd gnd

Xtest vtest vclk vout1 vout2 dff

vdd vdd gnd DC 1v
vclk vclk gnd pulse (0 1 0.5n 0.1n 0.1n 2n 4n)
vtest vtest gnd pulse (0 1 0 0.1n 0.1n 4n 8n)

$ inverter module 
.subckt inv in out
	Mp1 out in vdd vdd pmos w=0.6u l=0.09u
	Mn1 out in gnd gnd nmos w=0.2u l=0.09u
.ends

.subckt dff in clk out inv_out
	Mp1 node1    in   vdd vdd pmos w=0.6u l=0.09u
	Mp2 nodeA   clk node1 vdd pmos w=0.6u l=0.09u
	Mn1 nodeA    in   gnd gnd nmos w=0.2u l=0.09u

	Mp3 nodeB   clk   vdd vdd pmos w=0.6u l=0.09u
	Mn2 nodeB nodeA node2 gnd nmos w=0.2u l=0.09u
	Mn3 node2   clk   gnd gnd nmos w=0.2u l=0.09u

	Mp4 inv_out nodeB vdd vdd pmos w=0.6u l=0.09u
	Mn4 inv_out clk node3 gnd nmos w=0.2u l=0.09u
	Mn5   node3 nodeB gnd gnd nmos w=0.2u l=0.09u

	Xinv inv_out out inv
.ends

.tran 0.1ns 26ns
.option post

.probe v1(vout1)
.probe v2(vout2)

.end

