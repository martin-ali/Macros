#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe ULTRAKILL.exe')
{
	*$WheelUp:: SendInput("{[}") ; Swap weapon variant

	*$WheelDown:: SendInput("{]}") ; Swap fist variant

	*$Numpad1::q ; Swap fist variant

	*$Numpad0::e
	*$XButton2::e
}
#HotIf
