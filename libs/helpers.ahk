﻿#Requires AutoHotkey >=v2.0

HOTKEY_MODIFIERS := "#!^+&<>*~$"
PHYSICAL_STATE := "p"

ToggleApp(processName, appLocation)
{
	If ProcessExist(processName)
	{
		ProcessClose(processName)
	}
	else
	{
		Run(appLocation)
	}
}

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

Hold(key)
{
	SendInput("{" key " down}")

	KeyWait(key)

	SendInput("{" key " up}")
}

IsHeld(baseKey, timeoutInMs := 200)
{
	timeoutInSeconds := timeoutInMs / 1000

	keyIsHeld := !KeyWait(baseKey, "T" timeoutInSeconds)
	return keyIsHeld
}

; Advantages:
; - Works even if other keys are pressed during the macro execution
; Limitations:
; - Always writes its new state, so it can't be used multiple times in a single shortcut
; - Could interfere with other macros if rapidly switching between windows in games using the same key
IsMultiTapped(key, tapCount, timeout := 300)
{
	static previousPressMsByKey := Map()
	static TapsCountInSeriesByKey := Map()

	if (previousPressMsByKey.Has(key) == false
		|| TapsCountInSeriesByKey.Has(key) == false)
	{
		previousPressMsByKey[key] := 0
		TapsCountInSeriesByKey[key] := 1
	}

	currentPressMs := A_TickCount
	msSinceLastPress := currentPressMs - previousPressMsByKey[key]

	additionalTapDetected := msSinceLastPress <= timeout
	if (additionalTapDetected == false)
	{
		previousPressMsByKey[key] := 0
		TapsCountInSeriesByKey[key] := 1
	}

	multiTapDetected := TapsCountInSeriesByKey[key] == tapCount
	if (multiTapDetected)  ; Reset, so repeated taps don't keep being as detected multi tap spam
	{
		previousPressMsByKey[key] := 0
		TapsCountInSeriesByKey[key] := 0
	}

	previousPressMsByKey[key] := currentPressMs
	TapsCountInSeriesByKey[key] := TapsCountInSeriesByKey[key] + 1

	return multiTapDetected
}

IsDoubleTapped(key, timeout := 300)
{
	return IsMultiTapped(key, 2, timeout)
}

IsTripleTapped(key, timeout := 300)
{
	return IsMultiTapped(key, 3, timeout)
}

; Multi-tap

; Double tap and hold

; Hold, long hold, and tap
