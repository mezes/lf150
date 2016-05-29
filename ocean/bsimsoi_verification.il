simulator( 'spectre )
design(	 "test"	"nmos_top_sim"	"schematic" )
resultsDir( "/afs/kth.se/home/p/a/pancha/simulation/nmos_top_sim/spectre/schematic" )
modelFile( 
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_hs")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_ll")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_na")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_3")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "tt_5")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "res_typ")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "mim_typ")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "bjt_t")
    '("/afs/ict.kth.se/proj/ektlab/PDK/LFOUNDRY2/PDK_LF150i_V2_0_0/analog/models/spectre/lf150.scs" "dio_t")
)
analysis('dc ?saveOppoint t  ?param "VD"  ?start "0"  
		?stop "1.8"  )

VD1 = 1.8
VG1 = 1

/*
nmosBottom:
gm = 0.383m
 rds = 133415.06
 cdb = 0.41f
 cgs = 1.93f
 cgd = 0.17f
 vth = 0.3677



nmosTop:
gm = 0.390m
 rds = 59632.31
 cdb = 0.36f
 cgs = 1.92f
 cgd = 0.17f
 vth = 0.0728

nmosBottom:
gm = 0.383m
 rds = 133415.06
 cdb = 0.41f
 cgs = 1.93f
 cgd = 0.17f
 vth = 0.3677



nmosTop:
gm = 0.350m
 rds = 97588.27
 cdb = 0.47f
 cgs = 1.85f
 cgd = 0.17f
 vth = 0.3547
*/
desVar(	  "VD" VD1	)
desVar(	  "VG" VG1	)
envOption(
	'analysisOrder  list("dc") 
)
save( 'i "/M0/D" "/I0/D" )

temp( 27 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

gmBottom = getData("M0")->gm
rdsBottom = 1./(getData("M0")->gds)
VthBottom = getData("M0")->vth
cdbBottom = 1e15*mag(getData("M0")->cdb)
cbdBottom = 1e15*mag(getData("M0")->cbd)
cgsBottom = 1e15*mag(getData("M0")->cgs)
cgdBottom = 1e15*mag(getData("M0")->cgd)

gmTop = getData("I0")->gm 
rdsTop = 1./(getData("I0")->gds)
VthTop = getData("I0")->vth
cdbTop = 1e15*mag(getData("I0")->cdb)
cbdTop = 1e15*mag(getData("I0")->cbd)
cgsTop = 1e15*mag(getData("I0")->cgs)
cgdTop = 1e15*mag(getData("I0")->cgd)

printf("\n\n\n******************************\n")
printf("* BSIMSOI VALIDATION RESULTS *  \n")
printf("******************************\n\n")

printf("nmosBottom:\n")
printf("gm = %4.3fm\n rds = %4.2f\n cdb = %4.2ff\n cbd = %4.2ff\n cgs = %4.2ff\n cgd = %4.2ff\n vth = %5.4f\n" 1e3*gmBottom rdsBottom cdbBottom cbdBottom cgsBottom cgdBottom VthBottom)

printf("\n\n\nnmosTop:\n")
printf("gm = %4.3fm\n rds = %4.2f\n cdb = %4.2ff\n cbd = %4.2ff\n cgs = %4.2ff\n cgd = %4.2ff\n vth = %5.4f\n" 1e3*gmTop rdsTop cdbTop cbdTop cgsTop cgdTop VthTop)