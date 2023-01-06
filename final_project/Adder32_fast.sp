*** Adder32 using static Manchester Carry Adder ***

.inc "../ptm90.l"

.global vdd gnd

.option post
$.temp 40
.tran 0.1ns 3ns
.print v2(s31)
.print v3 (c30)
.probe v1(s0)

vvdd vdd gnd dc 1v
Va0 a0 gnd pwl 0ns 0v 0.05ns 0v 0.1ns 1v
$Va0 a0 gnd dc 0v
Va1 a1 gnd dc 0v
Va2 a2 gnd dc 0v
Va3 a3 gnd dc 0v
Va4 a4 gnd dc 0v
Va5 a5 gnd dc 0v
Va6 a6 gnd dc 0v
Va7 a7 gnd dc 0v
Va8 a8 gnd dc 0v
Va9 a9 gnd dc 0v
Va10 a10 gnd dc 0v
Va11 a11 gnd dc 0v
Va12 a12 gnd dc 0v
Va13 a13 gnd dc 0v
Va14 a14 gnd dc 0v
Va15 a15 gnd dc 0v
Va16 a16 gnd dc 0v
Va17 a17 gnd dc 0v
Va18 a18 gnd dc 0v
Va19 a19 gnd dc 0v
Va20 a20 gnd dc 0v
Va21 a21 gnd dc 0v
Va22 a22 gnd dc 0v
Va23 a23 gnd dc 0v
Va24 a24 gnd dc 0v
Va25 a25 gnd dc 0v
Va26 a26 gnd dc 0v
Va27 a27 gnd dc 0v
Va28 a28 gnd dc 0v
Va29 a29 gnd dc 0v
Va30 a30 gnd dc 0v
Va31 a31 gnd dc 0v

Vb0 b0 gnd dc 1v
Vb1 b1 gnd dc 1v
Vb2 b2 gnd dc 1v
Vb3 b3 gnd dc 1v
Vb4 b4 gnd dc 1v
Vb5 b5 gnd dc 1v
Vb6 b6 gnd dc 1v
Vb7 b7 gnd dc 1v
Vb8 b8 gnd dc 1v
Vb9 b9 gnd dc 1v
Vb10 b10 gnd dc 1v
Vb11 b11 gnd dc 1v
Vb12 b12 gnd dc 1v
Vb13 b13 gnd dc 1v
Vb14 b14 gnd dc 1v
Vb15 b15 gnd dc 1v
Vb16 b16 gnd dc 1v
Vb17 b17 gnd dc 1v
Vb18 b18 gnd dc 1v
Vb19 b19 gnd dc 1v
Vb20 b20 gnd dc 1v
Vb21 b21 gnd dc 1v
Vb22 b22 gnd dc 1v
Vb23 b23 gnd dc 1v
Vb24 b24 gnd dc 1v
Vb25 b25 gnd dc 1v
Vb26 b26 gnd dc 1v
Vb27 b27 gnd dc 1v
Vb28 b28 gnd dc 1v
Vb29 b29 gnd dc 1v
Vb30 b30 gnd dc 1v
Vb31 b31 gnd dc 0v

XADD   a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 
	  + a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31
	  + b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16
	  + b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31
	  + s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 
	  + s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 
	  +	c0 c1 c2 c3    
	  +	c4 c5 c6 c7    
	  +	c8 c9 c10 c11  
	  +	c12 c13 c14 c15
	  +	c16 c17 c18 c19
	  +	c20 c21 c22 c23
	  +	c24 c25 c26 c27
	  +	c28 c29 c30 c31 ADD
$
.meas tran T1 when V(a0)=0.5 rise =1
.meas tran T2 when V(s31)=0.5 rise=1
.meas Td param="T2-T1"
.meas tran power avg p(XADD) from T1 to T2

