simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_Mixer_impl1_hb_hbac"	"schematic"  )

resultsDir( "/home/pancha/simulation/LNA_Mixer_impl1/spectre/schematic" )

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
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "tt_rf_hs")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "tt_rf_ll")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "tt_rf_3")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "t_rf_nvar")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "resrf_typ")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "mimrf_typ")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150rf.scs" "t_rf_ind")
)

Freq = 2.402G
flo = 2.4G
Rosc = 1
C0 = 675f
C1 = 100p
Cdecap = 1p
Cext = 140f
IBIAS = 1.2m
L1 = 150n
Lbias = 250n
Lmix = 150n
Lext = 8.3n
pacmag = 1
Rdecap = 10K
Rmatch = 90
Rp = 500
vdsBias = 450m
vgsBias = 578m
vgsn = 456m
Wbias_tot = 40u
Wf1_tot = 80u
Wfmix_tot = 80u
Wbias = Wbias_tot/5
Wf1 = Wf1_tot/5
Wfmix = Wfmix_tot/5

desVar(   "Rosc" Rosc      )
desVar(   "C0" C0    )
desVar(   "C1" C1     )
desVar(   "Cdecap" Cdecap   )
desVar(   "CdecapIN" Cdecap )
desVar(   "CdecapMatch" Cdecap     )
desVar(   "Cext" Cext   )
desVar(   "flo"  flo    )
desVar(   "IBIAS"  IBIAS  )
desVar(   "L1"  L1     )
desVar(   "Lbias"   Lbias  )
desVar(   "Lind" Lext   )
desVar(   "Lmix"  Lmix   )
desVar(   "pacmag" pacmag    )
desVar(   "RdcpI" Rdecap  )
desVar(   "RdcpQ" Rdecap   )
desVar(   "Rmatch"  Rmatch   )
desVar(   "Rp"  Rp      )
desVar(   "vdsBias"  vdsBias       )
desVar(   "vgsBias"  vgsBias        )
desVar(   "vgsn"  vgsn   )
desVar(   "Wbias" Wbias    )
desVar(   "Wf1" Wf1     )
desVar(   "Wfmix" Wfmix   )

