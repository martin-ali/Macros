#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe DOOMEternalx64vk.exe')
{
	swapGrenade := "/"
	fireGrenade := "RControl"
	jump := "LControl"

	Hop()
	{
		SendEvent("{" jump "}")
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

	; ; Ice bomb
	; *$t::
	; {
	; 	SetKeyDelay(1, 0)

	; 	SendEvent(swapGrenade)
	; 	SendEvent("{" fireGrenade "}")
	; 	SendEvent(swapGrenade)

	; 	KeyWait("t")
	; }
}
#HotIf