.subckt ADD     a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 
			  + a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31
			  + b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16
			  + b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31
			  + s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 
			  + s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 
			  +	c0 c1 c2 c3    
			  +	c4 c5 c6 c7    
			  +	c8 c9 c10 c11  
			  +	c12 c13 c14 c15
			  +	c16 c17 c18 c19
			  +	c20 c21 c22 c23
			  +	c24 c25 c26 c27
			  +	c28 c29 c30 c31
			
$Xcell4_1 gnd p0 p1 p2 p3 g0 g1 g2 g3 		  c0 c1 c2 c3      manchester_static_4bit
$Xcell4_2 c3 p4 p5 p6 p7 g4 g5 g6 g7 		  c4 c5 c6 c7      manchester_static_4bit
$Xcell4_3 c7 p8 p9 p10 p11 g8 g9 g10 g11	  c8 c9 c10 c11    manchester_static_4bit
$Xcell4_4 c11 p12 p13 p14 p15 g12 g13 g14 g15 c12 c13 c14 c15 manchester_static_4bit
$Xcell4_5 c15 p16 p17 p18 p19 g16 g17 g18 g19 c16 c17 c18 c19 manchester_static_4bit
$Xcell4_6 c19 p20 p21 p22 p23 g20 g21 g22 g23 c20 c21 c22 c23 manchester_static_4bit
$Xcell4_7 c23 p24 p25 p26 p27 g24 g25 g26 g27 c24 c25 c26 c27 manchester_static_4bit
$Xcell4_8 c27 p28 p29 p30 p31 g28 g29 g30 g31 c28 c29 c30 c31 manchester_static_4bit

$Xcell4_1 gnd p0 p1 p2 p3 g0 g1 g2 g3 c0 c1 c2 c3 manchester_static_4bit_1
$Xcell4_2 c3 p4 p5 p6 p7 g4 g5 g6 g7 c4 c5 c6 c7 manchester_static_4bit_1
$Xcell4_3 c7 p8 p9 p10 p11 g8 g9 g10 g11 c8 c9 c10 c11 manchester_static_4bit_1
$Xcell4_4 c11 p12 p13 p14 p15 g12 g13 g14 g15 c12 c13 c14 c15 manchester_static_4bit_1
$Xcell4_5 c15 p16 p17 p18 p19 g16 g17 g18 g19 c16 c17 c18 c19 manchester_static_4bit_1
$Xcell4_6 c19 p20 p21 p22 p23 g20 g21 g22 g23 c20 c21 c22 c23 manchester_static_4bit_1
$Xcell4_7 c23 p24 p25 p26 p27 g24 g25 g26 g27 c24 c25 c26 c27 manchester_static_4bit_1
$Xcell4_8 c27 p28 p29 p30 p31 g28 g29 g30 g31 c28 c29 c30 c31 manchester_static_4bit_1


$Xcell4_1 gnd p0 p1 p2 p3 g0 g1 g2 g3 c0 c1 c2 c3 manchester_static_Fast_carry_4bits
$Xcell4_2 c3 p4 p5 p6 p7 g4 g5 g6 g7 c4 c5 c6 c7 manchester_static_Fast_carry_4bits
$Xcell4_3 c7 p8 p9 p10 p11 g8 g9 g10 g11 c8 c9 c10 c11 manchester_static_Fast_carry_4bits
$Xcell4_4 c11 p12 p13 p14 p15 g12 g13 g14 g15 c12 c13 c14 c15  manchester_static_Fast_carry_4bits
$Xcell4_5 c15 p16 p17 p18 p19 g16 g17 g18 g19 c16 c17 c18 c19  manchester_static_Fast_carry_4bits
$Xcell4_6 c19 p20 p21 p22 p23 g20 g21 g22 g23 c20 c21 c22 c23  manchester_static_Fast_carry_4bits
$Xcell4_7 c23 p24 p25 p26 p27 g24 g25 g26 g27 c24 c25 c26 c27  manchester_static_Fast_carry_4bits
$Xcell4_8 c27 p28 p29 p30 p31 g28 g29 g30 g31 c28 c29 c30 c31  manchester_static_Fast_carry_4bits


