#Requires AutoHotkey >=v2.0

#Include libs/exclusions.ahk

ProcessSetPriority "High"

; ; Prevents language switching while in-game
; ; Switching languages in games sometimes breaks macros
; #HotIf WinActive('ahk_group ExcludedPrograms')
; {
; 	!Shift:: return
; }

#Include libs/games/alien-isolation.ahk
#Include libs/games/baldurs-gate-3.ahk
#Include libs/games/borderlands-3.ahk
#Include libs/games/common-rebinds.ahk
#Include libs/games/crab-champions.ahk
#Include libs/games/cyberpunk-2077.ahk
#Include libs/games/deep-rock-galactic.ahk
#Include libs/games/destiny-2.ahk
#Include libs/games/doom-eternal.ahk
#Include libs/games/halo-infinite.ahk
#Include libs/games/horizon-zero-dawn.ahk
#Include libs/games/necromunda-hired-gun.ahk
#Include libs/games/quake-2-remastered.ahk
#Include libs/games/rage-1.ahk
#Include libs/games/rage-2.ahk
#Include libs/games/ultrakill.ahk
