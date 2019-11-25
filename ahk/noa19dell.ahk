#NoEnv  ; performance and compatibility
#Warn  ; detecting common errors
SendMode Input  ; speed and reliability
SetWorkingDir %A_ScriptDir%
#SingleInstance, force

SetTitleMatchMode, 2
#InstallKeybdHook



; SETUP
device := "desktop"
img := "none"
scale := 1
correctInputID := 0x4090409
setupdone := false

setup(width) ; Called on first SC056 press
{
    global device, global correctInputID, global scale, global setupdone
    if (width = 3840) 
    {
        device := "dell"
        correctInputID := 0xF0C12000
        scale := 2
    }
    else if (width != 1920)
        cornermsg("Weird res detected!", 1500)
    setupdone := true
}


; SHOW IMAGE centered x
show(name, h)
{
    global scale
    ypos := (1080 - h) * scale
    SplashImage, %A_ScriptDir%/%name%%scale%.png, b y%ypos%
}

; MESSAGE
cornermsg(string, duration)
{
    CoordMode, ToolTip
    ToolTip, %string%, 8, 8
    Sleep, %duration%
    ToolTip,
}

; OPEN OR SWITCH TO APP
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


; ALWAYS  ---------------------------------------------------------------------------------------------
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
SC056 & w::cornermsg(A_ScreenWidth, 1500)


; ONLY WHEN THERE IS NO REPLACE MODE, OR HELP VISIBLE  -------------------------------------------------
#If (img = "none")
SC056::
    if (setupdone = false)
        setup(A_ScreenWidth)
    show("replace", 48)
    img := "replace"
return


; IN REPLACE MODE --------------------------------------------------------------------------------------
#If (img = "replace")
SC056::
if (A_PriorHotkey <> "SC056" or A_TimeSincePriorHotkey > 400)
{   
    ; Hide if the second press was not fast enough
    KeyWait, SC056
    SplashImage, Off
    img := "none"
}
else
{
    ; Double press happened, get InputID
    SetFormat, Integer, H
    WinGet, WinID,, A
    ThreadID := DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    InputID :=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt") ; (0x4070407 D) (0xF0C02000 E)
    SetFormat, Integer, D

    if (InputID = correctInputID)
    {
        if WinActive("ahk_exe Figma.exe") 
        show("figma", 365)
        else show("main", 365)
        img := "help"
    }
    else
    {
        message := "Sprache ist gerade:`n" + InputID
        cornermsg(message, 2500)
    }
}
return

:?*:.a::Ä
:?*:.o::Ö
:?*:.u::Ü
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
f::switch("Figma",       "C:\Users\Noa\AppData\Local\Figma\Figma.exe")
c::switch("Code",        "C:\Users\Noa\AppData\Local\Programs\Microsoft VS Code\Code.exe")
b::switch("Firefox",     "C:\ProgramData\TileIconify\Firefox\Firefox.vbs")
s::switch("Spotify",     "C:\Users\Noa\AppData\Roaming\Spotify\Spotify.exe")
d::switch("Discord",     "C:\Users\Noa\AppData\Local\Discord\Update.exe")
l::switch("Left",        "C:\Users\Noa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Left.lnk")
a::switch("Illustrator", "C:\Program Files\Adobe\Adobe Illustrator CC 2019\Support Files\Contents\Windows\Illustrator.exe")
p::switch("Photoshop",   "C:\Program Files\Adobe\Adobe Photoshop CC 2019\Photoshop.exe")
i::switch("InDesign",    "C:\Program Files\Adobe\Adobe InDesign CC 2019\InDesign.exe")

SC056::
    SplashImage, Off
    img := "none"
return
+::
    SplashImage, Off
    img := "none"
    WinMinimize, A
return


#If (device = "Dell")
;fix for middle mouse button
<#<^<+F22::Send {Mbutton}
return


#If MouseIsOver("ahk_class Shell_TrayWnd")
; Adjust volume by scrolling the mouse wheel over the taskbar.
WheelUp::Send {Volume_Up 2}
WheelDown::Send {Volume_Down 2}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}


#IfWinActive ahk_exe Figma.exe
F3::
    send ^'
    send ^+'
return
F4::
    send ^+4
return


; #IfWinActive ahk_exe Firefox.exe
; ; Click on bookmark icon
; ^d::MouseClick,, 1587 * scale, 52 * scale,, 0.1


#IfWinActive noa19dell.ahk
~^s::Run, noa19dell.ahk
