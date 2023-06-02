; ; #NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; ; ; #Warn ; Enable warnings to assist with detecting common errors.
; ; SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
; ; SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; #NoEnv
;     ;Avoids checking empty variables to see if
;     ;they are environment variables
;     ;(recommended for all new scripts).

#SingleInstance Force
;Skips the dialog box and replaces the old
;instance automatically which is similar
;in effect to the Reload command.

; #Persistent
;     ;Keeps a script permanently running (that
;     ;is until the user closes it or ExitApp
;     ;is encountered).

; #InstallKeybdHook
;     ;Forces the unconditional installation of
;     ;the keyboard hook.

#UseHook
;Force the use of the hook for hotkeys
;after this point.

; #KeyHistory 0
;     ;Sets the maximum number of keyboard and
;     ;mouse events displayed by the KeyHistory
;     ;window. You can set it to 0 to disable
;     ;key history.

; #HotKeyInterval 1
;     ;Along with #MaxHotkeysPerInterval,
;     ;specifies the rate of hotkey activations
;     ;beyond which a warning dialog will be
;     ;displayed.


; #MaxHotkeysPerInterval 127
;     ;Along with #HotkeyInterval specifies the
;     ;rate of hotkey activations beyond which a
;     ;warning dialog will be displayed.

; SetKeyDelay,-1 1
;     ;Sets the delay that will occur after each
;     ;keystroke sent by Send and ControlSend.

; SetControlDelay -1
;     ;Sets the delay that will occur after each
;     ;control-modifying command.

; SetMouseDelay -1
;     ;Sets the delay that will occur after each
;     ;mouse movement or click.

; SetWinDelay,-1
;     ;Sets the delay that will occur after each
;     ;windowing command such as WinActivate.

; SendMode Input
;     ;Switches to the SendInput method for Send,
;     ;SendRaw Click and MouseMove/Click/Drag.

; ;SendMode InputThenPlay
;     ;Same as above except that rather than
;     ;falling back to Event mode when SendInput
;     ;is unavailable it reverts to Play mode
;     ;(below). This also causes the SendInput
;     ;command itself to revert to Play mode when
;     ;SendInput is unavailable.

; ;PID := DllCall("GetCurrentProcessId")
; ;Process Priority %PID% High

; #MaxThreadsBuffer True
; ; Buffer keypresses rather than ignoring them when over the thread limit
; ; Experimental

#MaxThreads 12

#Requires AutoHotkey >=v2.0

#Include libs/helpers.ahk

GroupAdd "CommonRebinds", "ahk_exe Magicka.exe"
GroupAdd "CommonRebinds", "ahk_exe Cyberpunk2077.exe"
GroupAdd "CommonRebinds", "ahk_exe Swat4.exe"
GroupAdd "CommonRebinds", "ahk_exe Titanfall2.exe"
GroupAdd "CommonRebinds", "ahk_exe bms.exe"
GroupAdd "CommonRebinds", "ahk_exe vermintide2.exe"
GroupAdd "CommonRebinds", "ahk_exe OxygenNotIncluded.exe"
GroupAdd "CommonRebinds", "ahk_exe FarCry6.exe"
GroupAdd "CommonRebinds", "ahk_exe R6-Extraction_Plus.exe"
GroupAdd "CommonRebinds", "ahk_exe MCC-Win64-Shipping.exe"
GroupAdd "CommonRebinds", "ahk_exe Dead Space.exe"
GroupAdd "CommonRebinds", "ahk_exe fc3_blooddragon_d3d11.exe"
GroupAdd "CommonRebinds", "ahk_exe Mechanicus.exe"
GroupAdd "CommonRebinds", "ahk_exe MidnightSuns-Win64-Shipping.exe"
GroupAdd "CommonRebinds", "ahk_exe Control_DX11.exe"
GroupAdd "CommonRebinds", "ahk_exe SW3.exe"
GroupAdd "CommonRebinds", "ahk_exe Rage.exe"
GroupAdd "CommonRebinds", "ahk_exe Rage64.exe"

#HotIf WinActive("ahk_group CommonRebinds")
{
    *Enter::Space
    *Delete::Enter
}
#HotIf

#HotIf WinActive("ahk_exe ULTRAKILL.exe")
{
    *WheelUp:: SendInput("{[}") ; Swap weapon variant
    *WheelDown:: SendInput("{]}") ; Swap fist variant
}
#HotIf

#HotIf WinActive("ahk_exe RAGE2.exe")
{
    sprintIsToggled := false

    *$WheelUp::
    {
        SendInput("{q}")
        SendInput("{WheelDown}")
    }

    *$WheelDown::
    {
        SendInput("{q}")
        SendInput("{WheelUp}")
    }

    ; Toggle run. Using the game's own toggle gives it unwanted double-tap-to-rush functionality
    ; Also supports holding to run
    *Enter::
    {
        sprintIsToggled := GetKeyState("Enter")
        if (sprintIsToggled)
        {
            SendInput("{Enter up}")
        }
        else
        {
            SendInput("{Enter down}")
        }

        sprintIsHeld := KeyWait("Enter", "T0.5")
        KeyWait("Enter")

        if (!sprintIsHeld)
        {
            SendInput("{Enter up}")
        }
    }

    ; Makes it so releasing W also causes the sprint to un-toggle
    *w::
    {
        Send("{w down}")
    }

    *w Up::
    {
        Send("{w up}")
        Send("{Enter up}")
    }
}
#HotIf

