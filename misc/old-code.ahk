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

; *Tab::
;     If !Time
;         Time := A_TickCount
; return

; *Tab Up::
;     If ( A_TickCount - Time < 400 ) ; If you hold for under 400 ms ( tap )
;     {
;         Send, {Tab}
;     }
;     else If ( A_TickCount - Time > 2000 ) ; If you hold for over 2 seconds ( long hold )
;     {
;         MsgBox, Long Hold
;     }
;     else ; If its between 400ms and 2s ( Hold )
;     {
;         MsgBox, Hold
;     }

;     Time := ""
; Return

; Modifiers and special
; Tab::
;     desiredMs := 100
;     elapsedMs := 0
;     While(GetKeyState("Tab", "P"))
;     {
;         if (elapsedMs>= desiredMs)
;         {
;             Send, {Ctrl down}
;         }

;         Sleep, 10
;         elapsedMs+=10
;     }

;     if (elapsedMs>= desiredMs)
;     {
;         Send, {Ctrl up}
;     }

;     if (elapsedMs < desiredMs)
;     {
;          Send, {Tab}
;     }
; return

; Space::
;     timeElapsed = 0
;     loop
;     {
;         if GetKeyState("Space", "P")
;         {
;             timeElapsed++
;         }
;         else
;         {
;             break
;         }
;         Sleep, 10
;     }

;     if (timeElapsed >= 300)
;     {
;         Send, 1
;     }
;     else
;     {
;         Send, 2
;     }

;     MsgBox, , 1, %timeElapsed%
; return

; *Space::
; 	If !Time
; 		Time := A_TickCount
; return

; *Space Up::
; 	If ( A_TickCount - Time < 400 )				; If you hold for under 400 ms ( tap )
; 	{
;         MsgBox, Tap
; 	}

; 	else If ( A_TickCount - Time > 2000 ) 		; If you hold for over 2 seconds ( long hold )
; 	{
;         MsgBox, Long Hold
; 	}

; 	else										; If its between 400ms and 2s ( Hold )
; 	{
;         MsgBox, Hold
; 	}

; 	Time := ""
; Return

; RControl::
;     loop
;     {
;         Sleep, 1
;         if GetKeyState("RControl", "P")
;         {
;             Send, RControl
;         }
;         else
;         {
;             Send, {Space}
;             break
;         }
;     }
; return

; ]::
;    FirePrecisionBolt()
; return

; [::
;     while GetKeyState("[","P")
;     {
;         Send, %heavyCannon%
;         Sleep, 250
;         FirePrecisionBolt()

;         if (!GetKeyState("[","P"))
;         {
;             break
;         }

;         Send, %superShotgun%
;         Click, Down
;         Sleep, 600
;         Click, Up
;     }
; return

; 0::
;     RotateWeapons("0", ballista, rocketLauncher)
; return

; 0::
;     switchDelay := 350

;     while GetKeyState("0","P")
;     {

;         Send, %ScombatShotgun%
;         Sleep, switchDelay
;         FireStickyGrenade()

;         if (!GetKeyState("0","P"))
;         {
;             break
;         }

;         Send, %heavyCannon%
;         Sleep, switchDelay
;         FirePrecisionBolt()
;     }
; return

; 3::
;     keywait, 3

;     combatShotgun := false
;     heavyCannon := false

;     plasmaRifle := !plasmaRifle
;     if (plasmaRifle)
;     {
;         Send, 3
;     }
;     else ;Ballista
;     {
;         plasmaRifle := false
;         Send, v
;     }
; return

; ~3::
;     KeyWait, 3
;     if (A_ThisHotkey = A_PriorHotkey and A_switchDelaySincePriorHotkey < 500)
;         Send, v
; return

; combatShotgun := "1"
; heavyCannon := "2"
; plasmaRifle := "3"
; rocketLauncher := "b"
; superShotgun := "c"
; ballista := "v"
; chaingun := "x"
; bfgUnmaykr := "f4"

; RotateWeapons(macroKey, weapon1, weapon2)
; {
;     switchDelay := 700

;     Send, %weapon1%
;     Click, Down
;     Sleep, switchDelay

;     while GetKeyState(macroKey,"P")
;     {
;         Send, %weapon2%
;         Sleep, switchDelay

;         if (!GetKeyState(macroKey,"P"))
;         {
;             break
;         }

;         Send, %weapon1%
;         Sleep, switchDelay
;     }

;     Click, Up
;     return
; }

; FirePrecisionBolt()
; {
;     Click, Down, Right
;     Sleep, 40
;     Click
;     Sleep, 30
;     Click, Up, Right
; }

; FireStickyGrenade()
; {
;     Click, Down, Right
;     Sleep, 70
;     Click
;     Sleep, 100
;     Click, Up, Right
; }

; ~[::
;     Send, %heavyCannon%
;     Sleep, 350
;     FirePrecisionBolt()

;     while GetKeyState("[","P")
;     {
;         Send, %ballista%
;         Click, Down
;         Sleep, 600
;         Click, Up

;         if (!GetKeyState("[","P"))
;         {
;             break
;         }

;         Send, %heavyCannon%
;         Sleep, 350
;         FirePrecisionBolt()
;     }
; return

; $F::
;     ; Fire ice grenade if held
;     fDown := A_TickCount
;     Keywait f
;     Duration := (A_TickCount - fDown)
;     If (Duration < 300)
;     {
;         Send, g{Control}
;         Sleep, 50
;         Send, g
;     }
;     Else
;     {
;         Send t
;     }
; return

; Bhop 1
; bunnyHopIsOn := false
; *LShift::
;     bunnyHopIsOn := !bunnyHopIsOn
;     while (bunnyHopIsOn)
;     {
;         Send, {Space}
;         ; Sleep, 1
;     }
; return

; Bhop 2
; *Space::
;     Loop
;     {
;         GetKeyState, state, SPACE, P

;         if state = U
;             break

;         Send,{Blind}{SPACE}
;         Sleep, 1
;     }

; return
