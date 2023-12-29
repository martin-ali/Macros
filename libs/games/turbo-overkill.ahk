#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Turbo Overkill.exe')
{
	global WeaponRequiresHoldingFire := false

	; Shoot alt fire when pressing M1, even for weapons that fire on M2 release
	~RButton & LButton::
	{
		if (WeaponRequiresHoldingFire)
		{
			Hold("LButton")
		}
		else
		{
			SendInput("{LButton}")
			SendInput("{RButton}")
		}
	}

	~*v:: ; Telefragger
	~*Numpad4:: ; Plasma Gun
	{
		global WeaponRequiresHoldingFire := true
	}

	~*r:: ; Magnums
	~*z:: ; Waster
	~*x:: ; Twincendiary
	~*c:: ; Boomer
	~*b:: ; Rocket Launcher
	~*XButton2:: ; Uzis
	{
		global WeaponRequiresHoldingFire := false
	}
}
#HotIf
