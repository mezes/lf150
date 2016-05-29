simulator( 'spectre )
design(	 "test"	"nmos_pmos_bias2"	"schematic")
resultsDir( "/home/pancha/simulation/nmos_ac_comp/spectre/schematic" )
modelFile( 
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "tt_hs")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "tt_ll")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "tt_na")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "tt_3")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "tt_5")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "res_typ")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "mim_typ")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "bjt_t")
    '("$LF150_HOME/analog/models/spectre/lf150.scs" "dio_t")
)

createNetlist

IDS1 = 300u
VDS1 = 500m
W1tot = 10u
W1 = W1tot/5
L1 = 150n

analysis('dc ?saveOppoint t  )

desVar(	  "IDSbot" IDS1	)
;desVar(	  "IDStop" IDS1	)
desVar(	  "VDSbot" VDS1	)
;desVar(	  "VDStop" VDS1	)
desVar(	  "W1" W1	)
desVar(	  "L1" L1	)


envOption(
	'analysisOrder  list("dc") 
)

temp( 25 ) 

run()

selectResult( 'dc )
selectResult( 'dcOpInfo )

vgsBottom = getData("MnBOT")->vgs
VthBottom = getData("MnBOT")->vth
gmBottom = getData("MnBOT")->gm
rdsBottom = 1./(getData("MnBOT")->gds)
GainBot = gmBottom*rdsBottom
cdbBottom = 1e15*mag(getData("MnBOT")->cdb)
cgsBottom = 1e15*mag(getData("MnBOT")->cgs)
cgdBottom = 1e15*mag(getData("MnBOT")->cgd)
FtBottom = gmBottom/(2*3.1415927*(cgsBottom+cgdBottom))*1e15

vgspBottom = mag(getData("MpBOT")->vgs)
VthpBottom = mag(getData("MpBOT")->vth)
gmpBottom = getData("MpBOT")->gm
rdspBottom = 1./(getData("MpBOT")->gds)
GainpBot = gmpBottom*rdspBottom
cdbpBottom = 1e15*mag(getData("MpBOT")->cdb)
cgspBottom = 1e15*mag(getData("MpBOT")->cgs)
cgdpBottom = 1e15*mag(getData("MpBOT")->cgd)
FtpBottom = gmpBottom/(2*3.1415927*(cgspBottom+cgdpBottom))*1e15

;vgsTop = getData("MnTOP")->vgs
;VthTop = getData("MnTOP")->vth
;gmTop = getData("MnTOP")->gm
;rdsTop = 1./(getData("MnTOP")->gds)
;GainTop = gmTop*rdsTop
;cdbTop = 1e15*mag(getData("MnTOP")->cdb)
;cgsTop = 1e15*mag(getData("MnTOP")->cgs)
;cgdTop = 1e15*mag(getData("MnTOP")->cgd)
;FtTop = gmTop/(2*3.1415927*(cgsTop+cgdTop))*1e15

;vgspTop = getData("MpTOP")->vgs
;VthpTop = getData("MpTOP")->vth
;gmpTop = getData("MpTOP")->gm
;rdspTop = 1./(getData("MpTOP")->gds)
;GainpTop = gmpTop*rdspTop
;cdbpTop = 1e15*mag(getData("MpTOP")->cdb)
;cgspTop = 1e15*mag(getData("MpTOP")->cgs)
;cgdpTop = 1e15*mag(getData("MpTOP")->cgd)
;FtpTop = gmpTop/(2*3.1415927*(cgspTop+cgdpTop))*1e15

printf("\n\n\n******************************\n")
printf("*      BIASING RESULTS       *  \n")
printf("******************************\n\n")

printf("nmosBottom: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgsBottom )
printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n Ft = %4.2fM\n" 1e3*gmBottom rdsBottom GainBot cdbBottom cgdBottom cgsBottom VthBottom FtBottom/1e6)

printf("\n\npmosBottom: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgspBottom )
printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n Ft = %4.2fM\n" 1e3*gmpBottom rdspBottom GainpBot cdbpBottom cgdpBottom cgspBottom VthpBottom FtpBottom/1e6)

;printf("\n\nnmosTop: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgsTop )
;printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n Ft = %5.2fM" 1e3*gmTop rdsTop GainTop cdbTop cgdTop cgsTop VthTop FtTop/1e6)

;printf("\n\npmosTop: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgspTop )
;printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n Ft = %5.2fM" 1e3*gmpTop rdspTop GainpTop cdbpTop cgdpTop cgspTop VthpTop FtpTop/1e6)