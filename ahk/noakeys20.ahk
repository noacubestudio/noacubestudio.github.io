; Autoexecute
    SetWorkingDir %A_ScriptDir% ; Startup folder is in Win+R shell:startup
    SetTitleMatchMode, 2
    SendMode Input  ; speed and reliability
    #NoEnv          ; performance and compatibility
    #InstallKeybdHook
    #SingleInstance force
    

    ; Groups
    GroupAdd, Puzzlescript, PuzzleScript
    GroupAdd, Puzzlescript, Pattern:Script
return


; Custom shortcut for this file
#IfWinActive noakeys20.ahk

; Auto run after saving
~^s::Run, noakeys20.ahk

; Main

; German Special Characters

F13 & a::
    If !GetKeyState("Shift","p")
         Send {U+00E4} ; ä
    else Send {U+00C4} ; Ä
Return

F13 & o::
    If !GetKeyState("Shift","p")
         Send {U+00F6} ; ö
    else Send {U+00D6} ; Ö
Return

F13 & u::
    If !GetKeyState("Shift","p")
         Send {U+00FC} ; ü
    else Send {U+00DC} ; Ü
Return

F13 & s::
    If !GetKeyState("Shift","p")
         Send {U+00DF} ; ß
    else Send {U+1E9E} ; ẞ
Return

; Punctiation

; Currency, Math and other symbols

F13 & e::
    If !GetKeyState("Shift","p")
         Send {U+20AC} ; euro
    else ; tbd
Return

F13 & 0::
    If !GetKeyState("Shift","p")
         Send {U+00B0} ; degree
    else ; tbd
Return

F13 & y::
    If !GetKeyState("Shift","p")
         Send {U+2713} ; checkmark
    else ; tbd
Return

; Arrows 

F13 & Left::
    If !GetKeyState("Shift","p")
         Send {U+2190} ; ← leftwards arrow
    else ; tbd
Return

F13 & Right::
    If !GetKeyState("Shift","p")
         Send {U+2192} ; rightwards arrow
    else ; tbd
Return

; if in Puzzlescript Tab
; TODO make sure this works in all forks

#IfWinActive ahk_group Puzzlescript

F2::
    ; Replace current selection with something
    Send ^+F
    Send {Enter}
return

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
#IfWinActive, Figma



; TOGGLES

Tab & 1::
    Send, !l ; collapse layers
return

Tab & 2::
    Send, ^/ ; open command palette
    Clip("nudge amount")
    Send, {Enter}
return

Tab & 3::
    Send, ^' ; toggle pixel grid
    Send, ^+' ; snap to pixel grid
return

Tab & 4::
    Send, ^+4 ; toggle layout grid
return



; Tools

!c::
    Send, !v ; align vertical centers
    Send, !h ; align horizontal centers
return

Tab & d::
    Send, +{Backspace} ; Delete and heal
return

Tab & q::
    Send, ^/ ; open command palette
return

Tab & w::
    Send, {Enter} ; Drill down
return

Tab & s::
    Send, +{Enter} ; Exit
return

Tab & e::
    Send, ^/ ; open command palette
    Clip("copy properties")
    Send, {Enter}
return

Tab & a::
    ; unused
return

; y, x, r, f, 5, ...

; Adjust volume by scrolling the mouse wheel over the taskbar.
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up 2}
WheelDown::Send {Volume_Down 2}
return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

; Clip() - Send and Retrieve Text Using the Clipboard
; by berban - updated February 18, 2019
; https://www.autohotkey.com/boards/viewtopic.php?f=6&t=62156
Clip(Text="", Reselect="")
{
	Static BackUpClip, Stored, LastClip
	If (A_ThisLabel = A_ThisFunc) {
		If (Clipboard == LastClip)
			Clipboard := BackUpClip
		BackUpClip := LastClip := Stored := ""
	} Else {
		If !Stored {
			Stored := True
			BackUpClip := ClipboardAll ; ClipboardAll must be on its own line
		} Else
			SetTimer, %A_ThisFunc%, Off
		LongCopy := A_TickCount, Clipboard := "", LongCopy -= A_TickCount ; LongCopy gauges the amount of time it takes to empty the clipboard which can predict how long the subsequent clipwait will need
		If (Text = "") {
			SendInput, ^c
			ClipWait, LongCopy ? 0.6 : 0.2, True
		} Else {
			Clipboard := LastClip := Text
			ClipWait, 10
			SendInput, ^v
		}
		SetTimer, %A_ThisFunc%, -700
		Sleep 20 ; Short sleep in case Clip() is followed by more keystrokes such as {Enter}
		If (Text = "")
			Return LastClip := Clipboard
		Else If ReSelect and ((ReSelect = True) or (StrLen(Text) < 3000))
			SendInput, % "{Shift Down}{Left " StrLen(StrReplace(Text, "`r")) "}{Shift Up}"
	}
	Return
	Clip:
	Return Clip()
}
