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
; - No support for more taps than 2
; - Could interfere with other macros if rapidly switching between windows in games using the same key
IsDoubleTapped(key, timeout := 300)
{
	static previousPressMsByKey := Map()
	if (previousPressMsByKey.Has(key) == false)
	{
		previousPressMsByKey[key] := 0
	}

	currentPressMs := A_TickCount
	msSinceLastPress := currentPressMs - previousPressMsByKey[key]

	previousPressMsByKey[key] := currentPressMs

	doubleTapDetected := msSinceLastPress <= timeout

	if (doubleTapDetected) ; Reset, so repeated taps don't keep being detected double tap spam
	{
		previousPressMsByKey[key] := 0
	}
	else
	{
		previousPressMsByKey[key] := currentPressMs
	}

	return doubleTapDetected
}

; Multi-tap

; Double tap and hold

; Hold, long hold, and tap
