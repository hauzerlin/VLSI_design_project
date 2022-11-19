**VLSI Design Middle project**

.inc "D:\1111\VLSI_Design\ptm90.l"
.global vdd gnd

$ circuit describe

$$ main-circuit describe


$ test input buffer
Xinv vclk vclk_in input_buffer

$ clk div by 3

$ .subckt dff in clk out inv_out
Xdff1 node_nor vclk VQ1 VQ1_bar dff
Xdff2 VQ1      vclk VQ2 VQ2_bar dff

Xnor1 VQ1 VQ2 node_nor nor
Xnor2 vclk_in vclk_in node1 nor

Xinv1 VQ1 node_1 inv
Xinv2 node_1 node_vq1 inv

Xnor3 node1 VQ2_bar node2 nor
Xnor4 node2 node_vq1 node3 nor
$Xnor4 node2 node_1 node3 nor

$Xnor4 node2 VQ1 node3 nor

Xtap_buff3 node3 vout3 tap_buffer3
Cbuf3 vout3 gnd 50f

$ clk div by 6


$ clk div by 8



$ voltage soure and other setting
vdd  vdd gnd DC 1V
vclk vclk gnd pulse(0 1  0n 0.001n 0.001n 0.1n  0.2n)

$ inverter module 
.subckt inv in out
	Mp1 out in vdd vdd pmos w=0.5u l=0.09u
	Mn1 out in gnd gnd nmos w=0.2u l=0.09u
.ends inv

$ AND module
.subckt and xin yin out
	Xnand  xin yin node1 nand
	Xinv node1 out inv
.ends and

$ OR module
.subckt or xin yin out
	XNOR xin yin node1 nor
	Xinv node1 out inv
.ends or

$ NAND module
.subckt nand vin_x vin_y out
	MP_x  out vin_x vdd vdd pmos W=0.5u L=0.09u
	MP_y  out vin_y vdd vdd pmos W=0.5u L=0.09u

	MN_x  out vin_x net1  gnd  nmos W=0.2u L=0.09u
	MN_y net1 vin_y  gnd  gnd  nmos W=0.2u L=0.09u
.ends nand

$ NOR module
.subckt nor vin_x vin_y out 
	MP_x net1 vin_x  vdd  vdd pmos W=0.5u L=0.09u
	MP_y  out vin_y net1  vdd pmos W=0.5u L=0.09u

	MN_x  out vin_x  gnd  gnd nmos W=0.2u L=0.09u
	MN_y  out vin_y  gnd  gnd nmos W=0.2u L=0.09u
.ends nor

$ dff module
.subckt dff in clk out inv_out
	Mp1 node1    in   vdd vdd pmos w=0.5u l=0.09u
	Mp2 nodeA   clk node1 vdd pmos w=0.5u l=0.09u
	Mn1 nodeA    in   gnd gnd nmos w=0.2u l=0.09u

	Mp3 nodeB   clk   vdd vdd pmos w=0.5u l=0.09u
	Mn2 nodeB nodeA node2 gnd nmos w=0.2u l=0.09u
	Mn3 node2   clk   gnd gnd nmos w=0.2u l=0.09u

	Mp4 inv_out nodeB vdd vdd pmos w=0.5u l=0.09u
	Mn4 inv_out clk node3 gnd nmos w=0.2u l=0.09u
	Mn5   node3 nodeB gnd gnd nmos w=0.2u l=0.09u

	Xinv inv_out out inv
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

$ tapper-buffer module(div by 3)
.subckt tap_buffer3 in out
	$Xinv_3 in net1 inv
	$Mp1 net2 net1 vdd vdd pmos w= 1.6309u l=0.09u
	$Mn1 net2 net1 gnd gnd nmos w= 0.5437u l=0.09u
	Mp1 net2 in vdd vdd pmos w= 1.6309u l=0.09u
	Mn1 net2 in gnd gnd nmos w= 0.5437u l=0.09u
	Mp2 net3 net2 vdd vdd pmos w= 4.4334u l=0.09u
	Mn2 net3 net2 gnd gnd nmos w= 1.4778u l=0.09u
	Mp3 out net3 vdd vdd pmos w=12.0513u l=0.09u
	Mn3 out net3 gnd gnd nmos w= 4.0171u l=0.09u	
	$Mp4  net5 net4 vdd vdd pmos w=32.7589u l=0.09u
	$Mn4  net5 net4 gnd gnd nmos w=10.9196u l=0.09u
	$Mp5  out net5 vdd vdd pmos w=89.0479u l=0.09u
	$Mn5  out net5 gnd gnd nmos w=29.6826u l=0.09u
	$Mp6  out net6 vdd vdd pmos w=242.0573u l=0.09u
	$Mn6  out net6 gnd gnd nmos w=80.6828 l=0.09u
.ends tap_buffer3

$ 測量 divider_3 的 falling time、rising time、high level、low level
$.measure tran fall_time_A  trig V(outA) VAL=0.9   cross=3  targ V(outA) val=0.1  cross=3
$.measure tran rising_time_A  trig V(outA) VAL=0.1  cross=2  targ V(outA) val=0.9 cross=2
$.measure tran high_level_A  trig V(outA) VAL=0.9   cross=3  targ V(outA) val=0.9  cross=4
$.measure tran low_level_A  trig V(outA) VAL=0.1   cross=2  targ V(outA) val=0.1  cross=3
$.measure tran period_A trig V(outA) VAL=0.5  cross=2 targ V(outA) val=0.5 cross=4
$.measure tran freqA param='1/period_a'
$.measure tran DutyCycle_A param ='high_level_A/period_A'

$ transmission gate module
.subckt tran_gate in out en_p en_n
	Mp out en_p  in  vdd pmos W=0.5u L=0.09u
	Mn in  en_n out  gnd nmos W=0.2u L=0.09u
	
	Xinv en en_b vdd gnd inv
.ends

.tran 0.001ns 2ns
.option post

.probe v1(vout3)
.probe v2(VQ2)
.end

**end**
