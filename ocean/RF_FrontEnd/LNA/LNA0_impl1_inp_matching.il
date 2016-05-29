simulator( 'spectre )

design(	 "RF_FrontEnd"	"LNA_impl1_inp_matching"    "schematic"   )
resultsDir( "/home/pancha/simulation/LNA_impl1_inp_matching/spectre/schematic" )
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

analysis('sp ?ports list("/PORT0" "/PORT1")  ?start "1G"  ?stop "5G"  
		?donoise "yes"  ?oprobe "/PORT1"  ?iprobe "/PORT0"  )

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
Rmatch  = 50
Lmatch  = 0
amp1    = -20
freq   =  2.4G

desVar(	  "Rmatch" Rmatch	)
desVar(	  "amp1"   amp1	)
desVar(	  "C1"     C1	)
desVar(	  "freq1"  freq	)
desVar(	  "C0"     C0	)
desVar(	  "cds1"   cds	)
desVar(	  "cds2"   cds	)
desVar(	  "cgd1"   cgd	)
desVar(	  "cgd2"   cgd	)
desVar(	  "cgs1"   cgs	)
desVar(	  "cgs2"   cgs	)
desVar(	  "gm1"    gm	)
desVar(	  "gm2"    gm	)
desVar(	  "rds1"   rds	)
desVar(	  "rds2"   rds	)
desVar(	  "RL"     RL	)
desVar(	  "Vac"    Vac_in	)
desVar(   "Lmatch" Lmatch )
envOption(
	'analysisOrder  list("sp") 
)

temp( 27 ) 

paramAnalysis("Rmatch" ?values '(20 30 50 70 100 200 500 1000)
)

paramRun()

S11\ dB20 = db(spm('sp 1 1))
plot( S11\ dB20 ?expr '( "S11 dB20" ) )

GT\ dB10 = db10(gt(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GT\ dB10 ?expr '( "GT dB10" ) )

GA\ dB10 = db10(ga(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GA\ dB10 ?expr '( "GA dB10" ) )

GP\ dB10 = db10(gp(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp")))
plot( GP\ dB10 ?expr '( "GP dB10" ) )

NF\ dB10 = db10(getData("F" ?result "sp_noise"))
plot( NF\ dB10 ?expr '( "NF dB10" ) )

NFmin\ dB10 = db10(getData("Fmin" ?result "sp_noise"))
plot( NFmin\ dB10 ?expr '( "NFmin dB10" ) )

Kf\  = kf(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp"))
plot( Kf\  ?expr '( "Kf " ) )

B1f\  = b1f(sp(1 1 ?result "sp") sp(1 2 ?result "sp") sp(2 1 ?result "sp") sp(2 2 ?result "sp"))
plot( B1f\  ?expr '( "B1f " ) )
