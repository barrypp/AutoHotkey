#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CoordMode, Mouse, Client

ShouldStop := false

IIMouseLClick(x,y)
{
	Send {Click %x%, %y%,0}
	Sleep 20
	Send {LButton down}
	sleep 50
	Send {LButton up}
	Sleep 50

}

h::
Loop
{
	IIMouseLClick(1683, 927)
	IIMouseLClick(1806, 911)
	IIMouseLClick(1931, 911)
	IIMouseLClick(2045, 927)
	IIMouseLClick(1444, 1076)
	IIMouseLClick(1582, 1076)

	IIMouseLClick(828, 905)
	sleep 200

	if (ShouldStop)
	{
		ShouldStop := false
		break
	}
		  	
}
return

y::
Loop
{
	IIMouseLClick(1511, 552)
	IIMouseLClick(1631, 552)
	IIMouseLClick(1763, 552)
	IIMouseLClick(1876, 552)
	IIMouseLClick(1983, 552)
	IIMouseLClick(2111, 552)

	IIMouseLClick(1066, 1222)
	sleep 300

	if (ShouldStop)
	{
		ShouldStop := false
		break
	}
}
return

u::
	ShouldStop := true
return

j::
	ExitApp 
return 

