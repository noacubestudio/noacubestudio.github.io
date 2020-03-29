#NoEnv          ; performance and compatibility
#Warn           ; detecting common errors
SendMode Input  ; speed and reliability
SetWorkingDir %A_ScriptDir%
#SingleInstance, force

SetTitleMatchMode, 2
#InstallKeybdHook

; Startup folder is in Win+R shell:startup

; #Persistent
; CoordMode, Mouse, Screen
; SetTimer, MousePos, On
; Exit
; 
; MousePos:
; 	MouseGetPos, x, y
; 	ToolTip, % "x: " x "`ny: " y
; return

; SETUP -----------------------------------------------------------------
img := false
scale := 1
correctInputID := 0

if (A_ScreenWidth == 3840) 
{
    device := "xps"
    correctInputID := 0xF0C12000
    scale := 2
    ; cursorMessage("Device: XPS 15", 1500)
}
else if (A_ScreenWidth == 1920)
{
    device := "desktop"
    correctInputID := 0x4090409
    scale := 1
    ; cursorMessage("Device: Desktop", 1500)
}
else cursorMessage("Screen width was %width%, must be 3840 or 1920", 1500)

; Store long strings in variables
FileRead, loremText, %A_ScriptDir%/text/loremipsum.txt
RegWrite, REG_SZ, HKEY_CURRENT_USER, software\KeyHintText,value1,%loremText%


; FUNCTIONS -------------------------------------------------------------
; SHOW IMAGE centered horizontally
bottomImage(name, h)
{
    winHandle := WinExist("A") ; The window to operate on
    VarSetCapacity(monitorInfo, 40), NumPut(40, monitorInfo)
    monitorHandle := DllCall("MonitorFromWindow", "Ptr", winHandle, "UInt", 0x2)
    DllCall("GetMonitorInfo", "Ptr", monitorHandle, "Ptr", &monitorInfo)

    workLeft      := NumGet(monitorInfo, 20, "Int") ; Left
    workTop       := NumGet(monitorInfo, 24, "Int") ; Top
    workRight     := NumGet(monitorInfo, 28, "Int") ; Right
    workBottom    := NumGet(monitorInfo, 32, "Int") ; Bottom

    global scale
    xpos := workLeft
    ypos := (1080 - h) * scale
    SplashImage, %A_ScriptDir%/images/%name%%scale%.png, b x%xpos% y%ypos%
}

topImage(name)
{
    global scale
    SplashImage, %A_ScriptDir%/images/%name%%scale%.png, b y0
}

; MESSAGE in top left screen corner
cursorMessage(string, duration)
{
    CoordMode, ToolTip
    ToolTip, %string%
    Sleep, %duration%
    ToolTip,
}

; OPEN OR SWITCH TO APP
switch(name)
{
    path := ""
    switch name
    {
        case "Figma":       path:= "C:\Users\Noa\AppData\Local\Figma\Figma.exe"
        case "Code":        path:= "C:\Users\Noa\AppData\Local\Programs\Microsoft VS Code\Code.exe"
        case "Firefox":     path:= "C:\ProgramData\TileIconify\Firefox\Firefox.vbs"
        case "Spotify":     path:= "C:\Users\Noa\AppData\Roaming\Spotify\Spotify.exe"
        case "Discord":     path:= "C:\Users\Noa\AppData\Local\Discord\Update.exe"
        case "Left":        path:= "C:\Users\Noa\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Left.lnk"
        case "Illustrator": path:= "C:\Program Files\Adobe\Adobe Illustrator CC 2019\Support Files\Contents\Windows\Illustrator.exe"
        case "Photoshop":   path:= "C:\Program Files\Adobe\Adobe Photoshop CC 2019\Photoshop.exe"
        case "InDesign":    path:= "C:\Program Files\Adobe\Adobe InDesign CC 2019\InDesign.exe"
    }
    IfWinNotExist ahk_exe %name%.exe
    run, "%path%"
    WinWait, ahk_exe %name%.exe
    if WinActive("ahk_exe %name%.exe")
        ToolTip, ALREADY ACTIVE
    Else
        winactivate, ahk_exe %name%.exe
}

; HOTKEYS -----------------------------------------------------------

