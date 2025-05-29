#Requires AutoHotkey >=v2.0

GroupAdd "CommonRebinds", "ahk_exe Magicka.exe"
GroupAdd "CommonRebinds", "ahk_exe Swat4.exe"
GroupAdd "CommonRebinds", "ahk_exe bms.exe" ; Black Mesa
GroupAdd "CommonRebinds", "ahk_exe vermintide2.exe"
GroupAdd "CommonRebinds", "ahk_exe OxygenNotIncluded.exe"
GroupAdd "CommonRebinds", "ahk_exe FarCry6.exe"
GroupAdd "CommonRebinds", "ahk_exe R6-Extraction_Plus.exe"
GroupAdd "CommonRebinds", "ahk_exe MCC-Win64-Shipping.exe" ; Halo MCC
GroupAdd "CommonRebinds", "ahk_exe Dead Space.exe"
GroupAdd "CommonRebinds", "ahk_exe fc3_blooddragon_d3d11.exe"
GroupAdd "CommonRebinds", "ahk_exe Mechanicus.exe"
GroupAdd "CommonRebinds", "ahk_exe MidnightSuns-Win64-Shipping.exe"
GroupAdd "CommonRebinds", "ahk_exe Control_DX11.exe"
GroupAdd "CommonRebinds", "ahk_exe SW3.exe"
GroupAdd "CommonRebinds", "ahk_exe Rage64.exe"
GroupAdd "CommonRebinds", "ahk_exe Fallout3.exe"
GroupAdd "CommonRebinds", "ahk_exe DRG Survivor.exe"
GroupAdd "CommonRebinds", "ahk_exe Darktide.exe"
GroupAdd "CommonRebinds", "ahk_exe FactoryGame-Win64-Shipping.exe" ; Satisfactory
GroupAdd "CommonRebinds", "ahk_exe Warhammer 40000 Space Marine 2 - Retail.exe" ; Satisfactory
GroupAdd "CommonRebinds", "ahk_exe DeltaForceClient-Win64-Shipping.exe"
GroupAdd "CommonRebinds", "ahk_exe BHDClient-Win64-Shipping.exe"
GroupAdd "CommonRebinds", "ahk_exe sins2.exe"
GroupAdd "CommonRebinds", "ahk_exe MetalEden-Win64-Shipping.exe"
GroupAdd "CommonRebinds", "ahk_exe KingdomCome.exe"
GroupAdd "CommonRebinds", "ahk_exe OblivionRemastered-Win64-Shipping.exe"

#HotIf WinActive('ahk_group CommonRebinds')
{
	*$Enter::Space

	*$Delete::Enter

	; *$Numpad5::MButton
}
#HotIf
