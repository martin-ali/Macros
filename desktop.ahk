#Requires AutoHotkey >=v2.0

#Include libs/common-headers.ahk
#Include libs/exclusions.ahk

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
        thisKey := ThisHotkeyClean(ThisHotkey)
        SendKeyOnlyOnTap(thisKey)
    }

    #HotIf GetKeyState("\", "p") and !WinActive("ahk_group ExcludedPrograms")
    {
        Space::Enter

        o::^PgUp ; Tab left
        [::^PgDn ; Tab right
        p::^w ; Close tab
    }
    #HotIf

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
