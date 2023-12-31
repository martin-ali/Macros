#Requires AutoHotkey >=v2.0

#SingleInstance Force
;Skips the dialog box and replaces the old
;instance automatically which is similar
;in effect to the Reload command.

; #Persistent
;     ;Keeps a script permanently running (that
;     ;is until the user closes it or ExitApp
;     ;is encountered).

InstallKeybdHook
;     ;Forces the unconditional installation of
;     ;the keyboard hook.

KeyHistory(0)
;     ;Sets the maximum number of keyboard and
;     ;mouse events displayed by the KeyHistory
;     ;window. You can set it to 0 to disable
;     ;key history.

SetKeyDelay(-1, -1)
;Sets the delay that will occur after each
;keystroke sent by Send and ControlSend.

SetControlDelay(-1)
;Sets the delay that will occur after each
;control-modifying command.

SetMouseDelay(-1)
;Sets the delay that will occur after each
;mouse movement or click.

SetWinDelay(-1)
; Sets the delay that will occur after each
; windowing command such as WinActivate.

#UseHook
;Force the use of the hook for hotkeys
;after this point.

#MaxThreadsBuffer False

ProcessSetPriority "High"
A_HotkeyInterval := 0

#MaxThreads 12

#Include libs/exclusions.ahk

#Include games.ahk
#Include desktop.ahk
; #Include misc/tests.ahk

#SuspendExempt
*$Pause:: Suspend
*$PrintScreen:: Reload
#SuspendExempt False
