﻿#Requires AutoHotkey >=v2.0

#Include ../libs/helpers.ahk
; #Include ../libs/xinput.ahk

; Joy1::LWin
; Joy2::LWin
; Joy3::LWin
; Joy4::LWin
; Joy5::LWin
; Joy6::LWin
; Joy7::LWin
; Joy8::LWin
; Joy9::LWin
; Joy10::LWin

; f1::
; {
; 	Loop 20
; 	{
; 		if GetKeyState(ControllerNumber "Joy" A_Index)
; 			buttons_down .= " " A_Index
; 	}
; }

; f1::
; {
; 	thisKey := SanitizeModifiers(ThisHotkey)

; 	isHeldv := IsHeld(thisKey)
; 	; isDoubleTappedv := IsDoubleTapped(thisKey)
; 	isDoubleTappedv := IsTripleTapped(thisKey)
; 	; isDoubleTappedv := IsMultiTapped(thisKey, 6)

; 	if (isHeldv && isDoubleTappedv) ; Tap and hold
; 	{
; 		SendInput("TapAndHold - ")
; 	}
; 	else if (isHeldv)
; 	{
; 		SendInput("Hold - ")
; 	}
; 	else if (isDoubleTappedv)
; 	{
; 		SendInput("MultiTap - ")
; 	}
; 	else
; 	{
; 		SendInput("Tap - ")
; 	}

; 	KeyWait(thisKey)

; }

; $f1::
; {
; 	if (A_PriorHotkey == ThisHotkey && A_TimeSinceThisHotkey < 1000)
; 	{
; 		SendInput("1")
; 	}
; }

; $f2::
; {
; 	SendInput("2")
; }

; $f3::
; {
; 	Static presses := 0
; 	Static squelch := 300
; 	hk := StrReplace(ThisHotkey, "$") ; Strip the dollar sign

; 	If KeyWait(hk, 'T.5') ; If key was quickly released,
; 	{
; 		SetTimer(done, -squelch)  ; then reset timer, and increment counter
; 		presses++
; 	}
; 	Else ; If held, send the shifted key
; 	{
; 		Send('0')
; 		presses := -1
; 	}

; 	; Key presses have ended
; 	done()
; 	{
; 		Switch presses
; 		{
; 			Case 1: Send('1') ; Single
; 			Case 2: Send('2') ; Double
; 		}

; 		presses := 0
; 	}
; }
