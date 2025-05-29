#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Darktide.exe')
{
	weaponIsMelee := true

	GuaranteeMeleeWeapon(currentWeaponIsMelee)
	{
		if (weaponIsMelee := false)
		{
			Send("c")
		}
	}

	~*XButton1::
	{
		GuaranteeMeleeWeapon(weaponIsMelee)

		SendInput("{RButton down}")

		KeyWait("XButton1")

		SendInput("{RButton up}")
	}

	~*XButton2:: 
	{
		if (weaponIsMelee := false)
		{
			GuaranteeMeleeWeapon(weaponIsMelee)

			Sleep(100)
		}

		SendInput("{LButton down}")

		KeyWait("XButton2")

		SendInput("{LButton up}")
	}

	~*$x:: ; Ranged weapon
	{
		weaponIsMelee := false
	}

	~*$c:: ; Melee weapon
	{
		weaponIsMelee := true
	}

}
#HotIf
