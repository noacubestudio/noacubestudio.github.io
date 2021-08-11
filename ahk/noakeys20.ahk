SetWorkingDir %A_ScriptDir%
#SingleInstance, force
#InstallKeybdHook

SetTitleMatchMode, 2


#IfWinActive, Figma

; Single use quick commands

F1::
    ToolTip, F1
return

F2::
    ToolTip, F2
return

F3::
    Send, ^'
    Send, ^+'
return

F4::
    Send, ^+4
return

; Palette shortcuts

Tab & q::
    Send, ^/
return