; While holding SC056 (next to shift)
SC056::
    ; Show ToolTip
    global img
    if (img = false)
        ToolTip, REPLACE MODE

    ; Use string input
    Input, typed, C
    switch typed
    {
        default:    cursorMessage(typed, 1200)

        ; Apps
        case "1":   switch("Firefox")
        case "2":   switch("Figma")
        case "3":   switch("Discord")
        case "4":   switch("Code")
        case "5":   switch("Spotify")
        case "6":   switch("Left")
        case "7":   switch("Illustrator")
        case "8":   switch("Photoshop")
        case "9":   switch("InDesign")

        ; Lowercase characters
        case "a":   Send, {U+00E4} ; ä
        case "o":   Send, {U+00F6} ; ö
        case "u":   Send, {U+00FC} ; ü
        case "s":   Send, {U+00DF} ; ß

        ; Uppercase characters
        case "aa":  Send, {U+00C4} ; Ä
        case "oo":  Send, {U+00D6} ; Ö
        case "uu":  Send, {U+00DC} ; Ü
        case "ss":  Send, {U+1E9E} ; ẞ

        ; Punctuation
        case "b":   Send, {U+2022}{Space} ; bullet
        case "-":   Send, {U+2013} ; en dash
        case "--":  Send, {U+2014} ; 1em dash
        case "---": Send, {U+2E3A} ; 2em dash
        case "...": Send, {U+2026} ; ellipsis
        case "i":   Send, {U+203D} ; interrobang
        
        case "=":   Send, {U+2011} ; non breaking hyphen
        case "==":  Send, {U+00A0} ; non breaking space
        case "===": Send, {U+2007} ; figure space

        case ",":   Send, {U+201E} ; double low 9 quotation mark 
        case ".":   Send, {U+201C} ; left double quotation mark
        case "/":   Send, {U+201D} ; right double quotation mark
        case ",,":  Send, {U+201A} ; single low 9 quotation mark 
        case "..":  Send, {U+2018} ; left single quotation mark
        case "//":  Send, {U+2019} ; right single quotation mark
        case ";":   Send, {U+00BB} ; right double guillemets
        case "'":   Send, {U+00AB} ; left double guillemets
        case ";;":  Send, {U+203A} ; right single guillemets
        case "''":  Send, {U+2039} ; left single guillemets
        
        ; Special characters
        case "0":   Send, {U+00B0} ; degree
        case "e":   Send, {U+20AC} ; euro
        case "rr":  Send, {U+00AE} ; registered
        case "tm":  Send, {U+2122} ; trademark
        case "c":   Send, {U+00A9}{Space} ; copyright
        case "y":   Send, {U+2713} ; checkmark
        
        ; Arrows
        case "l":   Send, {U+2190} ; ← leftwards arrow
        case "up":  Send, {U+2191} ; ↑ upwards arrow
        case "r":   Send, {U+2192} ; rightwards arrow
        case "do":  Send, {U+2193} ; downwards arrow
        case "lr":  Send, {U+2194} ; left right arrow
        case "ud":  Send, {U+2195} ; up down arrow
        case "ul":  Send, {U+2196} ; up left arrow
        case "ur":  Send, {U+2197} ; up right arrow
        case "dr":  Send, {U+2198} ; down left arrow
        case "dl":  Send, {U+2199} ; down right arrow

        ; Emoticons
        case "idk": Send, {U+00AF}{U+005C}_{U+0028}{U+30C4}{U+0029}_/{U+00AF}  ; ¯\_(ツ)_/¯
        case "duh": Send, {U+0CA0}_{U+0CA0} ; ಠ_ಠ
        case "len": Send, {U+0028}{U+0361}{U+00B0}{U+0020}{U+035C}{U+0296}{U+0020}{U+0361}{U+00B0}{U+0029} ; (͡° ͜ʖ ͡°)

        ; Text
        case "lp":
            Clipboard := loremText
            Send ^v
        return

        ; Technical
        case "run": Send, browser-sync start --server -f -w
        case "w":   cursorMessage(A_ScreenWidth, 1500)
        
        ; Actions
        case "m":   Send, {Volume_Mute}
        case "ll":                ; Toggle Caps Lock
            if GetKeyState("Capslock", "T") = 1
                SetCapsLockState, Off
            else
                SetCapsLockState, On
        case "p":   Send, #+S     ; Start Snipping Tool
        case "t":   
            time := A_now
            FormatTime, time,, Time
            Send {raw}%time%
        return
        case "d":
            date := A_now
            FormatTime, date,, LongDate
            Send {raw}%date%
        return 

        ; Cheatsheet
        case "h":
            bottomImage("cheat-home", 300)
            img := true
        return

        case "4k":  cursorMessage("3840 x 2160 px", 2500)
        case "a0":  cursorMessage("841 x 1189 mm`n9933 x 14043 px", 2500)
        case "a1":  cursorMessage("594 x 841 mm`n7016 x 9933 px", 2500)
        case "a2":  cursorMessage("420 x 594 mm`n4960 x 7016 px", 2500)
        case "a3":  cursorMessage("297 x 420 mm`n3508 x 4960 px", 2500)
        case "a4":  cursorMessage("210 x 297 mm`n2480 x 3508 px", 2500)
        case "a5":  cursorMessage("148 x 210 mm`n1748 x 2480 px", 2500)
        case "a6":  cursorMessage("105 x 148 mm`n1240 x 1748 px", 2500)
    }
