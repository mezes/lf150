simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1_sp"	"schematic")

resultsDir( "/home/pancha/simulation/LNA_impl1_sp/spectre/schematic" )

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


;IBIAS = 600u

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


desVar(	  "Rout" Rout	)
desVar(	  "Rmatch" Rmatch  )
desVar(	  "C0" C0	)
desVar(	  "C1" C1	)
desVar(	  "Cdecap" Cdecap	)
desVar(	  "CdecapIN" CdecapIN	)
desVar(	  "CdecapMatch" CdecapMatch	)
desVar(	  "frf1" Freq	)
desVar(	  "L1" L1	)
desVar(	  "Lbias" Lbias	)
desVar(	  "vdsBias" vdsBias	)
desVar(	  "vdsn" vdsn	)
desVar(	  "Wbias" Wbias	)
desVar(	  "Wf1" Wf1	)

analysis('dc ?saveOppoint t  )

analysis('sp ?ports list("/PORT_INP" "/PORT_OUT_I")  ?start Fstart  ?stop Fstop  
		?donoise "yes"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  )


envOption(
	'analysisOrder  list("dc" "sp") 
)

option( ?categ 'turboOpts
	'uniMode  "APS" 
)

saveOption( 'currents "all" )

temp( 27 ) 

run()

/*****************************Power Gains GP, GT, GA******************************************************/
/*
GP\ dB10 = db10(gp(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GP\ dB10 ?expr '( "GP dB10" ) )

GT\ dB10 = db10(gt(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GT\ dB10 ?expr '( "GT dB10" ) )

GA\ dB10 = db10(ga(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GA\ dB10 ?expr '( "GA dB10" ) )

/***************************** S Parameters ***************************************************************/
/*
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
Kf\  = kf(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp"))
plot( Kf\  ?expr '( "Kf " ) )

/***********************************Noise Figure *********8**********************************************/

NF\ dB10 = db10(getData("F" ?result "sp_noise"))
plot( NF\ dB10 ?expr '( "NF_bias_deCap dB10" ) )


