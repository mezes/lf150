*
*
*
*                       LINUX           Mon Mar 21 14:19:55 2016
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
.SUBCKT test_filter OUT Vsup VSS INP
*
*
*  caps2d version: 10
*
*
*       CANONICAL RESISTOR AND CAP/DIODE CARDS
*
RI0	OUT#10	net10#4	resistor 	  114.9000	L=0.00001U
+ W=0U	$SUB=Vsup#1 
RI1	net10#5	INP#2	resistor 	 9867.6504	L=0.00001U
+ W=0U	$SUB=Vsup#1 
*
*       PARASITIC RESISTOR AND CAP/DIODE CARDS
*
Rm1	net10	net10#4	    0.8950	$L=0.0895U	$W=1U
Rm2	OUT#10	OUT#1	    0.8950	$L=0.0895U	$W=1U
Rm3	INP#1	INP#2	    1.7353	$L=0.59U	$W=3.4U
Rm4	net10#5	net10#3	    1.7353	$L=0.59U	$W=3.4U
Rl1	OUT#1	OUT#2	    5.5592	$L=2.33U	$W=1U
Rl2	OUT#2	OUT	    0.1093	$L=0.6595U	$W=1.98U
Rl3	OUT	OUT#3	    0.2600	$L=0.34U	$W=1.98U
Rl4	net10	net10#2	    5.8952	$L=3.73U	$W=1U
Rl5	net10#2	net10#3	    1.4450	$L=0.1495U	$W=3.4U
Rl6	INP	INP#1	    1.7053	$L=3.92U	$W=3.4U
Rl7	VSS	VSS#3	    0.3549	$L=5.4905U	$W=4.39U
Rl8	Vsup	Vsup#1	    0.1512	$L=1.21U	$W=1.92U
Rk1	OUT#11	OUT#3	    0.2188	$L=0.001U	$W=1.98U
Rk2	VSS#3	VSS#4	5.469E-02	$L=0.001U	$W=4.22U
Rj1	OUT#12	OUT#11	    0.2188	$L=0.001U	$W=1.98U
Rj2	VSS#4	VSS#5	5.469E-02	$L=0.001U	$W=4.22U
Ri1	OUT#13	OUT#12	    0.2188	$L=0.001U	$W=1.98U
Ri2	VSS#5	VSS#6	5.469E-02	$L=0.001U	$W=4.22U
Rh1	OUT#13	OUT#14	    0.5738	$L=0.001U	$W=1.98U
Rh2	VSS#7	VSS#6	    0.1434	$L=0.001U	$W=4.22U
Rf1	OUT#15	OUT#14	    0.2188	$L=0.001U	$W=1.98U
Rf2	VSS#7	VSS#8	5.469E-02	$L=0.001U	$W=4.22U
Re1	OUT#16	OUT#15	    0.2188	$L=0.001U	$W=1.98U
Re2	VSS#8	VSS#9	5.469E-02	$L=0.001U	$W=4.22U
Rd1	OUT#5	OUT#16	    0.2188	$L=0.001U	$W=1.98U
Rd2	VSS#9	VSS#1	5.469E-02	$L=0.001U	$W=4.22U
Rb1	OUT#4	OUT#5	    0.4375	$L=0.001U	$W=1.98U
Rb2	VSS#1	VSS#2	    0.1094	$L=0.001U	$W=4.22U
Rb3	VSS#11	VSS#12	6.715E-03	$L=4.405U	$W=72.16U
Rb4	VSS#12	VSS#13	7.919E-03	$L=5.195U	$W=72.16U
Rb5	VSS#14	VSS#15	1.463E-02	$L=9.6U	$W=72.16U
Rb6	VSS#15	VSS#16	1.463E-02	$L=9.6U	$W=72.16U
Rb7	VSS#16	VSS#11	1.463E-02	$L=9.6U	$W=72.16U
Rb8	VSS#13	VSS#17	1.463E-02	$L=9.6U	$W=72.16U
Rb9	VSS#17	VSS#18	1.463E-02	$L=9.6U	$W=72.16U
Rb10	VSS#18	VSS#19	9.878E-03	$L=6.48U	$W=72.16U
Rb11	VSS#14	VSS#21	5.062E-02	$L=33.205U	$W=72.16U
Rb12	VSS#12	VSS#14	7.791E-03	$L=5.07U	$W=71.58U
Rb13	VSS#22	VSS#14	5.062E-02	$L=33.205U	$W=72.16U
Rb14	VSS#14	VSS#22	1.475E-02	$L=9.6U	$W=71.58U
Rb15	VSS#24	VSS#14	5.062E-02	$L=33.205U	$W=72.16U
Rb16	VSS#22	VSS#24	1.475E-02	$L=9.6U	$W=71.58U
Rb17	VSS#14	VSS#27	5.456E-02	$L=35.79U	$W=72.16U
Rb18	VSS#24	VSS#14	1.770E-02	$L=11.52U	$W=71.58U
Rb19	VSS#14	VSS#29	5.062E-02	$L=33.205U	$W=72.16U
Rb21	VSS#14	VSS#31	5.062E-02	$L=33.205U	$W=72.16U
Rb23	VSS#32	VSS#14	5.062E-02	$L=33.205U	$W=72.16U
Rb24	VSS#14	VSS#32	1.475E-02	$L=9.6U	$W=71.58U
Rb25	VSS#34	VSS#35	6.715E-03	$L=4.405U	$W=72.16U
Rb26	VSS#35	VSS#36	7.919E-03	$L=5.195U	$W=72.16U
Rb27	VSS#14	VSS#38	1.463E-02	$L=9.6U	$W=72.16U
Rb28	VSS#38	VSS#39	1.463E-02	$L=9.6U	$W=72.16U
Rb29	VSS#39	VSS#34	1.463E-02	$L=9.6U	$W=72.16U
Rb30	VSS#36	VSS#40	1.463E-02	$L=9.6U	$W=72.16U
Rb31	VSS#40	VSS#41	1.463E-02	$L=9.6U	$W=72.16U
Rb32	VSS#41	VSS#42	9.878E-03	$L=6.48U	$W=72.16U
Rb33	VSS#42	VSS#43	3.552E-03	$L=2.33U	$W=72.16U
Rb34	VSS#32	VSS#35	9.958E-03	$L=6.48U	$W=71.58U
Ra1	OUT#6	OUT#7	    2.9647	$L=67.44U	$W=1U
Ra2	OUT#7	OUT#8	6.855E-03	$L=0.4995U	$W=4.56U
Ra3	OUT#8	OUT#6	    1.5597	$L=34.66U	$W=1U
Ra4	OUT#7	OUT#9	6.851E-03	$L=0.4995U	$W=4.56U
Ra5	OUT#9	OUT#4	5.579E-02	$L=4.86U	$W=3.92U
Ra6	VSS#44	VSS#45	    0.3495	$L=4.76U	$W=0.58U
Ra7	VSS#45	VSS#46	    0.5028	$L=6.48U	$W=0.58U
Ra8	VSS#46	VSS#47	    0.7448	$L=9.6U	$W=0.58U
Ra9	VSS#47	VSS#48	    0.7448	$L=9.6U	$W=0.58U
Ra10	VSS#48	VSS#49	    0.7448	$L=9.6U	$W=0.58U
Ra11	VSS#49	VSS#50	    0.7448	$L=9.6U	$W=0.58U
Ra12	VSS#50	VSS#51	    0.7448	$L=9.6U	$W=0.58U
Ra13	VSS#51	VSS#52	    0.7448	$L=9.6U	$W=0.58U
Ra14	VSS#52	VSS#53	    0.5543	$L=7.4U	$W=0.58U
Ra15	VSS#53	VSS#54	    0.5028	$L=6.48U	$W=0.58U
Ra16	VSS#54	VSS#55	    0.7448	$L=9.6U	$W=0.58U
Ra17	VSS#55	VSS#56	    0.7448	$L=9.6U	$W=0.58U
Ra18	VSS#56	VSS#57	    0.7448	$L=9.6U	$W=0.58U
Ra19	VSS#57	VSS#58	    0.7448	$L=9.6U	$W=0.58U
Ra20	VSS#58	VSS#59	    0.7448	$L=9.6U	$W=0.58U
Ra21	VSS#59	VSS#14	    0.9198	$L=9.6U	$W=0.58U
Ra22	VSS#44	VSS#60	    0.5028	$L=6.48U	$W=0.58U
Ra23	VSS#60	VSS#61	    0.7448	$L=9.6U	$W=0.58U
Ra24	VSS#61	VSS#62	    0.7448	$L=9.6U	$W=0.58U
Ra25	VSS#62	VSS#63	    0.7448	$L=9.6U	$W=0.58U
Ra26	VSS#63	VSS#64	    0.7448	$L=9.6U	$W=0.58U
Ra27	VSS#64	VSS#65	    0.7448	$L=9.6U	$W=0.58U
Ra28	VSS#65	VSS#14	    0.9198	$L=9.6U	$W=0.58U
Ra29	VSS#50	VSS#2	    0.1058	$L=19.47U	$W=8.28U
Ra30	VSS#42	VSS#44	    0.5000	$L=0.001U	$W=0.58U
Ra31	VSS#43	VSS#45	    0.5000	$L=0.001U	$W=0.58U
Ra32	VSS#14	VSS#46	    0.1750	$L=0.001U	$W=0.58U
Ra33	VSS#31	VSS#47	    0.1750	$L=0.001U	$W=0.58U
Ra34	VSS#29	VSS#48	    0.1750	$L=0.001U	$W=0.58U
Ra35	VSS#27	VSS#49	    0.1750	$L=0.001U	$W=0.58U
Ra36	VSS#14	VSS#50	    0.1750	$L=0.001U	$W=0.58U
Ra37	VSS#14	VSS#51	    0.1750	$L=0.001U	$W=0.58U
Ra38	VSS#21	VSS#52	    0.1750	$L=0.001U	$W=0.58U
Ra39	VSS#19	VSS#53	    0.5000	$L=0.001U	$W=0.58U
Ra40	VSS#18	VSS#54	    0.1750	$L=0.001U	$W=0.58U
Ra41	VSS#17	VSS#55	    0.1750	$L=0.001U	$W=0.58U
Ra42	VSS#13	VSS#56	    0.1750	$L=0.001U	$W=0.58U
Ra43	VSS#11	VSS#57	    0.1750	$L=0.001U	$W=0.58U
Ra44	VSS#16	VSS#58	    0.1750	$L=0.001U	$W=0.58U
Ra45	VSS#15	VSS#59	    0.1750	$L=0.001U	$W=0.58U
Ra46	VSS#41	VSS#60	    0.1750	$L=0.001U	$W=0.58U
Ra47	VSS#40	VSS#61	    0.1750	$L=0.001U	$W=0.58U
Ra48	VSS#36	VSS#62	    0.1750	$L=0.001U	$W=0.58U
Ra49	VSS#34	VSS#63	    0.1750	$L=0.001U	$W=0.58U
Ra50	VSS#39	VSS#64	    0.1750	$L=0.001U	$W=0.58U
Ra51	VSS#38	VSS#65	    0.1750	$L=0.001U	$W=0.58U
*
*       CAP/DIODE CARDS
*
*
CC0	OUT#6	VSS#14	capacitor 	4.833E-12 	w=7e-05 l=7e-05  
*
*
*       CAPACITOR CARDS
*
*
C2	INP	X6/6	1.50703E-17
C3	INP	X6/7	1.51875E-17
C4	X5/5	X5/6	8.88843E-17
C5	X6/6	INP#2	3.06353E-17
C6	X6/6	net10#5	2.99723E-17
C7	X6/7	INP#2	3.07887E-17
C8	X6/7	net10#5	3.02038E-17
C9	X5/5	net10#4	2.53702E-17
C10	X5/5	OUT#10	2.50509E-17
C11	VSS#13	OUT#6	1.0165E-17
C12	X5/6	net10#4	2.5544E-17
C13	X5/6	OUT#10	2.51361E-17
C14	X5/5	OUT#4	4.71364E-18
C15	X6/6	INP#1	1.02769E-16
C16	X6/6	net10#3	7.35804E-17
C17	X6/6	net10	6.07831E-18
C18	X6/6	OUT#6	2.53459E-17
C19	X6/6	net10#2	1.51499E-17
C20	X5/6	OUT#4	5.10954E-18
C21	X5/5	OUT#13	5.56147E-18
C22	VSS#16	OUT#6	1.07236E-17
C23	X6/7	INP#1	1.02526E-16
C24	X6/7	net10#3	7.33938E-17
C25	X6/7	net10	6.70154E-18
C26	X6/7	net10#2	1.5947E-17
C27	X5/5	OUT#15	3.29291E-18
C28	X5/6	OUT#13	5.44622E-18
C29	X5/5	net10#3	1.95397E-18
C30	X5/5	net10	5.31435E-17
C31	X5/5	OUT#1	4.76964E-17
C32	X5/5	OUT#2	4.29824E-18
C33	X5/5	net10#2	4.32823E-18
C34	X5/6	OUT#15	3.37516E-18
C35	X5/5	OUT#8	6.27557E-18
C36	X5/6	net10#3	2.62334E-18
C37	X5/6	net10	5.27149E-17
C38	X5/6	OUT#1	4.79604E-17
C39	X5/6	OUT#6	3.15934E-18
C40	X5/6	OUT#2	4.24308E-18
C41	X5/6	net10#2	4.34187E-18
C42	X5/6	OUT#8	4.71868E-18
C43	VSS#31	OUT#6	1.87089E-16
C44	VSS#29	OUT#6	1.48713E-17
C45	VSS#14	INP#2	4.27836E-18
C46	VSS#14	net10#2	3.24332E-17
C47	Vsup#1	VSS#14	2.0254E-16
C48	net10#3	VSS#14	3.46312E-17
C49	VSS#14	OUT#15	4.34631E-17
C50	VSS#14	OUT#12	1.11582E-17
C51	VSS#14	OUT#5	5.62811E-17
C52	VSS#14	OUT#4	1.63522E-16
C53	X5/6	VSS#14	4.91109E-17
C54	X6/6	VSS#14	2.1701E-16
C55	VSS#14	net10#5	3.61472E-18
C56	VSS#14	OUT#6	2.97789E-14
C57	net10	VSS#14	3.94606E-17
C58	X6/7	VSS#14	3.79413E-16
C59	INP	VSS#14	1.9117E-16
C60	VSS#14	OUT#8	2.87361E-15
C61	INP#1	VSS#14	9.22149E-17
C62	VSS#14	OUT#16	2.67039E-17
C63	VSS#14	OUT#13	3.31916E-17
C64	X5/5	VSS#14	7.43638E-17
C65	OUT#4	VSS#15	6.11188E-18
C66	VSS#17	OUT#6	6.15632E-18
C67	VSS#14	OUT#1	6.50228E-18
C68	VSS#18	OUT#6	6.75114E-18
C69	VSS#41	OUT#6	7.18117E-18
C70	VSS#14	OUT#11	7.24378E-18
C71	VSS#40	OUT#6	7.37569E-18
C72	VSS#34	OUT#6	7.58755E-18
C73	VSS#21	OUT#6	8.48911E-18
C74	VSS#39	OUT#6	8.59188E-18
C75	VSS#11	OUT#6	9.78879E-18
C76	VSS#36	OUT#6	9.80513E-18
C77	OUT	X5/5	1.73373E-18
C78	X5/5	OUT#11	2.33864E-18
C79	X5/6	OUT#12	1.81878E-18
C80	X5/6	OUT#11	1.84152E-18
C81	OUT	VSS	3.10969E-16
C82	INP	VSS	1.30016E-15
C83	X6/6	VSS	8.37246E-15
C84	X6/7	VSS	8.21131E-15
C85	X5/5	VSS	2.23336E-15
C86	X5/6	VSS	2.25738E-15
C87	INP#2	VSS	2.37577E-16
C88	net10#5	VSS	2.40384E-16
C89	net10#4	VSS	1.10661E-16
C90	OUT#10	VSS	1.10549E-16
C91	OUT#4	VSS	2.7453E-16
C92	OUT#5	VSS	7.10122E-17
C93	OUT#13	VSS	1.4822E-16
C94	OUT#12	VSS	1.02744E-16
C95	OUT#16	VSS	3.42152E-17
C96	OUT#11	VSS	1.27421E-16
C97	OUT#15	VSS	1.07515E-16
C98	INP#1	VSS	6.37726E-16
C99	net10#3	VSS	3.99366E-16
C100	net10	VSS	1.83471E-16
C101	OUT#1	VSS	1.19395E-16
C102	Vsup#1	VSS	1.43895E-15
C103	OUT#6	VSS	1.13532E-15
C104	OUT#2	VSS	9.1438E-17
C105	net10#2	VSS	1.43201E-16
C106	OUT#8	VSS	1.62793E-16
*
*
.ENDS test_filter
*
