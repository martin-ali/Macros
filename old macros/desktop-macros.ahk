#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; #If WinActive("Firefox.exe") or WinActive("Code.exe") or WinActive("Discord.exe") or WinActive("devenv.exe")
; #IfWinActive, ahk_exe Firefox.exe
; #IfWinActive, ahk_exe Code.exe
; #IfWinActive, ahk_exe Discord.exe
; #IfWinActive, ahk_exe devenv.exe

; GroupAdd, InclusionGroup, ahk_exe Firefox.exe
; GroupAdd, InclusionGroup, ahk_exe Code.exe
; GroupAdd, InclusionGroup, ahk_exe Discord.exe
; GroupAdd, InclusionGroup, ahk_exe devenv.exe
; GroupAdd, InclusionGroup, ahk_exe explorer.exe
; #IfWinActive, ahk_group InclusionGroup

; GroupAdd, ExclutionGroup, ahk_exe explorer.exe
#IfWinNotActive, ahk_group ExclutionGroup

; Modifiers and setup
; CapsLock::Control
Space::Space
Space & \::CapsLock

; Navigation
; Set 1
Space & o::Up
Space & l::Down
Space & k::Left
Space & `;::Right

Space & i::Home
Space & p::End
Space & u::PgUp
Space & j::PgDn

Space & ,::Browser_Back
Space & .::Browser_Forward

Space & [::^PgUp
Space & ]::^PgDn

; Set 2
Space & w::Up
Space & s::Down
Space & a::Left
Space & d::Right

Space & q::PgUp
Space & e::PgDn

Control & q::^PgUp
Control & e::^PgDn

; Functionality
Space & Tab::Enter
Space & r::BackSpace
Space & f::Delete
; Space & z::AppsKey

Space & m::^m
Space & t::^t
Space & g::^w

; Space & -::^-
; Space & =::^=
; Space & w::^w

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
Space & -::F11
Space & =::F12

return