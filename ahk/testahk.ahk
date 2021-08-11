#SingleInstance, force

$*a::
SendInput, a
KeyWait, a, T.15
If ErrorLevel
    Send {BS}{U+00E4}
return