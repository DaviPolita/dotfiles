#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

classname = ""
keystate = ""
activeprocess = ""

*Capslock::
  WinGet, activeprocess, ProcessName, A
  if (activeprocess = "WindowsTerminal.exe" or activeprocess = "Code.exe" or activeprocess = "ubuntu2004.exe")
  {
    SetCapsLockState, Off
    Send, {ESC}
  }
  else
  {
    GetKeyState, keystate, CapsLock, T
    if (keystate = "D")
      SetCapsLockState, Off
    else
      SetCapsLockState, On
    return
  }
  return