$Xcell4_1 gnd p0 p1 p2 p3 g0 g1 g2 g3 c0 c1 c2 c3 manchester_static_Fast_carry_4bits
$Xcell4_2 c3 p4 p5 p6 p7 g4 g5 g6 g7 c4 c5 c6 c7 manchester_static_Fast_carry_4bits

$Xcell4_3 c7 p8 p9 p10 p11 g8 g9 g10 g11 c8 c9 c10 c11 manchester_static_Fast_carry_4bits
$Xcell4_4 c11 p12 p13 p14 p15 g12 g13 g14 g15 c12 c13 c14 c15 manchester_static_Fast_carry_4bits

$Xcell4_5 c15 p16 p17 p18 p19 g16 g17 g18 g19 c16 c17 c18 c19 manchester_static_Fast_carry_4bits
$Xcell4_6 c19 p20 p21 p22 p23 g20 g21 g22 g23 c20 c21 c22 c23 manchester_static_Fast_carry_4bits

$Xcell4_7 c23 p24 p25 p26 p27 g24 g25 g26 g27 c24 c25 c26 c27 manchester_static_Fast_carry_4bits
$Xcell4_8 c27 p28 p29 p30 p31 g28 g29 g30 g31 c28 c29 c30 c31 manchester_static_Fast_carry_4bits

$.subckt manchester_static_Fast_carry_8bits c0  c1 c2 c3 c4 c5 c6 c7 c8 p1 p2 p3 p4 p5 p6 p7 p8 g1 g2 g3 g4 g5 g6 g7 g8  
Xcell8_1 gnd   c0 c1 c2 c3 c4 c5 c6 c7  	   p0  p1  p2  p3  p4  p5  p6  p7  g0  g1  g2  g3  g4  g5  g6  g7 manchester_static_Fast_carry_8bits
Xcell8_2 c7    c8  c9 c10 c11 c12 c13 c14 c15  p8  p9 p10 p11 p12 p13 p14 p15 g16 g17 g18 g19 g12 g13 g14 g15 manchester_static_Fast_carry_8bits
Xcell8_3 c15  c16 c17 c18 c19 c20 c21 c22 c23 p16 p17 p18 p19 p20 p21 p22 p23 g16 g17 g18 g19 g20 g21 g22 g23 manchester_static_Fast_carry_8bits
Xcell8_4 c23  c24 c25 c26 c27 c28 c29 c30 c31 p24 p25 p26 p27 p28 p29 p30 p31 g24 g25 g26 g27 g28 g29 g30 g31 manchester_static_Fast_carry_8bits
$
$
$$.subckt manchester_static_Fast_carry_8bits c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4 p5 p6 p7 p8 g5 g6 g7 g8 c5 c6 c7 c8 
$$Xcell8_1
$Xcell8_2
$Xcell8_3
$Xcell8_4


Xsum0 p0 gnd s0 xor
Xsum1 p1 c0 s1 xor
Xsum2 p2 c1 s2 xor
Xsum3 p3 c2 s3 xor
Xsum4 p4 c3 s4 xor
Xsum5 p5 c4 s5 xor
Xsum6 p6 c5 s6 xor
Xsum7 p7 c6 s7 xor
Xsum8 p8 c7 s8 xor
Xsum9 p9 c8 s9 xor
Xsum10 p10 c9 s10 xor
Xsum11 p11 c10 s11 xor
Xsum12 p12 c11 s12 xor
Xsum13 p13 c12 s13 xor
Xsum14 p14 c13 s14 xor
Xsum15 p15 c14 s15 xor
Xsum16 p16 c15 s16 xor
Xsum17 p17 c16 s17 xor
Xsum18 p18 c17 s18 xor
Xsum19 p19 c18 s19 xor
Xsum20 p20 c19 s20 xor
Xsum21 p21 c20 s21 xor
Xsum22 p22 c21 s22 xor
Xsum23 p23 c22 s23 xor
Xsum24 p24 c23 s24 xor
Xsum25 p25 c24 s25 xor
Xsum26 p26 c25 s26 xor
Xsum27 p27 c26 s27 xor
Xsum28 p28 c27 s28 xor
Xsum29 p29 c28 s29 xor
Xsum30 p30 c29 s30 xor
Xsum31 p31 c30 s31 xor

