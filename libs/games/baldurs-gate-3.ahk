#Requires AutoHotkey >=v2.0

#Include ../helpers.ahk

#HotIf WinActive('ahk_exe bg3.exe')
{
	~*$LAlt:: Toggle("LAlt")
}
#HotIf
