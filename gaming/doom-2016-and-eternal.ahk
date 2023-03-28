; #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; ; #Warn ; Enable warnings to assist with detecting common errors.
; SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#NoEnv
    ;Avoids checking empty variables to see if
    ;they are environment variables
    ;(recommended for all new scripts).

#SingleInstance, Force
    ;Skips the dialog box and replaces the old
    ;instance automatically, which is similar
    ;in effect to the Reload command.

#Persistent
    ;Keeps a script permanently running (that
    ;is, until the user closes it or ExitApp
    ;is encountered).

#InstallKeybdHook
    ;Forces the unconditional installation of
    ;the keyboard hook.

#UseHook
    ;Force the use of the hook for hotkeys
    ;after this point.

#KeyHistory, 0
    ;Sets the maximum number of keyboard and
    ;mouse events displayed by the KeyHistory
    ;window. You can set it to 0 to disable
    ;key history.

#HotKeyInterval 1
    ;Along with #MaxHotkeysPerInterval,
    ;specifies the rate of hotkey activations
    ;beyond which a warning dialog will be
    ;displayed.


#MaxHotkeysPerInterval 127
    ;Along with #HotkeyInterval, specifies the
    ;rate of hotkey activations beyond which a
    ;warning dialog will be displayed.

SetKeyDelay,-1, 1
    ;Sets the delay that will occur after each
    ;keystroke sent by Send and ControlSend.

SetControlDelay, -1
    ;Sets the delay that will occur after each
    ;control-modifying command.

SetMouseDelay, -1
    ;Sets the delay that will occur after each
    ;mouse movement or click.

SetWinDelay,-1
    ;Sets the delay that will occur after each
    ;windowing command, such as WinActivate.

SendMode, Input
    ;Switches to the SendInput method for Send,
    ;SendRaw, Click, and MouseMove/Click/Drag.

;SendMode, InputThenPlay
    ;Same as above except that rather than
    ;falling back to Event mode when SendInput
    ;is unavailable, it reverts to Play mode
    ;(below). This also causes the SendInput
    ;command itself to revert to Play mode when
    ;SendInput is unavailable.

;PID := DllCall("GetCurrentProcessId")
;Process, Priority, %PID%, High

#MaxThreadsPerHotkey, 12

meathookIsEnabled := true

*=::Suspend

; Ice bomb
*t::
    ; KeyWait, t
    SendInput, {h}
    Sleep, 50

    SendInput, {RControl}

    Sleep, 50
    SendInput, {h}
return

; Autohop
*LControl::
    desiredHoldMs := 100
    startMs := A_TickCount

    SendInput, {LControl}

    While GetKeyState("LControl", "P")
    {
        elapsedMs := A_TickCount - startMs
        elapsedTimeIsFulfilled := elapsedMs >= desiredHoldMs

        if (elapsedTimeIsFulfilled)
        {
            SendInput {LControl}
        }

        Sleep, 5
    }
return

; ; TODO: Find a cleaner way to disable the meathook
; *RButton::
;     if (meathookIsEnabled == false)
;     {
;         Send, {e}
;     }
; return

; *c::
;     meathookIsEnabled := false
;     SendInput, {c}
; return

; *x::
;     meathookIsEnabled := true
;     SendInput, {x}
; return

; *v::
;     meathookIsEnabled := true
;     SendInput, {v}
; return

; *b::
;     meathookIsEnabled := true
;     SendInput, {b}
; return

; *Enter::
;     meathookIsEnabled := true
;     SendInput, {Enter}
; return

; *LShift::
;     meathookIsEnabled := true
;     SendInput, {LShift}
; return

; ; *LControl::
; ;     meathookIsEnabled := true
; ;     SendInput, {LControl}
; ; return

; *2::
;     meathookIsEnabled := true
;     SendInput, {2}
; return

; *XButton2::
;     meathookIsEnabled := true
;     SendInput, {XButton2}
; return
