simulator( 'spectre )
design(  "/home/pancha/simulation/LNA_impl1_IP3c_ideal_vsource/spectre/schematic/netlist/netlist")
resultsDir( "/home/pancha/simulation/LNA_impl1_IP3c_ideal_vsource/spectre/schematic" )
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
analysis('ac ?start "2.4G"  ?stop "2402.5M"  ?out2 ""
                ?out1 "/PORT_OUT_I/PLUS"  ?maxharm_nonlin "5"  ?flin_out "2402.5M"  ?fim_out "2397.5M"
                ?rfdbm3 ""  ?rfdbm2 ""  ?rfdbm "-40"  ?rf2_src list("/PORT_INP")
                ?rf1_src list("/PORT_INP")  ?srcType "port"  ?perturbation "ip3"  ?special "Rapid IP3"  )
desVar(   "C0" 760f     )
desVar(   "C1" 100p     )
desVar(   "Cdecap" 5p   )
desVar(   "CdecapIN" 15p        )
desVar(   "CdecapMatch" 15p     )
desVar(   "frf1" 2.4G   )
desVar(   "IBIAS" 1.2m  )
desVar(   "L1" 150n     )
desVar(   "Lbias" 250n  )
desVar(   "prf" -40     )
desVar(   "Rmatch" 50   )
desVar(   "Rout" 300    )
desVar(   "vdsBias" 450m        )
desVar(   "vdsn" 450m   )
desVar(   "vgsBias" 508m        )
desVar(   "vgsn" 456m   )
desVar(   "Wbias" 16u   )
desVar(   "Wf1" 16u     )
envOption(
        'analysisOrder  list("ac")
)
save( 'i "/PORT_OUT_I/PLUS" )
temp( 27 )
run()
AC\ Rapid\ IIP3\ Results = _drplRapidIIPN("ac_ip3")
plot( AC\ Rapid\ IIP3\ Results ?expr '( "AC Rapid IIP3 Results" ) )
AC\ Rapid\ IP3\ Results = _drplRapidIPNCurves("ac_ip3")
plot( AC\ Rapid\ IP3\ Results ?expr '( "AC Rapid IP3 Results" ) )
