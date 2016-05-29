pcDefinePCell(list(ddGetObj("lf150_passives") "rppoly_SKILL" "layout") 
    ((Length float 5.0) 
	(Width float 1.0)
    ) 
    let((Width Width0 Width0offset Width1 Width1offset
	    Width2 Width2offset Width3 Width3offset Width4
	    Width4offset Length Length5 Length5offset pcMember
	    pcStretchGroup stretchOffsetX stretchOffsetY pcLib pcMaster
	    pcInst pcTerm pcPin pcPinName pcNet
	    pcTermNet pcNetName pcTermNetName pcMosaicInst pcParameters
	    pcParamProp pcStep pcStepX pcStepY pcRepeat
	    pcRepeatX pcRepeatY pcIndexX pcIndexY pcLayer
	    pcPurpose pcLabelText pcLabelHeight pcPropText pcParamText
	    pcCoords pcPathWidth pcPolygonMargin
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
	(Width1 = (5.18 + (3 * (Width - 1)))) 
	(Width2 = Width) 
	(Width3 = Width) 
	(Width4 = (4.68 + (3 * (Width - 1)))) 
	(Length5 = Length)
	(Width0offset = ((Width0 - 1) / 2)) 
	(Width1offset = ((Width1 - 5.18) / 2)) 
	(Width2offset = (Width2 - 1)) 
	(Width3offset = (Width3 - 1)) 
	(Width4offset = ((Width4 - 4.68) / 2))
	(Length5offset = ((Length5 - 5) / 2)) 
	dbReplaceProp(pcCellView "function" "string" "transistor") 
	dbReplaceProp(pcCellView "pin#" "int" 3) 
	dbReplaceProp(pcCellView "_pcCompiledCounter" "int" 2449) 
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
		list(((4.23 - Width0offset):(2.31 + Length5offset)) 
		    ((4.43 - Width0offset):(2.51 + Length5offset))
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
		list(((4.2 - Width0offset):(-3.87 - Length5offset)) 
		    ((4.4 - Width0offset):(-3.67 - Length5offset))
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
		list(((2.05 - Width1offset):(-4.37 - Length5offset)) 
		    ((7.23 + Width1offset):(3.01 + Length5offset))
		)
	    )) 
	(pcLayer = 25) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(-3.92 - Length5offset)) 
		    ((5.14 + Width0offset):(2.56 + Length5offset))
		)
	    )) 
	(pcLayer = 25)
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((5.48 + Width0offset):(-3.92 - Length5offset)) 
		    ((6.48 + Width0offset + Width3offset):(2.56 + Length5offset))
		)
	    )) 
	(pcLayer = 25) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((2.8 - Width0offset - Width2offset):(-3.92 - Length5offset)) 
		    ((3.8 - Width0offset):(2.56 + Length5offset))
		)
	    ))
	(pcLayer = 43) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((2.3 - Width4offset):(-3.18 - Length5offset)) 
		    ((6.98 + Width4offset):(1.82 + Length5offset))
		)
	    )) 
	(pcLayer = 100) 
	(pcPurpose = "drawing")
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(-3.18 - Length5offset)) 
		    ((5.14 + Width0offset):(1.82 + Length5offset))
		)
	    )) 
	(pcLayer = 45) 
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(-3.92 - Length5offset)) 
		    ((5.14 + Width0offset):(-3.62 - Length5offset))
		)
	    )) 
	(pcLayer = 45)
	(pcPurpose = "drawing") 
	(pcInst = dbCreateRect(pcCellView 
		list(pcLayer pcPurpose) 
		list(((4.14 - Width0offset):(2.26 + Length5offset)) 
		    ((5.14 + Width0offset):(2.56 + Length5offset))
		)
	    )) t
    )
)
