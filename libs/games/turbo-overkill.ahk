#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe Turbo Overkill.exe')
{
	; Shoot alt fire when pressing M1, even for weapons that fire on M2 release
	~RButton & ~LButton::
	{
		SendInput("{RButton}")
	}

	; Workaround for the alt fire macro breaking the plasma rifle's projectile mode
	Numpad5::LButton
}
#HotIf
