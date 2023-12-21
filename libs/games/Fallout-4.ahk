#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe Fallout4.exe')
{
	; Flashlight
	$*t::
	{
		LongPress("Tab", 350)
	}
}
#HotIf
