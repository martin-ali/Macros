#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

GroupAdd, ExclutionGroup, ahk_exe bms.exe
GroupAdd, ExclutionGroup, ahk_exe DOOMEternalx64vk.exe
GroupAdd, ExclutionGroup, ahk_exe Fallout4.exe
GroupAdd, ExclutionGroup, ahk_exe SC2_x64.exe
GroupAdd, ExclutionGroup, ahk_exe Prodeus.exe
GroupAdd, ExclutionGroup, ahk_exe sw.x64.exe
#IfWinNotActive, ahk_group ExclutionGroup
    #MaxThreadsPerHotkey, 2

    Pause::Suspend

    ; RSHift::Space
    Tab::LControl
    Tab Up::Send, 1

    #If, GetKeyState("Tab", "P")

    ; ; Cut, copy, paste
    ; x::^x
    ; c::^c
    ; v::^v

    ; ; Control
    ; s::^s ; Save
    ; d::^d ; Duplicate line
    ; w::^w ; Close tab
    ; t::^t ; New tab
    ; z::^z ; Undo
    ; a::^a ; Select all
    ; q::^PgUp
    ; e::^PgDn

    ; Deletion
    r::^BackSpace
    f::^Delete

    Return

    #If, GetKeyState("\", "P")

    o::^PgUp ; Tab left
    [::^PgDn ; Tab right
    p::^w ; Close tab

    Return

    #If, GetKeyState("RControl", "P")

    q::^PgUp ; Tab left
    e::^PgDn ; Tab right

    Return

    #If, GetKeyState("LAlt", "P")

    r::BackSpace
    f::Delete

    c::BackSpace
    v::Delete

    Return

    #If, GetKeyState("Space", "P")

    ; Space::Return

    RSHift::RShift
    `::Escape
    Tab::Enter
    g::AppsKey

    ; Navigation
    ; Set left
    w::Up
    s::Down
    a::Left
    d::Right

    q::Home
    e::End
    r::PgUp
    f::PgDn

    z::Browser_Back
    x::Browser_Forward

    ; Set right
    p::Up
    `;::Down
    l::Left
    '::Right

    o::Home
    [::End
    i::PgUp
    k::PgDn

    ,::Browser_Back
    .::Browser_Forward

    ; Productivity
    c::BackSpace
    v::Delete

    ; Surfing
    m::^m ; Mute tab

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
    -::^-
    =::^+

    ; Hotstrings
    ::slul::soyapoLaugh
    ::rntear::spudhunterSlayer spudhunterFist
    ::sbow::ThankEgg

    return

    ; LCtrl and q and e have functionality in vscode