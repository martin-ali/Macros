#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe destiny2.exe')
{
	*Enter::Space
	*Delete::Enter
	*LControl::Numpad0
	*RControl::Numpad1
}
#HotIf
