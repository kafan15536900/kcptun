#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=kcptun.ico
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=KcptunLoader
#AutoIt3Wrapper_Res_Fileversion=0.0.1.4
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****

Opt("TrayMenuMode", 3) 

Run(@ComSpec & ' /c .\client_windows_amd64.exe -l :[PORT] -r [IP]:[PORT] -key [PWD] -mtu 1400 -sndwnd 256 -rcvwnd 2048 -mode fast2 -dscp 46 > .\kcptun.log 2>&1',"",@SW_HIDE)

Local $aboutitem    = TrayCreateItem("关于")
TrayCreateItem("")
Local $exititem = TrayCreateItem("退出")

TraySetState()
TraySetToolTip("KcptunLoader")
While 1
    Local $msg = TrayGetMsg()
    Select
        Case $msg = 0
            ContinueLoop
        Case $msg = $aboutitem
			If ProcessExists ("client_windows_amd64.exe") Then
				MsgBox(64, "Kcptun:", "Running.")
			Else
				MsgBox(64, "Kcptun:", "Stoped.")
			EndIf
        Case $msg = $exititem
            ExitLoop
    EndSelect
WEnd
ProcessClose ("client_windows_amd64.exe")
Exit
