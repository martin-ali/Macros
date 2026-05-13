#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Darktide.exe')
{
	global Dodge := "LControl"
	global Crouch := "j"

	; Dodge slide with one button
	*$\::
	{
		Send("{" Dodge "}")

		Sleep(50)

		SendInput("{" Crouch " down}")

		Sleep(20)

		thisKey := SanitizeModifiers(ThisHotkey)
		KeyWait(thisKey)

		SendInput("{" Crouch " up}")
	}
}
#HotIf
