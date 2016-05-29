;;***********************************************************************
;; $Author: Panagiotis Chaourani $
;; $Revision: #1 $
;; $Date: 2015/06/11 $
;;************************************************************************

;; This script creates an nmos PCELL for the top tier using the LFOUNDRY2 (S3D) PDK

procedure(mosRodPcell( FingerWidth Length fingers leftCnt leftFill leftAlign
        rightCnt rightFill rightAlign centerFill centerAlign
        diff poly contact metal1 cw cs m1oc pext dds
        doc dop pcs pds pps snapGrid defDiffWid leftSt rightSt)

  let(	(wx lx snapGridX2 leftDiffPin obj sourcePins drainPins abutRuleList ;; let function defines a collection of local variables for a group of several statements
    	(centerGateCntAlign  "centerRight")
    	(centerCntAlign  "midLeft0")
    	(GateCenterCntAlgn  "centerRight")
    	(GateCenterGateAlign  "centerLeft")
    	(centerCntYSep    0)
    	(centerGateYSep    0)
    	(leftDiffCntAlign  "centerRight")
    	(leftCntAlign  "midRight0")
    	(leftCntYSep    0)
    	(rightDiffCntAlign  "centerLeft")
    	(rightCntAlign  "midLeft0")
    	(rightCntYSep   0 )
   	)


    	;; Makes sure boolean values are t/nil format.
    	leftCnt = leftCnt && leftCnt != "FALSE"
    	rightCnt = rightCnt && rightCnt != "FALSE"

	;;; if leftFill rightFill centerFill are strings convert to ints
   	when(stringp(leftFill) leftFill = cdfParseFloatString(leftFill))
   	when(stringp(rightFill) rightFill = cdfParseFloatString(rightFill))
   	when(stringp(centerFill) centerFill = cdfParseFloatString(centerFill))

	;;; check to see if the input values were in microns if so then multiply 1e06
    	if( FingerWidth < .001 then
		wfx = FingerWidth*1e06
    	else
		wfx = FingerWidth
    	)
    	if( Length < .001 then
		lx = Length*1e06
    	else
		lx = Length
    	)

	;;; calculate the number of fingers if a threshold number was set
    	unless(zerop(threshold )
        fingers = calcFinger(wx threshold)
    	)

        ;;; assign the new width based on the number of fingers 
	;;; makeing sure it is on grid
	wx = spcRound(wx/fingers snapGrid)

        ;;; used for the diffusion width later
        snapGridX2 = 2 * snapGrid
        metOvDiff = doc - m1oc	;;; diffusion overlap of metal
        metOvPoly = pcs - m1oc	;;;   !!!!!!!!!!!!!!!!!!!! Perhaps we need to substitute m1oc, doc, pcs with the technology definitions


	;;; set the alignment conditions based on the alignment parameter for the 
	;;; left metal / contacts
    	cond(
       	( leftAlign == "center"
            leftDiffCntAlign = "centerRight"
            leftCntAlign = "midRight0"
            leftCntYSep =   0
        )
        ( leftAlign == "top"
            leftDiffCntAlign = "upperRight"
            leftCntAlign = "endRight0"
            leftCntYSep =   -metOvDiff
        )
        ( leftAlign == "bottom"
            leftDiffCntAlign = "lowerRight"
            leftCntAlign = "startRight0"
            leftCntYSep =   metOvDiff
        )
    	    )
	;;; set the alignment conditions based on the alignment parameter for the 
	;;; right metal / contacts
    	cond(
       	( rightAlign == "center"
            rightDiffCntAlign = "centerLeft"
            rightCntAlign = "midLeft0"
            rightCntYSep =  0 
       )
       ( rightAlign == "top"
            rightDiffCntAlign = "upperLeft"
            rightCntAlign = "endLeft0"
            rightCntYSep =   -metOvDiff
       )
       ( rightAlign == "bottom"
            rightDiffCntAlign = "lowerLeft"
            rightCntAlign = "startLeft0"
            rightCntYSep =   metOvDiff
       )
          )
	;;; set the alignment conditions based on the alignment parameter for the 
	;;; center metal / contacts
    	cond(
       	( centerAlign == "center"
            centerGateCntAlign = "centerRight"
            centerCntAlign = "midLeft0"
            GateCenterCntAlgn = "centerRight"
            GateCenterGateAlign = "centerLeft"
            centerCntYSep =   0 
            centerGateYSep =   0 
       )
       ( centerAlign == "top" 
            centerGateCntAlign = "upperRight"
            centerCntAlign = "endLeft0"
            GateCenterCntAlgn = "upperRight"
            GateCenterGateAlign = "upperLeft"
            centerCntYSep =   (-metOvDiff) - (-pext)
            centerGateYSep =  ((-pext) - metOvDiff)
       )
       ( centerAlign == "bottom"
            centerGateCntAlign = "lowerRight"
            centerCntAlign = "startLeft0"
            GateCenterCntAlgn = "lowerRight"
            GateCenterGateAlign = "lowerLeft"
            centerCntYSep =   metOvDiff + pext
            centerGateYSep =   pext+metOvDiff
       )

          )


    ;;; ************ draw left diff ***************
    leftDiffPin = rodCreateRect(
		      ?layer        diff;; !!!!!!!!!!!!!!! Probably we need to change it according to LFOUNDRY techfiles.
		      ?length       wx
    ;;;;;;;;;;;;;;; adding (2 x the min grid) to the width because auto abut sets 
    ;;;;;;;;;;;;;;; leftSt variable to 0 and you can not have a 0 width rectangle.
		      ?width        leftSt + snapGridX2 
		      ?termName     "S"
		      ?termIOType   "inputOutput"
		      ?pin          t
		      ?origin       -leftSt:0
		    )


  ;;; ********** Add properties for auto abutment on the diffusion shape *****

    obj = leftDiffPin~>dbId
    obj~>pin~>name = "leftDiffPin"

  ;;; property identifing abutment direction
    dbReplaceProp(obj "abutAccessDir" "list" list("left"))
 
  ;;; property to identify the parameter name that turns the contacts on or off
    dbReplaceProp(obj "abutCondInclusion" "string" "leftCnt")

  ;;; property to identify the gate so autoabut knows where the gate edge is
    dbReplaceProp(obj "abutGateNet" "string" "G")

  ;;; property to identify the abutment class for this cell.
    dbReplaceProp(obj "abutClass" "string" obj~>cellView~>cellName)

  ;;; property and value of the conditions for the diffusion stretch
    abutRuleList = list(
	list("abutFlush" 0.0)                 
	list("abutGateSpaceSeries" pps)       
	list("abutGateSpaceParallel" max((cw + (pcs * 2)) pps))
	list("abutEncloseGate" doc)
	list("abutEncloseContact" doc + cw + pcs)
	list("abutSmallerSeries" max((pps - doc) pds))
	list("abutSmallerParallel" max((pcs - doc) (pps - pcs - cw - doc) pds))
	list("abutEncloseDogBoneContact" cw + doc + max(pds+doc pcs))
	list("abutMinContactWidth" cw + (2 * doc))
    )
    dbReplaceProp(obj "abutMosStretchMat" "list" cons("leftSt" abutRuleList))

    ; first do the spacing tools properties
    dbReplaceProp(obj "vxlInstSpacingDir" "list" list("left"))
    ; should be a parameter to the function
    dbReplaceProp(obj "vxlInstSpacingRule" "float" dds)


    ;;; ******** draw left contacts *************

    when( leftCnt && !zerop(leftFill)   ;;; if contacts are "on" continue

    ;;;;;;; variable for metal / cnt height ( xtr width / percent of fill )
        cntsw = (wx - (2*doc))/(100/leftFill)

    ;;;;;;; function to create the metal /cont regions. These are multiPart Paths
    ;;;;;;; the rturn value is the rod object Id
	leftCnts = smosRodMosCnt( "S" cntsw metal1 contact cw cs m1oc 1)

    ;;;;;;; variable for collecting all the source pins so we can make them
    ;;;;;;; must connects (how many depends on number of gates)
        sourcePins = nil

    ;;;;;;; add the first pin to the list
        sourcePins = cons(leftCnts~>dbId~>pin sourcePins)

    ;;;;;; now we are going to align the  left contact region to the left diffusion
    ;;;;;; area. The alignment Handles depend on the position of the contacts
    ;;;;;; top, bottom or center alignment as defined by the input parameter
	rodAlign(
	    ?refObj leftDiffPin		    ;diffusion shape
	    ?refHandle leftDiffCntAlign	    ;alignment variable defined above 
	    ?alignObj leftCnts		    ;MPP metal/contact region
	    ?alignHandle leftCntAlign	    ;alignment variable defined above
	    ?xSep -(metOvPoly + snapGridX2) ;x dist from the alignment handles
	    ?ySep leftCntYSep 		    ;y dist from the alignment handles
	)
    )	;;; end when leftCnt and not zerop(leftFill)


   ;;;;;************* draw first gate *************
   ;;; function to create the gate region returns a list of objects 
   ;;; the 1st is the rod object Id of the gate, the next 2 are the gates pins
   ;;; top and bottom.  The Rod Handle of this gate is "gate1".
     gate = smosRodBuildGate( wx lx poly pext 1)

   ;;; now we are going to align the gate to the left (1st) diffusion area.
     rodAlign(
	?refObj leftDiffPin
	?refHandle "centerRight"
	?alignObj car(gate)
	?alignHandle "centerLeft"
	?xSep -(2*snapGrid)
     )

   ; *************** draw fingers ***********

    cntSep = pcs - m1oc		

    ;;; set the net name to be D for the first metal/cont region
     node = "D"

    ;;; set the varibles for the rod object name of the drain and source cnts
    dCnt = 1
    sCnt = 2
    ;;; the varible passed to smosRodSMosCnt
    cntNum = dCnt

    ;;; init the drain pins "list" variable, collect all drain pins for use later
    drainPins = nil

    ;;; now loop for the total number of fingers minus the gate we created already
       for( i 1 (fingers - 1)
       ;;;;;; if the center contact coverage is zero then we won't create any 
       ;;;;;; metal/contact regions, else we create them as max width divided by 
       ;;;;;; the percentage of fill
       unless(zerop(centerFill)
          ;;;;;;;;; variable for metal / cnt height ( xtr width / percent of fill )
          cntsw = (wx - (2*doc))/(100/centerFill)

       ;;;;;;;;; function to create the metal /cont regions. These are multiPart Paths
       ;;;;;;;;; the rturn value is the rod object Id
	  contacts = smosRodMosCnt( node cntsw metal1 contact cw cs m1oc cntNum ) ;;; !!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles
       ;;;;;;;;; Now align the metal / contact MPP to the gate previously created
	   rodAlign(
	       ?refObj car(gate)
	       ?refHandle centerGateCntAlign
	       ?alignObj contacts
	       ?alignHandle centerCntAlign
	       ?xSep cntSep
               ?ySep centerGateYSep
	   )
        )

      ;;;;;;; function to create the gate region returns a list of objects 
      ;;;;;;; the 1st is the rod object Id of the gate, the next 2 are the gates pins
      ;;;;;;; top and bottom
	gate = smosRodBuildGate( wx lx poly pext i+1);;; !!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles

      ;;;;;;; align the gate to the last metal /contact region if it exists
        unless(zerop(centerFill)
	   rodAlign(
	       ?refObj contacts
	       ?refHandle GateCenterCntAlgn
	       ?alignObj car(gate)
	       ?alignHandle GateCenterGateAlign
	       ?xSep cntSep
               ?ySep -centerGateYSep 
	   )
	)

      ;;;;;;; toggle the node name for use on the next loop
      ;;;;;;; and add the pins to the appropriate variable
        if( node == "S" then
	    node = "D"
            sCnt = ++sCnt
            cntNum = dCnt
	    sourcePins = cons(contacts~>dbId~>pin sourcePins)
	else
	    node = "S"
            dCnt = ++dCnt
            cntNum = sCnt
            drainPins = cons(contacts~>dbId~>pin drainPins)
	)
    )


    ; ************ draw right diff **********
    rightDiffPin = rodCreateRect(
		      ?layer        diff ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
		      ?length       wx
;;;;;;;;;;;;;;; adding (2 x the min grid) to the width because auto abut sets 
;;;;;;;;;;;;;;; rightSt variable to 0 and you can not have a 0 width rectangle.
		      ?width        rightSt + (2*snapGrid)
		      ?origin       0:0
		      ?termName     node
		      ?termIOType   "inputOutput"
		      ?pin          t
		    )

    ; *********** Add properties for auto abutment *******
    obj = rightDiffPin~>dbId
    obj~>pin~>name = "rightDiffPin"

    ;;; property identifing abutment direction
    dbReplaceProp(obj "abutAccessDir" "list" list("right"))

    ;;; property to identify the parameter name that turns the contacts on or off
    dbReplaceProp(obj "abutCondInclusion" "string" "rightCnt")

    ;;; property to identify the gate so autoabut knows where the gate edge is
    dbReplaceProp(obj "abutGateNet" "string" "G")

    ;;; property to identify the the abutment class for this cell.
    dbReplaceProp(obj "abutClass" "string" obj~>cellView~>cellName)

    ;;; property and value of the conditions for the diffusion stretch
    dbReplaceProp(obj "abutMosStretchMat" "list" cons("rightSt" abutRuleList))

    ; first do the spacing tools properties
    dbReplaceProp(obj "vxlInstSpacingDir" "list" list("right"))
    ; should be a parameter to the function
    dbReplaceProp(obj "vxlInstSpacingRule" "float" dds)

   ;;; now we are going to align the right diffusion area to the previous gate. 
   ;;; The alignment Handles depend on the position of the contacts
   ;;; top, bottom or center alignment as defined by the input parameter
    rodAlign(
	?refObj car(gate)
	?refHandle "centerRight"
	?alignObj rightDiffPin
	?alignHandle "centerLeft"
	?xSep -(2*snapGrid)
    )

    ; ************ Add right contacts ************
    when( rightCnt && !zerop(rightFill)
	cntsw = (wx - (2*doc))/(100/rightFill)
	rightCnts = smosRodMosCnt( node cntsw metal1 contact cw cs m1oc cntNum) ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
        if( node == "S" then
	    sourcePins = cons(rightCnts~>dbId~>pin sourcePins)
        else
	    drainPins = cons(rightCnts~>dbId~>pin drainPins)
        )
	rodAlign(
	    ?refObj rightDiffPin
	    ?refHandle rightDiffCntAlign
	    ?alignObj rightCnts
	    ?alignHandle rightCntAlign
	    ?xSep (metOvPoly + snapGridX2)
	    ?ySep rightCntYSep 
	)
    )
    smakeExternal( drainPins )
    smakeExternal( sourcePins )


   ; ************ draw diff ****************
    xdim = ((fingers - 1) * (lx+(2*pcs)+cw)) + lx + leftSt + rightSt
    bigDiff = rodCreateRect(
        ?layer diff ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
        ?width xdim
        ?length wx
    )
    rodAlign(
        ?refObj leftDiffPin
        ?refHandle "lowerLeft"
        ?alignObj bigDiff
        ?alignHandle "lowerLeft"
    )
  ))
