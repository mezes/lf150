simulator( 'spectre )
design(	 "TopBiasing"	"biasing"	"schematic")
resultsDir( "/home/pancha/simulation/biasing/spectre/schematic" )
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

/*Input Transistor*/
;NMOS

IDS1 =170u
VDS1 = 500m
W1tot = 90u
W1 = W1tot/5
L1 = 1000n

;PMOS
/*
IDS1 =30u
VDS1 = 792m
W1tot = 60u
W1 = W1tot/5
L1 = 2u
*/
/*Bias Transistor*/
/*
IDS1 = 800u
VDS1 = 400m
W1tot = 30u
W1 = W1tot/5
L1 = 250n 
*/
analysis('dc ?saveOppoint t  )

desVar(	  "IDS" IDS1	)
desVar(	  "VDS" VDS1	)
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
veffBottom = 1000*getData("MnBOT")->vgt
gmBottom = getData("MnBOT")->gm
rdsBottom = 1./(getData("MnBOT")->gds)
GainBot = gmBottom*rdsBottom
cdbBottom = 1e15*mag(getData("MnBOT")->cdb)
cdsBottom = 1e15*mag(getData("MnBOT")->cds)
cgsBottom = 1e15*mag(getData("MnBOT")->cgs)
cgdBottom = 1e15*mag(getData("MnBOT")->cgd)
FtBottom = gmBottom/(2*3.1415927*(cgsBottom+cgdBottom))*1e15

vgspBottom = (-1)*getData("MpBOT")->vgs
VthpBottom = (-1)*getData("MpBOT")->vth
veffpBottom = -1000*getData("MpBOT")->vgt
gmpBottom = getData("MpBOT")->gm
rdspBottom = 1./(getData("MpBOT")->gds)
GainpBot = gmpBottom*rdspBottom
cdbpBottom = 1e15*mag(getData("MpBOT")->cdb)
cdspBottom = 1e15*mag(getData("MpBOT")->cds)
cgspBottom = 1e15*mag(getData("MpBOT")->cgs)
cgdpBottom = 1e15*mag(getData("MpBOT")->cgd)
FtpBottom = gmpBottom/(2*3.1415927*(cgspBottom+cgdpBottom))*1e15


vgsTop = getData("MnTOP")->vgs
VthTop = getData("MnTOP")->vth
veffTop = 1000*getData("MnTOP")->vth_drive
gmTop = getData("MnTOP")->gm
rdsTop = 1./(getData("MnTOP")->gds)
GainTop = gmTop*rdsTop
cdbTop = 1e15*mag(getData("MnTOP")->cdb)
cdsTop = 1e15*mag(getData("MnTOP")->cds)
cdTop  = cdbTop + cdsTop
cgsTop = 1e15*mag(getData("MnTOP")->cgs)
cgdTop = 1e15*mag(getData("MnTOP")->cgd)
FtTop = gmTop/(2*3.1415927*(cgsTop+cgdTop))*1e15


printf("\n\n\n******************************\n")
printf("*      BIASING RESULTS       *  \n")
printf("******************************\n\n")

printf("\nnmosBottom: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgsBottom)
printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cds = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n veff = %4.2fm\n Ft = %4.2fM\n" 1e3*gmBottom rdsBottom GainBot cdbBottom cdsBottom cgdBottom cgsBottom VthBottom veffBottom FtBottom/1e6)


printf("\n\npmosBottom: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgspBottom )
printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cds = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n veff = %4.2fm\n Ft = %4.2fM\n" 1e3*gmpBottom rdspBottom GainpBot cdbpBottom cdspBottom cgdpBottom cgspBottom VthpBottom veffpBottom FtpBottom/1e6)

printf("\n\nnmosTop: W1tot = %4.3fu L1 = %4.3fn Ids = %4.3fu VDS = %4.3fV VGS = %4.3fV \n" 1e6*W1tot 1e9*L1 1e6*IDS1 VDS1 vgsTop )
printf("gm = %4.3fm\n rds = %4.2f\n Gain = %4.3f\n cdb = %4.2ff\n cds = %4.2ff\n cd = %4.2ff\n cgd = %4.2ff\n cgs = %4.2ff\n vth = %5.4f\n veff = %4.2fm\n Ft = %5.2fM" 1e3*gmTop rdsTop GainTop cdbTop cdsTop cdTop cgdTop cgsTop VthTop veffTop FtTop/1e6)

