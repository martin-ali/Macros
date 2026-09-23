#Requires AutoHotkey >=v2.0

#Include libs/exclusions-from-desktop-macros.ahk
#Include libs/helpers.ahk

$#q::Insert

#HotIf !WinActive('ahk_group ExclusionsFromDesktopMacros')
{
    SendKeyOnlyOnTap(key, timeoutMs := 100)
    {
        timeoutSeconds := timeoutMs / 1000

        keyIsTapped := KeyWait(key, "T" timeoutSeconds)
        KeyWait(key)

        if (keyIsTapped)
        {
            SendInput("{" key "}")
        }
    }

    ; Need a fix for the alt-tab double-tab issue
    $\::
    $Enter::
    $Tab::
    {
        thisKey := SanitizeModifiers(ThisHotkey)
        SendKeyOnlyOnTap(thisKey)
    }

    ; Disable extra buttons
    Numpad0::MButton
    Numpad5::MButton

    Numpad1::^PgUp ; WheelLeft
    Numpad2::^PgDn ; WheelRight

    \ & '::NumLock

    Enter & -::^- ; Zoom in
    Enter & =::^= ; Zoom out
    Enter & 0::^0 ; Zoom reset
    Enter & u::^PgUp ; Tab left
    Enter & o::^PgDn ; Tab right
    Enter & i::^w ; Close tab

    ; Functionality
    Enter & m::^m ; Mute Tab
    Enter & `::Escape
    Enter & g::AppsKey
    Enter & Space::Enter
    Enter & Tab::CapsLock
    ; ; / or ? focuses on the search bar in some websites

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
