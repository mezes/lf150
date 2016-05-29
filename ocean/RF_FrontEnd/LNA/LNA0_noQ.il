simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl0_no_Q"    "schematic")
resultsDir( "/home/pancha/simulation/LNA_impl0_no_Q/spectre/schematic" )
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

;nmosTop: W1tot = 60.000u L1 = 150.000n Ids = 800.000u VDS = 0.500V VGS = 0.446V 
gm = 12.516m
 rds = 2547.19
 Gain = 31.880
 cdb = 0.86f
 cds = 11.35f
 cgd = 17.71f
 cgs = 47.72f
 vth = 0.3389
 veff = 107.45m
 Ft = 30440.92M
 RL	= 500
 C0_dgn	= 682f
 Vac_in	= 1	

analysis('ac ?start "2.2G"  ?stop "2.6G"  )

desVar(	  "cds1" cds	)
desVar(	  "cgd1" cgd	)
desVar(	  "cgs1" cgs	)
desVar(	  "gm1"  gm	)
desVar(	  "rds1" rds	)
desVar(	  "RL"   RL	)
desVar(	  "C0"   C0_dgn	)
desVar(	  "Vac"  Vac_in	)

envOption(
	'analysisOrder  list("ac") 
)

save( 'i "/IPRB0/PLUS" )
temp( 25 ) 

run()

selectResult( 'ac )

plot(getData("/IPRB0/PLUS") )

