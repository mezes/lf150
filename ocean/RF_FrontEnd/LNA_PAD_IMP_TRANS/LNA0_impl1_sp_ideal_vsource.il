simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1_sp_PAD_Imp_Trans"	"schematic")

resultsDir( "/home/pancha/simulation/LNA_impl1_sp_PAD_Imp_Trans/spectre/schematic" )

modelFile( 
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_hs")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_ll")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_na")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_3")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_5")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "res_typ")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "mim_typ")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "bjt_t")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "dio_t")
)

createNetlist
/*
IBIAS = 400u
Fstart = 800M
Fstop  = 8G
Freq = 2.4G
Ibias = 600u
C0   = 325f ;With ideal biasing sources
;C0   =  ;When the biasing source are implemented with current mirrors
C1   = 50p
Cdecap = 5p
CdecapIN = 15p
CdecapMatch = 15p
Rmatch = 50
L1 = 150n
Lbias = 250n
vdsBias = 450m
vdsn = 450m
vgsn = 431m
vgsBias = 498m
Wbias_tot = 30u
Wbias = Wbias_tot/5
W1_tot = 40u
Wf1 = W1_tot/5
Rout = 500
prf = -20
*/
/*
IBIAS = 600u
Fstart = 800M
Ibias = 600u
Fstop  = 8G
Freq = 2.4G
C0   = 442f ;With ideal biasing sources
;C0   = 420f ;When the biasing source are implemented with current mirrors
C1   = 50p
Cdecap = 5p
CdecapIN = 15p
CdecapMatch = 15p
Rmatch = 50
L1 = 150n
Lbias = 250n
vdsBias = 450m
vdsn = 450m
vgsn = 434m
vgsBias = 535m
Wbias_tot = 30u
Wbias = Wbias_tot/5
W1_tot = 54u
Wf1 = W1_tot/5
Rout = 500
prf = -20
*/
/*
IBIAS = 800u
Fstart = 800M
Fstop  = 8G
Ibias = 800u
Freq = 2.4G
C0 = 625f ;With ideal biasing sources
C1 = 100p
Cdecap = 5p
CdecapIN = 15p
CdecapMatch = 15p
Rmatch = 50
L1 = 150n
Lbias = 250n
vdsBias = 450m
vdsn = 450m
vgsn = 460m
vgsBias = 564m
Wbias_tot = 30u
Wbias = Wbias_tot/5
W1_tot = 50u
Wf1 = W1_tot/5
Rout = 200
Zout = 200
prf = -20
*/
Np_dec = 1000 ; Number of points per decade
IBIAS = 1200u
Fstart = 800M
Fstop  = 6G
Cext = 140f
Lext = 8.3n
C0 = 675f
C1 = 100p
Cdecap = 1p
CdecapIn = 1p
CdecapMatch = 1p
Freq = 2.4G
L1 = 150n
Lbias = 250n
prf = -30
RdcpI = 10K
RdcpQ = 10K
;Rmatch = 50
;Rmatch = 300 ; WIth Cext
Rmatch = 90 ; Without Cext
Rout = 300
vdsBias = 450m
vdsn = 450m
vgsBias = 578m
vgsn = 456m
Wbias_tot = 40u
Wbias = Wbias_tot/5
W1_tot = 80u
Wf1 = W1_tot/5

desVar(   "Cext" Cext  )
desVar(   "Lind" Lext )
desVar(   "C0" C0     )
desVar(   "C1" C1     )
desVar(   "Cdecap" Cdecap   )
desVar(   "CdecapIN" CdecapIN )
desVar(   "CdecapMatch" CdecapMatch     )
desVar(   "frf1" Freq   )
desVar(   "IBIAS" IBIAS )
desVar(   "L1"  L1     )
desVar(   "Lbias"  Lbias  )
desVar(   "prf"   prf    )
desVar(   "RdcpI"  RdcpI  )
desVar(   "RdcpQ"  RdcpQ  )
desVar(   "Rmatch"   Rmatch  )
desVar(   "Rout"   Rout   )
desVar(   "vdsBias"  vdsBias      )
desVar(   "vdsn" vdsn   )
desVar(   "vgsBias"   vgsBias      )
desVar(   "vgsn"  vgsn  )
desVar(   "Wbias"  Wbias   )
desVar(   "Wf1"  Wf1   )

/*****************************Power Gains GP, GT, GA******************************************************/
/*

analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop
                ?dec Np_dec  ?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("dc" "sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

saveOption( 'currents "all" )

temp( 27 ) 

run()

GP\ dB10 = db10(gp(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GP\ dB10 ?expr '( "GP dB10" ) )

GT\ dB10 = db10(gt(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GT\ dB10 ?expr '( "GT dB10" ) )

GA\ dB10 = db10(ga(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GA\ dB10 ?expr '( "GA dB10" ) )

/***************************** S Parameters ***************************************************************/
/*
analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop
                ?dec Np_dec  ?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("dc" "sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

saveOption( 'currents "all" )

temp( 27 ) 

run()

S12\ dB20 = db(spm('sp 1 2))
plot( S12\ dB20 ?expr '( "S12 dB20" ) )

S11\ dB20 = db(spm('sp 1 1))
plot( S11\ dB20 ?expr '( "S11 dB20" ) )

S22\ dB20 = db(spm('sp 2 2))
plot( S22\ dB20 ?expr '( "S22 dB20" ) )

S21\ dB20 = db(spm('sp 2 1))
plot( S21\ dB20 ?expr '( "S21 dB20" ) )

/******************************** Stability ****************************************************************/
/*
analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop
                ?dec Np_dec  ?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("dc" "sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

saveOption( 'currents "all" )

temp( 27 ) 

run()

Kf\  = kf(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp"))
plot( Kf\  ?expr '( "Kf " ) )

/***********************************Noise Figure ********************************************************/

analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop
                ?dec Np_dec  ?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("dc" "sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

saveOption( 'currents "all" )

temp( 27 ) 

run()

NF\ dB10 = db10(getData("F" ?result "sp_noise"))
plot( NF\ dB10 ?expr '( "NF dB10" ) )

/************************** Smith Chart ******************************************************************/
/*
analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop
                ?dec Np_dec  ?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("dc" "sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

saveOption( 'currents "all" )

temp( 27 ) 

run()

S11\  = spm('sp 1 1)
plot( S11\  ?expr '( "S11 " ) )

/*************************************Sweep Lext ************************************************************/
/*
Fstart = 2.3G
Fstop = 2.5G
Np_dec = 100 ; Number of points per decade

Lstart = 5n
Lstop = 20n
Lstep = 0.5n

analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop
                ?dec Np_dec  ?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

temp( 27 ) 

run()

paramAnalysis("Lind" ?start Lstart ?stop Lstop ?step Lstep)
paramRun()
S11\  = spm('sp 1 1)
plot( S11\  ?expr '( "S11 " ) )


