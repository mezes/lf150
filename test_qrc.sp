*
*
*
*                       LINUX           Tue Apr 12 20:46:18 2016
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
.SUBCKT test_qrc G S D
*
*
*  caps2d version: 10
*
*
*       TRANSISTOR CARDS
*
*
MM0	D	G	S	S	nmos_hs
*
*
*       CAPACITOR CARDS
*
*
C1	G	D	1.77972E-16
C2	G	S	4.70024E-16
C3	D	S	6.74795E-16
*
*
.ENDS test_qrc
*
