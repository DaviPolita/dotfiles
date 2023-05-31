
$LButton::    
{ ; V1toV2: Added bracket
ErrorLevel := !KeyWait("LButton")
ErrorLevel := !KeyWait("LButton", "D TO 0.5")
if ErrorLevel
	Send("{LButton}")
Return
} ; V1toV2: Added bracket in the end
