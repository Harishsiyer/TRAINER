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


;---------------- KODA FORM SETUP -----------------------------------------------------------------------------
CreateDir()
$dll = DllOpen("user32.dll")




$Form1 = GUICreate("TRAINER - A FREE SIMULATOR", 596, 150, 192, 124)
GUISetBkColor(0x464646)

$Label11 = GUICtrlCreateLabel("TRAINER", 230, 2, 200, 33)
GUICtrlSetFont(-1, 16, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFF0000)

$Label11 = GUICtrlCreateLabel("T", 8, 30, 21, 33)
GUICtrlSetFont(-1, 18, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label12 = GUICtrlCreateLabel("R", 133, 30, 22, 33)
GUICtrlSetFont(-1, 18, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label13 = GUICtrlCreateLabel("A", 220, 30, 22, 33)
GUICtrlSetFont(-1, 18, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label14 = GUICtrlCreateLabel("IN", 390, 30, 22, 33)
GUICtrlSetFont(-1, 18, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label15 = GUICtrlCreateLabel("ER", 422, 30, 28, 33)
GUICtrlSetFont(-1, 18, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label8 = GUICtrlCreateLabel(" rainig Program to ", 20, 38, 110, 20)
GUICtrlSetFont(-1, 11, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label9 = GUICtrlCreateLabel(" ecord and", 150, 40, 68, 20)
GUICtrlSetFont(-1, 11, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label20 = GUICtrlCreateLabel("utomatically Export as an ", 240, 40, 150, 20)
GUICtrlSetFont(-1, 11, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label21 = GUICtrlCreateLabel("t", 415, 38, 8, 20)
GUICtrlSetFont(-1, 12, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Label22 = GUICtrlCreateLabel("active Simulator", 450, 38, 150, 20)
GUICtrlSetFont(-1, 12, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$START = GUICtrlCreateButton("START", 88, 78, 105, 25)
GUICtrlSetFont(-1, 10, 800, 0, "Corbel")
$Button1 = GUICtrlCreateButton("STOP", 200, 78, 105, 25)
GUICtrlSetFont(-1, 10, 800, 0, "Corbel")
$Createdbyiharishatfordcomasasasasasasasasas = GUICtrlCreateLabel("Created by Harish Iyer - iharish@ford.com", 360, 124, 271, 17)
GUICtrlSetFont(-1, 9, 800, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)
$Button2 = GUICtrlCreateButton("EXPORT", 360, 78, 105, 25)
GUICtrlSetFont(-1, 10, 800, 0, "Corbel")
$REC = GUICtrlCreateLabel("REC", 16, 70, 75, 43)
GUICtrlSetFont(-1, 24, 800, 0, "Calibri")
GUICtrlSetColor(-1, 0xFF0000)
$Button3 = GUICtrlCreateButton("EXIT", 472, 78, 105, 25)
GUICtrlSetFont(-1, 10, 800, 0, "Corbel")

;GUICtrlCreateProgress(138, 122, 140, 12, $PBS_MARQUEE)
;_SendMessage(GUICtrlGetHandle(-1), $PBM_SETMARQUEE, True, 50)

GUISetState(@SW_SHOW)


While 1
	$nMsg = GUIGetMsg()

	Switch $nMsg

		Case $GUI_EVENT_CLOSE, $Button3
			Exit

		Case $START
			Maincoursemacro()

		Case $Button1
			Exitcoursemacro()

		Case $Button2
			ExtractMacrores()

	EndSwitch
WEnd

 ;----------------------------------------------------------------------------------------------------------









;---------------- Main Macro 1 -----------------------------------------------------------------------------
Func Maincoursemacro()

			$Macros1 = 0
			$Macros2 = 0
			$Macros1 = 1

		 CreateDir()

				$CMD = "psr.exe /stop"
				RunWait(@ComSpec & " /c " & $CMD, @WindowsDir, @SW_HIDE)

		 Createoutput()
		 WindowsMinimizeall()
		 StartRecording()
		FunctionsGetpressed()

EndFunc
 ;----------------------------------------------------------------------------------------------------------


;---------------- Create Dirctory -------------------------------------------------------------------------
Func CreateDir()
	;Delete
	DirRemove("C:\temp" , 1)
	;Create
Local $sFldr1 = "C:\temp\"
DirCreate($sFldr1)
EndFunc
 ;----------------------------------------------------------------------------------------------------------


;---------------- Windows Minimize all --------------------------------------------------------------------
Func WindowsMinimizeall()
WinMinimizeAll()
EndFunc
 ;----------------------------------------------------------------------------------------------------------


;---------------- Create Output --------------------------------------------------------------------
Func Createoutput()

$CMD = "start /min psr.exe /start /output C:\temp\Screenshot1.zip /gui 0 /maxsc 100"
RunWait(@ComSpec & " /c " & $CMD, @WindowsDir, @SW_HIDE)

EndFunc
;----------------------------------------------------------------------------------------------------------




;---------------- Start Recording --------------------------------------------------------------------

Func StartRecording()

ToolTip(@CRLF & @CRLF & "Recording Will start in 3." & @CRLF & @CRLF, 687, 390 , "" , 1, 1)
Sleep(1000) ;Sleep to give tooltip time to display.
ToolTip(@CRLF & @CRLF & "Recording Will start in 2." & @CRLF & @CRLF, 687, 390 , "" , 1, 1)
Sleep(1000)
ToolTip(@CRLF & @CRLF & "Recording Will start in 1." & @CRLF & @CRLF, 687, 390 , "" , 1, 1)
Sleep(1000)
ToolTip(@CRLF & @CRLF & "Go." & @CRLF & @CRLF, 687, 390 , "" , 1, 1)
Sleep(1000)
ToolTip("", 0, 0)

EndFunc
;---------------- Create Output --------------------------------------------------------------------






;---------------- Get all Functions Get --------------------------------------------------------------------
Func FunctionsGetpressed()
$idnumber = 0

While 1

	 If _IsPressed("01", $dll) Then
        $avMousePos = MouseGetPos()
        $idnumber += 1
        IniWrite("C:\temp\Keystrokes.txt",$idnumber ,"" ,  _Now() & " - " & "Mouse - " & "left - "& $avMousePos[0] & " - " & $avMousePos[1] &"")
        sleep(100)
	 EndIf


	 If _IsPressed("02", $dll) Then
        $avMousePos = MouseGetPos()
        $idnumber += 1
        IniWrite("C:\temp\Keystrokes.txt",$idnumber ,"" ,  _Now() & " - " & "Mouse - " & "Right - "& $avMousePos[0] & " - " & $avMousePos[1] &"")
        sleep(100)
	 EndIf

;------------------------------------------------------
	  If IsInt($idnumber/90)  Then
		 $idnumber += 1

					$bnum = $idnumber/90
					$restult = StringLeft($bnum,StringInStr($bnum,".")-1)
					$restult = $restult + 1

		 $CMD = "psr.exe /stop"
			   RunWait(@ComSpec & " /c " & $CMD, @WindowsDir, @SW_HIDE)
		 $CMD = "start /min psr.exe /start /output C:\temp\Screenshot"& $restult &".zip /gui 0 /maxsc 100"
			   RunWait(@ComSpec & " /c " & $CMD, @WindowsDir, @SW_HIDE)
	  EndIf


		$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $Button3
			Exit
		Case $nMsg = $Button1
			Exitcoursemacro()
		Case $nMsg = $Button2
			ExtractMacrores()
	EndSelect


WEnd

EndFunc


Func _Quit()
    DllClose($dll)
    Exit
EndFunc


;----------------------------------------------------------------------------------------------------------














;---------------- Main Macro 2 -----------------------------------------------------------------------------
Func Exitcoursemacro()

$Macros2 = 1

; Adding the progress bar
$ShowPRogress = GUICtrlCreateProgress(138, 122, 140, 12, $PBS_MARQUEE)
$ShowPRogress2 = _SendMessage(GUICtrlGetHandle(-1), $PBM_SETMARQUEE, True, 50)


	CreateExit()
	Extractzipandclear()
	CreateHTM()
	movealldatatosingle()
	Deletewastefolders()
	ConvertHTMtotxt()
	Convertsingleetxt()
	createperfecttext()


; Disabling the status Bar
$ShowPRogress2 = _SendMessage(GUICtrlGetHandle(-1), $PBM_SETMARQUEE, False , 50)
$Label22 = GUICtrlCreateLabel("                      ", 138, 122, 140, 12)
GUICtrlSetFont(-1, 12, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)

MsgBox($MB_SYSTEMMODAL, "Recording", "Recording has been Stopped.!")

While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $Button3
			Exit
		Case $nMsg = $START
			Maincoursemacro()
		Case $nMsg = $Button2
			ExtractMacrores()
	EndSelect
WEnd

EndFunc
 ;----------------------------------------------------------------------------------------------------------


 Func CreateExit()

;'PSr Open CMD Command

$CMD = "psr.exe /stop"
RunWait(@ComSpec & " /c " & $CMD, @WindowsDir, @SW_HIDE)

EndFunc




;---------------- Clear VBS, CREATE VBS, EXTRACT ZIP, DELETE WASTE FILES-------------------------------------
 Func Extractzipandclear()

FileDelete("C:\temp\*.vbs")

$file = FileOpen("C:\temp\vbscriptau3.vbs", 2)
FileWrite($file, 'Option  Explicit'  & @CRLF & 'On Error Resume Next'  & @CRLF & 'Dim MyFolder, objFSO, MyFile, j, i, Item'  & @CRLF & 'Set objFSO = CreateObject("Scripting.FileSystemObject")'  & @CRLF & 'i = 0'  & @CRLF & 'For i = 1 To 100'  & @CRLF & 'If objFSO.FileExists("C:\temp\Screenshot" & i & ".zip") Then'  & @CRLF & 'CreateObject("Shell.Application").Namespace("C:\temp\").CopyHere CreateObject("Shell.Application").Namespace("C:\temp\Screenshot" & i & ".zip").items'  & @CRLF & 'j = 0'  & @CRLF & 'For Each Item In objFSO.GetFolder("C:\temp\").Files'  & @CRLF & 'If InStr(Item, ".mht") > 0 Then'  & @CRLF & 'j = j + 1'  & @CRLF & 'Else'  & @CRLF & 'End If'  & @CRLF & 'Next'  & @CRLF & 'For Each Item In objFSO.GetFolder("C:\temp\").Files'  & @CRLF & 'If InStr(Item, "Problem") > 0 Then'  & @CRLF & 'objFSO.MoveFile Item, "C:\temp\" & j & ".mht"'  & @CRLF & 'Exit For'  & @CRLF & 'Else'  & @CRLF & 'End If'  & @CRLF & 'Next'  & @CRLF & 'Else'  & @CRLF & 'End If'  & @CRLF & 'Next')
FileClose($file)
runWait(@comSpec & ' /c cscript.exe "C:\temp\vbscriptau3.vbs"', '', @SW_HIDE)

FileDelete("C:\temp\*.vbs")
FileDelete("C:\temp\*.zip")

 EndFunc

 ;----------------------------------------------------------------------------------------------------------



 ;---------------- Clear VBS, CREATE EXTRACT -------------------------------------
 Func CreateHTM()
 FileDelete("C:\temp\*.vbs")
$file = FileOpen("C:\temp\vbscriptau3.vbs", 2)
FileWrite($file, 'Option Explicit'  & @CRLF & 'Dim totalfilename , objStartFolder , objFSO , objFolder ,colFiles, objFile'  & @CRLF & 'Set objFSO = CreateObject("Scripting.FileSystemObject")'  & @CRLF & 'objStartFolder = "C:\temp"'  & @CRLF & 'Set objFolder = objFSO.GetFolder(objStartFolder)'  & @CRLF & 'Set colFiles = objFolder.Files'  & @CRLF & 'For Each objFile in colFiles'  & @CRLF & 'totalfilename = "C:\temp\" & objFile.Name'  & @CRLF & 'If instr(totalfilename , ".mht") > 0 Then'  & @CRLF & 'Doc2HTML totalfilename'  & @CRLF & 'End If'  & @CRLF & 'Next'  & @CRLF & 'Sub Doc2HTML(myFile)'  & @CRLF & 'Dim objDoc, objFile, objFSO, objWord, StrFile, strHTML'  & @CRLF & 'Const wdFormatHTML = 8'  & @CRLF & 'Set objFSO = CreateObject("Scripting.FileSystemObject")'  & @CRLF & 'Set objWord = CreateObject("Word.Application")'  & @CRLF & 'With objWord'  & @CRLF & '.Visible = False'  & @CRLF & 'If objFSO.FileExists(myFile) Then'  & @CRLF & 'Set objFile = objFSO.GetFile(myFile)'  & @CRLF & 'StrFile = objFile.Path'  & @CRLF & 'Else'  & @CRLF & 'WScript.Echo "FILE OPEN ERROR: The file does not exist" & vbCrLf'  & @CRLF & '.Quit'  & @CRLF & 'Exit Sub'  & @CRLF & 'End If'  & @CRLF & 'strHTML = objFSO.BuildPath(objFile.ParentFolder, _'  & @CRLF & 'objFSO.GetBaseName(objFile) & ".html")'  & @CRLF & '.Documents.Open StrFile'  & @CRLF & 'Set objDoc = .ActiveDocument'  & @CRLF & 'objDoc.SaveAs strHTML, wdFormatHTML'  & @CRLF & 'objDoc.Close'  & @CRLF & '.Quit'  & @CRLF & 'End With'  & @CRLF & 'End Sub')
FileClose($file)
runWait(@comSpec & ' /c cscript.exe "C:\temp\vbscriptau3.vbs"', '', @SW_HIDE)
FileDelete("C:\temp\*.vbs")
FileDelete("C:\temp\*.mht")

 EndFunc




 ;---------------- Move all Files to s aingle folder -------------------------------------
 Func movealldatatosingle()


	Local $sFldrre3 = "C:\temp\Image_Upload\"
    DirCreate($sFldrre3)
    Local $aFileList = _FileListToArray("C:\temp", "*", $FLTA_FOLDERS)
	For $i = 1 To $aFileList[0]
	$files = 0
	If StringInStr($aFileList[$i], "Image_Upload") Then
	Else
	$files = DirGetSize ( "C:\temp\Image_Upload\",1)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image001.jpg", "C:\temp\Image_Upload\"& $files[1] + 1 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image002.jpg", "C:\temp\Image_Upload\"& $files[1] + 2 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image003.jpg", "C:\temp\Image_Upload\"& $files[1] + 3 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image004.jpg", "C:\temp\Image_Upload\"& $files[1] + 4 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image005.jpg", "C:\temp\Image_Upload\"& $files[1] + 5 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image006.jpg", "C:\temp\Image_Upload\"& $files[1] + 6 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image007.jpg", "C:\temp\Image_Upload\"& $files[1] + 7 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image008.jpg", "C:\temp\Image_Upload\"& $files[1] + 8 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image009.jpg", "C:\temp\Image_Upload\"& $files[1] + 9 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image010.jpg", "C:\temp\Image_Upload\"& $files[1] + 10 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image011.jpg", "C:\temp\Image_Upload\"& $files[1] + 11 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image012.jpg", "C:\temp\Image_Upload\"& $files[1] + 12 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image013.jpg", "C:\temp\Image_Upload\"& $files[1] + 13 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image014.jpg", "C:\temp\Image_Upload\"& $files[1] + 14 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image015.jpg", "C:\temp\Image_Upload\"& $files[1] + 15 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image016.jpg", "C:\temp\Image_Upload\"& $files[1] + 16 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image017.jpg", "C:\temp\Image_Upload\"& $files[1] + 17 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image018.jpg", "C:\temp\Image_Upload\"& $files[1] + 18 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image019.jpg", "C:\temp\Image_Upload\"& $files[1] + 19 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image020.jpg", "C:\temp\Image_Upload\"& $files[1] + 20 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image021.jpg", "C:\temp\Image_Upload\"& $files[1] + 21 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image022.jpg", "C:\temp\Image_Upload\"& $files[1] + 22 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image023.jpg", "C:\temp\Image_Upload\"& $files[1] + 23 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image024.jpg", "C:\temp\Image_Upload\"& $files[1] + 24 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image025.jpg", "C:\temp\Image_Upload\"& $files[1] + 25 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image026.jpg", "C:\temp\Image_Upload\"& $files[1] + 26 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image027.jpg", "C:\temp\Image_Upload\"& $files[1] + 27 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image028.jpg", "C:\temp\Image_Upload\"& $files[1] + 28 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image029.jpg", "C:\temp\Image_Upload\"& $files[1] + 29 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image030.jpg", "C:\temp\Image_Upload\"& $files[1] + 30 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image031.jpg", "C:\temp\Image_Upload\"& $files[1] + 31 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image032.jpg", "C:\temp\Image_Upload\"& $files[1] + 32 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image033.jpg", "C:\temp\Image_Upload\"& $files[1] + 33 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image034.jpg", "C:\temp\Image_Upload\"& $files[1] + 34 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image035.jpg", "C:\temp\Image_Upload\"& $files[1] + 35 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image036.jpg", "C:\temp\Image_Upload\"& $files[1] + 36 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image037.jpg", "C:\temp\Image_Upload\"& $files[1] + 37 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image038.jpg", "C:\temp\Image_Upload\"& $files[1] + 38 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image039.jpg", "C:\temp\Image_Upload\"& $files[1] + 39 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image040.jpg", "C:\temp\Image_Upload\"& $files[1] + 40 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image041.jpg", "C:\temp\Image_Upload\"& $files[1] + 41 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image042.jpg", "C:\temp\Image_Upload\"& $files[1] + 42 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image043.jpg", "C:\temp\Image_Upload\"& $files[1] + 43 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image044.jpg", "C:\temp\Image_Upload\"& $files[1] + 44 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image045.jpg", "C:\temp\Image_Upload\"& $files[1] + 45 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image046.jpg", "C:\temp\Image_Upload\"& $files[1] + 46 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image047.jpg", "C:\temp\Image_Upload\"& $files[1] + 47 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image048.jpg", "C:\temp\Image_Upload\"& $files[1] + 48 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image049.jpg", "C:\temp\Image_Upload\"& $files[1] + 49 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image050.jpg", "C:\temp\Image_Upload\"& $files[1] + 50 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image051.jpg", "C:\temp\Image_Upload\"& $files[1] + 51 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image052.jpg", "C:\temp\Image_Upload\"& $files[1] + 52 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image053.jpg", "C:\temp\Image_Upload\"& $files[1] + 53 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image054.jpg", "C:\temp\Image_Upload\"& $files[1] + 54 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image055.jpg", "C:\temp\Image_Upload\"& $files[1] + 55 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image056.jpg", "C:\temp\Image_Upload\"& $files[1] + 56 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image057.jpg", "C:\temp\Image_Upload\"& $files[1] + 57 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image058.jpg", "C:\temp\Image_Upload\"& $files[1] + 58 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image059.jpg", "C:\temp\Image_Upload\"& $files[1] + 59 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image060.jpg", "C:\temp\Image_Upload\"& $files[1] + 60 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image061.jpg", "C:\temp\Image_Upload\"& $files[1] + 61 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image062.jpg", "C:\temp\Image_Upload\"& $files[1] + 62 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image063.jpg", "C:\temp\Image_Upload\"& $files[1] + 63 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image064.jpg", "C:\temp\Image_Upload\"& $files[1] + 64 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image065.jpg", "C:\temp\Image_Upload\"& $files[1] + 65 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image066.jpg", "C:\temp\Image_Upload\"& $files[1] + 66 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image067.jpg", "C:\temp\Image_Upload\"& $files[1] + 67 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image068.jpg", "C:\temp\Image_Upload\"& $files[1] + 68 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image069.jpg", "C:\temp\Image_Upload\"& $files[1] + 69 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image070.jpg", "C:\temp\Image_Upload\"& $files[1] + 70 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image071.jpg", "C:\temp\Image_Upload\"& $files[1] + 71 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image072.jpg", "C:\temp\Image_Upload\"& $files[1] + 72 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image073.jpg", "C:\temp\Image_Upload\"& $files[1] + 73 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image074.jpg", "C:\temp\Image_Upload\"& $files[1] + 74 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image075.jpg", "C:\temp\Image_Upload\"& $files[1] + 75 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image076.jpg", "C:\temp\Image_Upload\"& $files[1] + 76 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image077.jpg", "C:\temp\Image_Upload\"& $files[1] + 77 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image078.jpg", "C:\temp\Image_Upload\"& $files[1] + 78 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image079.jpg", "C:\temp\Image_Upload\"& $files[1] + 79 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image080.jpg", "C:\temp\Image_Upload\"& $files[1] + 80 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image081.jpg", "C:\temp\Image_Upload\"& $files[1] + 81 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image082.jpg", "C:\temp\Image_Upload\"& $files[1] + 82 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image083.jpg", "C:\temp\Image_Upload\"& $files[1] + 83 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image084.jpg", "C:\temp\Image_Upload\"& $files[1] + 84 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image085.jpg", "C:\temp\Image_Upload\"& $files[1] + 85 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image086.jpg", "C:\temp\Image_Upload\"& $files[1] + 86 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image087.jpg", "C:\temp\Image_Upload\"& $files[1] + 87 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image088.jpg", "C:\temp\Image_Upload\"& $files[1] + 88 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image089.jpg", "C:\temp\Image_Upload\"& $files[1] + 89 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image090.jpg", "C:\temp\Image_Upload\"& $files[1] + 90 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image091.jpg", "C:\temp\Image_Upload\"& $files[1] + 91 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image092.jpg", "C:\temp\Image_Upload\"& $files[1] + 92 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image093.jpg", "C:\temp\Image_Upload\"& $files[1] + 93 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image094.jpg", "C:\temp\Image_Upload\"& $files[1] + 94 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image095.jpg", "C:\temp\Image_Upload\"& $files[1] + 95 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image096.jpg", "C:\temp\Image_Upload\"& $files[1] + 96 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image097.jpg", "C:\temp\Image_Upload\"& $files[1] + 97 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image098.jpg", "C:\temp\Image_Upload\"& $files[1] + 98 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image099.jpg", "C:\temp\Image_Upload\"& $files[1] + 99 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image100.jpg", "C:\temp\Image_Upload\"& $files[1] + 100 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image101.jpg", "C:\temp\Image_Upload\"& $files[1] + 101 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image102.jpg", "C:\temp\Image_Upload\"& $files[1] + 102 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image103.jpg", "C:\temp\Image_Upload\"& $files[1] + 103 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image104.jpg", "C:\temp\Image_Upload\"& $files[1] + 104 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image105.jpg", "C:\temp\Image_Upload\"& $files[1] + 105 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image106.jpg", "C:\temp\Image_Upload\"& $files[1] + 106 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	FileCopy("C:\temp\"& $aFileList[$i] &"\image107.jpg", "C:\temp\Image_Upload\"& $files[1] + 107 &".jpg", $FC_OVERWRITE + $FC_CREATEPATH)
	EndIf
 Next

 EndFunc





;---------------- Delete alll others -----------------------------------------------------------------------------
Func Deletewastefolders()
;Create HTML folder and move
	Local $sFldrre4 = "C:\temp\Html_Files\"
    DirCreate($sFldrre4)
	FileMove("C:\temp\" & "*.html", $sFldrre4 , $FC_OVERWRITE + $FC_CREATEPATH)

;Delete unwanted
	Local $aFileList = _FileListToArray("C:\temp\", "*", $FLTA_FOLDERS)
	For $vElement in $aFileList
	If StringInStr($vElement, "Image_Upload") or StringInStr($vElement, "Html_Files") Then
	Else
	DirRemove("C:\temp\"& $vElement &"\", 1)
	EndIf
   Next
EndFunc






 ;---------------- Clear VBS, CREATE EXTRACT -------------------------------------
 Func ConvertHTMtotxt()
 FileDelete("C:\temp\Html_Files\*.vbs")
$file = FileOpen("C:\temp\Html_Files\vbscriptau3.vbs", 2)
FileWrite($file, 'Option Explicit'  & @CRLF & 'Dim totalfilename , objStartFolder , objFSO , objFolder ,colFiles, objFile'  & @CRLF & 'Set objFSO = CreateObject("Scripting.FileSystemObject")'  & @CRLF & 'objStartFolder = "C:\temp\Html_Files"'  & @CRLF & 'Set objFolder = objFSO.GetFolder(objStartFolder)'  & @CRLF & 'Set colFiles = objFolder.Files'  & @CRLF & 'For Each objFile in colFiles'  & @CRLF & 'totalfilename = "C:\temp\Html_Files\" & objFile.Name'  & @CRLF & 'If instr(totalfilename , ".html") > 0 Then'  & @CRLF & 'Doc2HTML totalfilename'  & @CRLF & 'End If'  & @CRLF & 'Next'  & @CRLF & 'Sub Doc2HTML(myFile)'  & @CRLF & 'Dim objDoc, objFile, objFSO, objWord, StrFile, strHTML'  & @CRLF & 'Const wdFormatHTML = 2'  & @CRLF & 'Set objFSO = CreateObject("Scripting.FileSystemObject")'  & @CRLF & 'Set objWord = CreateObject("Word.Application")'  & @CRLF & 'With objWord'  & @CRLF & '.Visible = False'  & @CRLF & 'If objFSO.FileExists(myFile) Then'  & @CRLF & 'Set objFile = objFSO.GetFile(myFile)'  & @CRLF & 'StrFile = objFile.Path'  & @CRLF & 'Else'  & @CRLF & 'WScript.Echo "FILE OPEN ERROR: The file does not exist" & vbCrLf'  & @CRLF & '.Quit'  & @CRLF & 'Exit Sub'  & @CRLF & 'End If'  & @CRLF & 'strHTML = objFSO.BuildPath(objFile.ParentFolder, _'  & @CRLF & 'objFSO.GetBaseName(objFile) & ".txt")'  & @CRLF & '.Documents.Open StrFile'  & @CRLF & 'Set objDoc = .ActiveDocument'  & @CRLF & 'objDoc.SaveAs strHTML, wdFormatHTML'  & @CRLF & 'objDoc.Close'  & @CRLF & '.Quit'  & @CRLF & 'End With'  & @CRLF & 'End Sub')
FileClose($file)
runWait(@comSpec & ' /c cscript.exe "C:\temp\Html_Files\vbscriptau3.vbs"', '', @SW_HIDE)
FileDelete("C:\temp\Html_Files\*.vbs")
FileDelete("C:\temp\Html_Files\*.html")
 EndFunc






 ;---------------- Create a single Text files -------------------------------------
 Func Convertsingleetxt()
$CMD = "type C:\temp\Html_Files\*.txt > C:\temp\Steps.txt"
RunWait(@ComSpec & " /c " & $CMD, @WindowsDir, @SW_HIDE)
DirRemove("C:\temp\Html_Files" , 1)
 EndFunc






 ;---------------- Create Perfect Text File -------------------------------------
 Func createperfecttext()
$file = FileOpen("C:\temp\Steps.txt", 0)
$outfile = FileOpen("C:\temp\Stepsa.txt", 1)

; Read in lines of text until the EOF is reached
While 1
    $line = FileReadLine($file)
    If @error = -1 Then ExitLoop
    If StringInStr($line, ': (') = 0  Then ContinueLoop
    FileWriteLine($outfile, $line)
Wend

FileClose($file)
FileClose($outfile)

FileDelete("C:\temp\Steps.txt")

 EndFunc




















;---------------- Main Macro 3 -----------------------------------------------------------------------------
Func ExtractMacrores()

; Adding the progress bar
$ShowPRogress = GUICtrlCreateProgress(138, 122, 140, 12, $PBS_MARQUEE)
$ShowPRogress2 = _SendMessage(GUICtrlGetHandle(-1), $PBM_SETMARQUEE, True, 50)

	Create_InitialFile()



; Disabling the status Bar
$ShowPRogress2 = _SendMessage(GUICtrlGetHandle(-1), $PBM_SETMARQUEE, False , 50)
$Label22 = GUICtrlCreateLabel("                      ", 138, 122, 140, 12)
GUICtrlSetFont(-1, 12, 400, 0, "Corbel")
GUICtrlSetColor(-1, 0xFFFFFF)


While 1
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $Button3
			Exit
		Case $nMsg = $START
			Maincoursemacro()
		Case $nMsg = $Button1
			Exitcoursemacro()
	EndSelect
WEnd

EndFunc
 ;----------------------------------------------------------------------------------------------------------



;This FUnction creates initial named ntext file which contains process name etc.
Func Create_InitialFile()

Local $iDelete = FileDelete("C:\temp\Initialdata.txt")

    Local $sAnswer = InputBox("Process Name", "Enter Your Process Name?", "Process Name")

    Local $sPasswd = InputBox("Sub-Process Name", "Enter Your Sub-Process Name?.", "Sub-Process Name")

    ; Create a constant variable in Local scope of the message to display in FileSelectFolder.
    Local Const $sMessagea = "Select a folder to save the simulator"

    ; Display an open dialog to select a file.
    Local $sFileSelectFolder = FileSelectFolder($sMessagea, "")

    Local $username = @UserName & ""

    Local $ippotime = _NowDate() & " - " & _NowTime() & ""

FileDelete("C:\temp\Initialdata.txt")
$file = FileOpen("C:\temp\Initialdata.txt", 2)
FileWrite($file, $sAnswer  & @CRLF & $sPasswd  & @CRLF & $username  & @CRLF & $ippotime & @CRLF & $sAnswer & $sPasswd & _NowTime() & @CRLF &  $sFileSelectFolder)
FileClose($file)



;Create VBSCript save PPT in new Path and exit

FileDelete("C:\temp\*.vbs")
$file = FileOpen("C:\temp\vbscriptau3.vbs", 2)
FileWrite($file, 'Dim fileNameString' & @CRLF & 'Set oApp = CreateObject("Powerpoint.Application")' & @CRLF & 'Set oPres = oApp.Presentations.Open("' & @ScriptDir & "\" & "PPT_Template.pptm" & '")' & @CRLF & 'Set oSlide = oPres.Slides(1).Duplicate' & @CRLF & 'oApp.Run "Mainmacro"' & @CRLF & 'oPres.Close')
FileClose($file)
runWait(@comSpec & ' /c cscript.exe "C:\temp\vbscriptau3.vbs"', '', @SW_HIDE)
FileDelete("C:\temp\*.vbs")

ProcessClose("POWERPNT.EXE")

Run("Explorer.exe " & $sFileSelectFolder)

EndFunc


