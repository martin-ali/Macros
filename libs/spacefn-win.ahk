; Note: This implementation assumes an en-US QWERTY layout.

SendMode Input
#NoEnv
#SingleInstance force

; GroupAdd, ExclutionGroup, ahk_exe bms.exe
; GroupAdd, ExclutionGroup, ahk_exe DOOMEternalx64vk.exe
; GroupAdd, ExclutionGroup, ahk_exe Fallout4.exe
; GroupAdd, ExclutionGroup, ahk_exe SC2_x64.exe
; GroupAdd, ExclutionGroup, ahk_exe Prodeus.exe
; GroupAdd, ExclutionGroup, ahk_exe sw.x64.exe
; GroupAdd, ExclutionGroup, ahk_exe WolfNewOrder_x64.exe
; GroupAdd, ExclutionGroup, ahk_exe Cyberpunk2077.exe
; #IfWinNotActive, ahk_group ExclutionGroup

; Pause::Suspend

options := {delay: 200, timeout: 300, doublePress: -1, swap_backtick_escape: false, mode: "pl;' and wasd"}
    loop %0% {
        arg := %A_Index%
        argSplit := StrSplit(arg, "=")
        option := argSplit[1]
        value := argSplit[2]
        options[option] := value
    }

    #Include <dual/dual>
    dual := new Dual

    #Include <dual/defaults>

    #If options.swap_backtick_escapew
        *`::dual.comboKey({F22: "Escape"})
    #If

    #If options.mode == "pl;' and wasd"

    ; Left
    *w::dual.comboKey({F22: "Up"})
    *a::dual.comboKey({F22: "Left"})
    *s::dual.comboKey({F22: "Down"})
    *d::dual.comboKey({F22: "Right"})

    *q::dual.comboKey({F22: "Home"})
    *e::dual.comboKey({F22: "End"})
    *f::dual.comboKey({F22: "PgUp"})
    *c::dual.comboKey({F22: "PgDn"})

    ; Right
    *p::dual.comboKey({F22: "Up"})
    *l::dual.comboKey({F22: "Left"})
    *;::dual.comboKey({F22: "Down"})
    *'::dual.comboKey({F22: "Right"})

    *o::dual.comboKey({F22: "Home"})
    *[::dual.comboKey({F22: "End"})
    *k::dual.comboKey({F22: "PgUp"})
    *,::dual.comboKey({F22: "PgDn"})
    #If

    #If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.

    *Space::
        *Space UP::dual.combine("F22", A_ThisHotkey, {delay: options.delay, timeout: options.timeout, doublePress: options.doublePress})

    *Tab::
        *Tab UP::dual.combine("RControl", A_ThisHotkey, {delay: options.delay, timeout: options.timeout, doublePress: options.doublePress})

        *BackSpace::dual.comboKey({F22: "Delete"})

        *1::dual.comboKey({F22: "F1"})
        *2::dual.comboKey({F22: "F2"})
        *3::dual.comboKey({F22: "F3"})
        *4::dual.comboKey({F22: "F4"})
        *5::dual.comboKey({F22: "F5"})
        *6::dual.comboKey({F22: "F6"})
        *7::dual.comboKey({F22: "F7"})
        *8::dual.comboKey({F22: "F8"})
        *9::dual.comboKey({F22: "F9"})
        *0::dual.comboKey({F22: "F10"})
        *-::dual.comboKey({F22: "F11"})
        *=::dual.comboKey({F22: "F12"})

        ; *`::dual.comboKey("Escape", {F22: "``"})
        #If

        RControl & q::^PgUp
        RControl & e::^PgDn
