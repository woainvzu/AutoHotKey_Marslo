#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^+r::
    reload
return

; Make quick scroll to the putty window
#IfWinActive, ahk_class PuTTY
; ControlGetFocus, control, A

; Ctrl+k to scroll up by one line
!k::
    WinGetTitle pTitle
    SendMessage, 0x115, 0, 0, , %pTitle% 
    ; SendMessage, 0x115, 0, 0, , A
return

; Ctrl+j to scroll down by one line
!j::
    WinGetTitle pTitle
    SendMessage, 0x115, 1, 0, , %pTitle%
    ; SendMessage, 0x115, 1, 0, , A
return
#IfWinActive



; Using VIM-KEY against Foxit Reader
#IfWinActive, ahk_class classFoxitReader
j::Down
k::Up
f::PgDn
b::PgUp
G::End
g::Home
h::
    Send ^+{Tab}
return
l::
    Send ^{Tab}
return
/::
    Send ^f
return
o::
    Send ^o
return
d::
    Send ^w q::Send !{F4}
return
#IfWinActive

; Using VIM-LIKE key against chm reader (c:\Windws\hh.exe)
#IfWinActive, ahk_class HH Parent
+j::Down
+k::Up
/::
    Send ^f
return
^w::
    Send !{F4}
return
#IfWinActive


; Using VIM-LIKE key against GoldenDict
#IfWinActive, ahk_class QWidget
+j::Down
+k::Up
+/::
    Send ^f
return
#IfWinActive

; Using VIM-LIKE key against Explorer.exe
#IfWinActive, ahk_class IEFrame
+j::Down
+k::Up
; +g::Home
; +e::End
+l::
    Send {Right}
return
+h::
    Send {Left}
return 
+/::
    Send ^f
return
^w::
    Send !{F4}
return
#IfWinActive


; Redefine only when the active window is a console window 
#IfWinActive ahk_class ConsoleWindowClass
; Close Command Window with Ctrl+w
$^w::
WinGetTitle sTitle
If (InStr(sTitle, "-")=0) 
{ 
	Send EXIT{Enter}
}
else 
{
	Send ^w
}
return 

; Ctrl+up / Down to scroll command window back and forward
^k::
    Send {WheelUp}
return
^j::
    Send {WheelDown}
return

; Ctrl+p/n to switch the command history
^p::
    Send {Up}
return
^n::
    Send {Down}
return

; Paste in command window
^v::
    ; Spanish menu (Editar->Pegar, I suppose English version is the same, Edit->Paste)
    Send !{Space}ep
return
#IfWinActive


; Open files
!+f::
    run "%A_ProgramFiles%\Foxit Software\Foxit Reader\Foxit Reader.exe"
return 
!+l::
    Run "%A_ProgramFiles%\Microsoft Office\Office14\OUTLOOK.EXE" /recycle
return 
!+m::
    Run %A_WinDir%\hh.exe c:\Marslo\Study\Scritps\MySql\MySQL.Cookbook.2nd.ed.chm
return
!+r::
    Run %A_WinDir%\hh.exe "%A_ProgramFiles%\Ruby187\doc\ruby18.chm"
return

; Move the windows by Shift+Win+h/l/j/k
+#h::
    WinGetTitle, mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos-20, ypos
return
+#l::
    WinGetTitle, mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos+20, ypos
return
+#k::
    WinGetTitle mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos, ypos-20
return
+#j::
    WinGetTitle mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos, ypos+20
return





