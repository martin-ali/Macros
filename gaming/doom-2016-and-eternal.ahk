#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey, 2

=::Suspend

t::
    ; Fire ice grenade
    KeyWait, t
    Send, {WheelDown}{RControl}
    ; g^
    Sleep, 50
    Send, {WheelDown}
return

; Space::
;     While GetKeyState("Space", "P")
;     {
;         Send, {Space}
;         Sleep, 1
;     }
; return

Enter::
    desiredHoldMs := 100
    startMs := A_TickCount

    Send, {Enter}

    While GetKeyState("Enter", "P")
    {
        elapsedMs := A_TickCount - startMs
        elapsedTimeIsFulfilled := elapsedMs >= desiredHoldMs

        if (elapsedTimeIsFulfilled)
        {
            Send, {Enter}
        }

        Sleep, 1
    }
return

; x := false
; n::
;     x := !x
;     While x
;     {
;         if (!x)
;         {
;             break
;         }

;         Send, {Click}
;         Sleep, 1
;     }
; return

; *Space up::
;     elapsedTimeIsFulfilled := False
; return
