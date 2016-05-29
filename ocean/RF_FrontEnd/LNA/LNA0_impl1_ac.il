simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1_ac"	"schematic")

resultsDir( "/home/pancha/simulation/LNA_impl1_ac/spectre/schematic" )

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
;IBIAS = 400u
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
/*
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
*/

IBIAS = 1200u
Fstart = 800M
Fstop  = 8G
Freq = 2.4G
C0 = 771f ;With ideal biasing sources
C1 = 100p
Cdecap = 5p
CdecapIN = 15p
CdecapMatch = 15p
RdcpI = 10K
RdcpQ = 10K
Rmatch = 50
L1 = 150n
Lbias = 250n
vdsBias = 450m
vdsn = 450m
vgsn = 456m
vgsBias = 578m
Wbias_tot = 40u
Wbias = Wbias_tot/5
W1_tot = 80u
Wf1 = W1_tot/5
Rout = 300

desVar(	  "IBIAS" IBIAS )
desVar(	  "freq1" Freq	)
desVar(	  "C0" C0	)
desVar(	  "C1" C1	)
desVar(	  "Cdecap" Cdecap	)
desVar(	  "CdecapIN" CdecapIN	)
desVar(   "RdcpI"   RdcpI  )
desVar(   "RdcpQ"  RdcpQ )
desVar(	  "L1" L1	)
desVar(	  "Lbias" Lbias	)
desVar(	  "Rmatch" Rmatch	)
desVar(	  "Rout" Rout	)
desVar(	  "vdsBias" vdsBias	)
desVar(	  "vgsBias" vgsBias	)
desVar(	  "vdsn" vdsn	)
desVar(	  "vgsn" vgsn	)
desVar(	  "Wbias" Wbias	)
desVar(	  "Wf1" Wf1	)

analysis('dc ?saveOppoint t  )
analysis('ac ?start Fstart  ?stop Fstop  )


envOption(
	'analysisOrder  list("dc" "ac") 
)
save( 'i "/R8/MINUS" "/R10/MINUS" )

temp( 27 ) 

run()

selectResult( 'dcOp )
selectResult( 'ac )

plot(getData("/R8/MINUS") getData("/R10/MINUS") getData("/VGQ2") getData("/VGQ") getData("/net030") )

plot(getData("/R8/MINUS") getData("/R10/MINUS") getData("/VGQ2") getData("/VGQ") getData("/net030") )
