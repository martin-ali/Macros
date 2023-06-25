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
;Sets the delay that will occur after each
;windowing command such as WinActivate.

SendMode("Input")
;     ;Switches to the SendInput method for Send,
;     ;SendRaw Click and MouseMove/Click/Drag.

SendMode("InputThenPlay")
;Same as above except that rather than
;falling back to Event mode when SendInput
;is unavailable it reverts to Play mode
;(below). This also causes the SendInput
;command itself to revert to Play mode when
;SendInput is unavailable.

; ;PID := DllCall("GetCurrentProcessId")
; ;Process, Priority, %PID%, High

#Requires AutoHotkey >=v2.0

#Include libs/exclusions.ahk

#HotIf !WinActive("ahk_group ExcludedPrograms")
{
    SendKeyOnlyOnTap(key, timeoutInMs := 200)
    {
        timeoutInSeconds := timeoutInMs / 1000

        keyIsTapped := KeyWait(key, "T" timeoutInSeconds "")
        KeyWait(key)

        if (keyIsTapped)
        {
            Send("{" key "}")
        }
    }

    $\::
    {
        SendKeyOnlyOnTap("\")
    }

    $Enter::
    {
        SendKeyOnlyOnTap("Enter")
    }

    $Tab::
    {
        SendKeyOnlyOnTap("Tab")
    }

    #HotIf GetKeyState("\", "p") and !WinActive("ahk_group ExcludedPrograms")
    {
        Space::Enter

        o::^PgUp ; Tab left
        [::^PgDn ; Tab right
        p::^w ; Close tab
    }

    #HotIf GetKeyState("Enter", "p") and !WinActive("ahk_group ExcludedPrograms")
    {
        ; Functionality
        m::^m ; Mute Tab
        ; x::^x
        ; c::^c
        v::^v
        `::Escape
        g::AppsKey
        Space::Enter
        Tab::CapsLock
        ; ; / or ? focuses on the search bar in some websites

        ; Navigation left side
        w::Up
        s::Down
        a::Left
        d::Right

        q::Home
        e::End
        f::PgUp
        c::PgDn

        z:: Send "{Browser_Back}"
        x:: Send "{Browser_Forward}"

        ; Navigation right side
        p::Up
        `;::Down
        l::Left
        '::Right

        o::Home
        [::End
        k::PgUp
        ,::PgDn

        .:: Send "{Browser_Back}"
        /:: Send "{Browser_Forward}"
    }
    #HotIf

    #HotIf GetKeyState("Tab", "p") and !WinActive("ahk_group ExcludedPrograms")
    {
        ; Tab
        q::^PgUp
        w::^w ; Close tab
        e::^PgDn
        t::^t ; New tab

        a::^a ; Select all
        s::^s ; Save
        d::^d ; Duplicate line

        z::^z ; Undo
        x::^x
        c::^c
        v::^v
        m::^m ; Mute Tab
        p::CapsLock
        ; Tab & f::^f ; Search
        Left::^Left ; Select all
        Right::^Right ; Select all

        ; Function row
        1::F1
        2::F2
        3::F3
        4::F4
        5::F5
        6::F6
        7::F7
        8::F8
        9::F9
        0::F10
        -::F11
        =::F12
    }
    #HotIf
}
#HotIf
