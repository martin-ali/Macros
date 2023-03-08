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

; Halo Infinite binds
grapplingHook := 1
motionTracker := 2
dropwall := 3
thruster := 4
activateAbility := "q"
meathookIsEnabled := true

sendWithDelay(key, delay := 25)
{
    Send, {%key% down}
    Sleep, %delay%
    Send, {%key% up}
}

#if WinActive("ahk_exe DOOMEternalx64vk.exe")
    or WinActive("ahk_exe DOOMx64vk.exe")
{
    global meathookIsEnabled

    =::Suspend

    ; Ice bomb
    #MaxThreads, 2
    t::
        KeyWait, t
        SendInput, {h}
        Sleep, 50
        SendInput, {RControl}
        Sleep, 50
        SendInput, {h}
    return

    ; Autohop
    LControl::
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

            Sleep, 1
        }
    return

    RButton::
        if (meathookIsEnabled == false)
        {
            Send, {e}
        }
    return

    c::
        meathookIsEnabled := false
        SendInput, {c}
    return

    x::
        meathookIsEnabled := true
        SendInput, {x}
    return

    v::
        meathookIsEnabled := true
        SendInput, {v}
    return

    b::
        meathookIsEnabled := true
        SendInput, {b}
    return

    Enter::
        meathookIsEnabled := true
        SendInput, {Enter}
    return

    LShift::
        meathookIsEnabled := true
        SendInput, {LShift}
    return

    ; LControl::
    ;     meathookIsEnabled := true
    ;     SendInput, {LControl}
    ; return

    2::
        meathookIsEnabled := true
        SendInput, {2}
    return

    XButton2::
        meathookIsEnabled := true
        SendInput, {XButton2}
    return
}

#if WinActive("ahk_exe ULTRAKILL.exe")
{
    WheelUp::
        SendInput T
    return

    WheelDown::
        SendInput G
    return
}

#if WinActive("ahk_exe HorizonZeroDawn.exe")
{
    ; cycle tools left
    WheelUp::
        sendWithDelay("[")
    return

    ; cycle tools right
    WheelDown::
        sendWithDelay("]")
    return

    ^WheelUp::
        Send, {WheelUp}
    return

    ^WheelDown::
        Send, {WheelDown}
    return

    ; ; Tap for map, hold to show HUD
    ; Tab::
    ;     desiredHoldMs := 200
    ;     startMs := A_TickCount
    ;     HoldIsFulfilled := false

    ;     while GetKeyState("Tab", "P")
    ;     {
    ;         elapsedMs := (A_TickCount - startMs)
    ;         HoldIsFulfilled := (elapsedMs >= desiredHoldMs)

    ;         if (HoldIsFulfilled)
    ;         {
    ;             Send, {h down}
    ;             break
    ;         }

    ;         Sleep, 10
    ;     }

    ;     KeyWait, `t

    ;     if(HoldIsFulfilled)
    ;     {
    ;         Send, {h up}
    ;     }
    ;     else
    ;     {
    ;         sendWithDelay("Tab")
    ;     }
    ; return
}

#if WinActive("ahk_exe destiny2.exe")
{
    Enter::Space
    Delete::Enter
    LControl::Numpad0
    RControl::Numpad1
}

#if WinActive("ahk_exe Magicka.exe")
    or WinActive("ahk_exe Cyberpunk2077.exe")
    or WinActive("ahk_exe Swat4.exe")
    or WinActive("ahk_exe HorizonZeroDawn.exe")
    or WinActive("ahk_exe Titanfall2.exe")
{
    Enter::Space
    BackSpace::Enter
    ; Space::Enter
}

#if WinActive("ahk_exe AI.exe")
{
    Enter::Space
    Ctrl::Shift
    Shift::C
}

#if WinActive("ahk_exe arma3_x64.exe")
; or WinActive("ahk_exe Indiana-Win64-Shipping.exe")
{
    Enter::Space
    Ctrl::Shift
    Shift::Ctrl
}

#if WinActive("ahk_exe vermintide2.exe")
    or WinActive("ahk_exe OxygenNotIncluded.exe")
{
    Enter::Space
}

#if WinActive("ahk_exe HaloInfinite.exe")
{
    global grapplingHook
    global dropwall
    global motionTracker
    global thruster
    global activateAbility

    SelectAbility(key, delay := 10)
    {
        SendInput, {%key% down}
        Sleep, delay

        SendInput, {%key% up}
        Sleep, delay
    }

    UseAbility(key, delay := 10)
    { 
        SelectAbility(key, delay)

        SendInput, %activateAbility%
    }

    Enter::Space

    XButton2::
        UseAbility(motionTracker)
        SelectAbility(grapplingHook)
    return

    XButton1::
        UseAbility(thruster)
        SelectAbility(grapplingHook)
    return

    g::
        UseAbility(dropwall)
        SelectAbility(grapplingHook)
    return
}
