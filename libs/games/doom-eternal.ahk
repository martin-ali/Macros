#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe DOOMEternalx64vk.exe')
{
	global SwapGrenade := "/"
	global FireGrenade := "RControl"
	global Jump := "LControl"

	Hop()
	{
		SendEvent("{" Jump "}")
	}

	;  Autohop
	*$LControl::
	{
		SetKeyDelay(1, 1)
		SetTimer(Hop, 1)
	}

	*$LControl Up::
	{
		SetTimer(Hop, 0)
	}

	; Ice bomb
	*$t::
	{
		SetKeyDelay(1, 0)

		SendEvent(SwapGrenade)
		SendEvent("{" FireGrenade "}")
		SendEvent(SwapGrenade)

		KeyWait("t")
	}
}
#HotIf