return

; After pressed (again), hide images and tooltips, reset input
*SC056 UP::
    Input,
    SplashImage, Off
    img := false
    ToolTip,
return

; PROGRAM SPECIFIC ---------------------------------------------------------

#IfWinActive ahk_exe Discord.exe
SC055::
    global img
    if (img = false)
    {
        ToolTip, DISCORD
    }

    ; Use string input
    Input, typed, C

    ; Any emoji
    if (SubStr(typed, 1, 1) = "n") 
    {
        typed := LTrim(typed, OmitChars := "n")
        Send, :noa%typed%:
        return
    }

    ; Switch to look for letters
    switch typed
    {
        default:   cursorMessage(typed, 1200)

        ; Structure
        case "b":  Send, {End}+{Enter}:noabullet:{Space}
        case "bb": Send, {Home}{Delete 2}:noabullet:{Space}{End}
        case "e":  Send, {End}+{Enter}:noaempty:{Space}
        case "ee": Send, {Home}{Delete 2}:noaempty:{Space}{End}
        case "r":  Send, {End}+{Enter}:noaright:{Space}
        case "rr": Send, {Home}{Delete 2}:noaright:{Space}{End}
        case "p":  Send, {End}+{Enter}:noaplus:{Space}
        case "pp": Send, {Home}{Delete 2}:noaplus:{Space}{End}

        ; Todo
        case "t":  Send, {End}+{Enter}:noatodo:{Space}
        case "tt": Send, {Home}{Delete 2}:noatodo:{Space}{End}
        case "w":  Send, {End}+{Enter}:noawip:{Space}
        case "ww": Send, {Home}{Delete 2}:noawip:{Space}{End}
        case "d":  Send, {End}+{Enter}:noadone:{Space}
        case "dd": Send, {Home}{Delete 2}:noadone:{Space}{End}
        case "c":  Send, {End}+{Enter}:noacancelled:{Space}
        case "cc": Send, {Home}{Delete 2}:noacancelled:{Space}{End}

        ; Emoji
        case "s":  Send, :noaleftshrug::noarightshrug:{Space}

        ; Cheatsheet
        case "h":
            bottomImage("cheat-discord", 300)
            img := true
        return
    }
return

#IfWinActive ahk_exe Firefox.exe
-::
    WinGetTitle, title
    if (InStr(title, "PuzzleScript")){
        Send _
    } else {
        Send -
    }
return
+-::
    WinGetTitle, title
    if (InStr(title, "PuzzleScript")){
        Send -
    } else {
        Send _
    }
return
F2::
    WinGetTitle, title
if (InStr(title, "PuzzleScript")){
    Send ^+F
    Send {Enter}
} else {
    Send F2
}
return

#IfWinActive, ahk_exe Code.exe
SC055::
    Send +^L
    Send snek_
return

; #IfWinActive ahk_exe Figma.exe
; SC055::
;     global img
;     if (img = false)
;     {
;         ToolTip, FIGMA
;     }
; 
;     ; Use string input
;     Input, typed, C
;     switch typed
;     {
;         default:   cursorMessage(typed, 1200)
; 
;         case "s":  
;             Send, +x
;             sleep 50
;             Send, i
;             sleep 200
;             Send, {Click}
;             sleep 50
;             Send, +x
;         case "g": send ^+4
;         case "p":
;             send ^'
;             send ^+'
;     }
; return

#If
*SC055 UP::
    Input,
    SplashImage, Off
    img := false
    ToolTip,
return

; OTHER USEFUL STUFF -------------------------------------------------------

; Fix for middle mouse on XPS.
#If (device = "xps")
<#<^<+F22::Send {Mbutton}
return

; Adjust volume by scrolling the mouse wheel over the taskbar.
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up 2}
WheelDown::Send {Volume_Down 2}
return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

; Custom shortcuts for Figma.
#IfWinActive ahk_exe Figma.exe
F3::
    send ^'
    send ^+'
return
F4::
    send ^+4
return

; Custom shortcut for this file
#IfWinActive noakeys20.ahk
~^s::Run, noakeys20.ahk

