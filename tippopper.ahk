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