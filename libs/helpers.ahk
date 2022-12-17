﻿#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

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
