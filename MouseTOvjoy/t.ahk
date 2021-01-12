#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
#SingleInstance

#include VJoy_lib.ahk

vjoy_id := 1
VJoy_Init(vjoy_id)

MAX_Axis := 32767

    VJoy_SetAxis(MAX_Axis/2, 1, HID_USAGE_X  )
    VJoy_SetAxis(MAX_Axis/2, 1, HID_USAGE_Y  )
    VJoy_SetAxis(MAX_Axis/2, 1, HID_USAGE_Z  )
    VJoy_SetAxis(MAX_Axis/2, 1, HID_USAGE_RX )
    VJoy_SetAxis(MAX_Axis/2, 1, HID_USAGE_RY )
    VJoy_SetAxis(MAX_Axis/2, 1, HID_USAGE_RZ )
    VJoy_SetAxis(0, 1, HID_USAGE_SL0)
    VJoy_SetAxis(0, 1, HID_USAGE_SL1)

times_Axis := 3000
 
last_x := 0
last_y := 0
 
joy_x := 0
joy_y := 0
 
CoordMode, Mouse, Screen

SetTimer, Loops_ZZX, 10

LButton::Enter
RButton::Space
[::LButton
]::RButton

return

Loops_ZZX:
	MouseGetPos, mouse_x, mouse_y
	
	if (last_x !=0 && last_y !=0){
		moved_x := last_x - mouse_x
		moved_y := last_y - mouse_y
		
		joy_x := MAX_Axis/2 - moved_x*times_Axis
		joy_y := MAX_Axis/2 - moved_y*times_Axis
		
		if (joy_x > MAX_Axis || mouse_x > 1910) 
			joy_x := MAX_Axis
		if (joy_x < 0 || mouse_x < 10) 
			joy_x := 0
		if (joy_y > MAX_Axis || mouse_y > 1070)
			joy_y := MAX_Axis
		if (joy_y < 0 || mouse_y < 10) 
			joy_y := 0
			
		; Show tooltip with internal -100 -> 100 values for stick
		; Tooltip, %joy_x% "|" %joy_y%
 
		VJoy_SetAxis(joy_x, 1, HID_USAGE_Z)
		VJoy_SetAxis(joy_y, 1, HID_USAGE_RZ)
	}
	last_x := mouse_x
	last_y := mouse_y
return
 

