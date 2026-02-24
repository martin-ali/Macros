#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Darktide.exe')
{
	global Dodge := "LControl"
	global Crouch := "LShift"

	; Dodge slide with one button
	*$\::
	{
		Send("{" Dodge "}")

		Sleep(50)

		Toggle(Crouch)

		Sleep(20)

		thisKey := SanitizeModifiers(ThisHotkey)
		KeyWait(thisKey)

		Toggle(Crouch)
	}
}
#HotIf