Xand1 a0 b0 g0 and
Xand2 a1 b1 g1 and
Xand3 a2 b2 g2 and
Xand4 a3 b3 g3 and
Xand5 a4 b4 g4 and
Xand6 a5 b5 g5 and
Xand7 a6 b6 g6 and
Xand8 a7 b7 g7 and
Xand9 a8 b8 g8 and
Xand10 a9 b9 g9 and
Xand11 a10 b10 g10 and
Xand12 a11 b11 g11 and
Xand13 a12 b12 g12 and
Xand14 a13 b13 g13 and
Xand15 a14 b14 g14 and
Xand16 a15 b15 g15 and
Xand17 a16 b16 g16 and
Xand18 a17 b17 g17 and
Xand19 a18 b18 g18 and
Xand20 a19 b19 g19 and
Xand21 a20 b20 g20 and
Xand22 a21 b21 g21 and
Xand23 a22 b22 g22 and
Xand24 a23 b23 g23 and
Xand25 a24 b24 g24 and
Xand26 a25 b25 g25 and
Xand27 a26 b26 g26 and
Xand28 a27 b27 g27 and
Xand29 a28 b28 g28 and
Xand30 a29 b29 g29 and
Xand31 a30 b30 g30 and
Xand32 a31 b31 g31 and
Xxor1 a0 b0 p0 xor
Xxor2 a1 b1 p1 xor
Xxor3 a2 b2 p2 xor
Xxor4 a3 b3 p3 xor
Xxor5 a4 b4 p4 xor
Xxor6 a5 b5 p5 xor
Xxor7 a6 b6 p6 xor
Xxor8 a7 b7 p7 xor
Xxor9 a8 b8 p8 xor
Xxor10 a9 b9 p9 xor
Xxor11 a10 b10 p10 xor
Xxor12 a11 b11 p11 xor
Xxor13 a12 b12 p12 xor
Xxor14 a13 b13 p13 xor
Xxor15 a14 b14 p14 xor
Xxor16 a15 b15 p15 xor
Xxor17 a16 b16 p16 xor
Xxor18 a17 b17 p17 xor
Xxor19 a18 b18 p18 xor
Xxor20 a19 b19 p19 xor
Xxor21 a20 b20 p20 xor
Xxor22 a21 b21 p21 xor
Xxor23 a22 b22 p22 xor
Xxor24 a23 b23 p23 xor
Xxor25 a24 b24 p24 xor
Xxor26 a25 b25 p25 xor
Xxor27 a26 b26 p26 xor
Xxor28 a27 b27 p27 xor
Xxor29 a28 b28 p28 xor
Xxor30 a29 b29 p29 xor
Xxor31 a30 b30 p30 xor
Xxor32 a31 b31 p31 xor

C0 s0 gnd 10f
C1 s1 gnd 10f
C2 s2 gnd 10f
C3 s3 gnd 10f
C4 s4 gnd 10f
C5 s5 gnd 10f
C6 s6 gnd 10f
C7 s7 gnd 10f
C8 s8 gnd 10f
C9 s9 gnd 10f
C10 s10 gnd 10f
C11 s11 gnd 10f
C12 s12 gnd 10f
C13 s13 gnd 10f
C14 s14 gnd 10f
C15 s15 gnd 10f
C16 s16 gnd 10f
C17 s17 gnd 10f
C18 s18 gnd 10f
C19 s19 gnd 10f
C20 s20 gnd 10f
C21 s21 gnd 10f
C22 s22 gnd 10f
C23 s23 gnd 10f
C24 s24 gnd 10f
C25 s25 gnd 10f
C26 s26 gnd 10f
C27 s27 gnd 10f
C28 s28 gnd 10f
C29 s29 gnd 10f
C30 s30 gnd 10f
C31 s31 gnd 10f
.ends ADD

