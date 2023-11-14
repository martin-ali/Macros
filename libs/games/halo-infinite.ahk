#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe HaloInfinite.exe')
{
	; Binds
	grapplingHook2 := 1
	motionTracker := 2
	dropwall := 3
	thruster := 4
	activateAbility := "/"

	SetKeyDelay(5, 1)

	SelectAbility(key)
	{
		SendEvent(key)
	}

	UseAbility(key)
	{
		SelectAbility(key)

		SendEvent("{" activateAbility "}")
	}

	*Enter::Space

	~*q::
	{
		UseAbility(grapplingHook2)
	}

	*XButton2::
	{
		UseAbility(motionTracker)
		SelectAbility(grapplingHook2)
	}

	*XButton1::
	{
		UseAbility(thruster)
		SelectAbility(grapplingHook2)
	}

	*g::
	{
		UseAbility(dropwall)
		SelectAbility(grapplingHook2)
	}
}
#HotIf
