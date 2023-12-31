#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe ULTRAKILL.exe')
{
	*$WheelUp:: SendInput("{[}") ; Weapon variant
	*$WheelDown:: SendInput("{]}") ; Fist variant

	; Dedicated Knuckleblaster key
	*$Numpad0::
	{
		SendEvent("{]}")

		SendEvent("{e down}")

		KeyWait("Numpad0")

		SendEvent("{e up}")

		SendEvent("{]}")
	}
}
#HotIf
	