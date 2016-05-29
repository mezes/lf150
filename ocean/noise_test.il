simulator( 'spectre )

Flow = 10.000
Fhigh = 20e9

design(	 "test"		"noise_test"	"schematic"	)

resultsDir( "/afs/kth.se/home/p/a/pancha/simulation/noise_test/spectre/schematic" )

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
VDS1 = 900m
W1_total = 30u
nf1 = 3
W1 = W1_total/nf1


createNetlist

desVar(	  "IDS" IDS1	)
desVar(	  "L1" L1	)
desVar(	  "VDS" VDS1	)
desVar(	  "W1" W1	)
desVar(    "nf1" nf1      )

/****************************************************************************************/
/*		AVERAGE INPUT REFERREF VOLTAGE NOISE BOTTOM TIER		        */
/****************************************************************************************/

analysis('dc ?saveOppoint t  )

analysis('noise ?start Flow  ?stop Fhigh  ?dec "10"  
		?oprobe "/Ibot"  ?iprobe "/Vin_bot"  )


envOption(
	'analysisOrder  list("dc" "noise") 
)

temp( 27 ) 

run()

vn_in = getData("in" ?result "noise")

plot( vn_in ?expr '( "Input noise Voltage V"))

noiseSummary( 'integrated ?result "noise" ?noiseUnit "V" ?from Flow ?to Fhigh )

vn_in_2 = pow(vn_in,2)
NBand = Fhigh - Flow
VN_Noise_2 = integ( vn_in_2, Flow, Fhigh)/NBand
VN_Noise = sqrt(VN_Noise_2)

printf("AVERAGE INPUT REFERRED NOISE Voltage = %4.2e V/sqrt(Hz) \n" VN_Noise)
printf("From: %4.2eHz to %4.2eHz" Flow Fhigh)