;*****************************************
;Spotify.au3 by QuynhDam
;Created with ISN AutoIt Studio v. 1.08
;*****************************************
#include < AutoItConstants.au3>
HotKeySet("1", "Open_Restore")
HotKeySet("2", "Open_Maximize")
HotKeySet("3", "Open_Maximize_Send")
HotKeySet("{ESC}", "Thoat")
Main()
Func Main()
	While 1
		
	Wend
EndFunc
Func Open_Restore()
	
	If WinExists("[CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]") Then 
		WinActivate("Spotify")
		WinSetState("[ACTIVE]","", @SW_RESTORE)

	Else 
		
		Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe")
	
	EndIf
EndFunc

Func Open_Maximize()
	
	If WinExists("[CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]") Then 
		WinActivate("Spotify")
		WinSetState("[ACTIVE]", "", @SW_MAXIMIZE)
	Else 
		Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
		 WinSetState("[ACTIVE]", "", @SW_MAXIMIZE)
	EndIf
EndFunc

Func Open_Maximize_Send()
	If WinExists("[CLASS:Chrome_RenderWidgetHostHWND; INSTANCE:1]") Then 
		WinActivate("Spotify")
		WinSetState("[ACTIVE]", "", @SW_MAXIMIZE)
		
		Send("{SPACE}")
	
	Else 
		Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
		 WinSetState("[ACTIVE]", "", @SW_MAXIMIZE)
	EndIf
EndFunc
Func Thoat()
	WinClose("Spotify")
	Exit 
EndFunc 