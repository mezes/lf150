simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1_IP3a"	"schematic")

resultsDir( "/home/pancha/simulation/LNA_impl1_IP3a/spectre/schematic" )
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

analysis('hb ?autoharms "yes"  ?autotstab "yes"  ?oversample list("1")  
		?fundfreqs list("(2.4G)")  ?maxharms list("5")  ?param "prf"  ?start "-80"  
		?stop "10"  ?lin "100"  )

analysis('hbac ?start "2402.5M"  ?stop ""  ?maxsideband "3"  )

analysis('dc ?saveOppoint t  )

Np_dec = 1000 ; Number of points per decade
IBIAS = 1200u
Fstart = 800M
Fstop  = 6G
Cext = 140f
;Lext = 10.6n ;with Cext
Lext = 8.3n ; Without Cext
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
;Rmatch = 300  ; With Cext
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

envOption(
	'analysisOrder  list("dc" "hb" "hbac") 
)

temp( 27 ) 

run()

;*******************IP3 results with HB and HBAC analysis****************************************************************************************
IIP3 = Input\ Referred\ IP3\ Point = ipnVRI((v("/net027" ?result "hbac") - 0.0) '-2 '0 ?rport resultParam("PORT_OUT_I:r" ?result "hbac") ?epoint -20)
plot( Input\ Referred\ IP3\ Point ?expr '( "Input Referred IP3 Point" ) )
ipnCurves = ipnVRICurves((v("/net027" ?result "hbac") - 0.0) '-2 '0 ?rport resultParam("PORT_OUT_I:r" ?result "hbac") ?epoint -40)
plot( ipnCurves ?expr '( "ipnCurves" ) )
 
printf("\n*******************IP3 results with HB and HBAC analysis****************************************************************************************")
printf("IIP3 = %3.3fdBm" IIP3)

