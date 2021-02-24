;---------------------------------------------------------------------------------------------------------------
; AutoIt Version: 1.0
; Language:       AU3
; Platform:       Win7/10
; Author:         Harish S Iyer (CDSID : IHARISH - Email : iharish1992@gmail.com ; iharish1992@gmail.com)
;
; Script Function:
;   Program to Create Learninig Material and replace KlassAct
;---------------------------------------------------------------------------------------------------------------



;---------------- Variables -----------------------------------------------------------------------------
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
#include <ScreenCapture.au3>
#include <Date.au3>
#include <WinAPI.au3>
#include <Array.au3>
#include <File.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>
;----------------------------------------------------------------------------------------------------------

$dll = DllOpen("user32.dll")
FunctionsGetpressed()



;---------------- Get all Functions Get --------------------------------------------------------------------
Func FunctionsGetpressed()

$TextFileName = "C:\temp\Keystrokes.au3"

While 1

	 If _IsPressed("01", $dll) Then
        $avMousePos = MouseGetPos()
		FileWrite($TextFileName, @CRLF & 'MouseClick("' & 'left",' & $avMousePos[0] & "," & $avMousePos[1] &",1)")
        sleep(50)
	 EndIf

	 If _IsPressed("02", $dll) Then
        $avMousePos = MouseGetPos()
		FileWrite($TextFileName, @CRLF & 'MouseClick("' & 'Right",' & $avMousePos[0] & "," & $avMousePos[1] &",1)")
        sleep(50)
	 EndIf






WEnd

EndFunc