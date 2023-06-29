#SingleInstance Force
;Skips the dialog box and replaces the old
;instance automatically which is similar
;in effect to the Reload command.

; #Persistent
;     ;Keeps a script permanently running (that
;     ;is until the user closes it or ExitApp
;     ;is encountered).

InstallKeybdHook
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

SetKeyDelay(-1, 1)
;Sets the delay that will occur after each
;keystroke sent by Send and ControlSend.

SetControlDelay(-1)
;Sets the delay that will occur after each
;control-modifying command.

SetMouseDelay(-1)
;Sets the delay that will occur after each
;mouse movement or click.

SetWinDelay(-1)
; Sets the delay that will occur after each
; windowing command such as WinActivate.

SendMode("Input")
;Switches to the SendInput method for Send,
;SendRaw Click and MouseMove/Click/Drag.

SendMode("InputThenPlay")
; Same as above except that rather than
; falling back to Event mode when SendInput
; is unavailable it reverts to Play mode
; (below). This also causes the SendInput
; command itself to revert to Play mode when
; SendInput is unavailable.

; PID := DllCall("GetCurrentProcessId")
; Process Priority %PID% High

#MaxThreadsBuffer True
; Buffer keypresses rather than ignoring them when over the thread limit
; Experimental

A_HotkeyInterval := 0

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
; GroupAdd "CommonRebinds", "ahk_exe Rage.exe"
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

#HotIf WinActive("ahk_exe Rage.exe")
{
    *Enter::Space
    *LWin::Enter
    *LControl::p
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

#HotIf WinActive("ahk_exe CrabChampions-Win64-Shipping.exe") ; Alien Isolation
{
    XButton1::
    {
        SendInput("{LControl}")
        Sleep("5")
        SendInput("{LControl}")
    }
}
#HotIf

#HotIf WinActive("ahk_exe DOOMEternalx64vk.exe")
{
    ; meathookIsEnabled := true

    ; ; Ice bomb
    ; *t::
    ; {
    ;     delay := 10
    ;     SendDelayed("/", delay)
    ;     SendDelayed("RControl", delay)
    ;     SendDelayed("/", delay)

    ;     KeyWait("t")
    ; }

    ; ;  Autohop
    ; ; BUG: Sometimes starts hopping on its own; Cause unknown
    ; ; WORKAROUND: Temporarily re-implemented using the reWASD turbo function
    ; $LControl::
    ; {
    ;     ; SendInput("{LControl}")

    ;     ; KeyWait("LControl", "T0.2")

    ;     While GetKeyState("LControl", "P")
    ;     {
    ;         Send("{LControl}")
    ;         Sleep(10)
    ;     }
    ; }

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

#HotIf WinActive("ahk_exe RAGE2.exe")
{
    QuickUseEquipment(position, key, requiresHolding := false)
    {
        global sprint
        global useEquipment
        global switchEquipment

        startLoopsCount := position
        loop (startLoopsCount)
        {
            SendDelayed(switchEquipment, 10)
        }

        SendInput("{" useEquipment " down}")

        if (requiresHolding)
        {
            KeyWait(key)
        }

        SendInput("{" useEquipment " up}")

        returnLoopsCount := 4 - position
        loop (returnLoopsCount)
        {
            SendDelayed(switchEquipment, 10)
        }
    }

    ; Keybinds
    global sprint := "Enter"
    global useEquipment := "RCtrl"
    global switchEquipment := "["

    ; Item indices
    grenade := "0"
    wingstick := "1"
    shockGrenades := "2"
    turretDrone := "3"

    ![::
    {
        SendInput("{WheelUp}")
    }

    !]::
    {
        SendInput("{WheelDown}")
    }

    ; Wingstick
    ~$q::
    {
        thisKey := "q"

        inFocus := GetKeyState("XButton1", "P")
        if (!inFocus)
        {
            QuickUseEquipment(wingstick, thisKey, true)
        }

        KeyWait(thisKey)
    }

    ; Tap for shock grenades, hold for turret drone
    $g::
    {
        keyIsTapped := KeyWait("g", "T0.2")
        thisKey := "g"

        inFocus := GetKeyState("XButton1", "P")
        if (inFocus)
        {
            SendInput(thisKey)
        }
        else if (keyIsTapped)
        {
            QuickUseEquipment(shockGrenades, thisKey)
        }
        else ; Key is held
        {
            QuickUseEquipment(turretDrone, thisKey)
        }

        KeyWait(thisKey)
    }

    ; ; Toggle run
    ; ; Using the game's own toggle gives it unwanted double-tap-to-rush functionality
    ; ; Also supports holding to run
    ; *$Enter::
    ; {
    ;     SendInput("{Enter}")

    ;     ; Toggle
    ;     running := GetKeyState("w")
    ;     notSprinting := !GetKeyState(sprint)
    ;     if (running and notSprinting)
    ;     {
    ;         Toggle(sprint)
    ;     }

    ;     ; Hold
    ;     sprintIsReleased := !KeyWait("Enter", "T0.3")
    ;     KeyWait("Enter")
    ;     if (sprintIsReleased)
    ;     {
    ;         Toggle(sprint)
    ;     }

    ;     ; Edge case: If sprint is already toggled on, holding the sprint key should continue sprinting until released
    ;     ; Side-effect: When toggling sprint off, the toggle now triggers on keyup instead of keydown
    ;     notRunning := !running
    ;     sprinting := !notSprinting
    ;     if (sprinting or notRunning)
    ;     {
    ;         ; Toggle(sprint)
    ;         SendInput("{" sprint " up}")
    ;     }
    ; }

    ; ~*w Up::
    ; {
    ;     SendInput("{" sprint " up}")
    ; }

    ; ~*Escape::
    ; {
    ;     SendInput("{" sprint " up}")
    ; }

    ; ~*Tab::
    ; {
    ;     SendInput("{" sprint " up}")
    ; }

    ; ; ~*Shift::
    ; ; {
    ; ;     Send("{" sprint " up}")
    ; ; }
}
#HotIf

#HotIf WinActive("ahk_exe deadspace2.exe")
{
    *XButton1::[ ; Stasis
    *XButton2::] ; Kinesis

    *Enter:: ; WIP. DirectInput game?
    {
        playerIsAiming := GetKeyState("LButton", "P") or GetKeyState("RButton", "P")

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
    ; Use the mouse wheel to change fire modes and preserve scrolling in menus
    ~*WheelUp::
    {
        Send("{.}")
    }

    ~*WheelDown::
    {
        Send("{.}")
    }

    ; Autorun
    ~*w::
    {
        Send("{o down}")

        KeyWait("w")

        Send("{o up}")
    }

    ; Use F for Zane's secondary ability; Also hold F in menu to inspect weapon
    *f::
    {
        TapAndHold("f", "RControl", "f", 300)
    }

    *Enter::o
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

    ~*q::
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
