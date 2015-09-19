VarSetCapacity(APPBARDATA, A_PtrSize=4 ? 36:48)

#b::
   NumPut(DllCall("Shell32\SHAppBarMessage", "UInt", 4 ; ABM_GETSTATE
                                           , "Ptr", &APPBARDATA
                                           , "Int")
 ? 2:1, APPBARDATA, A_PtrSize=4 ? 32:40) ; 2 - ABS_ALWAYSONTOP, 1 - ABS_AUTOHIDE
 , DllCall("Shell32\SHAppBarMessage", "UInt", 10 ; ABM_SETSTATE
                                    , "Ptr", &APPBARDATA)
   KeyWait, % A_ThisHotkey
   Return
   
#c::
IfWinExist, ahk_class IPTip_Main_Window 
	PostMessage,0x112,0xF060,,,ahk_class IPTip_Main_Window
Else {
	Run, TabTip.exe
	
	; Now move TIP to current mouse position
	Sleep, 100
	WinShow, ahk_class IPTip_Main_Window
	WinGetPos, tipX, tipY, , , ahk_class IPTip_Main_Window
	CoordMode, Mouse, Screen
	MouseGetPos, mouseX, mouseY
	MouseClickDrag, Left, tipX+300, tipY+10, mouseX, mouseY+50
}

Return