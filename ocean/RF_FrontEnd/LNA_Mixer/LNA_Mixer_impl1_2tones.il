simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_Mixer_impl1_hb_2tones"	"schematic"  )

resultsDir( "/home/pancha/simulation/LNA_Mixer_impl1_hb_2tones/spectre/schematic" )
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

Freq = 2.402G
flo = 2.4G
Rosc = 1
C0 = 675f
C1 = 100p
Cdecap = 1p
Cext = 140f
IBIAS = 1.2m
L1 = 150n
Lbias = 250n
Lmix = 150n
Lext = 8.3n
prf  =  -20
Rdecap = 10K
Rmatch = 90
Rp = 400
Rosc = 1
vdsBias = 450m
vgsBias = 578m
vgsn = 456m
Wbias_tot = 40u
Wf1_tot = 80u
Wfmix_tot = 80u
Wbias = Wbias_tot/5
Wf1 = Wf1_tot/5
Wfmix = Wfmix_tot/5


desVar(   "C0"  C0     )
desVar(   "C1"  C1     )
desVar(   "Cdecap"  Cdecap   )
desVar(   "CdecapIN"  Cdecap )
desVar(   "CdecapMatch"  Cdecap     )
desVar(   "Cext"  Cext  )
desVar(   "flo"  flo    )
desVar(   "frf1"  Freq )
desVar(   "IBIAS"   IBIAS  )
desVar(   "L1"  L1    )
desVar(   "Lbias"  Lbias  )
desVar(   "Lind"   Lext   )
desVar(   "Lmix"  Lmix   )
desVar(   "prf"   prf     )
desVar(   "RdcpI"   Rdecap   )
desVar(   "RdcpQ"  Rdecap  )
desVar(   "Rmatch"   Rmatch   )
desVar(   "Rosc"   Rosc      )
desVar(   "Rp"  Rp      )
desVar(   "vdsBias"  vdsBias        )
desVar(   "vgsBias"  vgsBias        )
desVar(   "vgsn"   vgsn  )
desVar(   "Wbias" Wbias    )
desVar(   "Wf1"  Wf1     )
desVar(   "Wfmix"  Wfmix   )


/**************************************** Transient Analysis 2 Tones ***********************************************************/
/* 2n CAP is ADDED IN PARALLEL WITH THE  OUTPOUT PORT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

analysis('tran ?stop "1.5u"  ?errpreset "moderate"  )          

envOption(
        'analysisOrder  list("hb" "tran")
)

option( ?categ 'turboOpts
	'uniMode  "APS" 


save( 'i "/PORT_out_I/PLUS" "/PORT_out_I/MINUS" "/PORT_out_Q/PLUS" "/PORT_out_Q/MINUS" "/IPRB5/MINUS" "/IPRB6/MINUS" )

temp( 27 )

run()

selectResult( 'tran )

plot(getData( "/PORT_out_I/PLUS") getData("/PORT_out_Q/PLUS") )

/******************************************** Harmonic Balance Analysis **************************************************************/
/* 2n CAP is ADDED IN PARALLEL WITH THE  OUTPOUT PORT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*
analysis('hb ?autoharms ""  ?autotstab "yes"  ?oversample list("1" "1")
                ?funds list("FLO" "FRF1")  ?maxharms list("8" "3")  ?errpreset "conservative"  )

envOption(
        'analysisOrder  list("hb" "tran")
)

option( ?categ 'turboOpts
	'uniMode  "APS" 


save( 'i "/PORT_out_I/PLUS" "/PORT_out_I/MINUS" "/PORT_out_Q/PLUS" "/PORT_out_Q/MINUS" "/IPRB5/MINUS" "/IPRB6/MINUS" )

temp( 27 )

run()

Iout_Q = db((ih('hb "/PORT_out_Q/PLUS") - ih('hb "/PORT_out_Q/MINUS")))
plot( Iout_Q ?expr '( "Iout_Q" ) )
Iout_I = db((ih('hb "/PORT_out_I/PLUS") - ih('hb "/PORT_out_I/MINUS")))
plot( Iout_I ?expr '( "Iout_I" ) )

 



                       