.subckt manchester_static_Fast_carry_4bits_1 c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4
XCell c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4_1 manchester_static_4bit
Xand p3 p2 p1 p0 sw1 and_4to1

Mn1 c4 sw1 c1 gnd nmos w=0.2u l=0.09u
Mp1 c4 sw1 c4_1 vdd pmos w=0.8u l=0.09u

$Xand1 p0 p1 temp1 and
$Xand2 p2 p3 temp2 and
$Xand3 temp1 temp2 sw1 and

.ends manchester_static_Fast_carry_4bits_1

.subckt manchester_static_Fast_carry_4bits c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4 
$XCell c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4_1 manchester_static_4bit
Xcell1 c0 p1 g1 c1 manchester_static_cell
Xcell2 c1 p2 g2 c2 manchester_static_cell
Xcell3 c2 p3 g3 c3 manchester_static_cell
Xcell4 c3 p4 g4 c4_1 manchester_static_cell
Xand p4 p3 p2 p1  sw1 and_4to1
Mn1 c4_temp sw1 c0 gnd nmos w=0.2u l=0.09u
Mp1 c4_temp sw1 c4_1 vdd pmos w=0.8u l=0.09u
Xinv1 c4_temp c4_temp1 inv_1
Xinv2 c4_temp1 c4 inv_1
.ends manchester_static_Fast_carry_4bits

.subckt manchester_static_Fast_carry_4bits_2 c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4
XCell c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4_1 manchester_static_4bit_1
Xand p3 p2 p1 p0 sw1 and_4to1_1
$Xand1 p0 p1 temp1 and
$Xand2 p2 p3 temp2 and
$Xand3 temp1 temp2 sw1 and
Mn1 c4 sw1 c0 gnd nmos w=6u l=0.09u
Mp1 c4 sw1 c4_1 vdd pmos w=8u l=0.09u
.ends manchester_static_Fast_carry_4bits_2

.subckt manchester_static_Fast_carry_8bits c0  c1 c2 c3 c4 c5 c6 c7 c8 p1 p2 p3 p4 p5 p6 p7 p8 g1 g2 g3 g4 g5 g6 g7 g8  
XCell c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4     manchester_static_4bit_8           
XCell2 c4 p5 p6 p7 p8 g5 g6 g7 g8 c5 c6 c7 c8_1    manchester_static_Fast_carry_4bits            
Xand p1 p2 p3 p4 p5 p6 p7 p8 sw1 and_8to1
$Xand1 p0 p1 temp1 and
$Xand2 p2 p3 temp2 and
$Xand3 temp1 temp2 sw1 and
Mn1 c8_temp sw1 c0 gnd nmos w=0.2u l=0.09u
Mp1 c8_temp sw1 c8_1 vdd pmos w=0.8u l=0.09u
Xinv1 c8_temp c8_temp1 inv_1
Xinv2 c8_temp1 c8 inv_1
.ends manchester_static_Fast_carry_8bits

.subckt manchester_static_4bit c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4
Xcell1 c0 p1 g1 c1 manchester_static_cell
Xcell2 c1 p2 g2 c2 manchester_static_cell
Xcell3 c2 p3 g3 c3 manchester_static_cell
Xcell4 c3 p4 g4 c4_temp manchester_static_cell
Xinv1 c4_temp c4_temp1 inv
Xinv2 c4_temp1 c4 inv
.ends manchester_static_4bit

.subckt manchester_static_4bit_8 c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4
Xcell1 c0 p1 g1 c1 manchester_static_cell
Xcell2 c1 p2 g2 c2 manchester_static_cell
Xcell3 c2 p3 g3 c3 manchester_static_cell
Xcell4 c3 p4 g4 c4 manchester_static_cell
$Xinv1 c4_temp c4_temp1 inv
$Xinv2 c4_temp1 c4 inv
.ends manchester_static_4bit_8

