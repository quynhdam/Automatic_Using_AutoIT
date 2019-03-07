;*****************************************
;Spotify.au3 by QuynhDam
;Created with ISN AutoIt Studio v. 1.08
;*****************************************
#include < AutoItConstants.au3>
#Include <WindowsConstants.au3>
#Include <WinAPI.au3>
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
;~ 	If WinExists("Spotify") Then 
;~  		Local $hWnd = WinGetHandle("Spotify")
;~  		WinSetState($hWnd, "", @SW_MAXIMIZE)
;~ 		WinSetState("Spotify", "", @SW_SHOW)
;~ 		Send("{SPACE}")

;~ 	ElseIf Not WinExists("Spotify") Then 
;~ 		
;~ 		Local $aWinList = WinList("[REGEXPTITLE:(?i)([^ISN AutoIT Studio].* - .*)]")
;~ 		If UBound($aWinList) = 2 Then 
;~ 			Local $sTitle = $aWinList[1][0]
;~ 			Local $hWnd_Get = $aWinList[1][1]
;~ 			WinSetState($hWnd_Get, "", @SW_MAXIMIZE)  
;~ 			Send("{SPACE}")
;~ 		Else 
;~ 			Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
;~ 			WinSetState("Spotify", "", @SW_SHOW)
;~ 		EndIf 
;~ 	EndIf

;~ 	Local $sSpotify = ""
;~ 	If WinExists("Spotify") Then 
;~  		Local $hWnd = WinGetHandle("Spotify")
;~  		WinSetState($hWnd, "", @SW_MAXIMIZE)
;~ 		WinSetState("Spotify", "", @SW_SHOW)
;~ 		

;~ 	ElseIf Not WinExists("Spotify") Then 
	Local $aWinInTaskBar[1][2]
	$iCount = 0

	$aList = WinList()

	For $i = 1 To $aList[0][0]
		$iExStyle = _WinAPI_GetWindowLong($aList[$i][1], $GWL_EXSTYLE) 

		If NOT BitAND($iExStyle, $WS_EX_TOOLWINDOW) AND _  
		   BitAND(WinGetState($aList[$i][1]), 2 ) Then    
			$iCount += 1
			Redim $aWinInTaskBar[ $iCount + 1][2]
			$aWinInTaskBar[ $iCount][0] = $aList[$i][0]
			$aWinInTaskBar[ $iCount][1] = $aList[$i][1]
		EndIf
	Next
	$aWinInTaskBar[0][0] = UBound($aWinInTaskBar) - 1

	;_ArrayDisplay($aWinInTaskBar)
	$sHandle = ""
	$id = ProcessExists("Spotify.exe")
	$aRet = WinList("[REGEXPTITLE:(?i)([^Default IME][^MSCTFIME UI][^GDI+ Window].*)]")
		;$aRet = WinList('[REGEXPTITLE:(.+)]')
		
	For $i = 1 To $aRet[0][0]
			
		$idTmp = WinGetProcess($aRet[$i][1])
		If $idTmp = $id Then 
			ConsoleWrite($aRet[$i][0] & '-->' & $aRet[$i][1]& @CRLF)
			$sHandle = $aRet[$i][1]
				
		EndIf
	Next
	For $i = 0 to $aWinInTaskBar[0][0]
		If $aWinInTaskBar[$i][1] = $sHandle Then 
			WinSetState($sHandle, "", @SW_MAXIMIZE) 
		Else 
			Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
		EndIf
	Next
;~ 		Local $sSpotify = ""
;~ 		Local $sHandle = ""
;~ 		Local $sProcess = ""
;~ 		Local $aList = WinList("[REGEXPTITLE:(?i)([^ISN AutoIT Studio].* - .*)]")
;~ 		Local $aProcessList = ProcessList("Spotify.exe")
;~ 		For $i = 1 To $aProcessList[0][0]
;~         
;~ 			$sProcess = $aProcessList[$i][1]
;~ 			ConsoleWrite("Process: " & $sProcess &  @CRLF)
;~ 			For $i = 1 To $aList[0][0]
;~ 				$sHandle = WinGetProcess($aList[$i][1] )
;~ 				ConsoleWrite("WinGetProcess: " & $sHandle &  @CRLF)
;~ 			 
;~ 				If $sProcess = $sHandle Then
;~ 					
;~ 					$sSpotify = $aList[$i][0]
;~ 					
;~ 				EndIf
;~ 				
;~ 			 Next
;~ 		Next
;~ 		
;~ 		$hWnd_Get = WinGetHandle($sSpotify)
;~ 		
;~ 		WinSetState($hWnd_Get, "", @SW_MAXIMIZE) 
;~ 		;Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
;~ 	Else 
;~ 		Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
;~ 		WinSetState("Spotify", "", @SW_SHOW)
;~ 	EndIf
EndFunc 


Func Open_Maximize_Send()
	Local $aWinInTaskBar[1][2]
	$iCount = 0

	$aList = WinList()

	For $i = 1 To $aList[0][0]
		$iExStyle = _WinAPI_GetWindowLong($aList[$i][1], $GWL_EXSTYLE) 

		If NOT BitAND($iExStyle, $WS_EX_TOOLWINDOW) AND _  
		   BitAND(WinGetState($aList[$i][1]), 2 ) Then    
			$iCount += 1
			Redim $aWinInTaskBar[ $iCount + 1][2]
			$aWinInTaskBar[ $iCount][0] = $aList[$i][0]
			$aWinInTaskBar[ $iCount][1] = $aList[$i][1]
		EndIf
	Next
	$aWinInTaskBar[0][0] = UBound($aWinInTaskBar) - 1

	;_Ar--rayDisplay($aWinInTaskBar)
	$sHandle = ""
	$id = ProcessExists("Spotify.exe")
	$aRet = WinList("[REGEXPTITLE:(?i)([^Default IME][^MSCTFIME UI][^GDI+ Window].*)]")
		;$aRet = WinList('[REGEXPTITLE:(.+)]')
		
	For $i = 1 To $aRet[0][0]
			
		$idTmp = WinGetProcess($aRet[$i][1])
		If $idTmp = $id Then 
			ConsoleWrite($aRet[$i][0] & '-->' & $aRet[$i][1]& @CRLF)
			$sHandle = $aRet[$i][1]
				
		EndIf
	Next
	For $i = 0 to $aWinInTaskBar[0][0]
		If $aWinInTaskBar[$i][1] = $sHandle Then 
			WinSetState($sHandle, "", @SW_MAXIMIZE) 
			Send("{SPACE}")
		Else 
			Run("C:\Users\QuynhDam\AppData\Roaming\Spotify\Spotify.exe", "", @SW_SHOWMAXIMIZED)
			;WinSetState($sHandle, "", @SW_MAXIMIZE)
		EndIf
	Next
EndFunc

Func Thoat()
	WinClose("Spotify")
	Exit 
EndFunc 
	
Func Minimize()
	WinSetState("Spotify", "", @SW_MINIMIZE)
EndFunc

