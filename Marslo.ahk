; =============================================================================
;       FileName: Marslo.ahk
;           Desc: 
;         Author: Marslo
;          Email: marslo.vida@gmail.com
;        Version: 0.0.2
;     LastChange: 2013-05-28 16:14:08
;        History:
;               0.0.2: Add the shortcut key make command line looks like shell
; =============================================================================

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
; Line move
^a:: ;; Move to beginning of line
    Send {Home}
return
^e:: ;; Move to End of line
    Send {End}
return

; Character move
^f:: ;; Move a character forward
    Send {Right}
return
^b:: ;; Move a character backward
    Send {Left}
return

; Word Move
!b:: ;; Move a word backward
    Send ^{Left}
return
!f:: ;; Move a word forward
    Send ^{Right}
return

; Delete
^d:: ;; Delete a char backward
    Send {Del}
return
^k:: ;; Delete the line from cursor to end
    Send ^{End}
return
^u:: ;; Delete the line from cursor to beginning
    Send ^{Home}
return
^w:: ;; Delete previous word
    Send ^+{Left}+{Left}
    Loop, 5 {
        Send {Del}
    }
return
!d:: ;; Delete backward word
    Send ^+{Right}+{Rigt}
    Loop, 5 {
        Send {Backspace}
    }
return

; Ctrl+up / Down to scroll command window back and forward
!k::
    WinGetTitle sTitle
    SendMessage, 0x115, 0, 0, , %sTitle%
    ; Send {WheelUp}
return
!j::
    WinGetTitle sTitle
    SendMessage, 0x115, 1, 0, , %sTitle%
    ; Send {WheelDown}
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

; Close Command Window with Ctrl+w
; $^w::
; WinGetTitle sTitle
; If (InStr(sTitle, "-")=0)
; {
    ; Send EXIT{Enter}
; }
; else
; {
    ; Send ^w
; }
; return

#IfWinActive


; Redefine only when the active window is Console2
#IfWinActive, ahk_class Console_2_Main
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
    WinMove, %mTitle%,, xpos-10, ypos
return
+#l::
    WinGetTitle, mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos+10, ypos
return
+#k::
    WinGetTitle mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos, ypos-10
return
+#j::
    WinGetTitle mTitle, A
    WinGetPos, xpos, ypos, Width, Height, %mTitle%
    WinMove, %mTitle%,, xpos, ypos+10
return

#3::
    Run, %A_ProgramFiles%\Internet Explorer\iexplore.exe https://webmail.nokiasiemensnetworks.com, , , nepid
    ; WinWait, ahk_pid %nepid%
    Sleep, 5000
    WinActivate, Outlook Web App - Windows Internet Explorer
    Send, Marslo{shift down}1{shift up}5
    Send, {Enter}
Return

#2::
    Run, %A_ProgramFiles%\Internet Explorer\iexplore.exe https://qc.inside.nokiasiemensnetworks.com/qcbin/start_a.htm, , , qcpid
    ; WinWait, ahk_pid %qcpid%
    ; WinActivate, ahk_pid %qcpid%
    Sleep, 15000
    WinActivate, HP Quality Center
    ; MsgBox, 'start'
    Send, {Tab}{Tab}
    Send, Marslo{shift down}1{shift up}5{Enter}
Return

#1::
    Run, %A_ProgramFiles%\VMware\Infrastructure\Virtual Infrastructure Client\Launcher\VpxClient.exe, , , vpcpid
    WinWait, ahk_pid %vpcpid%
    WinActivate, ahk_pid %vpcpid%
    Send, NLE\tempuser{Tab}Passw0rd{Enter}
Return
