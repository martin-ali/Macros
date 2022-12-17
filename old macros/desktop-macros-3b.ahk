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

    Pause::Suspend
    Tab::Tab
    Space::Space
    RAlt::Space
    ; RControl & `;::;
    ; `;::Space
    Space & `::Escape
    ; Space & \::\
    \::Space
    Space & Tab::Enter
    Space & g::AppsKey

    ; Navigation
    ; Set left
    Space & e::Up
    Space & d::Down
    Space & s::Left
    Space & f::Right

    Space & w::Home
    Space & r::End
    Space & q::PgUp
    Space & a::PgDn

    RControl & w::^PgUp ; Tab left
    RControl & r::^PgDn ; Tab right

    Space & z::Browser_Back
    Space & x::Browser_Forward

    ; Set right
    Space & i::Up
    Space & k::Down
    Space & j::Left
    Space & l::Right

    Space & u::Home
    Space & o::End
    Space & p::PgUp
    Space & `;::PgDn

    RControl & u::^PgUp ; Tab left
    RControl & o::^PgDn ; Tab right

    Space & <::Browser_Back
    Space & >::Browser_Forward

    ; Deletion
    Tab & q::^BackSpace
    Tab & a::^Delete

    LAlt & q::BackSpace
    LAlt & a::Delete

    LAlt & c::BackSpace
    LAlt & v::Delete

    Space & c::BackSpace
    Space & v::Delete

    ; Functionality
    Space & m::^m ; Mute tab

    ; Tab
    Tab & x::^x
    Tab & c::^c
    Tab & v::^v
    Tab & s::^s ; Save
    Tab & d::^d ; Duplicate line
    Tab & e::^w ; Close tab
    Tab & t::^t ; New tab
    Tab & z::^z ; Undo
    Tab & w::^PgUp
    Tab & r::^PgDn

    ; Short
    ; Space & [::{
    ; Space & ]::}

    ; Function row
    Space & 1::F1
    Space & 2::F2
    Space & 3::F3
    Space & 4::F4
    Space & 5::F5
    Space & 6::F6
    Space & 7::F7
    Space & 8::F8
    Space & 9::F9
    Space & 0::F10
    Space & -::^-
    Space & =::^+

    ; Hotstrings
    ::slul::soyapoLaugh
    ::rntear::spudhunterSlayer spudhunterFist

    return
    ; / or ? focuses on the search bar in some websites