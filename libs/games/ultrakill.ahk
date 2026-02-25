#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe ULTRAKILL.exe')
{
	*$WheelUp:: SendInput("{[}") ; Weapon variant
	*$WheelDown:: SendInput("{]}") ; Fist variant
}
#HotIf
