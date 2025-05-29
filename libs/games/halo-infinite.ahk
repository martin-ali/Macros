#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe HaloInfinite.exe')
{
	; Binds
	global GrapplingHook := 1
	global MotionTracker := 2
	global Dropwall := 3
	global Thruster := 4
	global ActivateAbility := "/"
	global DefaultAbility := GrapplingHook

	SetKeyDelay(5, 1)

	SelectAbility(key)
	{
		SendEvent(key)
	}

	UseAbility(key)
	{
		SelectAbility(key)

		SendEvent("{" ActivateAbility "}")
	}

	*Enter::Space

	~*q::
	{
		UseAbility(GrapplingHook)
		SelectAbility(DefaultAbility)
	}

	*XButton2::
	{
		UseAbility(MotionTracker)
		SelectAbility(DefaultAbility)
	}

	*XButton1::
	{
		UseAbility(Thruster)
		SelectAbility(DefaultAbility)
	}

	*g::
	{
		UseAbility(Dropwall)
		SelectAbility(DefaultAbility)
	}
}
#HotIf
