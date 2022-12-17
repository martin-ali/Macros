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
RAlt::Space
; RControl & `;::;
; `;::Space
' & `::Escape
; ' & \::\
\::Space
' & Tab::Enter
' & g::AppsKey
'::'

; Navigation
; Set left
' & e::Up
' & d::Down
' & s::Left
' & f::Right

' & w::Home
' & r::End
' & q::PgUp
' & a::PgDn

RControl & w::^PgUp ; Tab left
RControl & r::^PgDn ; Tab right

' & z::Browser_Back
' & x::Browser_Forward

; Set right
' & o::Up
' & l::Down
' & k::Left
' & `;::Right

' & i::Home
' & p::End
' & u::PgUp
' & j::PgDn

; RControl & u::^PgUp ; Tab left
; RControl & o::^PgDn ; Tab right

' & <::Browser_Back
' & >::Browser_Forward

; Deletion
Tab & q::^BackSpace
Tab & a::^Delete

LAlt & q::BackSpace
LAlt & a::Delete

LAlt & c::BackSpace
LAlt & v::Delete

' & c::BackSpace
' & v::Delete

; Functionality
' & m::^m ; Mute tab

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
; ' & [::{
; ' & ]::}

; Function row
' & 1::F1
' & 2::F2
' & 3::F3
' & 4::F4
' & 5::F5
' & 6::F6
' & 7::F7
' & 8::F8
' & 9::F9
' & 0::F10
' & -::^-
' & =::^+

; Hotstrings
::slul::soyapoLaugh
::rntear::spudhunterSlayer spudhunterFist

return
; / or ? focuses on the search bar in some websites