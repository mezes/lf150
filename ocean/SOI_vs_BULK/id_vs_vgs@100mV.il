simulator( 'spectre )
design(	 "UTSOI_model"  "Ids_VGS_@100mV_sc" "schematic")
resultsDir( "/home/pancha/simulation/Ids_VGS_@100mV_sc/spectre/schematic" )
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
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150hv.scs" "tt_ldmos_5")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150hv.scs" "tt_ldmos_40")
    '("/PDKs/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150hv.scs" "tt_ldmosrf_5")
)
analysis('dc ?saveOppoint t ?hysteresis t  ?param "VGS"  ?start "0"  
		?stop "1"  )
Lo = 350n



/**********************************************************************************************
;Ids vs Vgs										      *
***********************************************************************************************/
/*
VDSo = 100m

desVar(	  "VDS" VDSo	)
desVar(	  "VGS" 1	)
desVar(	  "L1"  Lo      )

envOption(
	'analysisOrder  list("dc") 
)

save( 'i "/M0/D" "/I0/D" )

temp( 27 ) 

run()

selectResult( 'dc )

Ibulk=getData("/M0/D")
Isoi=getData("/I0/D")

plot(getData("/M0/D") getData("/I0/D") )

/**********************************************************************************************
;Cgs vs Vgs										      *
***********************************************************************************************/

VDSo = 0.0

desVar(	  "VDS" VDSo	)
desVar(	  "VGS" 1	)
desVar(	  "L1"  Lo      )

envOption(
	'analysisOrder  list("dc") 
)

temp( 25 ) 

paramAnalysis("VGS" ?values '(0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8)
)

paramRun()

CGG = OP("/I0" "cgg")
plot( CGG ?expr '( "CGG" ) )
