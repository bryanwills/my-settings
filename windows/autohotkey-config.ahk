#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; --------------------------------------------------------------
; Notes
; --------------------------------------------------------------
; ! = Alt
; >! = Right Alt
; <! = Left Alt
; ^ = Ctrl
; + = Shift
; # = Win

; disable start menu on left winkey
LWin & vk07::return
LWin::return

; switching between windows
LCtrl & Tab::AltTab
 
; remaps alt-delete keys to mimic OSX
; command-delete deletes whole line
^BS::Send {LShift down}{Home}{LShift Up}{Del}
 
; alt-function-delete deletes next word
!Delete::Send {LShift down}{LCtrl down}{Right}{Lctrl up}{LShift Up}{Del}
 
; alt-delete deletes previous word
!BS::Send {LShift down}{LCtrl down}{Left}{Lctrl up}{LShift Up}{Del}
 
; mimics command-q and command-w behaviour to close windows
^SC011::^F4 ;w
^SC010::Send {LAlt down}{Ctrl up}{F4}{LAlt up} ;q

; ctrl+H (cmd+h) to hide window
^SC023::WinMinimize,a ;h
 
; remaps command-arrow
<^Up::Send {Lctrl down}{Home}{Lctrl up}
<^Down::Send {Lctrl down}{End}{Lctrl up}
<^Left::Send {Home}
<^Right::Send {End}
<^+Up::Send {Shift down}{Lctrl down}{Home}{Lctrl up}{Shift up}
<^+Down::Send {Shift down}{Lctrl down}{End}{Lctrl up}{Shift up}
<^+Left::Send {Shift down}{Home}{Shift up}
<^+Right::Send {Shift down}{End}{Shift up} 

; remaps alt-arrow
!Up::Send {LAlt down}{Up}{LAlt up}
!Down::Send {LAlt down}{Down}{LAlt up}
!Left::Send {Lctrl down}{Left}{Lctrl up}
!Right::Send {Lctrl down}{Right}{Lctrl up}
!+Up::Send {Shift down}{PgUp}
!+Down::Send {Shift down}{PgDn}
!+Left::Send {Shift down}{Lctrl down}{Left}{Lctrl up}{Shift up}
!+Right::Send {Shift down}{Lctrl down}{Right}{Lctrl up}{Shift up}

; remaps ijkl to arrows
; the modifier button for this behavior is the right Alt button, we use
; the right Ctrl here because it's right Alt is remapped to right Ctrl
; at a registry level to avoid messing with the native Alt functionality
; in windows (that selects the menu)
>^i::Send {Up}       
>^k::Send {Down}     
>^j::Send {Left}     
>^l::Send {Right}    
>^+i::Send {Shift down}{Up}{Shift up}      
>^+k::Send {Shift down}{Down}{Shift up}    
>^+j::Send {Shift down}{Left}{Shift up}    
>^+l::Send {Shift down}{Right}{Shift up}   

; remaps ijkl + ctrl to arrows
>^<^i::Send {Lctrl down}{Home}{Lctrl up}
>^<^k::Send {Lctrl down}{End}{Lctrl up}
>^<^j::Send {Home}
>^<^l::Send {End}
>^<^+i::Send {Shift down}{Lctrl down}{Home}{Lctrl up}{Shift up}
>^<^+k::Send {Shift down}{Lctrl down}{End}{Lctrl up}{Shift up}
>^<^+j::Send {Shift down}{Home}{Shift up}
>^<^+l::Send {Shift down}{End}{Shift up} 

; remaps ijkl + alt to arrows
>^<!i::Send {LAlt down}{Up}{LAlt up}
>^<!k::Send {LAlt down}{Down}{LAlt up}
>^<!j::Send {Lctrl down}{Left}{Lctrl up}
>^<!l::Send {Lctrl down}{Right}{Lctrl up}
>^<!+i::Send {Shift down}{PgUp}
>^<!+k::Send {Shift down}{PgDn}
>^<!+j::Send {Shift down}{Lctrl down}{Left}{Lctrl up}{Shift up}
>^<!+l::Send {Shift down}{Lctrl down}{Right}{Lctrl up}{Shift up}
 
; tabs switching
<^!Left::Send {LCtrl down}{LShift down}{Tab}{LShift up}{LCtrl up}
<^!Right::Send {LCtrl down}{Tab}{LCtrl up}
 
; switching between windows of the same app
^SC056::    ; Next window Cmd+\ (left from Z)
WinGetClass, ActiveClass, A
WinGet, WinClassCount, Count, ahk_class %ActiveClass%
IF WinClassCount = 1
    Return
Else
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return

<^Space::Send, #s ; ctrl + space (option + space; spotlight)
