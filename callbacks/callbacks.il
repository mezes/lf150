;;Title: CDF callback functions for the top tier nmos_ll_4_top transistor in the S3D PDK
;;Author: Panagiotis Chaourani
;;Date: 18 June 2015

;;******************************************************************************************************************************************************************************************************
;;**********							pcMOSl() - Check the lenth value that the user has inserted and update the corresponding pcell value			     								  **********
;;******************************************************************************************************************************************************************************************************
procedure( pcMOSl()

	prog( ()
		temp = evalstring(cdfgData->l->value) ;Covert string to float/integer
		if( (type(temp) != 'flonum) 
		then
			artError("Length Value must be a floating point number. The value will be set to default (0.15u).")	;artError will send error message to the CIW
			cdfgData->l->value = cdfgData->l->defValue
			cdfgData->Length->value = cdfgData->Length->defValue
			return(nil)
		)
		temp = (temp/1e-6)	;Convert it to um
		if( (temp < 0.15)
		then
			artError("The specified Length is less than the minimum allowed value (0.15u). The value will be set to minimum (0.15u).")	;artError will send error message to the CIW
			cdfgData->l->value = "0.15u"
			cdfgData->Length->value = 0.15
			return(nil)
		)
		if( (temp > 20)
		then
			artError("The specified Length is larger than the maximum allowed value (20u). The value will be set to maximum (20u).")	;artError will send error message to the CIW
			cdfgData->l->value = "20u"
			cdfgData->Length->value = 20
			return(nil)
		)
		cdfgData->Length->value = temp

	)

)

;;******************************************************************************************************************************************************************************************************
;;**********							pcMOSwf() - Check the finger width value that the user has inserted and update the corresponding pcell value		                                  **********
;;******************************************************************************************************************************************************************************************************
procedure( pcMOSwf()

	prog( ()
		wf_temp = evalstring(cdfgData->wf->value) ;Covert string to float/integer
		nf_temp = evalstring(cdfgData->nf->value) ;Covert string to float/integer
		if( (type(wf_temp) != 'flonum) 
		then
			artError("Finger Width Value must be a floating point number. The value will be set to default (0.32u).")	;artError will send error message to the CIW
			cdfgData->wf->value = cdfgData->wf->defValue
			wf_temp = 0.32e-6
			return(nil)
		)
		temp = (wf_temp/1e-6)	;Convert it to um
		if( (temp < 0.32)
		then
			artError("The specified Finger Width is less than the minimum allowed value (0.32u). The value will be set to minimum (0.32u).")	;artError will send error message to the CIW
			temp = 0.32
			wf_temp = 0.32e-6
  			cdfgData->wf->value = "0.32u"
			return(nil)
		)
		if( (temp > 50)
		then
			artError("The specified Finger Width is larger than the maximum allowed value (50u). The value will be set to maximum (50u).")	;artError will send error message to the CIW
			temp = 50
			wf_temp = 50e-6
			cdfgData->wf->value = "50u"
			return(nil)
		)
		;;**********;Examine if nf is even or odd**********
		nf2 = mod(nf_temp 2)
		;;**********;as, ad, ps, pd Calculation**********
		if( (nf2 != 0) 	;Examine if nf is even or odd
		then	;;Calculate as, ad if nf is odd
			as_temp = ((nf_temp + 1)/2*0.37e-6*wf_temp + (nf_temp - 1)/2*50e-9*wf_temp)	
			ad_temp = ((nf_temp + 1)/2*0.37e-6*wf_temp + (nf_temp - 1)/2*50e-9*wf_temp)
			ps_temp = (2*(0.37e-6 + wf_temp) + (nf_temp - 1)*(0.42e-6 + wf_temp))	
			pd_temp = (2*(0.37e-6 + wf_temp) + (nf_temp - 1)*(0.42e-6 + wf_temp))
		else	;;Calculate as, ad if nf is even
			as_temp = ((nf_temp/2 + 1)*0.37e-6*wf_temp + (nf_temp/2 - 1)*50e-9*wf_temp)
			ad_temp = (nf_temp/2*0.37e-6*wf_temp + nf_temp/2*50e-9*wf_temp)
			ps_temp = 4*(0.37e-6 + wf_temp) + (nf_temp - 2)*(0.42e-6 + wf_temp)
			pd_temp = nf_temp*(0.42e-6 + wf_temp)
		)	
		cdfgData->finger_width->value = temp
		cdfgData->w->value = sprintf(s "%g"  (wf_temp*nf_temp) )
		cdfgData->as->value = sprintf(s "%g" as_temp )
		cdfgData->ad->value = sprintf(s "%g" ad_temp )
		cdfgData->as_sim->value = sprintf(s "%g" as_temp )
		cdfgData->ad_sim->value = sprintf(s "%g" ad_temp )
		cdfgData->ps->value = sprintf(s "%g" ps_temp )
		cdfgData->pd->value = sprintf(s "%g" pd_temp )
		cdfgData->ps_sim->value = sprintf(s "%g" ps_temp )
		cdfgData->pd_sim->value = sprintf(s "%g" pd_temp )

	)

)

;;******************************************************************************************************************************************************************************************************
;;**********							pcMOSnf() - Check the number of fingers that the user has inserted and update the corresponding pcell value		                                      **********
;;******************************************************************************************************************************************************************************************************
procedure( pcMOSnf()

	prog( ()
		temp = evalstring(cdfgData->nf->value) ;Covert string to float/integer
		wf_temp = evalstring(cdfgData->wf->value)
		if( (type(temp) != 'fixnum) 
		then
			artError("Number of fingers must be an integer number. The value will be set to default (1).")	;artError will send error message to the CIW
			cdfgData->nf->value = cdfgData->nf->defValue
			temp = 1
			return(nil)
		)
		if( (temp > 100)
		then
			artError("The specified Number of fingers is larger than the maximum allowed value (100). The value will be set to maximum (100).")	;artError will send error message to the CIW
			cdfgData->nf->value = "100"
			temp = 100
			return(nil)
		)
		;;**********;Examine if nf is even or odd**********
		
		nf2 = mod(temp 2)
		;;**********;as, ad, ps, pd Calculation**********
		if( (nf2 != 0)
		then	;;Calculate as, ad if nf is odd
			as_temp = ((temp + 1)/2*0.37e-6*wf_temp + (temp - 1)/2*50e-9*wf_temp)	
			ad_temp = ((temp + 1)/2*0.37e-6*wf_temp + (temp - 1)/2*50e-9*wf_temp)
			ps_temp = (2*(0.37e-6 + wf_temp) + (temp - 1)*(0.42e-6 + wf_temp))	
			pd_temp = (2*(0.37e-6 + wf_temp) + (temp - 1)*(0.42e-6 + wf_temp))
		else	;;Calculate as, ad if nf is even
			as_temp = ((temp/2 + 1)*0.37e-6*wf_temp + (temp/2 - 1)*50e-9*wf_temp)
			ad_temp = (temp/2*0.37e-6*wf_temp + temp/2*50e-9*wf_temp)
			ps_temp = 4*(0.37e-6 + wf_temp) + (temp - 2)*(0.42e-6 + wf_temp)
			pd_temp = temp*(0.42e-6 + wf_temp)
		)	
		cdfgData->Fingers->value = temp
		cdfgData->w->value = sprintf(s "%g" (temp*wf_temp)) 
		cdfgData->as->value = sprintf(s "%g" as_temp )
		cdfgData->ad->value = sprintf(s "%g" ad_temp )
		cdfgData->as_sim->value = sprintf(s "%g" as_temp )
		cdfgData->ad_sim->value = sprintf(s "%g" ad_temp )
		cdfgData->ps->value = sprintf(s "%g" ps_temp )
		cdfgData->pd->value = sprintf(s "%g" pd_temp )
		cdfgData->ps_sim->value = sprintf(s "%g" ps_temp )
		cdfgData->pd_sim->value = sprintf(s "%g" pd_temp )

	)

)
