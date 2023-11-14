#Requires AutoHotkey >=v2.0

#HotIf WinActive('ahk_exe CrabChampions-Win64-Shipping.exe')
{
	*XButton1::
	{
		SetKeyDelay(1, 1)

		SendEvent("{LControl}")
		SendEvent("{LControl}")
	}

	*XButton2::f
}
#HotIf
