﻿#Requires AutoHotkey >=v2.0

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
	*f::
	{
		thisKey := SanitizeModifiers(ThisHotkey)

		if (IsHeld(thisKey, 300))
		{
			SendInput(thisKey)
		}
		else
		{
			SendInput("RControl")
		}

		KeyWait(thisKey)
	}

	*Enter::o
}
#HotIf
