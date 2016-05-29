simulator( 'spectre )
design(	 "test"		"nmos_ac"	"schematic")
resultsDir( "/afs/kth.se/home/p/a/pancha/simulation/nmos_ac/spectre/schematic" )
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

createNetlist

;;nmosBottom: 
W1 = 10.000u 
L1 = 200.000n 
Ids = 200.000u 
VDS = 0.800 
VGSbot = 0.499 
;;gm = 2.666m
;; rds = 21076.20
;; Gain = 56.200
;; cdb = 8.33f
;; cgd = 4.37f
;; cgs = 20.10f
;; vth = 0.4170
;; Ft = 17345.65M


;;nmosTop: W1 = 10.000u L1 = 200.000n Ids = 200.000u VDS = 0.800V 
VGStop = 0.555 
;;gm = 2.967m
;; rds = 33560.74
;; Gain = 99.572
;; cdb = 0.12f
;; cgd = 0.66f
;; cgs = 20.20f
;; vth = 0.4665
;; Ft = 22636.26M


analysis('dc ?saveOppoint t  )
analysis('ac ?start "1"  ?stop "10G"  )

desVar(	  "IDC" Ids	)
desVar(	  "L1" L1	)
desVar(	  "VinAC" 1	)
desVar(	  "VinDCbot" VGSbot	)
desVar(	  "VinDCtop" VGStop	)
desVar(	  "W1" W1	)

envOption(
	'analysisOrder  list("dc" "ac") 
)

temp( 27 ) 

run()


selectResult( 'ac )

VoutBOT = v("/VOUTbot" ?result "ac")
VoutTOP = v("/VOUTtop" ?result "ac")

plot(VoutBOT ?expr '("VoutBOT") )
plot(VoutTOP ?expr '("VoutTOP")  )

BWbot = bandwidth(VoutBOT 3 "low")
BWtop = bandwidth(VoutTOP 3 "low")

printf("\nBWtop = %4.3fM\nBWbot = %4.3fM\n" BWtop/1.0e+006 BWbot/1.0e+006 )

