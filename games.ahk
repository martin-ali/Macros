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

#MaxThreads 12

SendDelayed(key, delayMs := 25, shouldDelayAfterPress := false)
{
    Send, {%key% down}
    Sleep, %delayMs%

    Send, {%key% up}
    if (shouldDelayAfterPress)
    {
        Sleep, %delayMs%
    }
}

; Halo Infinite
grapplingHook := 1
motionTracker := 2
dropwall := 3
thruster := 4
activateAbility := "/"

; Doom Eternal
meathookIsEnabled := true

; Horizon Zero Dawn
weaponWheelIsToggled := false

GroupAdd, CommonRebinds, ahk_exe Magicka.exe
GroupAdd, CommonRebinds, ahk_exe Cyberpunk2077.exe
GroupAdd, CommonRebinds, ahk_exe Swat4.exe
GroupAdd, CommonRebinds, ahk_exe Titanfall2.exe
GroupAdd, CommonRebinds, ahk_exe bms.exe
GroupAdd, CommonRebinds, ahk_exe vermintide2.exe
GroupAdd, CommonRebinds, ahk_exe OxygenNotIncluded.exe
GroupAdd, CommonRebinds, ahk_exe FarCry6.exe
GroupAdd, CommonRebinds, ahk_exe R6-Extraction_Plus.exe
GroupAdd, CommonRebinds, ahk_exe MCC-Win64-Shipping.exe
GroupAdd, CommonRebinds, ahk_exe Dead Space.exe
GroupAdd, CommonRebinds, ahk_exe fc3_blooddragon_d3d11.exe
GroupAdd, CommonRebinds, ahk_exe Mechanicus.exe
GroupAdd, CommonRebinds, ahk_exe MidnightSuns-Win64-Shipping.exe
GroupAdd, CommonRebinds, ahk_exe Control_DX11.exe

#IfWinActive ahk_group CommonRebinds

    *Enter::Space
    *Delete::Enter

#IfWinActive

#IfWinActive ahk_exe DOOMEternalx64vk.exe

    global meathookIsEnabled

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

#IfWinActive

#IfWinActive ahk_exe ULTRAKILL.exe

    *WheelUp::Send, {[}

    *WheelDown::Send, {]}

#IfWinActive

#IfWinActive ahk_exe HorizonZeroDawn.exe

    global weaponWheelIsToggled

    Enter::Space

    ; Cycle tools left
    *WheelUp::SendDelayed("[")

    ; Cycle tools right
    *WheelDown::SendDelayed("]")

    ; Zoom in / scroll up
    *^WheelUp::WheelUp

    ; Zoom out / scroll down
    *^WheelDown::WheelDown

    ; Toggle weapon wheel
    *MButton::
        if (weaponWheelIsToggled)
        {
            Send, {MButton up}
            weaponWheelIsToggled := false
        }
        else
        {
            Send, {MButton down}
            weaponWheelIsToggled := true
        }
    return

    ; Tap for map, hold to show HUD
    Tab::
        desiredHoldMs := 200
        startMs := A_TickCount
        HoldIsFulfilled := false
        Send, {h down}

        while GetKeyState("Tab", "P")
        {
            elapsedMs := (A_TickCount - startMs)
            HoldIsFulfilled := (elapsedMs >= desiredHoldMs)

            if (HoldIsFulfilled)
            {
                break
            }

            Sleep, 10
        }

        KeyWait, `t

        if(HoldIsFulfilled) ; Hold
        {
            Send, {h up}
        }
        else ; Tap
        {
            SendDelayed("Tab")
        }
    return

#IfWinActive

#IfWinActive ahk_exe destiny2.exe

    *Enter::Space
    *Delete::Enter
    *LControl::Numpad0
    *RControl::Numpad1

#IfWinActive

#IfWinActive ahk_exe AI.exe ; Alien Isolation

    *Enter::Space
    *Ctrl::Shift
    *Shift::C

#IfWinActive

#IfWinActive ahk_exe HaloInfinite.exe

    global grapplingHook
    global motionTracker
    global dropwall
    global thruster
    global activateAbility

    SelectAbility(key)
    {
        SendInput, %key%
    }

    ; UseAbility(key, delay := 100)
    UseAbility(key, delay := 20)
    {
        SelectAbility(key)

        Sleep, delay

        SendInput, {%activateAbility%}
    }

    *Enter::Space

    *q::
        UseAbility(grapplingHook)
    return

    *XButton2::
        UseAbility(motionTracker)
        SelectAbility(grapplingHook)
    return

    *XButton1::
        UseAbility(thruster)
        SelectAbility(grapplingHook)
    return

    *g::
        UseAbility(dropwall)
        SelectAbility(grapplingHook)
    return

#IfWinActive
