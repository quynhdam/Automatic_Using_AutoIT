;*****************************************
;Spotify.au3 by QuynhDam
;Created with ISN AutoIt Studio v. 1.08
;*****************************************
#include < AutoItConstants.au3>
Opt("WinTitleMatchMode", 2)

HotKeySet("1", "Open_Restore")
HotKeySet("2", "Open_Maximize")
HotKeySet("3", "Open_Maximize_Send")
HotKeySet("4", "Minimize")
HotKeySet("{ESC}", "Thoat")
Global $aWinList = "" 
Main()
Func Main()
	While 1
		Sleep(100)
	Wend
EndFunc
Func Open_Restore()
	
	If WinExists("Spotify") Then 
		Local $hWnd = WinGetHandle("Spotify")
		WinSetState($hWnd, "", @SW_RESTORE)
	Else 
		
		Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe")
	
	EndIf
EndFunc


Func Open_Maximize()
	If WinExists("Spotify") Then 
 		Local $hWnd = WinGetHandle("Spotify")
 		WinSetState($hWnd, "", @SW_MAXIMIZE)
		WinSetState("Spotify", "", @SW_SHOW)
		Send("{SPACE}")

	ElseIf Not WinExists("Spotify") Then 
		
		Local $aWinList = WinList("[REGEXPTITLE:(?i)([^ISN AutoIT Studio].* - .*)]")
		If UBound($aWinList) = 2 Then 
			Local $sTitle = $aWinList[1][0]
			Local $hWnd_Get = $aWinList[1][1]
			WinSetState($hWnd_Get, "", @SW_MAXIMIZE)
			Send("{SPACE}")
		Else 
			Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
			WinSetState("Spotify", "", @SW_SHOW)
		EndIf 
	EndIf
EndFunc



Func Open_Maximize_Send()
	If WinExists("Spotify") Then 
 		Local $hWnd = WinGetHandle("Spotify")
 		WinSetState($hWnd, "", @SW_MAXIMIZE)
		WinSetState("Spotify", "", @SW_SHOW)
		Send("{SPACE}")

	ElseIf Not WinExists("Spotify") Then 
		
		Local $aWinList = WinList("[REGEXPTITLE:(?i)([^ISN AutoIT Studio].* - .*)]")
		If UBound($aWinList) = 2 Then 
			Local $sTitle = $aWinList[1][0]
			Local $hWnd_Get = $aWinList[1][1]
			WinSetState($hWnd_Get, "", @SW_MAXIMIZE)
			Send("{SPACE}")
		Else 
			Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
			WinSetState("Spotify", "", @SW_SHOW)
		EndIf 
	EndIf

EndFunc

Func Thoat()
	WinClose("Spotify")
	Exit 
EndFunc 
	
Func Minimize()
	WinSetState("Spotify", "", @SW_MINIMIZE)
EndFunc

