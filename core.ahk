; #NoEnv
;     ;Avoids checking empty variables to see if
;     ;they are environment variables
;     ;(recommended for all new scripts).

#SingleInstance Force
;     ;Skips the dialog box and replaces the old
;     ;instance automatically, which is similar
;     ;in effect to the Reload command.

; #Persistent
;     ;Keeps a script permanently running (that
;     ;is, until the user closes it or ExitApp
;     ;is encountered).

; #InstallKeybdHook
;     ;Forces the unconditional installation of
;     ;the keyboard hook.

#UseHook
;     ;Force the use of the hook for hotkeys
;     ;after this point.

; #KeyHistory, 0
;     ;Sets the maximum number of keyboard and
;     ;mouse events displayed by the KeyHistory
;     ;window. You can set it to 0 to disable
;     ;key history.

; #HotKeyInterval 1
;     ;Along with #MaxHotkeysPerInterval,
;     ;specifies the rate of hotkey activations
;     ;beyond which a warning dialog will be
;     ;displayed.


; #MaxHotkeysPerInterval 127
;     ;Along with #HotkeyInterval, specifies the
;     ;rate of hotkey activations beyond which a
;     ;warning dialog will be displayed.

; SetKeyDelay,-1, 1
;     ;Sets the delay that will occur after each
;     ;keystroke sent by Send and ControlSend.

; SetControlDelay, -1
;     ;Sets the delay that will occur after each
;     ;control-modifying command.

; SetMouseDelay, -1
;     ;Sets the delay that will occur after each
;     ;mouse movement or click.

; SetWinDelay,-1
;     ;Sets the delay that will occur after each
;     ;windowing command, such as WinActivate.

; SendMode, Input
;     ;Switches to the SendInput method for Send,
;     ;SendRaw, Click, and MouseMove/Click/Drag.

; ;SendMode, InputThenPlay
;     ;Same as above except that rather than
;     ;falling back to Event mode when SendInput
;     ;is unavailable, it reverts to Play mode
;     ;(below). This also causes the SendInput
;     ;command itself to revert to Play mode when
;     ;SendInput is unavailable.

; ;PID := DllCall("GetCurrentProcessId")
; ;Process, Priority, %PID%, High

#Requires AutoHotkey >=v2.0

#Include libs/exclusions.ahk

#Include games.ahk
#Include desktop.ahk

#SuspendExempt
Pause:: Suspend
PrintScreen:: Reload
#SuspendExempt False