procedure( smosRodBuildGate( wx lx poly pext fingers )  ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
prog(( gate topPin botPin pins )
    sprintf( name "%d" fingers)
    gate = rodCreateRect(
               ?name      strcat("gate" name)
	       ?layer     poly  ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
	       ?length     wx+(2*pext) ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
	       ?width     lx
    )
    topPin = rodCreateRect(
               ?name      strcat("topPin" name)
	       ?layer     poly ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
	       ?length    pext;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
	       ?width     lx
	       ?termName  "G"
	       ?pin       t
    )
    botPin = rodCreateRect(
               ?name      strcat("botPin" name)
	       ?layer     poly ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
	       ?length    pext ;;!!!!!!!!!!!!!Perhaps we need to change it according to LFOUNDRY2 techfiles.
	       ?width     lx
	       ?termName  "G"
	       ?pin       t
    )
    rodAssignHandleToParameter(
	    ?parameter 'w
	    ?displayName "width"
	    ?displayExpression "w"
	    ?rodObj topPin
	    ?handleName 'upperCenter
	    ?stretchDir 'y
	    ?stretchType "relative"
	    ?moveOrigin t
	    ?userFunction 'smosStretchCB
    )
    rodAssignHandleToParameter(
	    ?parameter 'w
	    ?displayName "width"
	    ?displayExpression "w"
	    ?rodObj botPin
	    ?handleName 'lowerCenter
	    ?stretchDir 'y
	    ?stretchType "relative"
	    ?moveOrigin t
	    ?userFunction 'smosStretchCB
    )
    rodAssignHandleToParameter(
            ?parameter 'l
            ?displayName "length"
            ?displayExpression "l"
            ?rodObj gate
            ?handleName 'centerLeft
            ?stretchDir 'x
            ?stretchType "relative"
            ?moveOrigin t
            ?userFunction 'smosStretchCB
    )
    rodAssignHandleToParameter(
            ?parameter 'l
            ?displayName "length"
            ?displayExpression "l"
            ?rodObj gate
            ?handleName 'centerRight
            ?stretchDir 'x
            ?stretchType "relative"
            ?moveOrigin t
            ?userFunction 'smosStretchCB
    )

   when(dbGetDatabaseType() == "CDBA"
    dbWeaklyConnectPins(list(topPin~>dbId~>pin))
    )
    dbReplaceProp(gate~>dbId "lxBlockOverlapCheck" "boolean" t)
    rodAlign(
	?refObj gate
	?refHandle "lowerLeft"
	?alignObj botPin
	?alignHandle "lowerLeft"
    )
    rodAlign(
	?refObj gate
	?refHandle "upperLeft"
	?alignObj topPin
	?alignHandle "upperLeft"
    )
    pins = list(gate list(topPin~>dbId~>pin botPin~>dbId~>pin))
    return(pins)
))

