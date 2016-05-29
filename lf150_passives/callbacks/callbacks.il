;;//;;//Title: CDF callback functions for the bottom tier resistors in the S3D PDK
;;//;;//Author: Panagiotis Chaourani
;;//;;//Date: 18 March 2016

;;//;;//******************************************************************************************************************************************************************************************************
;;//;;//**********							pcRESl() - Check the lenth value that the user has inserted and update the corresponding pcell value			      **********
;;//;;//******************************************************************************************************************************************************************************************************
procedure( pcRES_SALl()

	prog( ()
		temp = evalstring(cdfgData->l->value) ;;//Covert string to float/integer
		tempW = evalstring(cdfgData->w->value)	;;	//Convert string to float
		Rsheet   = evalstring(cdfgData->rsh->value)	;;

		if( (type(temp) != 'flonum) 		
		then
			artError("Length Value must be a floating point number. The value will be set to default (10u).")	;;//artError will send error message to the CIW
			cdfgData->l->value = cdfgData->l->defValue
			cdfgData->Length->value = cdfgData->Length->defValue
			return(nil)
		)
		temp = (temp/1e-6)	;;//Convert it to um
		if( (temp < 10)
		then
			artError("The specified Length is less than the minimum allowed value (10u). The value will be set to minimum (10u).")	;;//artError will send error message to the CIW
			cdfgData->l->value = "10u"
			cdfgData->Length->value = 10
			return(nil)
		)
		
		cdfgData->Length->value = temp
		cdfgData->r->value = sprintf(s "%g"  (temp*1e-6/tempW*Rsheet) ) ;;//;;// 
	)

)

;;//;;//******************************************************************************************************************************************************************************************************
;;//;;//**********							pcRES_SALl() - Check the lenth value that the user has inserted and update the corresponding pcell value			      **********
;;//;;//******************************************************************************************************************************************************************************************************
procedure( pcRESl()

	prog( ()
		temp = evalstring(cdfgData->l->value) ;;//Covert string to float/integer
		tempW = evalstring(cdfgData->w->value)	;;	//Convert string to float
		Rh    = evalstring(cdfgData->Rhead->value)	;;
		Rb    = evalstring(cdfgData->Rbulk->value)	;;
		if( (type(temp) != 'flonum) 
		then
			artError("Length Value must be a floating point number. The value will be set to default (5u).")	;;//artError will send error message to the CIW
			cdfgData->l->value = cdfgData->l->defValue
			cdfgData->Length->value = cdfgData->Length->defValue
			return(nil)
		)
		temp = (temp/1e-6)	;;//Convert it to um
		if( (temp < 5)
		then
			artError("The specified Length is less than the minimum allowed value (5u). The value will be set to minimum (5u).")	;;//artError will send error message to the CIW
			cdfgData->l->value = "5u"
			cdfgData->Length->value = 5
			return(nil)
		)
		
		cdfgData->Length->value = temp
		cdfgData->r->value = sprintf(s "%g"  (temp*1e-6/tempW*Rb + 2*Rh*1e-6/tempW) ) ;;//;;// //(temp/tempW*Rb + 2*Rh*1e-6/tempW) needs parenthesises because it is a function

	)

)



;;//;;//******************************************************************************************************************************************************************************************************
;;//;;//**********							pcRESw() - Check the width value that the user has inserted and update the corresponding pcell value		      **********
;;//;;//******************************************************************************************************************************************************************************************************
procedure( pcRESw()

	prog( ()
		w_temp = evalstring(cdfgData->w->value) ;;//Covert string to float/integer
		tempL  = evalstring(cdfgData->l->value)	;;
		Rh    = evalstring(cdfgData->Rhead->value)	;;
		Rb    = evalstring(cdfgData->Rbulk->value)	;;
		if( (type(w_temp) != 'flonum) 
		then
			artError("Width Value must be a floating point number. The value will be set to default (1u).")	;;//artError will send error message to the CIW
			cdfgData->w->value = cdfgData->w->defValue
			cdfgData->Width->value = cdfgData->Width->defValue
			w_temp = 1e-6
			return(nil)
		)
		temp = (w_temp/1e-6)	;;//Convert it to um
		if( (temp < 1)
		then
			artError("The specified Width is less than the minimum allowed value (1u). The value will be set to minimum (1u).")	;;//artError will send error message to the CIW
			temp = 1
			wf_temp = 1e-6
  			cdfgData->w->value = "1u"
			cdfgData->Width->value = 6
			return(nil)
		)
		
		cdfgData->Width->value = temp
		cdfgData->r->value = sprintf(s "%g"  (tempL/(temp*1e-6)*Rb + 2*Rh/temp) ) ;

	)

)


;;//;;//******************************************************************************************************************************************************************************************************
;;//;;//**********							pcRESw() - Check the width value that the user has inserted and update the corresponding pcell value		      **********
;;//;;//******************************************************************************************************************************************************************************************************
procedure( pcRES_SALw()

	prog( ()
		w_temp = evalstring(cdfgData->w->value) ;;//Covert string to float/integer
		tempL  = evalstring(cdfgData->l->value)	;;
		Rsheet   = evalstring(cdfgData->rsh->value)	;;
		if( (type(w_temp) != 'flonum) 
		then
			artError("Width Value must be a floating point number. The value will be set to default (1u).")	;;//artError will send error message to the CIW
			cdfgData->w->value = cdfgData->w->defValue
			cdfgData->Width->value = cdfgData->Width->defValue
			w_temp = 1e-6
			return(nil)
		)
		temp = (w_temp/1e-6)	;;//Convert it to um
		if( (temp < 1)
		then
			artError("The specified Width is less than the minimum allowed value (1u). The value will be set to minimum (1u).")	;;//artError will send error message to the CIW
			temp = 1
			wf_temp = 1e-6
  			cdfgData->w->value = "1u"
			cdfgData->Width->value = 6
			return(nil)
		)
		
		cdfgData->Width->value = temp
		cdfgData->r->value = sprintf(s "%g"  tempL*1e6/temp*Rsheet ) ;;//;;// 
	)

)
