#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

GroupAdd "CommonRebinds", "ahk_exe FSD-Win64-Shipping.exe"

#HotIf WinActive('ahk_exe FSD-Win64-Shipping.exe')
{
	; Instant cast grappling hook
	*$Numpad1::
	{
		SendInput ("q") ; Swap to grappling hook

		Toggle("LButton") ; Deploy hook

		thisKey := SanitizeModifiers(ThisHotkey) ; Wait for release
		KeyWait(thisKey)

		Toggle("LButton") ; Release hook
	}
}
#HotIf
