#Requires AutoHotkey >=v2.0

#Include libs/common-headers.ahk
#Include libs/exclusions.ahk
#Include libs/helpers.ahk

#HotIf !WinActive('ahk_group ExcludedPrograms')
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

    $\::
    $Enter::
    $Tab::
    $Delete::
    {
        thisKey := TrimModifiers(ThisHotkey)
        SendKeyOnlyOnTap(thisKey)
    }

    ; Window switching
    XButton2 & WheelUp:: SendInput("!{Escape}") ; Next window
    XButton2 & WheelDown:: SendInput("!+{Escape}") ; Previous window
    XButton2::XButton2

    XButton1 & WheelUp:: SendInput("!{Escape}") ; Next window
    XButton1 & WheelDown:: SendInput("!+{Escape}") ; Previous window
    XButton1::XButton1

    Numpad4::^PgUp ; WheelLeft
    Numpad5::^PgDn ; WheelRight

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

    Enter & z:: Send "{Browser_Back}"
    Enter & x:: Send "{Browser_Forward}"

    ; Navigation right side
    Enter & p::Up
    Enter & `;::Down
    Enter & l::Left
    Enter & '::Right

    Enter & o::Home
    Enter & [::End
    Enter & k::PgUp
    Enter & ,::PgDn

    Enter & .:: Send "{Browser_Back}"
    Enter & /:: Send "{Browser_Forward}"

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
