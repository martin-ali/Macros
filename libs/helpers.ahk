#Requires AutoHotkey >=v2.0

#Include common-headers.ahk

HOTKEY_MODIFIERS := "#!^+&<>*~$"

ThisHotkeyClean(hotkey)
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

TapAndHold(baseKey, tapKey, holdKey, timeoutInMs := 200, shouldDelay := false)
{
	timeoutInSeconds := timeoutInMs / 1000

	keyIsTapped := KeyWait(baseKey, "T" timeoutInSeconds "")
	if (keyIsTapped)
	{
		if (shouldDelay)
		{
			SendDelayed(tapKey)
		}
		else
		{
			SendInput("{" tapKey "}")
		}
	}
	else
	{
		if (shouldDelay)
		{
			SendDelayed(holdKey)
		}
		else
		{
			SendInput("{" holdKey "}")
		}
	}

	KeyWait(baseKey)
}

; Double tap

; Multi-tap

; Double tap and hold
