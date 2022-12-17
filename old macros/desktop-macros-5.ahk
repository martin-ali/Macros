#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

GroupAdd, ExclutionGroup, ahk_exe bms.exe
GroupAdd, ExclutionGroup, ahk_exe DOOMEternalx64vk.exe
GroupAdd, ExclutionGroup, ahk_exe Fallout4.exe
GroupAdd, ExclutionGroup, ahk_exe SC2_x64.exe
GroupAdd, ExclutionGroup, ahk_exe Prodeus.exe
#IfWinNotActive, ahk_group ExclutionGroup

Pause::Suspend
Tab::Tab
Space::Space
; RControl & `;::;
; `;::Space
RWin & `::Escape
\::\
; RWin & \::\
RWin & Tab::Enter
RWin & g::AppsKey
; RWin::RAlt

; Navigation
; Set left
RWin & w::Up
RWin & s::Down
RWin & a::Left
RWin & d::Right

RWin & q::Home
RWin & e::End
RWin & r::PgUp
RWin & f::PgDn

RControl & q::^PgUp ; Tab left
RControl & e::^PgDn ; Tab right

RWin & z::Browser_Back
RWin & x::Browser_Forward

; Set right
RWin & p::Up
RWin & `;::Down
RWin & l::Left
RWin & '::Right

RWin & o::Home
RWin & [::End
RWin & i::PgUp
RWin & k::PgDn

\ & o::^PgUp ; Tab left
\ & [::^PgDn ; Tab right
\ & p::^w ; Close tab

RWin & <::Browser_Back
RWin & >::Browser_Forward

; Deletion
Tab & r::^BackSpace
Tab & f::^Delete

LAlt & r::BackSpace
LAlt & f::Delete

LAlt & c::BackSpace
LAlt & v::Delete

RWin & c::BackSpace
RWin & v::Delete

; Functionality
RWin & m::^m ; Mute tab

; Tab
Tab & x::^x
Tab & c::^c
Tab & v::^v
Tab & s::^s ; Save
Tab & d::^d ; Duplicate line
Tab & w::^w ; Close tab
Tab & t::^t ; New tab
Tab & z::^z ; Undo
Tab & q::^PgUp
Tab & e::^PgDn

; Short
; RWin & [::{
; RWin & ]::}

; Function row
RWin & 1::F1
RWin & 2::F2
RWin & 3::F3
RWin & 4::F4
RWin & 5::F5
RWin & 6::F6
RWin & 7::F7
RWin & 8::F8
RWin & 9::F9
RWin & 0::F10
RWin & -::^-
RWin & =::^+

; Hotstrings
::slul::soyapoLaugh
::rntear::spudhunterSlayer spudhunterFist

return
; / or ? focuses on the search bar in some websites