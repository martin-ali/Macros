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

#if WinActive("ahk_exe DOOMEternalx64vk.exe")
    or WinActive("ahk_exe DOOMx64vk.exe")
{
    =::Suspend

    t::
        ; Fire ice grenade
        KeyWait, t
        Send, {WheelDown}{RControl}
        ; g^
        Sleep, 50
        Send, {WheelDown}
    return

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
}

#if WinActive("ahk_exe ULTRAKILL.exe")
{
    #MaxThreadsPerHotkey, 2

    WheelUp::
        SendInput T
    return

    WheelDown::
        SendInput G
    return
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
    useAbility(abilityBind, bindToAwait, timeout := 10){
        KeyWait, %bindToAwait%

        Send, {%abilityBind% down}
        Sleep, timeout
        Send, {%abilityBind% up}
        Sleep, timeout

        Send, {m down}
        Sleep, timeout
        Send, {m up}
        Sleep, timeout
    }

    resetToGrapplingHook() {
        Send {1 down}
        Sleep, 10
        Send {1 up}
        Sleep 10
    }

    XButton2::
        motionTracker := 2

        useAbility(motionTracker, XButton2)
        resetToGrapplingHook()
    return

    XButton1::
        thruster := 4

        useAbility(thruster, XButton1)
        resetToGrapplingHook()
    return

    g::
        dropwall := 3

        useAbility(dropwall, g)
        resetToGrapplingHook()
    return

    Enter::Space
    q::m ; Workaround for Q-based ability activation causing shift to be send as well
}
