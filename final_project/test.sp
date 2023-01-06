

.inc "../ptm90.l"
.global vdd gnd


Xand a b c d e and_4to1

vVdd vdd gnd dc 1v
Va a gnd pwl 0ns 0v 1500ps 0v 1700ps 1v
Vb b gnd dc 1v
Vc c gnd dc 1v
Vd d gnd dc 1v

.subckt and a b c
Mn1 c_bar a spot1 gnd nmos w=0.2u l=0.09u
Mn2 spot1 b gnd gnd nmos w=0.2u l=0.09u
Mp1 c_bar a vdd vdd pmos w=0.6u l=0.09u
Mp2 c_bar b vdd vdd pmos w=0.6u l=0.09u
Xinv c_bar c inv
.ends and

$.subckt xor a b c 
$xinv_a a a_bar inv
$xinv_b b b_bar inv
$Mp1 c_temp a b vdd pmos w=0.8u l=0.09u
$Mn1 c_temp a_bar b gnd nmos w=0.2u l=0.09u
$Mp2 c_temp a_bar b_bar vdd pmos w=0.8u l=0.09u
$Mn2 c_temp a b gnd nmos w=0.2u l=0.09u 
$xinv1 c_temp c_temp2
$Xinv2 c_temp2 c
$.ends xor

$.subckt XOR A B C 
$ *6TXOR
$ MN1 NET1  A   GND  GND  nmos W=0.2u L=0.09u
$ MN2 C   B   NET1  GND  nmos W=0.2u L=0.09u
$ MN3 C   NET1 B   GND  nmos W=0.2u L=0.09u
$               
$ MP1 NET1  A   Vdd  Vdd  pmos W=0.6u L=0.09u
$ MP2 C   B   A   Vdd  pmos W=0.6u L=0.09u
$ MP3 C   A   B   Vdd  pmos W=0.6u L=0.09u
$  
$.ends XOR


.subckt xor vin_x vin_y vout
Mn1 net1 vin_x gnd  gnd nmos w=0.2u l=0.09u
Mn2 vout vin_y net1 gnd nmos w=0.2u l=0.09u
Mn3 vout net1 vin_y gnd nmos w=0.2u l=0.09u

Mp1 net1 vin_x vdd vdd pmos w=0.6u l=0.09u
Mp2 vout vin_y vin_x vdd pmos w=0.6u l=0.09u
Mp3 vout vin_x vin_y vdd pmos w=0.6u l=0.09u
.ends xor


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


$.subckt xor vin_x vin_y vout1
$Xinv1 vin_x vin_xb
$Xinv2 vin_y Vin_yb
$
$MP_x1  net1 vin_xb  vdd  vdd pmos W=0.8u L=0.09u
$MP_y1  net1 vin_yb  vdd  vdd pmos W=0.8u L=0.09u
$MP_x2 vout1  vin_y net1 net1 pmos W=0.8u L=0.09u
$MP_y2 vout1  vin_x net1 net1 pmos W=0.8u L=0.09u
$											  
$MN_x1 vout1  vin_x net2 net2 nmos W= 0.2u  L=0.09u
$MN_y1  net2  vin_y  gnd  gnd nmos W= 0.2u  L=0.09u
$MN_x2 vout1 vin_xb net3 net3 nmos W= 0.2u  L=0.09u
$MN_y2  net3 vin_yb  gnd  gnd nmos W= 0.2u  L=0.09u
$.ends xor


$.subckt and a b c
$	Mp1 c a spot1 vdd pmos w=0.8u l=0.09u
$	Mp2 spot1 b vdd vdd pmos w=0.8u l=0.09u
$	Mn1 c a gnd gnd nmos w=0.2u l=0.09u
$	Mn2 c b gnd gnd nmos w=0.2u l=0.09u
$.ends and

.subckt inv in out
  Mp1 out in vdd vdd pmos w=0.8u l=0.09u
  Mn1 out in gnd gnd nmos w=0.2u l=0.09u
.ends inv

.option post

.tran 0.001ns 20ns 

.end