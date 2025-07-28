#Requires AutoHotkey >=v2.0

#Include libs/exclusions-from-desktop-macros.ahk
#Include libs/exclusions-from-strokesplus.ahk
#Include libs/constants.ahk

ProcessSetPriority "High"

#Include libs/games/alien-isolation.ahk
#Include libs/games/baldurs-gate-3.ahk
#Include libs/games/borderlands-3.ahk
#Include libs/games/common-rebinds.ahk
#Include libs/games/crab-champions.ahk
#Include libs/games/cyberpunk-2077.ahk
; #Include libs/games/daemon-x-machina.ahk
; #Include libs/games/darktide.ahk
#Include libs/games/deep-rock-galactic.ahk
#Include libs/games/destiny-2.ahk
; #Include libs/games/doom-eternal.ahk
; #Include libs/games/Fallout-4.ahk
#Include libs/games/halo-infinite.ahk
#Include libs/games/helldivers-2.ahk
#Include libs/games/horizon-zero-dawn.ahk
; #Include libs/games/necromunda-hired-gun.ahk
#Include libs/games/quake-2-remastered.ahk
#Include libs/games/rage-1.ahk
#Include libs/games/rage-2.ahk
#Include libs/games/remnant-ii.ahk
#Include libs/games/turbo-overkill.ahk
; #Include libs/games/ultrakill.ahk

; ; Prevents language switching while in-game
; ; Switching languages in games sometimes breaks macros
; #HotIf WinActive('ahk_group ExcludedPrograms')
; {
; 	!Shift:: return
; }

; ; Disable StrokesPlus
; ; TODO: Make it automatically disable StrokesPlus when a game is detected
; #HotIf WinActive('ahk_exe FSD-Win64-Shipping.exe')
; {
; 	ToggleApp(strokesPlusProcessName, strokesPlusLocation)
; }
; #HotIf

; ; Fix for the alt-tab issue
; #HotIf WinExist('ahk_group ExclusionsFromDesktopMacros')
; {
; 	; Alt & Tab::AltTabAndMenu
; 	; ToggleApp(STROKES_PLUS_PROCESS_NAME, STROKES_PLUS_LOCATION)
; }
; #HotIf