.subckt manchester_static_4bit_1 c0 p1 p2 p3 p4 g1 g2 g3 g4 c1 c2 c3 c4
Xcell1 c0 p1 g1 c1 manchester_static_cell_1
Xcell2 c1 p2 g2 c2 manchester_static_cell_1
Xcell3 c2 p3 g3 c3 manchester_static_cell_1
Xcell4 c3 p4 g4 c4_temp manchester_static_cell_1
Xinv1 c4_temp c4_temp1 inv_1
Xinv2 c4_temp1 c4 inv_1
.ends manchester_static_4bit_1

.subckt manchester_static_cell_1 cin p G cout
Mn1 cout p cin gnd nmos w=2u l=0.09u
Mn2 spot1 p_bar gnd gnd nmos w=2u l=0.09u
Mn3 cout g_bar spot1 gnd nmos w=2u l=0.09u
Mp1 cout p_bar cin vdd pmos w=8u l=0.09u
Mp2 cout g_bar vdd vdd pmos w=8u l=0.09u
Xinv1 p p_bar inv_1
Xinv2 g g_bar inv_1
.ends manchester_static_cell_1

.subckt manchester_static_cell cin p G cout
Mn1 cout p cin gnd nmos w=0.2u l=0.09u
Mn2 spot1 p_bar gnd gnd nmos w=0.2u l=0.09u
Mn3 cout g_bar spot1 gnd nmos w=0.2u l=0.09u
Mp1 cout p_bar cin vdd pmos w=0.8u l=0.09u
Mp2 cout g_bar vdd vdd pmos w=0.8u l=0.09u
Xinv1 p p_bar inv
Xinv2 g g_bar inv
.ends manchester_static_cell

.subckt manchester_dynamic clk C0 G1 G2 G3 G4 P1 P2 P3 P4 C1 C2 C3 C4
MN1 spot1 clk gnd gnd nmos w=0.2u l=0.09u
MN2 C0_bar C0 spot1 gnd nmos w=0.2u l=0.09u
MP1 C0_bar clk vdd vdd pmos w=0.6u l=0.09u
Xcell1 clk C0_bar P1 G1 C1_bar sub_machester
Xcell2 clk C1_bar P2 G2 C2_bar sub_machester
Xcell3 clk C2_bar P3 G3 C3_bar sub_machester
Xcell4 clk C3_bar P4 G4 C4_bar sub_machester
Xinv C4_bar C4_bar C4
.ends manchester_dynamic

.subckt sub_machester_dynamic clk Cin P G Cout
Mn1 Cin p Cout gnd nmos w=0.2u l=0.09u
Mn2 spot1 clk gnd gnd nmos w=0.2u l=0.09u
Mn3 Cout G spot gnd nmos w=0.2u l=0.09u
Mp1 Cout clk vdd vdd pmos w=0.6u l=0.09u 
.ends sub_machester_dynamic


.subckt and a b c
Mn1 c_bar a spot1 gnd nmos w=0.4u l=0.09u
Mn2 spot1 b gnd gnd nmos w=0.4u l=0.09u
Mp1 c_bar a vdd vdd pmos w=0.6u l=0.09u
Mp2 c_bar b vdd vdd pmos w=0.6u l=0.09u
Xinv c_bar c inv
.ends and

.subckt and_3to1 a b c d 
Mn1 d_bar a spot1 gnd nmos w=0.6u l=0.09u
Mn2 spot1 b spot2 gnd nmos w=0.6u l=0.09u
Mn3 spot2 c gnd gnd nmos w=0.6u l=0.09u

Mp1 d_bar a vdd vdd pmos w=0.6u l=0.09u
Mp2 d_bar b vdd vdd pmos w=0.6u l=0.09u
Mp3 d_bar c vdd vdd pmos w=0.6u l=0.09u

