#Requires AutoHotkey >=v2.0

HOTKEY_MODIFIERS := "#!^+&<>*~$"
PHYSICAL_STATE := "p"

ConvertFromHoldToToggle(key)
{
	Toggle(key)
}

ConvertFromToggleToHold(key)
{
	SendInput("{" key "}")

	KeyWait(key)

	SendInput("{" key "}")
}

SanitizeModifiers(hotkey)
{
	cleanedHotkey := LTrim(hotkey, HOTKEY_MODIFIERS)
	return cleanedHotkey
}

SendDelayed(key, delayMs := 25, shouldDelayAfterPress := true)
{
	SendInput("{" key " down}")

	Sleep(delayMs)

	SendInput("{" key " up}")

	if (shouldDelayAfterPress)
	{
		Sleep(delayMs)
	}
}

Toggle(key)
{
	keyIsDown := GetKeyState(key)
	if (keyIsDown)
	{
		SendInput("{" key " up}")
	}
	else
	{
		SendInput("{" key " down}")
	}
}

IsHeld(baseKey, timeoutInMs := 200)
{
	timeoutInSeconds := timeoutInMs / 1000

	keyIsHeld := !KeyWait(baseKey, "T" timeoutInSeconds "")
	if (keyIsHeld)
	{
		return true
	}

	return false
}

; Double tap

; Multi-tap

; Double tap and hold

; Hold, long hold, and tap
