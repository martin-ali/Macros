#Requires AutoHotkey >=v2.0

#Include libs/common-headers.ahk
#Include libs/exclusions.ahk
#Include libs/helpers.ahk

#HotIf !WinActive("ahk_group ExcludedPrograms")
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
    {
        thisKey := TrimModifiers(ThisHotkey)
        SendKeyOnlyOnTap(thisKey)
    }

    Numpad4::^PgUp ; WheelLeft
    Numpad5::^PgDn ; WheelRight

    WheelRight::^PgDn
}
#HotIf

#HotIf GetKeyState("\", PHYSICAL_STATE) and !WinActive("ahk_group ExcludedPrograms")
{
    Delete::NumLock
    -::^- ; Zoom in
    =::^= ; Zoom out
    0::^0 ; Zoom reset
    o::^PgUp ; Tab left
    [::^PgDn ; Tab right
    p::^w ; Close tab
}
#HotIf

#HotIf GetKeyState("Enter", PHYSICAL_STATE) and !WinActive("ahk_group ExcludedPrograms")
{
    ; Functionality
    m::^m ; Mute Tab
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

#HotIf GetKeyState("Tab", PHYSICAL_STATE) and !WinActive("ahk_group ExcludedPrograms")
{
    ; Tab
    q::^PgUp ; Tab left
    w::^w ; Close tab
    e::^PgDn ; Tab right
    t::^t ; New tab

    a::^a ; Select all
    s::^s ; Save
    d::^d ; Duplicate line

    z::^z ; Undo
    x::^x ; Cut
    c::^c ; Copy
    v::^v ; Paste
    m::^m ; Mute Tab
}
#HotIf
