#Requires AutoHotkey >=v2.0

#Include libs/exclusions-from-desktop-macros.ahk
#Include libs/helpers.ahk

#HotIf !WinActive('ahk_group ExclusionsFromDesktopMacros')
{
    SendKeyOnlyOnTap(key, timeoutInMs := 100)
    {
        timeoutInSeconds := timeoutInMs / 1000

        keyIsTapped := KeyWait(key, "T" timeoutInSeconds)
        KeyWait(key)

        if (keyIsTapped)
        {
            SendInput("{" key "}")
        }
    }

    ; Need a fix for the alt-tab double-tab issue
    $\::
    $Enter::
    ; $Tab::
    $Delete::
    {
        thisKey := SanitizeModifiers(ThisHotkey)
        SendKeyOnlyOnTap(thisKey)
    }

    ; Disable extra buttons
    Numpad0::MButton
    Numpad5::MButton

    ; ; Upper side buttons
    ; Numpad1:: SendInput("!{escape}") ; Next window
    ; Numpad2:: SendInput("!+{escape}") ; Previous window

    ; ; Window switching
    ; XButton2 & WheelUp:: SendInput("!{escape}") ; Next window
    ; XButton2 & WheelDown:: SendInput("!+{escape}") ; Previous window
    ; XButton2::XButton2

    ; XButton1 & WheelUp:: SendInput("!{escape}") ; Next window
    ; XButton1 & WheelDown:: SendInput("!+{escape}") ; Previous window
    ; XButton1::XButton1

    Numpad3::^PgUp ; WheelLeft
    Numpad4::^PgDn ; WheelRight

    Delete & -::^- ; Zoom in
    Delete & =::^= ; Zoom out
    Delete & 0::^0 ; Zoom reset

    \ & Delete::NumLock
    \ & -::^- ; Zoom in
    \ & =::^= ; Zoom out
    \ & 0::^0 ; Zoom reset
    \ & o::^PgUp ; Tab left
    \ & [::^PgDn ; Tab right
    \ & p::^w ; Close tab

    ; Functionality
    Enter & m::^m ; Mute Tab
    Enter & `::Escape
    Enter & g::AppsKey
    Enter & Space::Enter
    Enter & Tab::CapsLock
    ; ; / or ? focuses on the search bar in some websites

    ; Navigation left side
    Enter & w::Up
    Enter & s::Down
    Enter & a::Left
    Enter & d::Right

    Enter & q::Home
    Enter & e::End
    Enter & f::PgUp
    Enter & c::PgDn

    Enter & z:: Send "{browser_back}"
    Enter & x:: Send "{browser_forward}"

    ; Navigation right side
    Enter & p::Up
    Enter & `;::Down
    Enter & l::Left
    Enter & '::Right

    Enter & o::Home
    Enter & [::End
    Enter & k::PgUp
    Enter & ,::PgDn

    Enter & .:: Send "{browser_back}"
    Enter & /:: Send "{browser_forward}"

    ; Function row
    Enter & 1::F1
    Enter & 2::F2
    Enter & 3::F3
    Enter & 4::F4
    Enter & 5::F5
    Enter & 6::F6
    Enter & 7::F7
    Enter & 8::F8
    Enter & 9::F9
    Enter & 0::F10
    Enter & -::F11
    Enter & =::F12

    ; #HotIf GetKeyState("Tab", PHYSICAL_STATE) and !WinActive("ahk_group ExcludedPrograms")
    ; Tab
    Tab::Tab ; Tab left
    Tab & q::^PgUp ; Tab left
    Tab & w::^w ; Close tab
    Tab & e::^PgDn ; Tab right
    Tab & t::^t ; New tab

    Tab & a::^a ; Select all
    Tab & s::^s ; Save
    Tab & d::^d ; Duplicate line

    Tab & z::^z ; Undo
    Tab & x::^x ; Cut
    Tab & c::^c ; Copy
    Tab & v::^v ; Paste
    Tab & m::^m ; Mute Tab
}
#HotIf
