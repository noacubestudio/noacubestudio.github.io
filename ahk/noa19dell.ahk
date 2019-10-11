#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
SetTitleMatchMode, 2
#InstallKeybdHook

device := "desktop"
img := "none"

SC056 & a::send ä
SC056 & o::send ö
SC056 & u::send ü
SC056 & s::send ß
SC056 & e::send €
SC056 & t::send ™
SC056 & -::send –
SC056 & d::send °
SC056 & ,::send „
SC056 & .::send “
SC056 & 9::send «
SC056 & 0::send »
SC056 & b::send •
SC056 & m::send {Volume_Mute}
SC056 & w::Tooltip, %A_ScreenWidth%,,

#If (img = "none")
SC056::
    if (A_ScreenWidth  > 1920) 
    {
    device := "dell"
    }
    ; SINGLE PRESS
    show("replace", 1032)
    img := "replace"
return

#If (img = "replace")
SC056::
if (A_PriorHotkey <> "SC056" or A_TimeSincePriorHotkey > 400)
{
    ; SINGLE PRESS
    KeyWait, SC056
    SplashImage, Off
    img := "none"
    return
}
{ ; DOUBLE PRESS
SetFormat, Integer, H
WinGet, WinID,, A
ThreadID := DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
InputID :=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt") ; (0x4070407 D) (0xF0C02000 E)
if (InputID = 0xF0C12000)
    {
    if WinActive("ahk_exe Figma.exe") 
        show("figma", 715)
    else show("main", 715)
    img := "help"
    }
else ; wrong language
    {
    send > 
    CoordMode, ToolTip
    ToolTip, Sprache ist gerade:`n%InputID%, 16, 16
    Sleep, 1000
    ToolTip,
    }
}
return
:?*:up::↑
:?*:down::↓
:?*:left::←
:?*:right::→
:?*:sharp::ẞ
:?*:emdash::—
:?*:longdash::―
:?*:...::…
:?*:shrug::¯\_(ツ)_/¯
:?*:time::
    time := A_now
    FormatTime, time,, Time
    Send {raw}%time%
return
:?*:date::
    date := A_now
    FormatTime, date,, LongDate
    Send {raw}%date%
return
:?*:fig::
switch("Figma", "C:\Users\Noa\AppData\Local\Figma\Figma.exe")
return
:?*:vs::
switch("Code", "C:\Users\Noa\AppData\Local\Programs\Microsoft VS Code\Code.exe")
return
:?*:fox::
switch("Firefox", "C:\ProgramData\TileIconify\Firefox\Firefox.vbs")
return
:?*:spot::
switch("Spotify", "C:\Users\Noa\AppData\Roaming\Spotify\Spotify.exe")
return
:?*:dis::
switch("Discord", "C:\Users\Noa\AppData\Local\Discord\Update.exe")
return
:?*:wri::
switch("Left", "C:\Users\Noa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Left.lnk")
return
:?*:ai::
switch("Illustrator", "C:\Program Files\Adobe\Adobe Illustrator CC 2019\Support Files\Contents\Windows\Illustrator.exe")
return
:?*:ps::
switch("Photoshop", "C:\Program Files\Adobe\Adobe Photoshop CC 2019\Photoshop.exe")
return
:?*:id::
switch("InDesign", "C:\Program Files\Adobe\Adobe InDesign CC 2019\InDesign.exe")
return
:?*:mu::{Volume_Mute}

:?*:lorem::
(
Lorem ipsum dolor sit amet, consectetur adipisici elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. 
)
:?*:blind::
(
Das hier ist der nützlichste und klügste Blindtext der ganzen Welt, weil er dir genau sagt, wann 100 Zeichen vorbei sind (gleich nach der Zahl). Kaum begreift man das Prinzip, zählt der Text schon 200 Zeichen, inklusive Leerschläge. Damit hast du nun eine geniale Methode zur Hand, einen Text von 300 Zeichen Länge zu visualisieren. Mal angenommen, du willst sehen, welch ansprechenden Textkörper 400 Zeichen bilden können – jetzt hast du ein Mass dafür. Und nachdem dieser amüsante Blindtext mit 500 Zeichen die Hälfte erreicht hat, könnte man eine Betrachtung anstellen, die sich schon über die 600er Marke hinaus erstreckt: Haben wir es hier wirklich mit Blindtext zu tun, oder könnte man nach 700 präzis getexteten Zeichen nicht schon von Content sprechen? Mit dieser Frage überrollen wir die 800-Zeichen-Grenze und bedanken uns herzlich, dass du diesen vermeintlich blinden Text von mehr als 900 Zeichen Länge tatsächlich gelesen hast. Damit setzen wir den Schlusspunkt, und zwar hinter die 999.
)

#If (img = "help")
; Launch
f::switch("Figma", "C:\Users\Noa\AppData\Local\Figma\Figma.exe")
c::switch("Code", "C:\Users\Noa\AppData\Local\Programs\Microsoft VS Code\Code.exe")
b::switch("Firefox", "C:\ProgramData\TileIconify\Firefox\Firefox.vbs")
s::switch("Spotify", "C:\Users\Noa\AppData\Roaming\Spotify\Spotify.exe")
d::switch("Discord", "C:\Users\Noa\AppData\Local\Discord\Update.exe")
l::switch("Left", "C:\Users\Noa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Left.lnk")
a::switch("Illustrator", "C:\Program Files\Adobe\Adobe Illustrator CC 2019\Support Files\Contents\Windows\Illustrator.exe")
p::switch("Photoshop", "C:\Program Files\Adobe\Adobe Photoshop CC 2019\Photoshop.exe")
i::switch("InDesign", "C:\Program Files\Adobe\Adobe InDesign CC 2019\InDesign.exe")

SC056::
    SplashImage, Off
    img := "none"
return
+::
    SplashImage, Off
    img := "none"
    WinMinimize, A
return


#If
; FUNCTION TO CLOSE AND SWITCH
switch(name, path)
{
    global img
    if (img = "help")
    {
        SplashImage, Off
        img := "none"
    }
    IfWinNotExist ahk_exe %name%.exe
    run, "%path%"
    WinWait, ahk_exe %name%.exe
    winactivate, ahk_exe %name%.exe
}

show(name, ypos)
{
    global device
    if (device := "dell") 
    {
        ypos *= 2
        SplashImage, %A_ScriptDir%/%name%2.png, b y %ypos%
    }
    else SplashImage, %A_ScriptDir%/%name%.png, b y %ypos%
}

; Dell fix for middle mouse button
<#<^<+F22::Send {Mbutton}
return

; Adjust volume by scrolling the mouse wheel over the taskbar.
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up 2}
WheelDown::Send {Volume_Down 2}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}


;FIGMA
#IfWinActive ahk_exe Figma.exe
F3::
    send ^'
    send ^+'
return
F4::
    send ^+4
return


;FIREFOX
#IfWinActive ahk_exe Firefox.exe
; Click on bookmark icon
^d::MouseClick,, 3175, 105,, 0.1


#IfWinActive noa19dell.ahk
~^s::Run, noa19dell.ahk
