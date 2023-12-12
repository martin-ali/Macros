#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe ULTRAKILL.exe')
{
	*$WheelUp:: SendInput("{[}") ; Weapon variant
	*$WheelDown:: SendInput("{]}") ; Fist variant

	*$Numpad1::q ; Whiplash

	*$Numpad0::e ; Punch

	*$XButton2::e ; Punch
}
#HotIf
