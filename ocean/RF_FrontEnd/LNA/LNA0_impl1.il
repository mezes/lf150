simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1"    "schematic")
resultsDir( "/home/pancha/simulation/LNA_impl1/spectre/schematic" )
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
 Vac_in	= 1
RL	= 500
Vac	= 1
C0	= 682f-cgs-cgd-cds - 55f
C1	= 100*C0

analysis('ac ?start "2.2G"  ?stop "2.6G"  )
desVar(	  "C0" C0	)
desVar(	  "C1" C1	)
desVar(	  "cds1" cds	)
desVar(	  "cds2" cds	)
desVar(	  "cgd1" cgd	)
desVar(	  "cgd2" cgd	)
desVar(	  "cgs1" cgs	)
desVar(	  "cgs2" cgs	)
desVar(	  "gm1"  gm	)
desVar(	  "gm2"  gm	)
desVar(	  "rds1" rds	)
desVar(	  "rds2" rds	)
desVar(	  "RL"   RL	)
desVar(	  "Vac"  Vac	)

envOption(
	'analysisOrder  list("ac") 
)

save( 'i "/IPRB0/MINUS" "/IPRB1/MINUS" )

temp( 27 ) 
run()

selectResult( 'ac )

plot(getData("/IPRB0/MINUS") getData("/IPRB1/MINUS") )

printf("\n\n\n******************************")
printf("*      Degeneration Capacitance       *  ")
printf("******************************")

printf("C0 = %4.2ff" C0*1e15)
printf("C1 = %4.2fp" C1*1e12)