Xinv d_bar d inv
.ends and_3to1

.subckt and_4to1 a b c d e
Mn1 e_bar a spot1 gnd nmos w=0.8u l=0.09u
Mn2 spot1 b spot2 gnd nmos w=0.8u l=0.09u
Mn3 spot2 c spot3 gnd nmos w=0.8u l=0.09u
Mn4 spot3 d gnd gnd nmos w=0.8u l=0.09u

Mp1 e_bar a vdd vdd pmos w=0.6u l=0.09u
Mp2 e_bar b vdd vdd pmos w=0.6u l=0.09u
Mp3 e_bar c vdd vdd pmos w=0.6u l=0.09u
Mp4 e_bar d vdd vdd pmos w=0.6u l=0.09u

Xinv e_bar e inv
.ends and_4to1

.subckt and_4to1_1 a b c d e
Mn1 e_bar a spot1 gnd nmos w=8u l=0.09u
Mn2 spot1 b spot2 gnd nmos w=8u l=0.09u
Mn3 spot2 c spot3 gnd nmos w=8u l=0.09u
Mn4 spot3 d   gnd gnd nmos w=8u l=0.09u

Mp1 e_bar a vdd vdd pmos w=6u l=0.09u
Mp2 e_bar b vdd vdd pmos w=6u l=0.09u
Mp3 e_bar c vdd vdd pmos w=6u l=0.09u
Mp4 e_bar d vdd vdd pmos w=6u l=0.09u

Xinv e_bar e inv_1
.ends and_4to1_1

.subckt and_8to1 a b c d e f g h out
Mn1 out_bar a spot1 gnd nmos w=1.6u l=0.09u
Mn2 spot1 b spot2 gnd nmos w=1.6u l=0.09u
Mn3 spot2 c spot3 gnd nmos w=1.6u l=0.09u
Mn4 spot3 d spot4 gnd nmos w=1.6u l=0.09u
Mn5 spot4 e spot5 gnd nmos w=1.6u l=0.09u
Mn6 spot5 f spot6 gnd nmos w=1.6u l=0.09u
Mn7 spot6 g spot7 gnd nmos w=1.6u l=0.09u
Mn8 spot7 h   gnd gnd nmos w=1.6u l=0.09u

Mp1 out_bar a vdd vdd pmos w=0.6u l=0.09u
Mp2 out_bar b vdd vdd pmos w=0.6u l=0.09u
Mp3 out_bar c vdd vdd pmos w=0.6u l=0.09u
Mp4 out_bar d vdd vdd pmos w=0.6u l=0.09u
Mp5 out_bar e vdd vdd pmos w=0.6u l=0.09u
Mp6 out_bar f vdd vdd pmos w=0.6u l=0.09u
Mp7 out_bar g vdd vdd pmos w=0.6u l=0.09u
Mp8 out_bar h vdd vdd pmos w=0.6u l=0.09u
Xinv out_bar out inv
.ends and_8to1


.subckt xor vin_x vin_y vout
Mn1 net1 vin_x gnd  gnd nmos w=0.2u l=0.09u
Mn2 vout vin_y net1 gnd nmos w=0.2u l=0.09u
Mn3 vout net1 vin_y gnd nmos w=0.2u l=0.09u
Mp1 net1 vin_x vdd vdd pmos w=0.6u l=0.09u
Mp2 vout vin_y vin_x vdd pmos w=0.6u l=0.09u
Mp3 vout vin_x vin_y vdd pmos w=0.6u l=0.09u
.ends xor

.subckt inv in out
  Mp1 out in vdd vdd pmos w=0.8u l=0.09u
  Mn1 out in gnd gnd nmos w=0.2u l=0.09u
.ends inv

.subckt inv_1 in out
  Mp1 out in vdd vdd pmos w=1.05u l=0.09u
  Mn1 out in gnd gnd nmos w=0.35u l=0.09u
.ends inv_1




.end