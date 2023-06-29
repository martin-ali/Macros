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

#HotIf WinActive("ahk_exe CrabChampions-Win64-Shipping.exe")
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
    ; Ice bomb
    *t::
    {
        SetKeyDelay(1, 1)

        SendEvent("{/}")
        SendEvent("{RControl}")
        SendEvent("{/}")

        KeyWait("t")
    }

    ;  Autohop
    *$LControl::
    {
        SetKeyDelay(1, 0)

        While GetKeyState("LControl", "P")
        {
            SendEvent("{LControl}")
        }
    }
}
#HotIf

#HotIf WinActive("ahk_exe RAGE2.exe")
{
    QuickUseEquipment(position, keyToHold := "")
    {
        SetKeyDelay(25, 1)

        global useEquipment
        global switchEquipment

        startLoopsCount := position
        loop (startLoopsCount)
        {
            SendEvent("{" switchEquipment "}")
        }

        SendEvent("{" useEquipment " down}")

        if (keyToHold)
        {
            KeyWait(keyToHold)
        }

        SendEvent("{" useEquipment " up}")

        returnLoopsCount := 4 - position
        loop (returnLoopsCount)
        {
            SendEvent("{" switchEquipment "}")
        }
    }

    ; Keybinds
    global sprint := "Enter"
    global useEquipment := "RControl"
    global switchEquipment := "["

    ; Item indices
    grenade := "0"
    wingstick := "1"
    shockGrenades := "2"
    turretDrone := "3"

    ; Wingstick
    ~$q::
    {
        thisKey := SubStr(ThisHotkey, 3)

        inFocus := GetKeyState("XButton1", "P")
        if (!inFocus)
        {
            QuickUseEquipment(wingstick, thisKey)
        }

        KeyWait(thisKey)
    }

    ; Tap for shock grenades, hold for turret drone
    ~$g::
    {
        thisKey := SubStr(ThisHotkey, 3)
        keyIsTapped := KeyWait(thisKey, "T0.2")

        inFocus := GetKeyState("XButton1", "P")
        if (!inFocus)
        {
            if (keyIsTapped)
            {
                QuickUseEquipment(shockGrenades)
            }
            else ; Key is held
            {
                QuickUseEquipment(turretDrone)
            }
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
    *!WheelUp::WheelUp

    ; Zoom out / scroll down
    *!WheelDown::WheelDown

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
