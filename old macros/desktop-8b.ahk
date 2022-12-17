#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#Include lib/exclusions.ahk

#IfWinNotActive, ahk_group ExclutionGroup

    Pause::Suspend

    layer = false

    Space::
        desiredHoldMs := 200
        startMs := A_TickCount
        elapsedTimeIsFulfilled := False
        elapsedMs := 0

        While GetKeyState("Space", "P")
        {
            elapsedMs := A_TickCount - startMs
            elapsedTimeIsFulfilled := elapsedMs >= desiredHoldMs

            if (elapsedTimeIsFulfilled)
            {
                layer = true
                break
            }

            Sleep, 10
        }
    return

    Space Up::
        {
            if(layer)
            {
                layer := false
            }
            else
            {
                Send, {Space}
            }
        }
    return

    ; Slash
    \::\

    \ & o::^PgUp ; Tab left
    \ & [::^PgDn ; Tab right
    \ & p::^w ; Close tab

    ; Tab
    Tab::Tab

    Tab & x::^x
    Tab & c::^c
    Tab & v::^v

    Tab & s::^s ; Save
    Tab & d::^d ; Duplicate line
    Tab & w::^w ; Close tab
    Tab & t::^t ; New tab
    Tab & z::^z ; Undo
    Tab & a::^a ; Select all
    Tab & q::^PgUp
    Tab & e::^PgDn

    Tab & r::^BackSpace
    Tab & f::^Delete

    ; LAlt
    LAlt & r::BackSpace
    LAlt & f::Delete

    LAlt & c::BackSpace
    LAlt & v::Delete

    ; Hotstrings
    ::slul::soyapoLaugh
    ::rntear::spudhunterSlayer spudhunterFist

    #if layer

    Tab::Enter
    `::Escape
    g::AppsKey

    ; Navigation
    ; Set left
    w::Up
    s::Down
    a::Left
    d::Right

    q::Home
    e::End
    f::PgUp
    c::PgDn

    z::Browser_Back
    x::Browser_Forward

    ; Set right
    p::Up
    `;::Down
    l::Left
    '::Right

    o::Home
    [::End
    k::PgUp
    ,::PgDn

    .::Browser_Back
    /::Browser_Forward

    b::Space
    v::Enter
    BackSpace::Delete

    ; Functionality
    m::^m ; Mute Tab

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

    return
    ; / or ? focuses on the search bar in some websites
