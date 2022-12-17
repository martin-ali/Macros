#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#if !WinActive("ahk_group ExclusionGroup")
{
    ; Tab & h::
    ;     SpamPyramid(5, "ResidentSleeper", 2000)
    ; return

    SpamPyramid(size, item, latency)
    {
        ; size := 5
        ; item := "quarth1Funi"
        ; latency := 1500
        topSize := Ceil(size / 2)
        bottomSize := Floor(size / 2)

        Loop %topSize%
        {
            Loop, %A_Index%
            {
                SendRaw, %item%
                Send, {Space}
            }

            Send, {Enter}
            Sleep, %latency%
        }

        Loop %bottomSize%
        {
            rowSize := bottomSize - A_Index + 1
            Loop, %rowSize%
            {
                SendRaw, %item%
                Send, {Space}
            }

            Send, {Enter}
            Sleep, %latency%
        }
    }

}
