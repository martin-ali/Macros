#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe Turbo Overkill.exe')
{
	; Execute alt fire when pressing M1, even for weapons that usually fire on M2 release
	~RButton & ~LButton::
	{
		SendInput("{RButton}")
	}
}
#HotIf