#HotIf WinActive("ahk_exe deadspace2.exe")
{
    *XButton1::[ ; Stasis
    *XButton2::] ; Kinesis

    *Enter:: ; WIP. DirectInput game?
    {
        playerIsAiming := GetKeyState("LButton", "P") or GetKeyState("RButton", "P")

        ; MsgBox playerIsAiming
        if (playerIsAiming)
        {
            SendDelayed(".", 25, true)
            SendInput("{.}")
            MsgBox("Aiming")
        }
        else
        {
            SendDelayed("/", 25, true)
            SendInput("{/}")
            MsgBox("Running")
        }
    }
}
#HotIf

#HotIf WinActive("ahk_exe Borderlands3.exe")
{
    ; Use wheel to swap fire modes while also preserving its functionality in menus
    *WheelUp::
    {
        Send("{WheelUp}")
        Send("{.}")
    }

    *WheelDown::
    {
        Send("{WheelDown}")
        Send("{.}")
    }

    ; Autorun
    *w::
    {
        Send("{w down}")
        Send("{o down}")

        KeyWait("w")

        Send("{w up}")
        Send("{o up}")

    }

    ; Use F for Zane's secondary ability; Also hold F in menu to inspect weapon
    *f::
    {
        TapAndHold("f", "RCtrl", "f", 300)
    }

    *Enter::o
}
#HotIf

#HotIf WinActive("ahk_exe destiny2.exe")
{
    *Enter::Space
    *Delete::Enter
    *LControl::Numpad0
    *RControl::Numpad1
}
#HotIf

#HotIf WinActive("ahk_exe AI.exe") ; Alien Isolation
{
    *Enter::Space
    *Ctrl::Shift
    *Shift::C
}
#HotIf

#HotIf WinActive("ahk_exe DOOMEternalx64vk.exe")
{
    meathookIsEnabled := true

    *t:: ; Ice bomb
    {
        ; KeyWait t
        Send("{h}")
        Sleep(50)
        Send("{RControl}")
        Sleep(50)
        Send("{h}")
    }

    *LControl:: ; Autohop
    {
        desiredHoldMs := 100
        startMs := A_TickCount

        Send("{LControl}")

        While GetKeyState("LControl", "P")
        {
            elapsedMs := A_TickCount - startMs
            elapsedTimeIsFulfilled := elapsedMs >= desiredHoldMs

            if (elapsedTimeIsFulfilled)
            {
                Send("{LControl}")
            }

            Sleep(5)
        }
    }

    ; ; TODO: Find a cleaner way to disable the meathook
    ; *RButton::
    ; {
    ;     if (meathookIsEnabled == false)
    ;     {
    ;         Send("{e}")
    ;     }
    ; }

    ; *c::
    ; {
    ;     meathookIsEnabled := false
    ;     SendInput("{c}")
    ; }

    ; *x::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{x}")
    ; }

    ; *v::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{v}")
    ; }

    ; *b::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{b}")
    ; }

    ; *Enter::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{Enter}")
    ; }

    ; *LShift::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{LShift}")
    ; }

    ; *2::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{2}")
    ; }

    ; *XButton2::
    ; {
    ;     meathookIsEnabled := true
    ;     SendInput("{XButton2}")
    ; }
}
#HotIf

#HotIf WinActive("ahk_exe HaloInfinite.exe")
{
    grapplingHook := 1
    motionTracker := 2
    dropwall := 3
    thruster := 4
    activateAbility := "/"

    SelectAbility(key)
    {
        SendInput(key)
    }

    UseAbility(key, delay := 25)
    {
        SelectAbility(key)

        Sleep(delay)

        SendInput("{" activateAbility "}")
    }

    *Enter::Space

    *q::
    {
        UseAbility(grapplingHook)
    }

    *XButton2::
    {
        UseAbility(motionTracker)
        SelectAbility(grapplingHook)
    }

    *XButton1::
    {
        UseAbility(thruster)
        SelectAbility(grapplingHook)
    }

    *g::
    {
        UseAbility(dropwall)
        SelectAbility(grapplingHook)
    }
}
#HotIf

#HotIf WinActive("ahk_exe HorizonZeroDawn.exe")
{
    ; Run
    *Enter::Space

    ; Cycle tools left
    *WheelUp:: SendDelayed("[")

    ; Cycle tools right
    *WheelDown:: SendDelayed("]")

    ; Zoom in / scroll up
    *^WheelUp::WheelUp

    ; Zoom out / scroll down
    *^WheelDown::WheelDown

    ; Toggle weapon wheel
    *MButton::
    {
        wheelIsShown := GetKeyState("MButton")
        if (wheelIsShown)
        {
            SendInput("{MButton up}") ; Hide wheel
        }
        else
        {
            SendInput("{MButton down}") ; Show wheel
        }
    }

    ; Tap for map, hold to show HUD
    *$Tab::
    {
        SendInput("{h down}")

        keyIsTapped := KeyWait("Tab", "T0.3")
        if (keyIsTapped)
        {
            SendDelayed("Tab")
        }

        KeyWait("Tab")

        SendInput("{h up}")
    }
}
#HotIf
