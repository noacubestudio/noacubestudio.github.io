; Autoexecute
    #SingleInstance force
    SetTitleMatchMode(2)
	SetWorkingDir A_ScriptDir
    InstallKeybdHook
    ; Long Hotstrings will need to go first.
    ; no end character, can be in middle of word, case sensitive.
    #Hotstring * ? C

; Basic Functions

GetCase()
{
    ; return true if shift is held physically
    return !GetKeyState("Shift","p")
}

; Characters and symbols

; German Special Characters
F13 & a::Send (GetCase() ? "ä" : "Ä")
F13 & o::Send (GetCase() ? "ö" : "Ö")
F13 & u::Send (GetCase() ? "ü" : "Ü")
F13 & s::Send (GetCase() ? "ß" : "ẞ")

; Currency and rights
F13 & e::Send (GetCase() ? "€" : "£")
F13 & r::Send (GetCase() ? "©" : "®")
F13 & t::Send (GetCase() ? "™" : "")

; Math
F13 & 0::Send (GetCase() ? "°" : "℃") ; Degree
F13 & =::Send (GetCase() ? "≠" : "≈") ; Not equals, almost equals
F13 & x::Send (GetCase() ? "{U+00D7}" : "÷") ; Multiply, divide
F13 & 2::Send (GetCase() ? "²" : "₂") ; Superscript/Subscript 2
F13 & 3::Send (GetCase() ? "³" : "₃") ; Superscript/Subscript 3

; Arrows
F13 & Left:: Send (GetCase() ? "←" : "↖")
F13 & Up::   Send (GetCase() ? "↑" : "↗")
F13 & Right::Send (GetCase() ? "→" : "↘")
F13 & Down:: Send (GetCase() ? "↓" : "↙")

F13 & C::Send (GetCase() ? "↻" : "↺") ; Rotation
F13 & 6::Send (GetCase() ? "↔" : "↕") ; Double Arrows

; Other symbols or emoji
F13 & y::Send (GetCase() ? "✓" : "☑")
::shrug/::¯\_(ツ)_/¯

; Punctuation
F13 & b::Send (GetCase() ? "• " : "⁃ ") ; bullet and hyphen bullet
F13 & .::Send (GetCase() ? "…" : "{U+2011}") ; ellipsis, non breaking hyphen
F13 & 1::Send (GetCase() ? "‽" : "") ; interrobang

; Dashes and spaces
F13 & -::     Send (GetCase() ? "–" : "—") ; en and em dash
F13 & d::     Send (GetCase() ? "―" : "⸺") ; Long bar and 2em dash
F13 & Space:: Send (GetCase() ? "{U+00A0}" : "{U+2007}") ; nonbreaking space/ figure space

; quotation marks
F13 & [::Send (GetCase() ? "“" : "‘") ; en
F13 & ]::Send (GetCase() ? "”" : "’")
F13 & '::Send (GetCase() ? "„" : "‚") ; de
F13 & \::Send (GetCase() ? "“" : "‘")
F13 & 8::Send (GetCase() ? "»" : "›") ; de alt (reverse for fr/sw)
F13 & 9::Send (GetCase() ? "«" : "‹")

; Copy
; F13 & ::Send (GetCase() ? "" : "")


