pcDefinePCell(list(ddGetObj("lf150_passives") "rppoly_s_SKILL" "layout") 
    ((Length float 20.0) 
	(Width float 4.0)
    ) 
    let((Width Width0 Width0offset Width1 Width1offset
	    Width2 Width2offset Width3 Width3offset Length
	    Length4 Length4offset pcMember pcStretchGroup stretchOffsetX
	    stretchOffsetY pcLib pcMaster pcInst pcTerm
	    pcPin pcPinName pcNet pcTermNet pcNetName
	    pcTermNetName pcMosaicInst pcParameters pcParamProp pcStep
	    pcStepX pcStepY pcRepeat pcRepeatX pcRepeatY
	    pcIndexX pcIndexY pcLayer pcPurpose pcLabelText
	    pcLabelHeight pcPropText pcParamText pcCoords pcPathWidth
	    pcPolygonMargin
	) 
	(pcLib = (pcCellView~>lib)) 
	(pcParameters = ((pcCellView~>parameters)~>value)) 
	(pcParamProp = car(exists(prop pcParameters 
		    ((prop~>name) == "Width")
		)
	    )) 
	(Width = (pcParamProp~>value))
	if( ((pcParamProp~>valueType) == "boolean")
	    (Width = (Width == "TRUE"))
	) 
	(pcParamProp = car(exists(prop pcParameters 
		    ((prop~>name) == "Length")
		)
	    )) 
	(Length = (pcParamProp~>value)) 
	if( ((pcParamProp~>valueType) == "boolean")
	    (Length = (Length == "TRUE"))
	) 
	(Width0 = Width)
	(Width1 = Width) 
	(Width2 = Width) 
	(Width3 = (4.18 + (3 * (Width - 1)))) 
	(Length4 = Length) 
	(Width0offset = ((Width0 - 1) / 2))
	(Width1offset = (Width1 - 1)) 
	(Width2offset = (Width2 - 1)) 
	(Width3offset = ((Width3 - 4.18) / 2)) 
	(Length4offset = ((Length4 - 10) / 2)) 
	dbReplaceProp(pcCellView "function" "string" "transistor")
	dbReplaceProp(pcCellView "pin#" "int" 3) 
	dbReplaceProp(pcCellView "_pcCompiledCounter" "int" 2853) 
	dbReplaceProp(pcCellView "viewSubType" "string" "maskLayoutParamCell") 
	(pcNetName = "PLUS") 
	(pcTermNet = dbMakeNet(pcCellView pcNetName nil))
	if( !(pcTerm = dbFindTermByName(pcCellView pcNetName))
	    then
	    (pcTerm = dbCreateTerm(pcTermNet pcNetName "inputOutput" 0))
	) 
	(pcLayer = 45) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.23 - Width0offset):(6.82 + Length4offset)) 
		    ((4.43 - Width0offset):(7.02 + Length4offset))
		)
	    )) 
	(pcPin = dbCreatePin(pcTermNet pcInst "P__0"))
	setSGq(pcPin 
	    '("top" "bottom" "left" "right") accessDir
	) 
	if( !(pcTerm~>pins)
	    then
	    dbDeleteObject(pcTerm)
	    if( (!(pcTermNet~>figs) && !(pcTermNet~>instTerms))
		then
		dbDeleteObject(pcTermNet)
	    )
	) 
	(pcNetName = "MINUS") 
	(pcTermNet = dbMakeNet(pcCellView pcNetName nil)) 
	if( !(pcTerm = dbFindTermByName(pcCellView pcNetName))
	    then
	    (pcTerm = dbCreateTerm(pcTermNet pcNetName "inputOutput" 0))
	)
	(pcLayer = 45) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.2 - Width0offset):(-3.36 - Length4offset)) 
		    ((4.4 - Width0offset):(-3.16 - Length4offset))
		)
	    )) 
	(pcPin = dbCreatePin(pcTermNet pcInst "P__1")) 
	setSGq(pcPin 
	    '("top" "bottom" "left" "right") accessDir
	)
	if( !(pcTerm~>pins)
	    then
	    dbDeleteObject(pcTerm)
	    if( (!(pcTermNet~>figs) && !(pcTermNet~>instTerms))
		then
		dbDeleteObject(pcTermNet)
	    )
	) 
	(pcLayer = 4) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((2.55 - Width3offset):(-3.67 - Length4offset)) 
		    ((6.73 + Width3offset):(7.31 + Length4offset))
		)
	    )) 
	(pcLayer = 25)
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(-3.42 - Length4offset)) 
		    ((5.14 + Width0offset):(7.06 + Length4offset))
		)
	    )) 
	(pcLayer = 25) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((5.48 + Width0offset):(-3.42 - Length4offset)) 
		    ((6.48 + Width0offset + Width2offset):(7.06 + Length4offset))
		)
	    ))
	(pcLayer = 25) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((2.8 - Width0offset - Width1offset):(-3.42 - Length4offset)) 
		    ((3.8 - Width0offset):(7.06 + Length4offset))
		)
	    )) 
	(pcLayer = 100) 
	(pcPurpose = "drawing")
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(-3.18 - Length4offset)) 
		    ((5.14 + Width0offset):(6.82 + Length4offset))
		)
	    )) 
	(pcLayer = 45) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(-3.42 - Length4offset)) 
		    ((5.14 + Width0offset):(-3.12 - Length4offset))
		)
	    )) 
	(pcLayer = 45)
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(6.76 + Length4offset)) 
		    ((5.14 + Width0offset):(7.06 + Length4offset))
		)
	    )) t
    )
)
