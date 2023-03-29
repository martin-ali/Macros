#NoEnv
    ;Avoids checking empty variables to see if
    ;they are environment variables
    ;(recommended for all new scripts).

#SingleInstance, Force
    ;Skips the dialog box and replaces the old
    ;instance automatically, which is similar
    ;in effect to the Reload command.

#Persistent
    ;Keeps a script permanently running (that
    ;is, until the user closes it or ExitApp
    ;is encountered).

#InstallKeybdHook
    ;Forces the unconditional installation of
    ;the keyboard hook.

#UseHook
    ;Force the use of the hook for hotkeys
    ;after this point.

#KeyHistory, 0
    ;Sets the maximum number of keyboard and
    ;mouse events displayed by the KeyHistory
    ;window. You can set it to 0 to disable
    ;key history.

#HotKeyInterval 1
    ;Along with #MaxHotkeysPerInterval,
    ;specifies the rate of hotkey activations
    ;beyond which a warning dialog will be
    ;displayed.


#MaxHotkeysPerInterval 127
    ;Along with #HotkeyInterval, specifies the
    ;rate of hotkey activations beyond which a
    ;warning dialog will be displayed.

SetKeyDelay,-1, 1
    ;Sets the delay that will occur after each
    ;keystroke sent by Send and ControlSend.

SetControlDelay, -1
    ;Sets the delay that will occur after each
    ;control-modifying command.

SetMouseDelay, -1
    ;Sets the delay that will occur after each
    ;mouse movement or click.

SetWinDelay,-1
    ;Sets the delay that will occur after each
    ;windowing command, such as WinActivate.

SendMode, Input
    ;Switches to the SendInput method for Send,
    ;SendRaw, Click, and MouseMove/Click/Drag.

;SendMode, InputThenPlay
    ;Same as above except that rather than
    ;falling back to Event mode when SendInput
    ;is unavailable, it reverts to Play mode
    ;(below). This also causes the SendInput
    ;command itself to revert to Play mode when
    ;SendInput is unavailable.

;PID := DllCall("GetCurrentProcessId")
;Process, Priority, %PID%, High

#IfWinNotActive ahk_group ExcludedPrograms

    ; Pause::Suspend
    ; Tab Up::Send, 1
    Tab::Tab
    ; Space::Space
    ; RAlt::Space
    Enter & `::Escape
    ; RSHift::Space
    \::\
    ; Enter & \::\
    ; Enter & Tab::Enter
    Tab & Enter::Enter
    Enter & g::AppsKey
    Tab & Space::Enter
    \ & Space::Enter
    Enter & Space::Enter
    Enter::Enter

    ; Navigation
    ; Set left
    Enter & w::Up
    Enter & s::Down
    Enter & a::Left
    Enter & d::Right

    Enter & q::Home
    Enter & e::End
    Enter & f::PgUp
    Enter & c::PgDn

    Enter & z::Browser_Back
    Enter & x::Browser_Forward

    ; Set right
    Enter & p::Up
    Enter & `;::Down
    Enter & l::Left
    Enter & '::Right

    Enter & o::Home
    Enter & [::End
    Enter & k::PgUp
    Enter & ,::PgDn

    \ & o::^PgUp ; Tab left
    \ & [::^PgDn ; Tab right
    \ & p::^w ; Close tab

    Enter & .::Browser_Back
    Enter & /::Browser_Forward

    ; Deletion
    ; Tab & r::^BackSpace
    ; Tab & f::^Delete

    ; LAlt & r::BackSpace
    ; LAlt & f::Delete

    ; LAlt & c::BackSpace
    ; LAlt & v::Delete

    ; Enter & c::BackSpace
    ; Enter & v::Delete
    ; Enter & BackSpace::Delete

    ; Functionality
    Enter & m::^m ; Mute Tab
    ; Enter & x::^x
    ; Enter & c::^c
    Enter & v::^v

    ; Tab
    Tab & q::^PgUp
    Tab & w::^w ; Close tab
    Tab & e::^PgDn
    Tab & t::^t ; New tab

    Tab & a::^a ; Select all
    Tab & s::^s ; Save
    Tab & d::^d ; Duplicate line

    Tab & z::^z ; Undo
    Tab & x::^x
    Tab & c::^c
    Tab & v::^v
    Tab & m::^m ; Mute Tab
    Tab & p::CapsLock
    ; Tab & f::^f ; Search
    Tab & Left::^Left ; Select all
    Tab & Right::^Right ; Select all

    ; Short
    ; Enter & [::{
    ; Enter & ]::}

    ; Function row
    Enter & 1::F1
    Enter & 2::F2
    Enter & 3::F3
    Enter & 4::F4
    Enter & 5::F5
    Enter & 6::F6
    Enter & 7::F7
    Enter & 8::F8
    Enter & 9::F9
    Enter & 0::F10
    Enter & -::^-
    ; Enter & -::F11
    Enter & =::^+
    ; Enter & =::F12

    ; Function row
    Tab & 1::F1
    Tab & 2::F2
    Tab & 3::F3
    Tab & 4::F4
    Tab & 5::F5
    Tab & 6::F6
    Tab & 7::F7
    Tab & 8::F8
    Tab & 9::F9
    Tab & 0::F10
    Tab & -::F11
    Tab & =::F12

    ; Misc
    Enter & Tab::CapsLock
    ; / or ? focuses on the search bar in some websites

#IfWinNotActive
