#Requires AutoHotkey >=v2.0
#SingleInstance Force

#Include libs/common-headers.ahk
#Include libs/exclusions.ahk

#Include games.ahk
#Include desktop.ahk

ProcessSetPriority "High"

#SuspendExempt
*Pause:: Suspend
*PrintScreen:: Reload
#SuspendExempt False
