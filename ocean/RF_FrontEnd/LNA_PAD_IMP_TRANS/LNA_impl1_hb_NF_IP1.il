simulator( 'spectre )
design(	 "RF_FrontEnd"	"LNA_impl1_hb"	"schematic"  )

resultsDir( "/home/pancha/simulation/LNA_impl1_hb/spectre/schematic" )\

createNetlist

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

Np_dec = 1000 ; Number of points per decade
IBIAS = 1200u
Fstart = 800M
Fstop  = 6G
Cext = 140f
;Lext = 10.6n ; With Cext
Lext = 8.3n ; Without Cext
C0 = 675f
C1 = 100p
Cdecap = 1p
CdecapIn = 1p
CdecapMatch = 1p
Freq = 2.4G
L1 = 150n
Lbias = 250n
prf = -20
RdcpI = 10K
RdcpQ = 10K
;Rmatch = 50
;Rmatch = 300 ; With Cext
Rmatch = 90 ; Without Cext
Rout = 300
vdsBias = 450m
vdsn = 450m
vgsBias = 578m
vgsn = 456m
Wbias_tot = 40u
Wbias = Wbias_tot/5
W1_tot = 80u
Wf1 = W1_tot/5

desVar(   "Cext" Cext  )
desVar(   "Lind" Lext )
desVar(   "C0" C0     )
desVar(   "C1" C1     )
desVar(   "Cdecap" Cdecap   )
desVar(   "CdecapIN" CdecapIN )
desVar(   "CdecapMatch" CdecapMatch     )
desVar(   "frf1" Freq   )
desVar(   "IBIAS" IBIAS )
desVar(   "L1"  L1     )
desVar(   "Lbias"  Lbias  )
desVar(   "prf"   prf    )
desVar(   "RdcpI"  RdcpI  )
desVar(   "RdcpQ"  RdcpQ  )
desVar(   "Rmatch"   Rmatch  )
desVar(   "Rout"   Rout   )
desVar(   "vdsBias"  vdsBias      )
desVar(   "vdsn" vdsn   )
desVar(   "vgsBias"   vgsBias      )
desVar(   "vgsn"  vgsn  )
desVar(   "Wbias"  Wbias   )
desVar(   "Wf1"  Wf1   )

/****************************************** Output Harmonics **************************************************************************************************************/
/*
analysis('hb ?autoharms "yes"  ?autotstab "yes"  ?oversample list("1")
                ?fundfreqs list("(2.4G)")  ?maxharms list("5")  )

analysis('dc ?saveOppoint t  )

envOption(
        'analysisOrder  list("dc" "hb" "hbnoise")
)

temp( 27 )

run()

i\ \/PORT_OUT_I\/PLUS\;\ hb\ dB20\(I\) = db(ih('hb "/PORT_OUT_I/PLUS"))
plot( i\ \/PORT_OUT_I\/PLUS\;\ hb\ dB20\(I\) ?expr '( "i /PORT_OUT_I/PLUS; hb dB20(I)" ) )

/********************************* 1dB Compression Point ******************************************************************************************************************/
/*
analysis('hb ?autoharms "yes"  ?autotstab "yes"  ?oversample list("1")  
		?fundfreqs list("(2.4G)")  ?maxharms list("9")  ?param "prf"  ?start "-120"  
		?stop "-5"  ?lin "50"  )

analysis('dc ?saveOppoint t  )

envOption(
	'analysisOrder  list("dc" "hb") 
)

temp( 27 ) 

run()

CP1dB = Input\ Referred\ 1dB\ Compression\ Point = compressionVRI((v("/net027" ?result "hb_fd") - 0.0) '1 ?rport resultParam("PORT_OUT_I:r" ?result "hb_fd") ?gcomp 1)
plot( Input\ Referred\ 1dB\ Compression\ Point ?expr '( "Input Referred 1dB Compression Point" ) )
compressionCurves = compressionVRICurves((v("/net027" ?result "hb_fd") - 0.0) '1 ?rport resultParam("PORT_OUT_I:r" ?result "hb_fd") ?gcomp 1)
plot( compressionCurves ?expr '( "compressionCurves" ) )
\1st\ Order\ freq = "cadar(setof(x harmonicFreqList(?result \"hb_fd\") equal(car(x) '1)))"
printf("\n*******************1dB Compression Point - HB analysis****************************************************************************************\n")
printf("1dB Compression Point = %3.3fdBm" CP1dB)

/************************************Noise Figure from HB analysis and Noise Contributors ***************************************************************************************/

analysis('hb ?autoharms "yes"  ?autotstab "yes"  ?oversample list("1")
                ?fundfreqs list("(2.4G)")  ?maxharms list("9")  )

analysis('hbnoise ?start "800M"  ?stop "8G"  ?lin "16"  
		?maxsideband "9"  ?oprobe "/PORT_OUT_I"  ?iprobe "/PORT_INP"  ?refsideband list("0")  )

envOption(
	'analysisOrder  list("dc" "hb" "hbnoise") 
)

temp( 27 ) 

run()

;plot( \1st\ Order\ freq ?expr '( "1st Order freq" ) )
noise\ figure = getData("NF" ?result "hbnoise")
plot( noise\ figure ?expr '( "noise figure" ) )
noiseSummary( 'integrated ?result "hbnoise" ?noiseUnit "V" ?from 800M ?to 8G ?deviceType 'all  ?truncateData 0.1 ?truncateType 'relative )
