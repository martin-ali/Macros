#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Borderlands3.exe')
{
	; Change fire mode / scroll
	~*WheelUp::
	~*WheelDown:: SendInput("{.}")

	; Autorun
	~*w::
	{
		SendInput("{o down}")

		KeyWait("w")

		SendInput("{o up}")
	}

	; Tap F for Zane's secondary ability, hold F in menu to inspect weapon
	*f:: TapAndHold("f", "RControl", "f", 300)

	*Enter::o
}
#HotIf