procedure( smosRodMosCnt( term cntsw metal1 contact cw cs m1oc fingers );; !!!!!! Probably we need ti change it according to LFOUNDRY2 techfiles.
    sprintf( name "%s%d" term fingers)
    xdim = (2*m1oc)+cw
    rodCreatePath(
        ?name          name 
	?layer         metal1 ;; !!!!!! Probably we need ti change it according to LFOUNDRY2 techfiles.
	?width         (2*m1oc)+cw
	?pts           list(0:0 0:(cntsw+(2*m1oc)))
	?justification "center"
	?subRect list( list(
	    ?layer     contact
	    ?length    cw
	    ?width     cw
	    ?space     cs
	    ?endOffset -m1oc ;; !!!!!! Probably we need ti change it according to LFOUNDRY2 techfiles.
	))
	?termName      term
	?pin           t
    )
)

procedure(smakeExternal( pinlist )
  let(( sizelist pin )
    sizelist = length(pinlist)
    for(i 0 sizelist - 2
      pin = nth(i pinlist)
when(dbGetDatabaseType() == "CDBA"
      dbExternallyConnectPins(list(pin))
)
    )
  )
)

;; We need to find out how many fingers we have so the width will
;; increment correctly.
procedure(smosStretchCB(spcInfo)
    let(( (paramValue spcInfo->paramVal) (handleName spcInfo->handleName)
            (increment spcInfo->increment) string_var paramValueNum
	    numFingers )
 
;fprintf(stderr "handleName = %L\n" handleName)
;fprintf(stderr "increment = %L\n" increment)
;fprintf(stderr "paramValue = %L\n" paramValue)
 
        if(stringp(paramValue) then
            string_var = t
            paramValueNum = spcParseFloatString(paramValue)
        else
            paramValueNum = paramValue
        )
        when(paramValueNum < .001
            paramValueNum = paramValueNum * 1e6
        )
 
;fprintf(stderr "paramValueNum = %L\n" paramValueNum)
 
	numFingers = spcInfo->origInstId~>fingers || 1

        case(handleName
            ("upperCenter"
                newValue = spcRound((paramValueNum + (increment * numFingers))
			.001)
            )
            ("lowerCenter"
                newValue = spcRound((paramValueNum + (increment * numFingers))
			.001)
            )
            ("centerLeft"
                newValue = spcRound((paramValueNum + (increment * numFingers))
			.001)
            )
            ("centerRight"
                newValue = spcRound((paramValueNum + (increment * numFingers))
			.001)
            )
            (t
                newValue = paramValueNum
            )
        )
        if(plusp(newValue) then
            when(string_var
                sprintf(newValue "%gu" newValue)
            )
        else
            newValue = paramValue
        )

	when(string_var
	    sprintf(newValue "%gu" newValue)
	)

;fprintf(stderr "newValue = %L\n \n" newValue)

	newValue
    )
)
