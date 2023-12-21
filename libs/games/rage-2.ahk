#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe RAGE2.exe')
{
	SwapEquipment(count)
	{
		loop (count)
		{
			SendEvent("{" switchEquipment "}")
		}
	}

	QuickUseEquipment(equipment, keyToHold := "")
	{
		SetKeyDelay(25, 1)

		SwapEquipment(equipment)

		SendEvent("{" useEquipment " down}")

		if (keyToHold)
		{
			KeyWait(keyToHold)
		}

		SendEvent("{" useEquipment " up}")

		SwapEquipment(4 - equipment)
	}

	; Binds
	sprint := "'"
	useEquipment := "RControl"
	switchEquipment := "["
	focus := "p"
	shatter := "7"

	; Item indices
	grenade := "0"
	wingstick := "1"
	shockGrenades := "2"
	turretDrone := "3"

	; Dash instant cast
	; Workaround for sometimes casting void or focus explosion instead of dash
	*$XButton1::
	{
		thisKey := SanitizeModifiers(ThisHotkey)
		SendInput("{" thisKey "}")
	}

	; Reworks dash/focus to shatter/focus
	~*$XButton2::
	{
		SendEvent("{" focus " down}")

		thisKey := SanitizeModifiers(ThisHotkey)
		focusIsTapped := KeyWait(thisKey, "T0.3")
		KeyWait(thisKey)

		if (focusIsTapped)
		{
			SendEvent("{" shatter "}")
		}

		SendEvent("{" focus " up}")
	}

	; Wingstick
	~*$q::
	{
		thisKey := SanitizeModifiers(ThisHotkey)

		inFocus := GetKeyState("XButton1", PHYSICAL_STATE)
		if (!inFocus)
		{
			QuickUseEquipment(wingstick, thisKey)
		}

		KeyWait(thisKey)
	}

	; Tap for shock grenades, hold for turret drone
	~*$g::
	{
		thisKey := SanitizeModifiers(ThisHotkey)
		keyIsTapped := KeyWait(thisKey, "T0.2")

		inFocus := GetKeyState("XButton1", PHYSICAL_STATE)
		if (!inFocus)
		{
			if (keyIsTapped)
			{
				QuickUseEquipment(shockGrenades)
			}
			else ; Key is held
			{
				QuickUseEquipment(turretDrone)
			}
		}

		KeyWait(thisKey)
	}

	; ; Run
	; ; Using the game's own toggle gives it unwanted double-tap-to-rush functionality
	; ~w & ~Enter::
	; {
	; 	; Hold
	; 	sprintIsHeld := KeyWait("Enter", "T0.3")
	; 	KeyWait("Enter")
	; 	if (sprintIsHeld)
	; 	{
	; 		Toggle(sprint)
	; 	}
	; }

	; ~*w Up::
	; ~*Escape::
	; ~*Tab::
	; {
	; 	SendInput("{" sprint " up}")
	; }
}
#HotIf
