#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe Fallout4.exe')
{
	; Flashlight
	$*t::
	{
		Hold("Tab", 350)
	}
}
#HotIf
