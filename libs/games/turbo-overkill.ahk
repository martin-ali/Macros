#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Turbo Overkill.exe')
{
	; Shoot alt fire when pressing M1, even for weapons that fire on M2 release
	~RButton & LButton::
	{
		Hold("LButton")
		SendInput("{RButton}")
	}
}
#HotIf
