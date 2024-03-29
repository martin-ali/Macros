﻿#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe HorizonZeroDawn.exe')
{
	; Binds
	global ShowHud := "h"

	; Run
	*Enter::Space

	; Cycle tools left
	*WheelUp:: SendDelayed("[")

	; Cycle tools right
	*WheelDown:: SendDelayed("]")

	; Zoom in / scroll up
	*!WheelUp::WheelUp

	; Zoom out / scroll down
	*!WheelDown::WheelDown

	; Toggle weapon wheel
	*MButton::
	{
		thisKey := SanitizeModifiers(ThisHotkey)
		Toggle(thisKey)
	}

	; Tap for map, hold to show HUD
	*$Tab::
	{
		SendInput("{" ShowHud " down}")

		thisKey := SanitizeModifiers(ThisHotkey)
		keyIsTapped := KeyWait(thisKey, "T0.35")
		if (keyIsTapped)
		{
			SendDelayed(thisKey)
		}

		KeyWait(thisKey)

		SendInput("{" ShowHud " up}")
	}
}
#HotIf
