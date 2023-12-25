#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Cyberpunk2077.exe')
{
	*$Enter::Space
	*$Delete::Enter

	*$r::
	{
		thisKey := SanitizeModifiers(ThisHotkey)

		if (IsHeld(thisKey))
		{
			SendInput("=") ; Holster weapon
		}
		else
		{
			SendInput(thisKey) ; Reload
		}

		KeyWait(thisKey)
	}

	*$e::
	{
		thisKey := SanitizeModifiers(ThisHotkey)

		if (IsHeld(thisKey))
		{
			SendInput("-") ; Melee weapon
		}
		else
		{
			SendInput(thisKey) ; Quick melee
		}

		KeyWait(thisKey)
	}
}
#HotIf
