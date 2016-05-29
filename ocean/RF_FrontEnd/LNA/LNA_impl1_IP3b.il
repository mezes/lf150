simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1_IP3b_ideal_vsource"	"schematic")

resultsDir( "/home/pancha/simulation/LNA_impl1_IP3b_ideal_vsource/spectre/schematic" )

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

analysis('hb ?autoharms "yes"  ?autotstab "yes"  ?oversample list("1" "1")  
		?funds list("RF" "RF2")  ?maxharms list("3" "3")  )

IBIAS = 1200u
Fstart = 800M
Fstop  = 8G
Freq = 2.4G
C0 = 760f ;With ideal biasing sources
C1 = 100p
Cdecap = 5p
CdecapIN = 15p
CdecapMatch = 15p
RdcpQ = 10K
RdcpI  =  10K
Rmatch = 50
L1 = 150n
Lbias = 250n
vdsBias = 450m
vdsn = 450m
vgsn = 456m
vgsBias = 508m
Wbias_tot = 80u
Wbias = Wbias_tot/5
W1_tot = 80u
Wf1 = W1_tot/5
Rout = 300
Zout = 0
prf = -40

analysis('dc ?saveOppoint t  )

desVar(	  "C0" C0	)
desVar(	  "C1" C1	)
desVar(	  "Cdecap" Cdecap	)
desVar(	  "CdecapIN" CdecapIN	)
desVar(	  "CdecapMatch" CdecapMatch	)
desVar(   "RdcpI"  RdcpI  )
desVar(   "RdcpQ"  RdcpQ  )
desVar(	  "frf1" Freq	)
desVar(	  "IBIAS" IBIAS	)
desVar(	  "L1" L1	)
desVar(	  "Lbias" Lbias	)
desVar(	  "prf" prf	)
desVar(	  "Rmatch" Rmatch	)
desVar(	  "Rout" Rout	)
desVar(	  "vdsBias" vdsBias	)
desVar(	  "vdsn" vdsn	)
desVar(	  "vgsBias" vgsBias	)
desVar(	  "vgsn" vgsn	)
desVar(	  "Wbias" Wbias	)
desVar(	  "Wf1" Wf1	)

envOption(
	'analysisOrder  list("dc" "hb") 
)

temp( 27 ) 

run()

/********************************** IP3 with a 2-tine HB analysis ******************************************************************************************************/
Input\ Referred\ IP3\ Point = ipnVRI((v("/net027" ?result "hb_mt_fi") - 0.0) '(2 -1) '(0 1) ?rport resultParam("PORT_OUT_I:r" ?result "hb_mt_fi") ?epoint -40)
plot( Input\ Referred\ IP3\ Point ?expr '( "Input Referred IP3 Point" ) )
ipnCurves = ipnVRICurves((v("/net027" ?result "hb_mt_fi") - 0.0) '(2 -1) '(0 1) ?rport resultParam("PORT_OUT_I:r" ?result "hb_mt_fi") ?epoint -40)
plot( ipnCurves ?expr '( "ipnCurves" ) )
