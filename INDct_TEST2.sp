*
*
*
*                       LINUX           Sat Mar 19 18:43:44 2016
*
*
*
*  PROGRAM  advgen
*
*  Name           : advgen - Quantus QRC - (64-bit)
*  Version        : 14.2.3-s099
*  Build Date     : Wed Jun 17 00:01:02 PDT 2015
*
*  HSPICE LIBRARY
*
*
*
*
.SUBCKT INDct_TEST2 B A C
*
*
*  caps2d version: 10
*
*       SUBCIRCUIT CALLS
*
XI0 A#1 C#1 B#52 ind3n60_1n80a2g4_CT
*
*       RESISTOR AND CAP/DIODE CARDS
*
Rb1	B#1	B#2	1.699E-02	$L=9.6U	$W=62.16U
Rb2	B#2	B#3	1.699E-02	$L=9.6U	$W=62.16U
Rb3	B#3	B#4	1.699E-02	$L=9.6U	$W=62.16U
Rb4	B#4	B#5	1.699E-02	$L=9.6U	$W=62.16U
Rb5	B#5	B#6	1.699E-02	$L=9.6U	$W=62.16U
Rb6	B#6	B#7	1.104E-02	$L=6.24U	$W=62.16U
Rb7	B#1	B#9	4.991E-02	$L=28.205U	$W=62.16U
Rb8	B#4	B#1	9.057E-03	$L=5.07U	$W=61.58U
Rb9	B#1	B#11	4.991E-02	$L=28.205U	$W=62.16U
Rb11	B#1	B#13	4.991E-02	$L=28.205U	$W=62.16U
Rb14	B#1	B#16	4.991E-02	$L=28.205U	$W=62.16U
Rb16	B#1	B#18	4.991E-02	$L=28.205U	$W=62.16U
Rb18	B#1	B#20	4.991E-02	$L=28.205U	$W=62.16U
Rb20	B#21	B#22	1.699E-02	$L=9.6U	$W=62.16U
Rb21	B#22	B#23	1.699E-02	$L=9.6U	$W=62.16U
Rb22	B#23	B#24	1.699E-02	$L=9.6U	$W=62.16U
Rb23	B#24	B#25	1.699E-02	$L=9.6U	$W=62.16U
Rb24	B#25	B#26	1.699E-02	$L=9.6U	$W=62.16U
Rb25	B#26	B#27	1.104E-02	$L=6.24U	$W=62.16U
Rb26	B#27	B#1	3.840E-03	$L=2.17U	$W=62.16U
Rb27	B#1	B#24	1.520E-02	$L=8.51U	$W=61.58U
Rb28	B#30	B#52	    0.2502	$L=21.605U	$W=9.5U
Ra1	A#1	A	    1.7208	$L=390.82999U	$W=9.92U
Ra2	A	A#2	8.885E-02	$L=20.5815U	$W=10.17U
Ra3	A#2	A#3	    2.1552	$L=48.655U	$W=1U
Ra4	A#2	A#3	    1.8263	$L=41.345U	$W=1U
Ra5	B#30	B#31	    0.1375	$L=23.545U	$W=8.02U
Ra6	B#31	B	7.409E-02	$L=16.2095U	$W=8.93U
Ra7	B	B#32	    2.0884	$L=421.18051U	$W=8.93U
Ra8	B#32	B#33	    0.3523	$L=4.745U	$W=0.58U
Ra9	B#33	B#34	    0.7448	$L=9.6U	$W=0.58U
Ra10	B#34	B#35	    0.7448	$L=9.6U	$W=0.58U
Ra11	B#35	B#36	    0.5419	$L=7.24U	$W=0.58U
Ra12	B#36	B#37	    0.4841	$L=6.24U	$W=0.58U
Ra13	B#37	B#38	    0.7448	$L=9.6U	$W=0.58U
Ra14	B#38	B#39	    0.7448	$L=9.6U	$W=0.58U
Ra15	B#39	B#40	    0.7448	$L=9.6U	$W=0.58U
Ra16	B#40	B#41	    0.7448	$L=9.6U	$W=0.58U
Ra17	B#41	B#1	    0.9198	$L=9.6U	$W=0.58U
Ra18	B#32	B#42	    0.3608	$L=4.855U	$W=0.58U
Ra19	B#42	B#43	    0.7448	$L=9.6U	$W=0.58U
Ra20	B#43	B#44	    0.7448	$L=9.6U	$W=0.58U
Ra21	B#44	B#45	    0.4841	$L=6.24U	$W=0.58U
Ra22	B#45	B#46	    0.3246	$L=4.44U	$W=0.58U
Ra23	B#46	B#47	    0.4841	$L=6.24U	$W=0.58U
Ra24	B#47	B#48	    0.7448	$L=9.6U	$W=0.58U
Ra25	B#48	B#49	    0.7448	$L=9.6U	$W=0.58U
Ra26	B#49	B#50	    0.7448	$L=9.6U	$W=0.58U
Ra27	B#50	B#51	    0.7448	$L=9.6U	$W=0.58U
Ra28	B#51	B#21	    0.9198	$L=9.6U	$W=0.58U
Ra29	B#13	B#33	    0.1750	$L=0.001U	$W=0.58U
Ra30	B#11	B#34	    0.1750	$L=0.001U	$W=0.58U
Ra31	B#9	B#35	    0.1750	$L=0.001U	$W=0.58U
Ra32	B#7	B#36	    0.5833	$L=0.001U	$W=0.58U
Ra33	B#6	B#37	    0.1750	$L=0.001U	$W=0.58U
Ra34	B#5	B#38	    0.1750	$L=0.001U	$W=0.58U
Ra35	B#4	B#39	    0.1750	$L=0.001U	$W=0.58U
Ra36	B#3	B#40	    0.1750	$L=0.001U	$W=0.58U
Ra37	B#2	B#41	    0.1750	$L=0.001U	$W=0.58U
Ra38	B#16	B#42	    0.1750	$L=0.001U	$W=0.58U
Ra39	B#18	B#43	    0.1750	$L=0.001U	$W=0.58U
Ra40	B#20	B#44	    0.1750	$L=0.001U	$W=0.58U
Ra41	B#1	B#45	    0.5833	$L=0.001U	$W=0.58U
Ra42	B#27	B#46	    0.5833	$L=0.001U	$W=0.58U
Ra43	B#26	B#47	    0.1750	$L=0.001U	$W=0.58U
Ra44	B#25	B#48	    0.1750	$L=0.001U	$W=0.58U
Ra45	B#24	B#49	    0.1750	$L=0.001U	$W=0.58U
Ra46	B#23	B#50	    0.1750	$L=0.001U	$W=0.58U
Ra47	B#22	B#51	    0.1750	$L=0.001U	$W=0.58U
Ra48	C	C#1	9.331E-02	$L=20.735U	$W=10U
*
*       CAP/DIODE CARDS
*
*
CC0	A#3	B#1	cmim 	3.554E-12 	w=6e-05 l=6e-05  
*
*
*       CAPACITOR CARDS
*
*
C2	4	B#30	4.17639E-16
C3	C	A#1	2.69944E-16
C4	3	C#1	1.99799E-16
C5	3	A#1	5.11198E-16
C6	4	B#31	5.42E-17
C7	B#26	A#3	1.06246E-17
C8	B#25	A#3	1.12243E-17
C9	B#24	A#3	1.39474E-17
C10	B#23	A#3	1.16344E-17
C11	B#22	A#3	1.13395E-17
C12	B#21	A#3	1.73068E-17
C13	B#20	A#3	2.57642E-17
C14	B#18	A#3	1.82247E-16
C15	B#11	A#3	1.92069E-16
C16	B#9	A#3	1.12184E-17
C17	C#1	A#1	1.42273E-16
C18	B#1	A#3	2.43155E-14
C19	B#1	A#2	3.06933E-15
C20	4	B#52	1.32004E-14
C21	B#3	A#3	6.91605E-18
C22	B#6	A#3	8.58187E-18
C23	B	A	2.02772E-14
C24	C	A	3.63091E-15
C25	3	A	6.08457E-15
C26	4	A	5.02934E-15
C27	B#30	A	3.96759E-16
C28	B#27	A	7.49563E-17
C29	B#26	A	9.83875E-17
C30	B#25	A	8.1471E-17
C31	B#24	A	7.8334E-17
C32	B#23	A	7.7601E-17
C33	B#22	A	8.56581E-17
C34	B#21	A	1.45682E-16
C35	B#20	A	1.37483E-16
C36	B#18	A	1.27473E-16
C37	B#16	A	2.20866E-17
C38	B#13	A	2.17555E-14
C39	B#11	A	1.15294E-16
C40	B#9	A	1.88058E-16
C41	B#7	A	4.77637E-17
C42	B#6	A	9.94217E-17
C43	B#5	A	8.62715E-17
C44	B#4	A	8.22526E-17
C45	B#3	A	7.57877E-17
C46	B#2	A	9.19368E-17
C47	B#1	A	2.69502E-14
C48	C#1	A	2.05178E-15
C49	B#52	A	4.28672E-15
C50	B#31	A	1.97292E-15
*
*
.ENDS INDct_TEST2
*
