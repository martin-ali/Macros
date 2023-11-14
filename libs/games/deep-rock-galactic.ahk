#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

GroupAdd "CommonRebinds", "ahk_exe FSD-Win64-Shipping.exe"

#HotIf WinActive('ahk_exe FSD-Win64-Shipping.exe')
{
	; Instant cast hook
	*$Numpad1::
	{
		grapplingHook := "q"
		SendInput ("{" grapplingHook "}")

		Toggle("LButton")

		thisKey := TrimModifiers(ThisHotkey)
		KeyWait(thisKey)

		Toggle("LButton")
	}

	*$LShift::
	{
		thisKey := TrimModifiers(ThisHotkey)
		SendInput("{" thisKey "}")
	}

	; y::
	; {
	; 	while (GetKeyState("y", "P"))
	; 	{
	; 		Send("{a}")
	; 		Sleep(100)

	; 		Send("{d}")
	; 		Sleep(100)
	; 	}
	; }
}
#HotIf
