simulator( 'spectre )
design(	 "test"	"fingers_top_test"	"schematic")
resultsDir( "/afs/kth.se/home/p/a/pancha/simulation/fingers_top_test/spectre/schematic" )
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

W1 = 6u
W2 = 1u
W3 = 2u
nf1 = 1
nf2 = 6
nf3 = 3


analysis('dc ?saveOppoint t  )

desVar(	  "W3" W3	)
desVar(	  "W2" W2	)
desVar(	  "W1" W1	)
desVar(	  "nf3" nf3	)
desVar(	  "nf2" nf2	)
desVar(	  "nf1" nf1	)
desVar(	  "IDC" 50u	)
desVar(	  "VDS" 900m	)


envOption(
	'analysisOrder  list("dc") 
)

temp( 27 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

vgs1BOT= getData("MnBot1")->vgs
Vth1BOT = getData("MnBot1")->vth
gm1BOT = getData("MnBot1")->gm
rds1BOT = 1./(getData("MnBot1")->gds)
cgs1BOT = 1e15*mag(getData("MnBot1")->cgs)
cgd1BOT = 1e15*mag(getData("MnBot1")->cgd)

vgs2BOT= getData("MnBot2")->vgs
Vth2BOT = getData("MnBot2")->vth
gm2BOT = getData("MnBot2")->gm
rds2BOT = 1./(getData("MnBot2")->gds)
cgs2BOT = 1e15*mag(getData("MnBot2")->cgs)
cgd2BOT = 1e15*mag(getData("MnBot2")->cgd)

vgs3BOT= getData("MnBot3")->vgs
Vth3BOT = getData("MnBot3")->vth
gm3BOT = getData("MnBot3")->gm
rds3BOT = 1./(getData("MnBot3")->gds)
cgs3BOT = 1e15*mag(getData("MnBot3")->cgs)
cgd3BOT = 1e15*mag(getData("MnBot3")->cgd)

vgs1TOP= getData("MnTop1")->vgs
Vth1TOP = getData("MnTop1")->vth
gm1TOP = getData("MnTop1")->gm
rds1TOP = 1./(getData("MnTop1")->gds)
cgs1TOP = 1e15*mag(getData("MnTop1")->cgs)
cgd1TOP = 1e15*mag(getData("MnTop1")->cgd)

vgs2TOP= getData("MnTop2")->vgs
Vth2TOP = getData("MnTop2")->vth
gm2TOP = getData("MnTop2")->gm
rds2TOP = 1./(getData("MnTop2")->gds)
cgs2TOP = 1e15*mag(getData("MnTop2")->cgs)
cgd2TOP = 1e15*mag(getData("MnTop2")->cgd)

vgs3TOP= getData("MnTop3")->vgs
Vth3TOP = getData("MnTop3")->vth
gm3TOP = getData("MnTop3")->gm
rds3TOP = 1./(getData("MnTop3")->gds)
cgs3TOP = 1e15*mag(getData("MnTop3")->cgs)
cgd3TOP = 1e15*mag(getData("MnTop3")->cgd)



printf("\n\n\n******************************\n")
printf("*        BOTTOM TIER         *  \n")
printf("******************************\n\n")

printf("FINGERS = 1\n W1 = %4.3fu W1_tot = %4.3fu L1 = 500n Ids = 50u VDS = 900mV VGS = %4.3fV \n" 1e6*W1 1e6*W1*nf1 vgs1BOT )
printf(" gm = %4.3fm\n rds = %4.2f\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n\n" 1e3*gm1BOT rds1BOT cgd1BOT cgs1BOT Vth1BOT)

printf("FINGERS = 2\n W2 = %4.3fu W2_tot = %4.3fu L2 = 500n Ids = 50u VDS = 900mV VGS = %4.3fV \n" 1e6*W2 1e6*W2*nf2 vgs2BOT )
printf(" gm = %4.3fm\n rds = %4.2f\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n\n" 1e3*gm2BOT rds2BOT cgd2BOT cgs2BOT Vth2BOT)

printf("FINGERS = 3\n W2 = %4.3fu W2_tot = %4.3fu L3 = 500n Ids = 50u VDS = 900mV VGS = %4.3fV \n" 1e6*W3 1e6*W3*nf3 vgs3BOT )
printf(" gm = %4.3fm\n rds = %4.2f\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n\n" 1e3*gm3BOT rds3BOT cgd3BOT cgs3BOT Vth3BOT)


printf("\n\n\n******************************\n")
printf("*         TOP  TIER          *  \n")
printf("******************************\n\n")

printf("FINGERS = 1\n W1 = %4.3fu W1_tot = %4.3fu L1 = 500nn Ids = 50u VDS = 900mV VGS = %4.3fV \n" 1e6*W1 1e6*W1*nf1 vgs1TOP )
printf("gm = %4.3fm\n rds = %4.2f\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n\n" 1e3*gm1TOP rds1TOP cgd1TOP cgs1TOP Vth1TOP)

printf("FINGERS = 2\n W2 = %4.3fu W2_tot = %4.3fu L2 = 500n Ids = 50u VDS = 900mV VGS = %4.3fV \n" 1e6*W2 1e6*W2*nf2 vgs2TOP )
printf("gm = %4.3fm\n rds = %4.2f\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n\n" 1e3*gm2TOP rds2TOP cgd2TOP cgs2TOP Vth2TOP)

printf("FINGERS = 3\n W2 = %4.3fu W3_tot = %4.3fu L3 = 500n Ids = 50u VDS = 900mV VGS = %4.3fV \n" 1e6*W3 1e6*W3*nf3 vgs3TOP )
printf("gm = %4.3fm\n rds = %4.2f\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n\n" 1e3*gm3TOP rds3TOP cgd3TOP cgs3TOP Vth3TOP)