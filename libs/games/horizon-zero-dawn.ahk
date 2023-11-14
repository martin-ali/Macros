#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe HorizonZeroDawn.exe')
{
	; Binds
	showHud := "h"

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
		thisKey := TrimModifiers(ThisHotkey)
		Toggle(thisKey)
	}

	; Tap for map, hold to show HUD
	*$Tab::
	{
		SendInput("{" showHud " down}")

		thisKey := TrimModifiers(ThisHotkey)
		keyIsTapped := KeyWait(thisKey, "T0.35")
		if (keyIsTapped)
		{
			SendDelayed(thisKey)
		}

		KeyWait(thisKey)

		SendInput("{" showHud " up}")
	}
}
#HotIf
