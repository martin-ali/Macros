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

SendDelayed(key, delayMs := 25, delayAfterPress := true)
{
	LongPress(key, delayMs)

	if (delayAfterPress)
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

LongPress(key, timeMs)
{
	SendInput("{" key " down}")

	Sleep(timeMs)

	SendInput("{" key " up}")
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
