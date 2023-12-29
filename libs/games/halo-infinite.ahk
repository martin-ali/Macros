#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe HaloInfinite.exe')
{
	; Binds
	global GrapplingHook := 1
	global MotionTracker := 2
	global Dropwall := 3
	global Thruster := 4
	global ActivateAbility := "/"

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
	}

	*XButton2::
	{
		UseAbility(MotionTracker)
		SelectAbility(GrapplingHook)
	}

	*XButton1::
	{
		UseAbility(Thruster)
		SelectAbility(GrapplingHook)
	}

	*g::
	{
		UseAbility(Dropwall)
		SelectAbility(GrapplingHook)
	}
}
#HotIf
