**
.include './sweep_data_mc'
.lib './l0040ll_v1p4_1r_new.lib' tt
**
.param SUPPLY=1
.global VDD 
.temp=25
**c1
.subckt inv1 g d
XP d g VDD VDD plvt11ll_ckt_11 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_11 w=240n l=40n
.ends inv1
**
.subckt nand1 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_12 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_13 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_12 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_13 w=240n l=40n
.ends nand1
**c2
.subckt inv2 g d
XP d g VDD VDD plvt11ll_ckt_21 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_21 w=240n l=40n
.ends inv2
**
.subckt nand2 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_22 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_23 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_22 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_23 w=240n l=40n
.ends nand2
**c3
.subckt inv3 g d
XP d g VDD VDD plvt11ll_ckt_31 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_31 w=240n l=40n
.ends inv3
**
.subckt nand3 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_32 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_33 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_32 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_33 w=240n l=40n
.ends nand3
**c4
.subckt inv4 g d
XP d g VDD VDD plvt11ll_ckt_41 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_41 w=240n l=40n
.ends inv4
**
.subckt nand4 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_42 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_43 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_42 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_43 w=240n l=40n
.ends nand4
**c5
.subckt inv5 g d
XP d g VDD VDD plvt11ll_ckt_51 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_51 w=240n l=40n
.ends inv5
**
.subckt nand5 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_52 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_53 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_52 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_53 w=240n l=40n
.ends nand5
**c6
.subckt inv6 g d
XP d g VDD VDD plvt11ll_ckt_61 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_61 w=240n l=40n
.ends inv6
**
.subckt nand6 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_62 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_63 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_62 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_63 w=240n l=40n
.ends nand6
**c7
.subckt inv7 g d
XP d g VDD VDD plvt11ll_ckt_71 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_71 w=240n l=40n
.ends inv7
**
.subckt nand7 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_72 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_73 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_72 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_73 w=240n l=40n
.ends nand7
**c8
.subckt inv8 g d
XP d g VDD VDD plvt11ll_ckt_81 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_81 w=240n l=40n
.ends inv8
**
.subckt nand8 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_82 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_83 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_82 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_83 w=240n l=40n
.ends nand8
**c9
.subckt inv9 g d
XP d g VDD VDD plvt11ll_ckt_91 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_91 w=240n l=40n
.ends inv9
**
.subckt nand9 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_92 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_93 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_92 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_93 w=240n l=40n
.ends nand9
**c10
.subckt inv10 g d
XP d g VDD VDD plvt11ll_ckt_101 w=240n l=40n
XN d g 0 0 nlvt11ll_ckt_101 w=240n l=40n
.ends inv10
**
.subckt nand10 A B Y
XP1 Y A VDD VDD plvt11ll_ckt_102 w=240n l=40n
XP2 Y B VDD VDD plvt11ll_ckt_103 w=240n l=40n
XN1 Y A C 0 nlvt11ll_ckt_102 w=240n l=40n
XN2 C B 0 0 nlvt11ll_ckt_103 w=240n l=40n
.ends nand10

X1 in d1 inv1
Xnand1 d1 d1 out1 nand1
**
X2 out1 d2 inv2
Xnand2 d2 d2 out2 nand2
**
X3 out2 d3 inv3
Xnand3 d3 d3 out3 nand3
**
X4 out3 d4 inv4
Xnand4 d4 d4 out4 nand4
**
X5 out4 d5 inv5
Xnand5 VDD d5 out5 nand5
**
X6 out5 d6 inv6
Xnand6 d6 d6 out6 nand6
**
X7 out6 d7 inv7
Xnand7 d7 d7 out7 nand7
**
X8 out7 d8 inv8
Xnand8 d8 d8 out8 nand8
**
X9 out8 d9 inv9
Xnand9 d9 d9 out9 nand9
**
X10 out9 d10 inv10
Xnand10 d10 d10 out10 nand10
**
VVDD VDD 0 'SUPPLY'
Vin in 0 pwl(0 0 0.1n 'SUPPLY')
**
.option ingold=2
.meas Td trig v(in) val='SUPPLY/2' rise=1 targ v(out10)
+val='SUPPLY/2' rise=1
*.meas T_test trig v(in) val='SUPPLY/2' rise=1 targ v(d1)
*+val='SUPPLY/2' fall=1
.tran 10p 2n sweep DATA=data
**
*.probe v(*)
.end