; Functions
F14 & l::
{
    ; Toggle Caps Lock
    if GetKeyState("Capslock", "T") = 1 {
        SetCapsLockState 0
    } else {
        SetCapsLockState 1
    }
}
F14 & t::
{
    ; 12 hour am/pm time
    TimeString12 := FormatTime("T2", "Time")
    Send TimeString12
}
F14 & z::
{
    ; 24 Hour Zeit
    TimeString24 := FormatTime("T12 T2", "Time")
    Send TimeString24
}
F14 & d::
{
    ; Date in long form, native language (German)
    DateString := FormatTime(, "LongDate")
    Send DateString
}
F14 & w::
{
    ; WIP
    Send "^r"
    Send "{Right}"
    Send "_"
}
::lp1::
(
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas egestas fringilla phasellus faucibus.
)
::lp2::
(
    Nisl rhoncus mattis rhoncus urna neque viverra justo nec. Gravida quis blandit turpis cursus. Elementum eu facilisis sed odio morbi quis commodo odio. Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Ornare arcu odio ut sem nulla pharetra diam sit amet. 
)
::lp3::
(
    Sed ullamcorper morbi tincidunt ornare massa eget egestas. Egestas fringilla phasellus faucibus scelerisque eleifend donec pretium vulputate. Bibendum at varius vel pharetra. Laoreet id donec ultrices tincidunt arcu non. In fermentum posuere urna nec tincidunt. Dignissim suspendisse in est ante in nibh. Vel pretium lectus quam id leo in vitae. 
)


; Adjust volume by scrolling the mouse wheel over the taskbar.
#HotIf MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send "{Volume_Up}"
WheelDown::Send "{Volume_Down}"

MouseIsOver(WinTitle) {
    MouseGetPos ,, &Win
    return WinExist(WinTitle " ahk_id " Win)
}

; If in Puzzlescript window (works with browser tabs)
#HotIf WinActive("Puzzlescript") or WinActive("Pattern:Script")

F2::
{
    ; Replace current selection with something
    Send "^+F"
    Send "{Enter}"
}
:*o:...../::
(
.....
.....
.....
.....
.....
)
:*o:00000/::
(
00000
00000
00000
00000
00000
)


; If in Figma window (works with browser tabs)
#HotIf WinActive("Figma")

; TOGGLES

Tab & 1::Send "!l" ; collapse layers
Tab & 2::
{
    Send "^/" ; open command palette
    ; Clip("nudge amount")
    Send "{Enter}"
}
Tab & 3::
{
    Send "^'" ; toggle pixel grid
    Send "^+'" ; snap to pixel grid
}
Tab & 4::Send "^+4" ; toggle layout grid


; Tools
!c::
{
    Send "!v" ; align vertical centers
    Send "!h" ; align horizontal centers
}

Tab & q::Send "^/" ; open command palette

Tab & d::Send "+{Backspace}" ; Delete and heal
Tab & w::Send "{Enter}" ; Drill down
Tab & s::Send "+{Enter}" ; Exit

/*
Clip(Text:="",Reselect:="")
;http://www.autohotkey.com/board/topic/70404-clip-send-and-retrieve-text-using-the-clipboard/
{
	Static BackUpClip,Stored,LastClip
	If (A_ThisLabel=Clip())
	{
		If (Clipboard==LastClip)
			Clipboard:=BackUpClip
		BackUpClip:=LastClip:=Stored:=""
	}
	Else
	{
		If !Stored
		{
			Stored:=True
			;ClipboardAll must be on its own line
			BackUpClip:=ClipboardAll
		}
		Else
			SetTimer Clip(),Off
		LongCopy:=A_TickCount,Clipboard:="",LongCopy-=A_TickCount
		;LongCopy gauges the amount of time it takes to empty the clipboard which can predict how long the subsequent clipwait will need
		If (Text = "")
		{
			SendInput "^c"
			ClipWait LongCopy ? 0.6 : 0.2,True
		}
		Else
		{
			Clipboard:=LastClip:=Text
			ClipWait 10
			SendInput "^v"
		}
		SetTimer Clip(),-700
		;Short sleep in case Clip() is followed by more keystrokes such as {Enter}
		Sleep 20
		If (Text="")
			Return LastClip:=Clipboard
		Else If (ReSelect=True) or (Reselect and (StrLen(Text) < 3000))
		{
			StrReplace(Text,Text,"`r")
            SendInput "{Shift Down}{Left " StrLen(Text) "}{Shift Up}"
		}
	}
	Return
	Clip:
	Return Clip()
}
*/