#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe Necromunda-Win64-Shipping.exe')
{
	XButton1::LShift
	Numpad1::q
}
#HotIf
