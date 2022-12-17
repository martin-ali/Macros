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
GroupAdd, ExclutionGroup, ahk_exe WolfNewOrder_x64.exe
#IfWinNotActive, ahk_group ExclutionGroup
    ; #MaxThreadsPerHotkey, 2

    Tab::
        desiredHoldMs := 100
        startMs := A_TickCount
        elapsedTimeIsFulfilled := False

        While GetKeyState("Tab", "P")
        {
            elapsedMs := A_TickCount - startMs
            elapsedTimeIsFulfilled := elapsedMs >= desiredHoldMs

            if (elapsedTimeIsFulfilled)
            {
                Send, {RControl Down}
            }

            Sleep, 1
        }

        if (elapsedTimeIsFulfilled)
        {
            Send, {RControl Up}
        }
        else
        {
            Send, {Tab}
        }

        ; MsgBox, %elapsedMs%
    return

    Pause::Suspend
    ; Tab Up::Send, 1
    ; Tab::Tab
    ; Space::Space
    ; RAlt::Space
    NumLock & `::Escape
    ; RSHift::Space
    \::\
    ; NumLock & \::\
    ; NumLock & Tab::Enter
    NumLock & g::AppsKey
    ; Tab & Space::Enter

    ; Navigation
    ; Set left
    NumLock & w::Up
    NumLock & s::Down
    NumLock & a::Left
    NumLock & d::Right

    NumLock & q::Home
    NumLock & e::End
    NumLock & r::PgUp
    NumLock & f::PgDn

    RControl & q::^PgUp ; Tab left
    RControl & e::^PgDn ; Tab right

    NumLock & z::Browser_Back
    NumLock & x::Browser_Forward

    ; Set right
    NumLock & p::Up
    NumLock & `;::Down
    NumLock & l::Left
    NumLock & '::Right

    NumLock & o::Home
    NumLock & [::End
    NumLock & i::PgUp
    NumLock & k::PgDn

    \ & o::^PgUp ; Tab left
    \ & [::^PgDn ; Tab right
    \ & p::^w ; Close tab

    NumLock & <::Browser_Back
    NumLock & >::Browser_Forward

    ; Deletion
    RControl & r::^BackSpace
    RControl & f::^Delete

    LAlt & r::BackSpace
    LAlt & f::Delete

    LAlt & c::BackSpace
    LAlt & v::Delete

    NumLock & c::BackSpace
    NumLock & v::Delete

    ; Functionality
    NumLock & m::^m ; Mute tab

    ; ; Tab
    ; Tab & x::^x
    ; Tab & c::^c
    ; Tab & v::^v
    ; ; Tab & f::^f ; Search
    ; Tab & s::^s ; Save
    ; Tab & d::^d ; Duplicate line
    ; Tab & w::^w ; Close tab
    ; Tab & t::^t ; New tab
    ; Tab & z::^z ; Undo
    ; Tab & a::^a ; Select all
    ; Tab & Left::^Left ; Select all
    ; Tab & Right::^Right ; Select all
    ; Tab & q::^PgUp
    ; Tab & e::^PgDn

    ; Short
    ; NumLock & [::{
    ; NumLock & ]::}

    ; Function row
    NumLock & 1::F1
    NumLock & 2::F2
    NumLock & 3::F3
    NumLock & 4::F4
    NumLock & 5::F5
    NumLock & 6::F6
    NumLock & 7::F7
    NumLock & 8::F8
    NumLock & 9::F9
    NumLock & 0::F10
    ; NumLock & -::^-
    NumLock & -::F11
    ; NumLock & =::^+
    NumLock & =::F12

    ; Hotstrings
    ::slul::soyapoLaugh
    ::rntear::spudhunterSlayer spudhunterFist

    return
    ; / or ? focuses on the search bar in some websites
