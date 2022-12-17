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
GroupAdd, ExclutionGroup, ahk_exe bms.exe
GroupAdd, ExclutionGroup, ahk_exe DOOMEternalx64vk.exe
GroupAdd, ExclutionGroup, ahk_exe Fallout4.exe
GroupAdd, ExclutionGroup, ahk_exe SC2_x64.exe
GroupAdd, ExclutionGroup, ahk_exe Prodeus.exe
#IfWinNotActive, ahk_group ExclutionGroup

; Modifiers and special
; Alt & z::Suspend
; Alt & .::Suspend
Alt::Suspend
`::Escape

; Navigation
; Set 1
o::Up
l::Down
k::Left
`;::Right

i::Home
p::End
u::PgUp
j::PgDn

[::^PgUp
]::^PgDn

,::Browser_Back
.::Browser_Forward

; Set 2
w::Up
s::Down
a::Left
d::Right

q::Home
e::End
r::PgUp
f::PgDn

RControl & q::^PgUp
RControl & e::^PgDn

z::Browser_Back
x::Browser_Forward

; Functionality
t::BackSpace
g::Delete

RControl & r::BackSpace
Alt & r::BackSpace
RControl & f::Delete

Tab::Enter
h::AppsKey
'::^t ; Open new tab
/::^w ; Close tab

m::^m ; Mute tab
; -::^-
; =::^=
; w::^w

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