/****************************** Iout vs Rp  - Find best value for Rp *********************************************/
/*
analysis('hbac ?outType "Voltage"  ?start Freq  ?stop ""
                ?maxsideband "8"  )
analysis('hb ?autoharms ""  ?autotstab "yes"  ?oversample list("1")
                ?funds list("FLO")  ?maxharms list("8")  ?freqdivide ""  ?param "Rp"
                ?start "100"  ?stop "2K"  ?sweepStep "20"  ?lsspDisplayHarmonic ""
                ?displayHarmonic ""  )
envOption(
        'analysisOrder  list("hb" "hbac")
)
option( ?categ 'turboOpts
	'uniMode  "APS" 

save( 'i "/IPRB5/MINUS" "/IPRB6/MINUS" "/PORT_out_I/PLUS" "/PORT_out_I/MINUS" "/PORT_out_Q/PLUS" "/PORT_out_Q/MINUS" )
temp( 27 )
run()

Iout_vs_Rp = (ih('hbac "/PORT_out_I/PLUS" '-1) - ih('hbac "/PORT_out_I/MINUS" '-1))
plot( Iout_vs_Rp ?expr '( "Iout_vs_Rp" ) )

/************************** Iout, Irf  - I PATH ******************************************************************/
/*
analysis('hbac ?outType "Voltage"  ?start Freq  ?stop ""
                ?maxsideband "8"  )
analysis('hb ?autoharms ""  ?autotstab "yes"  ?oversample list("1")
                ?funds list("FLO")  ?maxharms list("8")  ?freqdivide ""  ?param "Rp"
                ?start "100"  ?stop "2K"  ?sweepStep "20"  ?lsspDisplayHarmonic ""
                ?displayHarmonic ""  )
envOption(
        'analysisOrder  list("hb" "hbac")
)
option( ?categ 'turboOpts
	'uniMode  "APS" 

save( 'i "/IPRB5/MINUS" "/IPRB6/MINUS" "/PORT_out_I/PLUS" "/PORT_out_I/MINUS" "/PORT_out_Q/PLUS" "/PORT_out_Q/MINUS" )
temp( 27 )
run()

Irf_I = value(ih('hbac "/IPRB5/MINUS") '"Rp" '400)
plot( Irf_I ?expr '( "Irf_I" ) )
;Iout_I = value((ih('hbac "/PORT_out_I/MINUS")  '"Rp" '400)
Iout_I = value((ih('hbac "/PORT_out_I/MINUS") - ih('hbac "/PORT_out_I/PLUS")) '"Rp" '400)
plot( Iout_I ?expr '( "Iout_I" ) )

/****************************** Iout, Irf   -  Q PATH **********************************************************/
/*
analysis('hbac ?outType "Voltage"  ?start Freq  ?stop ""
                ?maxsideband "8"  )
analysis('hb ?autoharms ""  ?autotstab "yes"  ?oversample list("1")
                ?funds list("FLO")  ?maxharms list("8")  ?freqdivide ""  ?param "Rp"
                ?start "100"  ?stop "2K"  ?sweepStep "20"  ?lsspDisplayHarmonic ""
                ?displayHarmonic ""  )
envOption(
        'analysisOrder  list("hb" "hbac")
)
option( ?categ 'turboOpts
	'uniMode  "APS" 

save( 'i "/IPRB5/MINUS" "/IPRB6/MINUS" "/PORT_out_I/PLUS" "/PORT_out_I/MINUS" "/PORT_out_Q/PLUS" "/PORT_out_Q/MINUS" )
temp( 27 )
run()

Iout_Q = value((ih('hbac "/PORT_out_Q/PLUS") - ih('hbac "/PORT_out_Q/MINUS")) '"Rp" '400)
plot( Iout_Q ?expr '( "Iout_Q" ) )
Irf_q = value(ih('hbac "/IPRB6/MINUS") '"Rp" '400)
plot( Irf_q ?expr '( "Irf_q" ) )

/*************************** Iout vs Wmix  - Find best Mixer Width for the value of Rp calculated before ****************/

Wmix_min = 5u
Wmix_max = 150u
Wfmix_min = Wmix_min/5
Wfmix_max = Wmix_max/5
Rpmin = 100
Rpmax = 2K
Rpstep = 100
Rp = 400
desVar(   "Rp"  Rp  )

analysis('hbac ?outType "Voltage"  ?start Freq  ?stop ""
                ?maxsideband "8"  )
analysis('hb ?autoharms ""  ?autotstab "yes"  ?oversample list("1")
                ?funds list("FLO")  ?maxharms list("8")  ?freqdivide ""  ?param "Wfmix"
                ?start Wfmix_min  ?stop Wfmix_max  ?sweepStep "5u"  ?lsspDisplayHarmonic ""
                ?displayHarmonic ""  )
envOption(
        'analysisOrder  list("hb" "hbac")
)
option( ?categ 'turboOpts
	'uniMode  "APS" 

save( 'i "/IPRB5/MINUS" "/IPRB6/MINUS" "/PORT_out_I/PLUS" "/PORT_out_I/MINUS" "/PORT_out_Q/PLUS" "/PORT_out_Q/MINUS" )
temp( 27 )
run()

paramAnalysis("Rp" ?start Rpmin ?stop Rpmax ?step Rpstep)
paramRun()
Iout_vs_Wmix = (ih('hbac "/PORT_out_I/PLUS" '-1) - ih('hbac "/PORT_out_I/MINUS" '-1))
plot( Iout_vs_Wmix ?expr '( "Iout_vs_Wmix Rp " ) )
