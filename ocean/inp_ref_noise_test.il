simulator( 'spectre )

Fmin = 10.0000
Fmax = 20.0000G

design(	 "test"		"inp_ref_noise_test"	"schematic"	)
resultsDir( "/afs/kth.se/home/p/a/pancha/simulation/inp_ref_noise_test/spectre/schematic" )

createNetlist

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

IDS1 = 100u
L1 = 500n
nf1 = 1
VDS1 = 500m
W1_tot = 30u
W1 = W1_tot/nf1

/***********************************************************************************/
/*			TOP TIER INPUT REFERRED VOLTAGE NOISE			   */
/***********************************************************************************/

analysis('dc ?saveOppoint t  )
analysis('noise ?start "10"  ?stop "20G"  ?oprobe "/IPRB_top_v"  
		?iprobe "/VinTop"  )

desVar(	  "IDS" IDS1	)
desVar(	  "L1" L1	)
desVar(	  "nf1" nf1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W1" W1	)

envOption(
	'analysisOrder  list("dc" "noise") 
)

temp( 27 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

vgs1 = getData("MnTopV")->vgs
gm1 = getData("MnTopV")->gm
rds1 = 1./(getData("MnTopV")->gds)
cgs1 = 1e15*mag(getData("MnTopV")->cgs)
cgd1 = 1e15*mag(getData("MnTopV")->cgd)

vn_in_Top = getData("in" ?result "noise")
plot( vn_in_Top ?expr '( "Input noise Voltage V"))

noiseSummary( 'integrated ?result "noise" ?noiseUnit "V" ?from Fmin ?to Fmax )

vn_in_2 = pow(vn_in_Top,2)
FBand = Fmax - Fmin
VN_Noise_2 = integ( vn_in_2, Fmin, Fmax)/FBand
VN_Noise = sqrt(VN_Noise_2)

printf("gm = %4.3fm\n rds = %4.2fK\n cgd = %4.2ff\n cgs = %4.2ff\n " 1e3*gm1 rds1/1e3 cgd1 cgs1 )

printf("AVERAGE INPUT REFERRED NOISE VOLTAGE = %4.2e V/sqrt(Hz) \n" VN_Noise)
printf("From: %4.2eHz to %4.2eHz" Fmin Fmax)


/***********************************************************************************/
/*			TOP TIER INPUT REFERRED CURRENT NOISE			   */
/***********************************************************************************/
/*
analysis('dc ?saveOppoint t  )
analysis('noise ?start "10"  ?stop "20G"  ?oprobe "/IPRB_top_i"  
		?iprobe "/IinTop"  )

desVar(	  "IDS" IDS1	)
desVar(	  "L1" L1	)
desVar(	  "nf1" nf1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W1" W1	)

envOption(
	'analysisOrder  list("dc" "noise") 
)

temp( 27 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

vgs1 = getData("MnTopI")->vgs
gm1 = getData("MnTopI")->gm
rds1 = 1./(getData("MnTopI")->gds)
cgs1 = 1e15*mag(getData("MnTopI")->cgs)
cgd1 = 1e15*mag(getData("MnTopI")->cgd)

in_in_Top = getData("in" ?result "noise")
plot( in_in_Top ?expr '( "Input noise Current A"))

noiseSummary( 'integrated ?result "noise" ?noiseUnit "A" ?from Fmin ?to Fmax )

in_in_2 = pow(in_in_Top,2)
FBand = Fmax - Fmin
IN_Noise_2 = integ( in_in_2, Fmin, Fmax)/FBand
IN_Noise = sqrt(IN_Noise_2)

printf("gm = %4.3fm\n rds = %4.2fK\n cgd = %4.2ff\n cgs = %4.2ff\n " 1e3*gm1 rds1/1e3 cgd1 cgs1 )

printf("AVERAGE INPUT REFERRED NOISE CURRENT = %4.2e A/sqrt(Hz) \n" IN_Noise)
printf("From: %4.2eHz to %4.2eHz" Fmin Fmax)

/***********************************************************************************/
/*		     BOTTOM TIER INPUT REFERRED VOLTAGE NOISE			   */
/***********************************************************************************/
/*
analysis('dc ?saveOppoint t  )
analysis('noise ?start "10"  ?stop "20G"  ?oprobe "/IPRB_bot_v"  
		?iprobe "/VinBot"  )

desVar(	  "IDS" IDS1	)
desVar(	  "L1" L1	)
desVar(	  "nf1" nf1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W1" W1	)

envOption(
	'analysisOrder  list("dc" "noise") 
)

temp( 27 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

vgs1 = getData("MnBotV")->vgs
gm1 = getData("MnBotV")->gm
rds1 = 1./(getData("MnBotV")->gds)
cgs1 = 1e15*mag(getData("MnBotV")->cgs)
cgd1 = 1e15*mag(getData("MnBotV")->cgd)

vn_in_Bot = getData("in" ?result "noise")
plot( vn_in_Bot ?expr '( "Input noise Voltage V"))

noiseSummary( 'integrated ?result "noise" ?noiseUnit "V" ?from Fmin ?to Fmax )

vn_in_2 = pow(vn_in_Bot,2)
FBand = Fmax - Fmin
VN_Noise_2 = integ( vn_in_2, Fmin, Fmax)/FBand
VN_Noise = sqrt(VN_Noise_2)

printf("gm = %4.3fm\n rds = %4.2fK\n cgd = %4.2ff\n cgs = %4.2ff\n " 1e3*gm1 rds1/1e3 cgd1 cgs1 )

printf("AVERAGE INPUT REFERRED NOISE VOLTAGE = %4.2e V/sqrt(Hz) \n" VN_Noise)
printf("From: %4.2eHz to %4.2eHz" Fmin Fmax)

/***********************************************************************************/
/*		   BOTTOM TIER INPUT REFERRED CURRENT NOISE			   */
/***********************************************************************************/
/*
analysis('dc ?saveOppoint t  )
analysis('noise ?start "10"  ?stop "20G"  ?oprobe "/IPRB_bot_i"  
		?iprobe "/IinBot"  )

desVar(	  "IDS" IDS1	)
desVar(	  "L1" L1	)
desVar(	  "nf1" nf1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W1" W1	)

envOption(
	'analysisOrder  list("dc" "noise") 
)

temp( 27 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

vgs1 = getData("MnBotI")->vgs
gm1 = getData("MnBotI")->gm
rds1 = 1./(getData("MnBotI")->gds)
cgs1 = 1e15*mag(getData("MnBotI")->cgs)
cgd1 = 1e15*mag(getData("MnBotI")->cgd)

in_in_Bot = getData("in" ?result "noise")
plot( in_in_Bot ?expr '( "Input noise Current A"))

noiseSummary( 'integrated ?result "noise" ?noiseUnit "A" ?from Fmin ?to Fmax )

in_in_2 = pow(in_in_Bot,2)
FBand = Fmax - Fmin
IN_Noise_2 = integ( in_in_2, Fmin, Fmax)/FBand
IN_Noise = sqrt(IN_Noise_2)

printf("gm = %4.3fm\n rds = %4.2fK\n cgd = %4.2ff\n cgs = %4.2ff\n " 1e3*gm1 rds1/1e3 cgd1 cgs1 )

printf("AVERAGE INPUT REFERRED NOISE CURRENT = %4.2e A/sqrt(Hz) \n" IN_Noise)
printf("From: %4.2eHz to %4.2eHz" Fmin Fmax)
