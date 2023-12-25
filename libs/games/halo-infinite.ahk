#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe HaloInfinite.exe')
{
	; Binds
	grapplingHook := 1
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
		UseAbility(grapplingHook)
	}

	*XButton2::
	{
		UseAbility(motionTracker)
		SelectAbility(grapplingHook)
	}

	*XButton1::
	{
		UseAbility(thruster)
		SelectAbility(grapplingHook)
	}

	*g::
	{
		UseAbility(dropwall)
		SelectAbility(grapplingHook)
	}
}
#HotIf
