; #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; ; #SingleInstance, Force
; SendMode Input
; SetWorkingDir, %A_ScriptDir%

#Requires AutoHotkey >=v2.0

#Include common-headers.ahk

; Pause::
;     WinGet, id, list, ahk_class AutoHotkey
;     Loop, %id%
;     {
;         this_id := id%A_Index%
;         If (this_id <> control_id)
;         {
;             PostMessage, WM_COMMAND, CMD_PAUSE,,, ahk_id %this_id%
;             PostMessage, WM_COMMAND, CMD_SUSPEND,,, ahk_id %this_id%
;         }
;     }
; return

; Pause::
;     DetectHiddenWindows On
;     WinGet, ID, List, ahk_class AutoHotkey
;     Loop, %id% ; For each AutoHotkey script (normal or compiled):
;     {
;         this_id := id%A_Index%
;         ; The followingis the same as the user having selected "Pause Script"
;         ; from the tray menu:
;         PostMessage, 0x111, 65305,,, ahk_id %this_id% ; Use 65305 if you prefer Suspend.
;         PostMessage, 0x111, 65306,,, ahk_id %this_id% ; Use 65305 if you prefer Suspend.
;     }
; Return

; ; Debugging hold
; iDown := A_TickCount

; i::
; {
;     global
;     iDown := A_TickCount
;     tooltip iDown
;     Send "{f}"
; }

; i up::
; {
;     global
;     MsgBox "down at " iDown ", up at " A_TickCount ", down for " A_TickCount - iDown " ms."
; }
; ; Debugging hold

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
