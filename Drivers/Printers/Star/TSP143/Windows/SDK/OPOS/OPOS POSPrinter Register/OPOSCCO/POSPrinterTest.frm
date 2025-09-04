VERSION 5.00
Object = "{CCB90150-B81E-11D2-AB74-0040054C3719}#1.0#0"; "OPOSPOSPrinter.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  '固定(実線)
   Caption         =   "OPOS POSPrinterTest"
   ClientHeight    =   8460
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3705
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8460
   ScaleWidth      =   3705
   StartUpPosition =   2  '画面の中央
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   200
      Style           =   2  'ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ ﾘｽﾄ
      TabIndex        =   1
      Top             =   400
      Width           =   3300
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'なし
      Height          =   3950
      Left            =   100
      TabIndex        =   2
      Top             =   800
      Width           =   3500
      Begin VB.CommandButton Command1 
         Caption         =   "Open"
         Height          =   250
         Left            =   100
         TabIndex        =   3
         Top             =   100
         Width           =   3300
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Claim (0)"
         Height          =   250
         Left            =   100
         TabIndex        =   4
         Top             =   450
         Width           =   3300
      End
      Begin VB.CommandButton Command3 
         Caption         =   "DeviceEnabled (True)"
         Height          =   250
         Left            =   100
         TabIndex        =   5
         Top             =   800
         Width           =   3300
      End
      Begin VB.CommandButton Command4 
         Caption         =   "OPOS Properties Print"
         Height          =   250
         Left            =   100
         TabIndex        =   6
         Top             =   1150
         Width           =   3300
      End
      Begin VB.CommandButton Command5 
         Caption         =   "OPOS CharacterSet Print"
         Height          =   250
         Left            =   100
         TabIndex        =   7
         Top             =   1500
         Width           =   3300
      End
      Begin VB.CommandButton Command6 
         Caption         =   "OPOS Methods Print"
         Height          =   250
         Left            =   100
         TabIndex        =   8
         Top             =   1850
         Width           =   3300
      End
      Begin VB.CommandButton Command7 
         Caption         =   "OPOS ESC Sequences Print"
         Height          =   250
         Left            =   100
         TabIndex        =   9
         Top             =   2200
         Width           =   3300
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Sample Print"
         Height          =   250
         Left            =   100
         TabIndex        =   10
         Top             =   2550
         Width           =   3300
      End
      Begin VB.CommandButton Command9 
         Caption         =   "DeviceEnabled (False)"
         Height          =   250
         Left            =   100
         TabIndex        =   11
         Top             =   2900
         Width           =   3300
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Release"
         Height          =   250
         Left            =   100
         TabIndex        =   12
         Top             =   3250
         Width           =   3300
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Close"
         Height          =   250
         Left            =   100
         TabIndex        =   13
         Top             =   3600
         Width           =   3300
      End
   End
   Begin VB.TextBox Text1 
      Height          =   885
      Left            =   200
      MultiLine       =   -1  'True
      ScrollBars      =   3  '両方
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   4850
      Width           =   3300
   End
   Begin VB.Frame Frame2 
      BorderStyle     =   0  'なし
      Height          =   1900
      Left            =   100
      TabIndex        =   15
      Top             =   5850
      Width           =   1700
      Begin VB.CheckBox Check1 
         Caption         =   "CoverOpen"
         DragMode        =   1  '自動
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   100
         Width           =   1500
      End
      Begin VB.CheckBox Check2 
         Caption         =   "JrnEmpty"
         DragMode        =   1  '自動
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   17
         TabStop         =   0   'False
         Top             =   450
         Width           =   1500
      End
      Begin VB.CheckBox Check3 
         Caption         =   "RecEmpty"
         DragMode        =   1  '自動
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   800
         Width           =   1500
      End
      Begin VB.CheckBox Check4 
         Caption         =   "SlpEmpty"
         DragMode        =   1  '自動
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   19
         TabStop         =   0   'False
         Top             =   1150
         Width           =   1500
      End
      Begin VB.CheckBox Check5 
         Caption         =   "FlagWhenIdle"
         DragMode        =   1  '自動
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   1500
         Width           =   1500
      End
   End
   Begin VB.Frame Frame3 
      BorderStyle     =   0  'なし
      Height          =   1900
      Left            =   1900
      TabIndex        =   21
      Top             =   5850
      Width           =   1700
      Begin VB.OptionButton Option1 
         Caption         =   "Journal"
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   22
         Top             =   450
         Width           =   1500
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Receipt"
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   23
         Top             =   800
         Width           =   1500
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Slip"
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   24
         Top             =   1150
         Width           =   1500
      End
   End
   Begin VB.Frame Frame4 
      BorderStyle     =   0  'なし
      Height          =   500
      Left            =   100
      TabIndex        =   25
      Top             =   7845
      Width           =   3500
      Begin VB.CommandButton Command12 
         Caption         =   "&Exit"
         Height          =   250
         Left            =   1800
         TabIndex        =   26
         Top             =   100
         Width           =   1600
      End
   End
   Begin OposPOSPrinter_CCOCtl.OPOSPOSPrinter OPOSPOSPrinter1 
      Left            =   3000
      OleObjectBlob   =   "POSPrinterTest.frx":0000
      Top             =   5520
   End
   Begin VB.Label Label1 
      Caption         =   "POSPrinter Select"
      Height          =   255
      Left            =   200
      TabIndex        =   0
      Top             =   100
      Width           =   3300
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub OPOSPOSPrinter1_ErrorEvent(ByVal ResultCode As Long, ByVal ResultCodeExtended As Long, ByVal ErrorLocus As Long, pErrorResponse As Long)
    Dim Message As String
    
    Select Case ResultCode
        Case OPOS_E_EXTENDED
            Select Case ResultCodeExtended
                Case OPOS_EPTR_COVER_OPEN: Message = "ResultCode : OPOS_EPTR_COVER_OPEN"
                Case OPOS_EPTR_JRN_EMPTY:  Message = "ResultCode : OPOS_EPTR_JRN_EMPTY"
                Case OPOS_EPTR_REC_EMPTY:  Message = "ResultCode : OPOS_EPTR_REC_EMPTY"
                Case OPOS_EPTR_SLP_EMPTY:  Message = "ResultCode : OPOS_EPTR_SLP_EMPTY"
                Case Else:                 Message = "ResultCode : Error !?"
            End Select
        Case OPOS_E_TIMEOUT
            Message = "ResultCode : OPOS_E_TIMEOUT"
        Case OPOS_E_NOHARDWARE
            Message = "ResultCode : OPOS_E_NOHARDWARE"
        Case OPOS_E_OFFLINE
            Message = "ResultCode : OPOS_E_OFFLINE"
        Case Else
            Message = "ResultCode : Error !?"
    End Select
    
    If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
        pErrorResponse = OPOS_ER_CLEAR
    End If
End Sub

Private Sub OPOSPOSPrinter1_StatusUpdateEvent(ByVal Status As Long)
    Select Case Status
        Case OPOS_SUE_POWER_ONLINE:      Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_ONLINE" + vbNewLine
        Case OPOS_SUE_POWER_OFF:         Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_OFF" + vbNewLine
        Case OPOS_SUE_POWER_OFFLINE:     Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_OFFLINE" + vbNewLine
        Case OPOS_SUE_POWER_OFF_OFFLINE: Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_OFF_OFFLINE" + vbNewLine
        Case PTR_SUE_COVER_OPEN:         Text1.Text = Text1.Text + "Event : PTR_SUE_COVER_OPEN" + vbNewLine
        Case PTR_SUE_COVER_OK:           Text1.Text = Text1.Text + "Event : PTR_SUE_COVER_OK" + vbNewLine
        Case PTR_SUE_JRN_EMPTY:          Text1.Text = Text1.Text + "Event : PTR_SUE_JRN_EMPTY" + vbNewLine
        Case PTR_SUE_JRN_NEAREMPTY:      Text1.Text = Text1.Text + "Event : PTR_SUE_JRN_NEAREMPTY" + vbNewLine
        Case PTR_SUE_JRN_PAPEROK:        Text1.Text = Text1.Text + "Event : PTR_SUE_JRN_PAPEROK" + vbNewLine
        Case PTR_SUE_REC_EMPTY:          Text1.Text = Text1.Text + "Event : PTR_SUE_REC_EMPTY" + vbNewLine
        Case PTR_SUE_REC_NEAREMPTY:      Text1.Text = Text1.Text + "Event : PTR_SUE_REC_NEAREMPTY" + vbNewLine
        Case PTR_SUE_REC_PAPEROK:        Text1.Text = Text1.Text + "Event : PTR_SUE_REC_PAPEROK" + vbNewLine
        Case PTR_SUE_SLP_EMPTY:          Text1.Text = Text1.Text + "Event : PTR_SUE_SLP_EMPTY" + vbNewLine
        Case PTR_SUE_SLP_NEAREMPTY:      Text1.Text = Text1.Text + "Event : PTR_SUE_SLP_NEAREMPTY" + vbNewLine
        Case PTR_SUE_SLP_PAPEROK:        Text1.Text = Text1.Text + "Event : PTR_SUE_SLP_PAPEROK" + vbNewLine
        Case PTR_SUE_IDLE:               Text1.Text = Text1.Text + "Event : PTR_SUE_IDLE" + vbNewLine
        Case Else:                       Text1.Text = Text1.Text + "Event : Status Error !?" + vbNewLine
    End Select

    Select Case Status
        Case PTR_SUE_COVER_OPEN:    Check1.Value = 1
        Case PTR_SUE_COVER_OK:      Check1.Value = 0
        Case PTR_SUE_JRN_EMPTY:     Check2.Value = 1: Check2.Caption = "JrnEmpty"
        Case PTR_SUE_JRN_NEAREMPTY: Check2.Value = 1: Check2.Caption = "JrnSlpNearEnd"
        Case PTR_SUE_JRN_PAPEROK:   Check2.Value = 0: Check2.Caption = "JrnEmpty"
        Case PTR_SUE_REC_EMPTY:     Check3.Value = 1: Check3.Caption = "RecEmpty"
        Case PTR_SUE_REC_NEAREMPTY: Check3.Value = 1: Check3.Caption = "RecNearEnd"
        Case PTR_SUE_REC_PAPEROK:   Check3.Value = 0: Check3.Caption = "RecEmpty"
        Case PTR_SUE_SLP_EMPTY:     Check4.Value = 1: Check4.Caption = "SlpEmpty"
        Case PTR_SUE_SLP_NEAREMPTY: Check4.Value = 1: Check4.Caption = "SlpNearEnd"
        Case PTR_SUE_SLP_PAPEROK:   Check4.Value = 0: Check4.Caption = "SlpEmpty"
        Case PTR_SUE_IDLE:          Check5.Value = 1
    End Select
End Sub

Private Sub Form_Load()
    Dim FT As FILETIME
    Dim KeyHandle As Long
    Dim Res As Long
    Dim Index As Long
    Dim KeyName As String
    Dim ClassName As String
    Dim KeyLen As Long
    Dim ClassLen As Long
    
    Res = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\OLEforRetail\ServiceOPOS\POSPrinter", 0, KEY_READ, KeyHandle)
    
    If Res <> ERROR_SUCCESS Then
        MsgBox ("Problem with the Windows Registry" & vbNewLine & "Unable to open key")
        Exit Sub
    End If
    
    Do
        KeyLen = 64
        ClassLen = 64
        KeyName = String$(KeyLen, 0)
        ClassName = String$(ClassLen, 0)
        Res = RegEnumKeyEx(KeyHandle, Index, KeyName, KeyLen, 0, ClassName, ClassLen, FT)
        Index = Index + 1
        
        If Res = ERROR_SUCCESS Then
            Combo1.AddItem (Left$(KeyName, KeyLen))
            
            If Combo1.Text = "" Then Combo1.Text = Left$(KeyName, KeyLen)
        End If
    Loop While Res = ERROR_SUCCESS
    
    Call RegCloseKey(KeyHandle)
End Sub

Private Sub Form_Unload(Cancel As Integer)
'   While Not (OPOSPOSPrinter1.State = OPOS_S_CLOSED Or OPOSPOSPrinter1.State = OPOS_S_IDLE)
'       DoEvents
'   Wend
    
    End
End Sub

Private Sub Command1_Click()
    ViewResultCode (OPOSPOSPrinter1.Open(Combo1.Text))
    
    If OPOSPOSPrinter1.CapSlpPresent = True Then Option3.Enabled = True: Option3.Value = True
    If OPOSPOSPrinter1.CapRecPresent = True Then Option2.Enabled = True: Option2.Value = True
    If OPOSPOSPrinter1.CapJrnPresent = True Then Option1.Enabled = True: Option1.Value = True
End Sub

Private Sub Command2_Click()
    ViewResultCode (OPOSPOSPrinter1.ClaimDevice(0))
End Sub

Private Sub Command3_Click()
    OPOSPOSPrinter1.PowerNotify = OPOS_PN_ENABLED
    
    OPOSPOSPrinter1.DeviceEnabled = True
    
    ViewResultCode (OPOSPOSPrinter1.ResultCode)
    
    If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
        If OPOSPOSPrinter1.CapCoverSensor = True Then Check1.Enabled = True
        If OPOSPOSPrinter1.CapJrnEmptySensor = True Then Check2.Enabled = True
        If OPOSPOSPrinter1.CapRecEmptySensor = True Then Check3.Enabled = True
        If OPOSPOSPrinter1.CapSlpEmptySensor = True Then Check4.Enabled = True
        
        If OPOSPOSPrinter1.CoverOpen = True Then
            Check1.Value = 1
        Else
            Check1.Value = 0
        End If
        
        If OPOSPOSPrinter1.JrnEmpty = True Then
            Check2.Value = 1
            Check2.Caption = "JrnEmpty"
        ElseIf OPOSPOSPrinter1.JrnNearEnd = True Then
            Check2.Value = 1
            Check2.Caption = "JrnNearEnd"
        Else
            Check2.Value = 0
            Check2.Caption = "JrnEmpty"
        End If
        
        If OPOSPOSPrinter1.RecEmpty = True Then
            Check3.Value = 1
            Check3.Caption = "RecEmpty"
        ElseIf OPOSPOSPrinter1.RecNearEnd = True Then
            Check3.Value = 1
            Check3.Caption = "RecNearEnd"
        Else
            Check3.Value = 0
            Check3.Caption = "RecEmpty"
        End If
        
        If OPOSPOSPrinter1.SlpEmpty = True Then
            Check4.Value = 1
            Check4.Caption = "SlpEmpty"
        ElseIf OPOSPOSPrinter1.SlpNearEnd = True Then
            Check4.Value = 1
            Check4.Caption = "SlpNearEnd"
        Else
            Check4.Value = 0
            Check4.Caption = "SlpEmpty"
        End If
        
        Check5.Enabled = True
        Check5.Value = 0
        
        OPOSPOSPrinter1.FlagWhenIdle = True
    End If
End Sub

Private Sub Command4_Click()
    Dim Message As String
    Dim Station As Long
    Dim i As Long
    
    While OPOSPOSPrinter1.State <> OPOS_S_IDLE
        Select Case OPOSPOSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & OPOSPOSPrinter1.State & ")"
        End Select
        
        If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then Exit Sub
    Wend
    
    If Option1.Value = True Then
        Station = PTR_S_JOURNAL
    ElseIf Option2.Value = True Then
        Station = PTR_S_RECEIPT
    ElseIf Option3.Value = True Then
        Station = PTR_S_SLIP
    Else
        Exit Sub
    End If
    
    ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    Select Case OPOSPOSPrinter1.BinaryConversion
        Case OPOS_BC_NONE:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "BinaryConversion         = OPOS_BC_NONE" & vbNewLine))
        Case OPOS_BC_NIBBLE:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "BinaryConversion         = OPOS_BC_NIBBLE" & vbNewLine))
        Case OPOS_BC_DECIMAL: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "BinaryConversion         = OPOS_BC_DECIMAL" & vbNewLine))
        Case Else:            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "BinaryConversion         = Error !?" & OPOSPOSPrinter1.BinaryConversion & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.CapPowerReporting
        Case OPOS_PR_NONE:     ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapPowerReporting        = OPOS_PR_NONE" & vbNewLine))
        Case OPOS_PR_STANDARD: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapPowerReporting        = OPOS_PR_STANDARD" & vbNewLine))
        Case OPOS_PR_ADVANCED: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapPowerReporting        = OPOS_PR_ADVANCED" & vbNewLine))
        Case Else:             ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapPowerReporting        = Error !? (" & OPOSPOSPrinter1.CapPowerReporting & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapStatisticsReporting   = " & OPOSPOSPrinter1.CapStatisticsReporting & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapUpdateStatistics      = " & OPOSPOSPrinter1.CapUpdateStatistics & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CheckHealthText          = " & OPOSPOSPrinter1.CheckHealthText & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Claimed                  = " & OPOSPOSPrinter1.Claimed & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "DeviceEnabled            = " & OPOSPOSPrinter1.DeviceEnabled & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "FreezeEvents             = " & OPOSPOSPrinter1.FreezeEvents & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "OpenResult               = " & OPOSPOSPrinter1.OpenResult & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "OutputID                 = " & OPOSPOSPrinter1.OutputID & vbNewLine))
    
    Select Case OPOSPOSPrinter1.PowerNotify
        Case OPOS_PN_DISABLED: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerNotify              = OPOS_PN_DISABLED" & vbNewLine))
        Case OPOS_PN_ENABLED:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerNotify              = OPOS_PN_ENABLED" & vbNewLine))
        Case Else:             ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerNotify              = Error !? (" & OPOSPOSPrinter1.PowerNotify & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.PowerState
        Case OPOS_PS_UNKNOWN:     ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_UNKNOWN" & vbNewLine))
        Case OPOS_PS_ONLINE:      ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_ONLINE" & vbNewLine))
        Case OPOS_PS_OFF:         ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_OFF" & vbNewLine))
        Case OPOS_PS_OFFLINE:     ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_OFFLINE" & vbNewLine))
        Case OPOS_PS_OFF_OFFLINE: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_OFF_OFFLINE" & vbNewLine))
        Case Else:                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PowerState               = Error !? (" & OPOSPOSPrinter1.PowerState & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.ResultCode
        Case OPOS_SUCCESS:      ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_SUCCESS" & vbNewLine))
        Case OPOS_E_CLOSED:     ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_CLOSED" & vbNewLine))
        Case OPOS_E_CLAIMED:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_CLAIMED" & vbNewLine))
        Case OPOS_E_NOTCLAIMED: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOTCLAIMED" & vbNewLine))
        Case OPOS_E_NOSERVICE:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOSERVICE" & vbNewLine))
        Case OPOS_E_DISABLED:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_DISABLED" & vbNewLine))
        Case OPOS_E_ILLEGAL:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_ILLEGAL" & vbNewLine))
        Case OPOS_E_NOHARDWARE: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOHARDWARE" & vbNewLine))
        Case OPOS_E_OFFLINE:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_OFFLINE" & vbNewLine))
        Case OPOS_E_NOEXIST:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOEXIST" & vbNewLine))
        Case OPOS_E_EXISTS:     ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_EXISTS" & vbNewLine))
        Case OPOS_E_FAILURE:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_FAILURE" & vbNewLine))
        Case OPOS_E_TIMEOUT:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_TIMEOUT" & vbNewLine))
        Case OPOS_E_BUSY:       ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_BUSY" & vbNewLine))
        Case OPOS_E_EXTENDED:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_EXTENDED" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCode               = Error !? (" & OPOSPOSPrinter1.ResultCode & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.ResultCodeExtended
        Case OPOS_EPTR_COVER_OPEN: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_COVER_OPEN" & vbNewLine))
        Case OPOS_EPTR_JRN_EMPTY:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_JRN_EMPTY" & vbNewLine))
        Case OPOS_EPTR_REC_EMPTY:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_REC_EMPTY" & vbNewLine))
        Case OPOS_EPTR_SLP_EMPTY:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_SLP_EMPTY" & vbNewLine))
        Case Else:                 ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ResultCodeExtended       = Error !? (" & OPOSPOSPrinter1.ResultCodeExtended & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.State
        Case OPOS_S_CLOSED: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "State                    = OPOS_S_CLOSED" & vbNewLine))
        Case OPOS_S_IDLE:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "State                    = OPOS_S_IDLE" & vbNewLine))
        Case OPOS_S_BUSY:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "State                    = OPOS_S_BUSY" & vbNewLine))
        Case OPOS_S_ERROR:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "State                    = OPOS_S_ERROR" & vbNewLine))
        Case Else:          ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "State                    = Error !? (" & OPOSPOSPrinter1.State & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ControlObjectDescription = " & OPOSPOSPrinter1.ControlObjectDescription & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ControlObjectVersion     = " & OPOSPOSPrinter1.ControlObjectVersion & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ServiceObjectDescription = " & OPOSPOSPrinter1.ServiceObjectDescription & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ServiceObjectVersion     = " & OPOSPOSPrinter1.ServiceObjectVersion & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "DeviceDescription        = " & OPOSPOSPrinter1.DeviceDescription & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "DeviceName               = " & OPOSPOSPrinter1.DeviceName & vbNewLine))
    
    Select Case OPOSPOSPrinter1.CapCharacterSet
        Case PTR_CCS_ALPHA:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_ALPHA" & vbNewLine))
        Case PTR_CCS_ASCII:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_ASCII" & vbNewLine))
        Case PTR_CCS_KANA:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_KANA" & vbNewLine))
        Case PTR_CCS_KANJI:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_KANJI" & vbNewLine))
        Case PTR_CCS_UNICODE: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_UNICODE" & vbNewLine))
        Case Else:            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCharacterSet          = Error !? (" & OPOSPOSPrinter1.CapCharacterSet & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapConcurrentJrnRec      = " & OPOSPOSPrinter1.CapConcurrentJrnRec & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapConcurrentJrnSlp      = " & OPOSPOSPrinter1.CapConcurrentJrnSlp & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapConcurrentRecSlp      = " & OPOSPOSPrinter1.CapConcurrentRecSlp & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapCoverSensor           = " & OPOSPOSPrinter1.CapCoverSensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapMapCharacterSet       = " & OPOSPOSPrinter1.CapMapCharacterSet & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapTransaction           = " & OPOSPOSPrinter1.CapTransaction & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnPresent            = " & OPOSPOSPrinter1.CapJrnPresent & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrn2Color             = " & OPOSPOSPrinter1.CapJrn2Color & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnBold               = " & OPOSPOSPrinter1.CapJrnBold & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnDhigh              = " & OPOSPOSPrinter1.CapJrnDhigh & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnDwide              = " & OPOSPOSPrinter1.CapJrnDwide & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnDwideDhigh         = " & OPOSPOSPrinter1.CapJrnDwideDhigh & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnEmptySensor        = " & OPOSPOSPrinter1.CapJrnEmptySensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnItalic             = " & OPOSPOSPrinter1.CapJrnItalic & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnNearEndSensor      = " & OPOSPOSPrinter1.CapJrnNearEndSensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnUnderline          = " & OPOSPOSPrinter1.CapJrnUnderline & vbNewLine))
    
    If OPOSPOSPrinter1.CapJrnCartridgeSensor And (PTR_CART_REMOVED Or PTR_CART_EMPTY Or PTR_CART_NEAREND Or PTR_CART_CLEANING) Then
        If OPOSPOSPrinter1.CapJrnCartridgeSensor And PTR_CART_REMOVED Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_REMOVED" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnCartridgeSensor And PTR_CART_EMPTY Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_EMPTY" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnCartridgeSensor And PTR_CART_NEAREND Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_NEAREND" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnCartridgeSensor And PTR_CART_CLEANING Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_CLEANING" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = Error !? (" & OPOSPOSPrinter1.CapJrnCartridgeSensor & ")" & vbNewLine))
    End If
    
    If OPOSPOSPrinter1.CapJrnColor <> 0 Then
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_PRIMARY Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_PRIMARY" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM1 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM1" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM2 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM2" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM3 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM3" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM4 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM4" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM5 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM5" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM6 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM6" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_CYAN Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CYAN" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_MAGENTA Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_MAGENTA" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_YELLOW Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_YELLOW" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapJrnColor And PTR_COLOR_FULL Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_FULL" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapJrnColor              = 0" & vbNewLine))
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecPresent            = " & OPOSPOSPrinter1.CapRecPresent & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRec2Color             = " & OPOSPOSPrinter1.CapRec2Color & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecBarCode            = " & OPOSPOSPrinter1.CapRecBarCode & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecBitmap             = " & OPOSPOSPrinter1.CapRecBitmap & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecBold               = " & OPOSPOSPrinter1.CapRecBold & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecDhigh              = " & OPOSPOSPrinter1.CapRecDhigh & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecDwide              = " & OPOSPOSPrinter1.CapRecDwide & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecDwideDhigh         = " & OPOSPOSPrinter1.CapRecDwideDhigh & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecEmptySensor        = " & OPOSPOSPrinter1.CapRecEmptySensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecItalic             = " & OPOSPOSPrinter1.CapRecItalic & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecLeft90             = " & OPOSPOSPrinter1.CapRecLeft90 & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecNearEndSensor      = " & OPOSPOSPrinter1.CapRecNearEndSensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecPapercut           = " & OPOSPOSPrinter1.CapRecPapercut & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecRight90            = " & OPOSPOSPrinter1.CapRecRight90 & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecRotate180          = " & OPOSPOSPrinter1.CapRecRotate180 & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecStamp              = " & OPOSPOSPrinter1.CapRecStamp & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecUnderline          = " & OPOSPOSPrinter1.CapRecUnderline & vbNewLine))
    
    If OPOSPOSPrinter1.CapRecCartridgeSensor And (PTR_CART_REMOVED Or PTR_CART_EMPTY Or PTR_CART_NEAREND Or PTR_CART_CLEANING) Then
        If OPOSPOSPrinter1.CapRecCartridgeSensor And PTR_CART_REMOVED Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_REMOVED" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecCartridgeSensor And PTR_CART_EMPTY Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_EMPTY" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecCartridgeSensor And PTR_CART_NEAREND Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_NEAREND" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecCartridgeSensor And PTR_CART_CLEANING Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_CLEANING" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = Error !? (" & OPOSPOSPrinter1.CapRecCartridgeSensor & ")" & vbNewLine))
    End If
    
    If OPOSPOSPrinter1.CapRecColor <> 0 Then
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_PRIMARY Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_PRIMARY" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CUSTOM1 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM1" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CUSTOM2 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM2" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CUSTOM3 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM3" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CUSTOM4 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM4" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CUSTOM5 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM5" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CUSTOM6 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM6" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_CYAN Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CYAN" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_MAGENTA Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_MAGENTA" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_YELLOW Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_YELLOW" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecColor And PTR_COLOR_FULL Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_FULL" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecColor              = 0" & vbNewLine))
    End If
    
    If OPOSPOSPrinter1.CapRecMarkFeed <> 0 Then
        If OPOSPOSPrinter1.CapRecMarkFeed And PTR_MF_TO_TAKEUP Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_TAKEUP" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecMarkFeed And PTR_MF_TO_CUTTER Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_CUTTER" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecMarkFeed And PTR_MF_TO_CURRENT_TOF Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_CURRENT_TOF" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapRecMarkFeed And PTR_MF_TO_NEXT_TOF Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_NEXT_TOF" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = 0" & vbNewLine))
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpPresent            = " & OPOSPOSPrinter1.CapSlpPresent & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpFullslip           = " & OPOSPOSPrinter1.CapSlpFullslip & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlp2Color             = " & OPOSPOSPrinter1.CapSlp2Color & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpBarCode            = " & OPOSPOSPrinter1.CapSlpBarCode & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpBitmap             = " & OPOSPOSPrinter1.CapSlpBitmap & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpBold               = " & OPOSPOSPrinter1.CapSlpBold & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpDhigh              = " & OPOSPOSPrinter1.CapSlpDhigh & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpDwide              = " & OPOSPOSPrinter1.CapSlpDwide & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpDwideDhigh         = " & OPOSPOSPrinter1.CapSlpDwideDhigh & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpEmptySensor        = " & OPOSPOSPrinter1.CapSlpEmptySensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpItalic             = " & OPOSPOSPrinter1.CapSlpItalic & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpLeft90             = " & OPOSPOSPrinter1.CapSlpLeft90 & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpNearEndSensor      = " & OPOSPOSPrinter1.CapSlpNearEndSensor & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpRight90            = " & OPOSPOSPrinter1.CapSlpRight90 & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpRotate180          = " & OPOSPOSPrinter1.CapSlpRotate180 & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpUnderline          = " & OPOSPOSPrinter1.CapSlpUnderline & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpBothSidesPrint     = " & OPOSPOSPrinter1.CapSlpBothSidesPrint & vbNewLine))
    
    If OPOSPOSPrinter1.CapSlpCartridgeSensor And (PTR_CART_REMOVED Or PTR_CART_EMPTY Or PTR_CART_NEAREND Or PTR_CART_CLEANING) Then
        If OPOSPOSPrinter1.CapSlpCartridgeSensor And PTR_CART_REMOVED Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_REMOVED" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpCartridgeSensor And PTR_CART_EMPTY Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_EMPTY" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpCartridgeSensor And PTR_CART_NEAREND Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_NEAREND" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpCartridgeSensor And PTR_CART_CLEANING Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_CLEANING" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = Error !? (" & OPOSPOSPrinter1.CapSlpCartridgeSensor & ")" & vbNewLine))
    End If
    
    If OPOSPOSPrinter1.CapSlpColor <> 0 Then
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_PRIMARY Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_PRIMARY" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM1 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM1" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM2 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM2" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM3 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM3" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM4 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM4" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM5 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM5" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM6 Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM6" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_CYAN Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CYAN" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_MAGENTA Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_MAGENTA" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_YELLOW Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_YELLOW" & vbNewLine))
        End If
        
        If OPOSPOSPrinter1.CapSlpColor And PTR_COLOR_FULL Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_FULL" & vbNewLine))
        End If
    Else
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CapSlpColor              = 0" & vbNewLine))
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "AsyncMode                = " & OPOSPOSPrinter1.AsyncMode & vbNewLine))
    
    Select Case OPOSPOSPrinter1.CartridgeNotify
        Case PTR_CN_DISABLED: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CartridgeNotify          = PTR_CN_DISABLED" & vbNewLine))
        Case PTR_CN_ENABLED:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CartridgeNotify          = PTR_CN_ENABLED" & vbNewLine))
        Case Else:            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CartridgeNotify          = Error !? (" & OPOSPOSPrinter1.CartridgeNotify & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CharacterSet             = " & OPOSPOSPrinter1.CharacterSet & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CharacterSetList         = " & OPOSPOSPrinter1.CharacterSetList & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CoverOpen                = " & OPOSPOSPrinter1.CoverOpen & vbNewLine))
    
    Select Case OPOSPOSPrinter1.ErrorLevel
        Case PTR_EL_NONE:        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorLevel               = PTR_EL_NONE" & vbNewLine))
        Case PTR_EL_RECOVERABLE: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorLevel               = PTR_EL_RECOVERABLE" & vbNewLine))
        Case PTR_EL_FATAL:       ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorLevel               = PTR_EL_FATAL" & vbNewLine))
        Case Else:               ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorLevel               = Error !? (" & OPOSPOSPrinter1.ErrorLevel & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.ErrorStation
        Case PTR_S_JOURNAL:           ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_JOURNAL" & vbNewLine))
        Case PTR_S_RECEIPT:           ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_RECEIPT" & vbNewLine))
        Case PTR_S_SLIP:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_SLIP" & vbNewLine))
        Case PTR_S_JOURNAL_RECEIPT:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_JOURNAL_RECEIPT" & vbNewLine))
        Case PTR_S_JOURNAL_SLIP:      ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_JOURNAL_SLIP" & vbNewLine))
        Case PTR_S_RECEIPT_SLIP:      ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_RECEIPT_SLIP" & vbNewLine))
        Case PTR_TWO_RECEIPT_JOURNAL: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_TWO_RECEIPT_JOURNAL" & vbNewLine))
        Case PTR_TWO_SLIP_JOURNAL:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_TWO_SLIP_JOURNAL" & vbNewLine))
        Case PTR_TWO_SLIP_RECEIPT:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_TWO_SLIP_RECEIPT" & vbNewLine))
        Case Else:                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorStation             = Error !? (" & OPOSPOSPrinter1.ErrorStation & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ErrorString              = " & OPOSPOSPrinter1.ErrorString & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "FontTypefaceList         = " & OPOSPOSPrinter1.FontTypefaceList & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "FlagWhenIdle             = " & OPOSPOSPrinter1.FlagWhenIdle & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "MapCharacterSet          = " & OPOSPOSPrinter1.MapCharacterSet & vbNewLine))
    
    Select Case OPOSPOSPrinter1.MapMode
        Case PTR_MM_DOTS:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_DOTS" & vbNewLine))
        Case PTR_MM_TWIPS:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_TWIPS" & vbNewLine))
        Case PTR_MM_ENGLISH: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_ENGLISH" & vbNewLine))
        Case PTR_MM_METRIC:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_METRIC" & vbNewLine))
        Case Else:           ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "MapMode                  = Error !? (" & OPOSPOSPrinter1.MapMode & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.RotateSpecial
        Case PTR_RP_NORMAL:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_NORMAL" & vbNewLine))
        Case PTR_RP_RIGHT90:   ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_RIGHT90" & vbNewLine))
        Case PTR_RP_LEFT90:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_LEFT90" & vbNewLine))
        Case PTR_RP_ROTATE180: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_ROTATE180" & vbNewLine))
        Case Else:             ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RotateSpecial            = Error !? (" & OPOSPOSPrinter1.RotateSpecial & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLineChars             = " & OPOSPOSPrinter1.JrnLineChars & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLineCharsList         = " & OPOSPOSPrinter1.JrnLineCharsList & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLineHeight            = " & OPOSPOSPrinter1.JrnLineHeight & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLineSpacing           = " & OPOSPOSPrinter1.JrnLineSpacing & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLineWidth             = " & OPOSPOSPrinter1.JrnLineWidth & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLetterQuality         = " & OPOSPOSPrinter1.JrnLetterQuality & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnEmpty                 = " & OPOSPOSPrinter1.JrnEmpty & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnNearEnd               = " & OPOSPOSPrinter1.JrnNearEnd & vbNewLine))
    
    Select Case OPOSPOSPrinter1.JrnCartridgeState
        Case PTR_CART_UNKNOWN:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_UNKNOWN" & vbNewLine))
        Case PTR_CART_REMOVED:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_REMOVED" & vbNewLine))
        Case PTR_CART_EMPTY:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_EMPTY" & vbNewLine))
        Case PTR_CART_CLEANING: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_CLEANING" & vbNewLine))
        Case PTR_CART_NEAREND:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_NEAREND" & vbNewLine))
        Case PTR_CART_OK:       ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_OK" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCartridgeState        = Error !? (" & OPOSPOSPrinter1.JrnCartridgeState & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.JrnCurrentCartridge
        Case PTR_COLOR_PRIMARY: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_PRIMARY" & vbNewLine))
        Case PTR_COLOR_CUSTOM1: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM1" & vbNewLine))
        Case PTR_COLOR_CUSTOM2: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM2" & vbNewLine))
        Case PTR_COLOR_CUSTOM3: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM3" & vbNewLine))
        Case PTR_COLOR_CUSTOM4: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM4" & vbNewLine))
        Case PTR_COLOR_CUSTOM5: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM5" & vbNewLine))
        Case PTR_COLOR_CUSTOM6: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM6" & vbNewLine))
        Case PTR_COLOR_CYAN:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CYAN" & vbNewLine))
        Case PTR_COLOR_MAGENTA: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_MAGENTA" & vbNewLine))
        Case PTR_COLOR_YELLOW:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_YELLOW" & vbNewLine))
        Case PTR_COLOR_FULL:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_FULL" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = Error !? (" & OPOSPOSPrinter1.JrnCurrentCartridge & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLineChars             = " & OPOSPOSPrinter1.RecLineChars & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLineCharsList         = " & OPOSPOSPrinter1.RecLineCharsList & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLineHeight            = " & OPOSPOSPrinter1.RecLineHeight & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLineSpacing           = " & OPOSPOSPrinter1.RecLineSpacing & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLineWidth             = " & OPOSPOSPrinter1.RecLineWidth & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLetterQuality         = " & OPOSPOSPrinter1.RecLetterQuality & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecEmpty                 = " & OPOSPOSPrinter1.RecEmpty & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecNearEnd               = " & OPOSPOSPrinter1.RecNearEnd & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecSidewaysMaxLines      = " & OPOSPOSPrinter1.RecSidewaysMaxLines & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecSidewaysMaxChars      = " & OPOSPOSPrinter1.RecSidewaysMaxChars & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLinesToPaperCut       = " & OPOSPOSPrinter1.RecLinesToPaperCut & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecBarCodeRotationList   = " & OPOSPOSPrinter1.RecBarCodeRotationList & vbNewLine))
    
    Select Case OPOSPOSPrinter1.RecCartridgeState
        Case PTR_CART_UNKNOWN:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_UNKNOWN" & vbNewLine))
        Case PTR_CART_REMOVED:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_REMOVED" & vbNewLine))
        Case PTR_CART_EMPTY:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_EMPTY" & vbNewLine))
        Case PTR_CART_CLEANING: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_CLEANING" & vbNewLine))
        Case PTR_CART_NEAREND:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_NEAREND" & vbNewLine))
        Case PTR_CART_OK:       ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_OK" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCartridgeState        = Error !? (" & OPOSPOSPrinter1.RecCartridgeState & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.RecCurrentCartridge
        Case PTR_COLOR_PRIMARY: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_PRIMARY" & vbNewLine))
        Case PTR_COLOR_CUSTOM1: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM1" & vbNewLine))
        Case PTR_COLOR_CUSTOM2: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM2" & vbNewLine))
        Case PTR_COLOR_CUSTOM3: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM3" & vbNewLine))
        Case PTR_COLOR_CUSTOM4: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM4" & vbNewLine))
        Case PTR_COLOR_CUSTOM5: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM5" & vbNewLine))
        Case PTR_COLOR_CUSTOM6: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM6" & vbNewLine))
        Case PTR_COLOR_CYAN:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CYAN" & vbNewLine))
        Case PTR_COLOR_MAGENTA: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_MAGENTA" & vbNewLine))
        Case PTR_COLOR_YELLOW:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_YELLOW" & vbNewLine))
        Case PTR_COLOR_FULL:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_FULL" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = Error !? (" & OPOSPOSPrinter1.RecCurrentCartridge & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecBitmapRotationList    = " & OPOSPOSPrinter1.RecBitmapRotationList & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLineChars             = " & OPOSPOSPrinter1.SlpLineChars & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLineCharsList         = " & OPOSPOSPrinter1.SlpLineCharsList & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLineHeight            = " & OPOSPOSPrinter1.SlpLineHeight & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLineSpacing           = " & OPOSPOSPrinter1.SlpLineSpacing & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLineWidth             = " & OPOSPOSPrinter1.SlpLineWidth & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLetterQuality         = " & OPOSPOSPrinter1.SlpLetterQuality & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpEmpty                 = " & OPOSPOSPrinter1.SlpEmpty & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpNearEnd               = " & OPOSPOSPrinter1.SlpNearEnd & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpSidewaysMaxLines      = " & OPOSPOSPrinter1.SlpSidewaysMaxLines & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpSidewaysMaxChars      = " & OPOSPOSPrinter1.SlpSidewaysMaxChars & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpMaxLines              = " & OPOSPOSPrinter1.SlpMaxLines & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLinesNearEndToEnd     = " & OPOSPOSPrinter1.SlpLinesNearEndToEnd & vbNewLine))
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpBarCodeRotationList   = " & OPOSPOSPrinter1.SlpBarCodeRotationList & vbNewLine))
    
    Select Case OPOSPOSPrinter1.SlpPrintSide
        Case PTR_PS_UNKNOWN:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_UNKNOWN" & vbNewLine))
        Case PTR_PS_SIDE1:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_SIDE1" & vbNewLine))
        Case PTR_PS_SIDE2:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_SIDE2" & vbNewLine))
        Case PTR_PS_OPPOSITE: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_OPPOSITE" & vbNewLine))
        Case Else:            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpPrintSide             = Error !? (" & OPOSPOSPrinter1.SlpPrintSide & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.SlpCartridgeState
        Case PTR_CART_UNKNOWN:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_UNKNOWN" & vbNewLine))
        Case PTR_CART_REMOVED:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_REMOVED" & vbNewLine))
        Case PTR_CART_EMPTY:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_EMPTY" & vbNewLine))
        Case PTR_CART_CLEANING: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_CLEANING" & vbNewLine))
        Case PTR_CART_NEAREND:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_NEAREND" & vbNewLine))
        Case PTR_CART_OK:       ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_OK" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCartridgeState        = Error !? (" & OPOSPOSPrinter1.SlpCartridgeState & ")" & vbNewLine))
    End Select
    
    Select Case OPOSPOSPrinter1.SlpCurrentCartridge
        Case PTR_COLOR_PRIMARY: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_PRIMARY" & vbNewLine))
        Case PTR_COLOR_CUSTOM1: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM1" & vbNewLine))
        Case PTR_COLOR_CUSTOM2: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM2" & vbNewLine))
        Case PTR_COLOR_CUSTOM3: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM3" & vbNewLine))
        Case PTR_COLOR_CUSTOM4: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM4" & vbNewLine))
        Case PTR_COLOR_CUSTOM5: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM5" & vbNewLine))
        Case PTR_COLOR_CUSTOM6: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM6" & vbNewLine))
        Case PTR_COLOR_CYAN:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CYAN" & vbNewLine))
        Case PTR_COLOR_MAGENTA: ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_MAGENTA" & vbNewLine))
        Case PTR_COLOR_YELLOW:  ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_YELLOW" & vbNewLine))
        Case PTR_COLOR_FULL:    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_FULL" & vbNewLine))
        Case Else:              ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = Error !? (" & OPOSPOSPrinter1.SlpCurrentCartridge & ")" & vbNewLine))
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpBitmapRotationList    = " & OPOSPOSPrinter1.SlpBitmapRotationList & vbNewLine))
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To OPOSPOSPrinter1.RecLinesToPaperCut
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If OPOSPOSPrinter1.CapSlpEmptySensor = False Or OPOSPOSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                OPOSPOSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (OPOSPOSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (OPOSPOSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case OPOSPOSPrinter1.ResultCode
                    Case OPOS_SUCCESS:      Message = "BeginInsertion : OPOS_SUCCESS"
                    Case OPOS_E_CLOSED:     Message = "BeginInsertion : OPOS_E_CLOSED"
                    Case OPOS_E_CLAIMED:    Message = "BeginInsertion : OPOS_E_CLAIMED"
                    Case OPOS_E_NOTCLAIMED: Message = "BeginInsertion : OPOS_E_NOTCLAIMED"
                    Case OPOS_E_NOSERVICE:  Message = "BeginInsertion : OPOS_E_NOSERVICE"
                    Case OPOS_E_DISABLED:   Message = "BeginInsertion : OPOS_E_DISABLED"
                    Case OPOS_E_ILLEGAL:    Message = "BeginInsertion : OPOS_E_ILLEGAL"
                    Case OPOS_E_NOHARDWARE: Message = "BeginInsertion : OPOS_E_NOHARDWARE"
                    Case OPOS_E_OFFLINE:    Message = "BeginInsertion : OPOS_E_OFFLINE"
                    Case OPOS_E_NOEXIST:    Message = "BeginInsertion : OPOS_E_NOEXIST"
                    Case OPOS_E_EXISTS:     Message = "BeginInsertion : OPOS_E_EXISTS"
                    Case OPOS_E_FAILURE:    Message = "BeginInsertion : OPOS_E_FAILURE"
                    Case OPOS_E_TIMEOUT:    Message = "BeginInsertion : OPOS_E_TIMEOUT"
                    Case OPOS_E_BUSY:       Message = "BeginInsertion : OPOS_E_BUSY"
                    Case OPOS_E_EXTENDED:   Message = "BeginInsertion : OPOS_E_EXTENDED"
                    Case Else:              Message = "BeginInsertion : ResultCode Error !?"
                End Select
                
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    OPOSPOSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        OPOSPOSPrinter1.AsyncMode = True
        
        ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    OPOSPOSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command5_Click()
    Dim Message As String
    Dim PrintMessage As String
    Dim ListCharacter As String
    Dim Station As Long
    Dim CharacterSetBackup As Long
    Dim CharacterSet As Long
    Dim Position As Long
    Dim i As Long
    Dim j As Long
    
    While OPOSPOSPrinter1.State <> OPOS_S_IDLE
        Select Case OPOSPOSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & OPOSPOSPrinter1.State & ")"
        End Select
        
        If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then Exit Sub
    Wend
    
    If Option1.Value = True Then
        Station = PTR_S_JOURNAL
    ElseIf Option2.Value = True Then
        Station = PTR_S_RECEIPT
    ElseIf Option3.Value = True Then
        Station = PTR_S_SLIP
    Else
        Exit Sub
    End If
    
    ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CharacterSet = " & OPOSPOSPrinter1.CharacterSet & vbNewLine))
    
    For i = &H20 To &H7F Step 16
        PrintMessage = ""
        
        For j = 0 To 15
            PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
        Next j
        
        OPOSPOSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
        
        OPOSPOSPrinter1.BinaryConversion = OPOS_BC_NONE
    Next i
    
    If OPOSPOSPrinter1.CharacterSet = 932 Then     ' Kanji
        For i = &HA0 To &HDF Step 16
            PrintMessage = ""
            
            For j = 0 To 15
                PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
            Next j
            
            OPOSPOSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
            
            OPOSPOSPrinter1.BinaryConversion = OPOS_BC_NONE
        Next i
    Else
        For i = &H80 To &HFF Step 16
            PrintMessage = ""
            
            For j = 0 To 15
                PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
            Next j
            
            OPOSPOSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
            
            OPOSPOSPrinter1.BinaryConversion = OPOS_BC_NONE
        Next i
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    
    CharacterSetBackup = OPOSPOSPrinter1.CharacterSet
    
    Position = 1
    CharacterSet = 0
    
    Do
        ListCharacter = Mid(OPOSPOSPrinter1.CharacterSetList, Position, 1)
        Position = Position + 1
        
        If ListCharacter = "" Or ListCharacter = "," Then
            OPOSPOSPrinter1.CharacterSet = CharacterSet
            CharacterSet = 0
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "CharacterSet = " & OPOSPOSPrinter1.CharacterSet & vbNewLine))
            
            If OPOSPOSPrinter1.CharacterSet = 932 Then     ' Kanji
                For i = &HA0 To &HDF Step 16
                    PrintMessage = ""
                    
                    For j = 0 To 15
                        PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
                    Next j
                    
                    OPOSPOSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
                    
                    OPOSPOSPrinter1.BinaryConversion = OPOS_BC_NONE
                Next i
            Else
                For i = &H80 To &HFF Step 16
                    PrintMessage = ""
                    
                    For j = 0 To 15
                        PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
                    Next j
                    
                    OPOSPOSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
                    
                    OPOSPOSPrinter1.BinaryConversion = OPOS_BC_NONE
                Next i
            End If
        
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
            
            If ListCharacter = "" Then Exit Do
        Else
            CharacterSet = CharacterSet * 10 + Val(ListCharacter)
        End If
    Loop
    
    OPOSPOSPrinter1.CharacterSet = CharacterSetBackup
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To OPOSPOSPrinter1.RecLinesToPaperCut
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If OPOSPOSPrinter1.CapSlpEmptySensor = False Or OPOSPOSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                OPOSPOSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (OPOSPOSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (OPOSPOSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case OPOSPOSPrinter1.ResultCode
                    Case OPOS_SUCCESS:      Message = "BeginInsertion : OPOS_SUCCESS"
                    Case OPOS_E_CLOSED:     Message = "BeginInsertion : OPOS_E_CLOSED"
                    Case OPOS_E_CLAIMED:    Message = "BeginInsertion : OPOS_E_CLAIMED"
                    Case OPOS_E_NOTCLAIMED: Message = "BeginInsertion : OPOS_E_NOTCLAIMED"
                    Case OPOS_E_NOSERVICE:  Message = "BeginInsertion : OPOS_E_NOSERVICE"
                    Case OPOS_E_DISABLED:   Message = "BeginInsertion : OPOS_E_DISABLED"
                    Case OPOS_E_ILLEGAL:    Message = "BeginInsertion : OPOS_E_ILLEGAL"
                    Case OPOS_E_NOHARDWARE: Message = "BeginInsertion : OPOS_E_NOHARDWARE"
                    Case OPOS_E_OFFLINE:    Message = "BeginInsertion : OPOS_E_OFFLINE"
                    Case OPOS_E_NOEXIST:    Message = "BeginInsertion : OPOS_E_NOEXIST"
                    Case OPOS_E_EXISTS:     Message = "BeginInsertion : OPOS_E_EXISTS"
                    Case OPOS_E_FAILURE:    Message = "BeginInsertion : OPOS_E_FAILURE"
                    Case OPOS_E_TIMEOUT:    Message = "BeginInsertion : OPOS_E_TIMEOUT"
                    Case OPOS_E_BUSY:       Message = "BeginInsertion : OPOS_E_BUSY"
                    Case OPOS_E_EXTENDED:   Message = "BeginInsertion : OPOS_E_EXTENDED"
                    Case Else:              Message = "BeginInsertion : ResultCode Error !?"
                End Select
                
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    OPOSPOSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        OPOSPOSPrinter1.AsyncMode = True
        
        ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    OPOSPOSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command6_Click()
    Dim Message As String
    Dim Station As Long
    Dim LineChars As Long
    Dim i As Long
    
    While OPOSPOSPrinter1.State <> OPOS_S_IDLE
        Select Case OPOSPOSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & OPOSPOSPrinter1.State & ")"
        End Select
        
        If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then Exit Sub
    Wend
    
    If Option1.Value = True Then
        Station = PTR_S_JOURNAL
    ElseIf Option2.Value = True Then
        Station = PTR_S_RECEIPT
    ElseIf Option3.Value = True Then
        Station = PTR_S_SLIP
    Else
        Exit Sub
    End If
    
    ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    Select Case Station
        Case PTR_S_JOURNAL:
            LineChars = OPOSPOSPrinter1.JrnLineChars
            OPOSPOSPrinter1.JrnLineChars = 1
            
            Do
                i = OPOSPOSPrinter1.JrnLineChars
                
                OPOSPOSPrinter1.JrnLineChars = LineChars
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "JrnLineChars (" & i & ")" & vbNewLine))
                
                OPOSPOSPrinter1.JrnLineChars = i
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.JrnLineChars, "H") & vbNewLine))
                
                If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(Int(OPOSPOSPrinter1.JrnLineChars / 2), "Ｈ") & vbNewLine))
                End If
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                
                OPOSPOSPrinter1.JrnLineChars = OPOSPOSPrinter1.JrnLineChars + 1
            Loop While i <> OPOSPOSPrinter1.JrnLineChars
            
            OPOSPOSPrinter1.JrnLineChars = LineChars
        Case PTR_S_RECEIPT:
            LineChars = OPOSPOSPrinter1.RecLineChars
            OPOSPOSPrinter1.RecLineChars = 1
            
            Do
                i = OPOSPOSPrinter1.RecLineChars
                
                OPOSPOSPrinter1.RecLineChars = LineChars
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "RecLineChars (" & i & ")" & vbNewLine))
                
                OPOSPOSPrinter1.RecLineChars = i
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.RecLineChars, "H") & vbNewLine))
                
                If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(Int(OPOSPOSPrinter1.RecLineChars / 2), "Ｈ") & vbNewLine))
                End If
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                
                OPOSPOSPrinter1.RecLineChars = OPOSPOSPrinter1.RecLineChars + 1
            Loop While i <> OPOSPOSPrinter1.RecLineChars
            
            OPOSPOSPrinter1.RecLineChars = LineChars
        Case PTR_S_SLIP:
            LineChars = OPOSPOSPrinter1.SlpLineChars
            OPOSPOSPrinter1.SlpLineChars = 1
            
            Do
                i = OPOSPOSPrinter1.SlpLineChars
                
                OPOSPOSPrinter1.SlpLineChars = LineChars
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SlpLineChars (" & i & ")" & vbNewLine))
                
                OPOSPOSPrinter1.SlpLineChars = i
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.SlpLineChars, "H") & vbNewLine))
                
                If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(Int(OPOSPOSPrinter1.SlpLineChars / 2), "Ｈ") & vbNewLine))
                End If
                
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                
                OPOSPOSPrinter1.SlpLineChars = OPOSPOSPrinter1.SlpLineChars + 1
            Loop While i <> OPOSPOSPrinter1.SlpLineChars
            
            OPOSPOSPrinter1.SlpLineChars = LineChars
    End Select
    
    OPOSPOSPrinter1.MapMode = PTR_MM_METRIC
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If OPOSPOSPrinter1.CapRecBarCode = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                OPOSPOSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (OPOSPOSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, OPOSPOSPrinter1.RecLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If OPOSPOSPrinter1.CapSlpBarCode = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                OPOSPOSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (OPOSPOSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    OPOSPOSPrinter1.MapMode = PTR_MM_DOTS
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If OPOSPOSPrinter1.CapRecBitmap = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If OPOSPOSPrinter1.CapSlpBitmap = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (OPOSPOSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (OPOSPOSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1B") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|1B)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|1B" & vbNewLine))
        End If
        
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (OPOSPOSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (OPOSPOSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2B") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|2B)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2B" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.SetLogo(PTR_L_TOP, "StarMicronics(TopLogo)" & vbNewLine))
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|tL") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|tL)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|tL" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.SetLogo(PTR_L_BOTTOM, "StarMicronics(BottomLogo)" & vbNewLine))
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bL") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|bL)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bL" & vbNewLine))
        End If
    End If
    
    ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_ROTATE180 Or PTR_RP_BITMAP Or PTR_RP_BARCODE))
    
    OPOSPOSPrinter1.MapMode = PTR_MM_METRIC
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If OPOSPOSPrinter1.CapRecBarCode = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                OPOSPOSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (OPOSPOSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, OPOSPOSPrinter1.RecLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If OPOSPOSPrinter1.CapSlpBarCode = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                OPOSPOSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (OPOSPOSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    OPOSPOSPrinter1.MapMode = PTR_MM_DOTS
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If OPOSPOSPrinter1.CapRecBitmap = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If OPOSPOSPrinter1.CapSlpBitmap = True Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
                
                If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (OPOSPOSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (OPOSPOSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1B") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|1B)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|1B" & vbNewLine))
        End If
        
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (OPOSPOSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (OPOSPOSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2B") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|2B)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2B" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.SetLogo(PTR_L_TOP, "StarMicronics(TopLogo)" & vbNewLine))
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|tL") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|tL)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|tL" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.SetLogo(PTR_L_BOTTOM, "StarMicronics(BottomLogo)" & vbNewLine))
        
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bL") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|bL)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bL" & vbNewLine))
        End If
    End If
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To OPOSPOSPrinter1.RecLinesToPaperCut
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If OPOSPOSPrinter1.CapSlpEmptySensor = False Or OPOSPOSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                OPOSPOSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (OPOSPOSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (OPOSPOSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case OPOSPOSPrinter1.ResultCode
                    Case OPOS_SUCCESS:      Message = "BeginInsertion : OPOS_SUCCESS"
                    Case OPOS_E_CLOSED:     Message = "BeginInsertion : OPOS_E_CLOSED"
                    Case OPOS_E_CLAIMED:    Message = "BeginInsertion : OPOS_E_CLAIMED"
                    Case OPOS_E_NOTCLAIMED: Message = "BeginInsertion : OPOS_E_NOTCLAIMED"
                    Case OPOS_E_NOSERVICE:  Message = "BeginInsertion : OPOS_E_NOSERVICE"
                    Case OPOS_E_DISABLED:   Message = "BeginInsertion : OPOS_E_DISABLED"
                    Case OPOS_E_ILLEGAL:    Message = "BeginInsertion : OPOS_E_ILLEGAL"
                    Case OPOS_E_NOHARDWARE: Message = "BeginInsertion : OPOS_E_NOHARDWARE"
                    Case OPOS_E_OFFLINE:    Message = "BeginInsertion : OPOS_E_OFFLINE"
                    Case OPOS_E_NOEXIST:    Message = "BeginInsertion : OPOS_E_NOEXIST"
                    Case OPOS_E_EXISTS:     Message = "BeginInsertion : OPOS_E_EXISTS"
                    Case OPOS_E_FAILURE:    Message = "BeginInsertion : OPOS_E_FAILURE"
                    Case OPOS_E_TIMEOUT:    Message = "BeginInsertion : OPOS_E_TIMEOUT"
                    Case OPOS_E_BUSY:       Message = "BeginInsertion : OPOS_E_BUSY"
                    Case OPOS_E_EXTENDED:   Message = "BeginInsertion : OPOS_E_EXTENDED"
                    Case Else:              Message = "BeginInsertion : ResultCode Error !?"
                End Select
                
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    OPOSPOSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        OPOSPOSPrinter1.AsyncMode = True
        
        ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    OPOSPOSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command7_Click()
    Dim Message As String
    Dim Station As Long
    Dim i As Long
    
    While OPOSPOSPrinter1.State <> OPOS_S_IDLE
        Select Case OPOSPOSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & OPOSPOSPrinter1.State & ")"
        End Select
        
        If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then Exit Sub
    Wend
    
    If Option1.Value = True Then
        Station = PTR_S_JOURNAL
    ElseIf Option2.Value = True Then
        Station = PTR_S_RECEIPT
    ElseIf Option3.Value = True Then
        Station = PTR_S_SLIP
    Else
        Exit Sub
    End If
    
    ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|90P") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Paper cut (<ESC>|#P)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & vbNewLine))
        
        If Station = PTR_S_RECEIPT Then
            For i = 1 To OPOSPOSPrinter1.RecLinesToPaperCut
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
            Next i
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|90P"))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|90fP") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed and Paper cut (<ESC>|#fP)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & vbNewLine & Chr$(&H1B) & "|90fP"))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|90sP") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed, Paper cut, and Stamp (<ESC>|#sP)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & vbNewLine & Chr$(&H1B) & "|90sP"))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|sL") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Fire stamp (<ESC>|sL)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|sL" & vbNewLine))
    End If
    
    Select Case Station
        Case PTR_S_RECEIPT: ViewResultCode (OPOSPOSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
        Case PTR_S_SLIP:    ViewResultCode (OPOSPOSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
    End Select
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1B") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Print bitmap (<ESC>|1B)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|1B" & vbNewLine))
    End If
    
    Select Case Station
        Case PTR_S_RECEIPT: ViewResultCode (OPOSPOSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
        Case PTR_S_SLIP:    ViewResultCode (OPOSPOSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
    End Select
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2B") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Print bitmap (<ESC>|2B)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2B" & vbNewLine))
    End If
    
    ViewResultCode (OPOSPOSPrinter1.SetLogo(PTR_L_TOP, "StarMicronics(TopLogo)" & vbNewLine))
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|tL") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Print top logo (<ESC>|tL)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|tL" & vbNewLine))
    End If
    
    ViewResultCode (OPOSPOSPrinter1.SetLogo(PTR_L_BOTTOM, "StarMicronics(BottomLogo)" & vbNewLine))
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bL") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Print bottom logo (<ESC>|bL)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bL" & vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2lF") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed lines (<ESC>|#lF)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|2lF"))
    End If
    
    Select Case Station
        Case PTR_S_JOURNAL:
            If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & OPOSPOSPrinter1.JrnLineSpacing * 2 & "uF") = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed units (<ESC>|#uF)" & vbNewLine))
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|" & OPOSPOSPrinter1.JrnLineSpacing * 2 & "uF"))
            End If
        Case PTR_S_RECEIPT:
            If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & OPOSPOSPrinter1.RecLineSpacing * 2 & "uF") = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed units (<ESC>|#uF)" & vbNewLine))
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|" & OPOSPOSPrinter1.RecLineSpacing * 2 & "uF"))
            End If
        Case PTR_S_SLIP:
            If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & OPOSPOSPrinter1.SlpLineSpacing * 2 & "uF") = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed units (<ESC>|#uF)" & vbNewLine))
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|" & OPOSPOSPrinter1.SlpLineSpacing * 2 & "uF"))
            End If
    End Select
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2rF") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Feed reverse (<ESC>|#rF)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & "StarMicronics(1)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2rF" & "     " & "StarMicronics(2)" & vbNewLine & vbNewLine & vbNewLine))
    End If
    
    For i = 1 To 8
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & i & "fT") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Font typeface selection (<ESC>|" & i & "fT)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "fT" & "StarMicronics" & vbNewLine))
            
            If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "fT" & "スター精密株式会社" & vbNewLine))
            End If
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        End If
    Next i
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|0fT") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Font typeface selection (<ESC>|0fT)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|0fT" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|0fT" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bC") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Bold (<ESC>|bC)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bC" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Underline (<ESC>|#uC)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|uC" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|uC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|iC") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Italic (<ESC>|iC)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|iC" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|iC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rC") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Alternate color (Red) (<ESC>|rC)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rC" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rvC") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Reverse video (<ESC>|rvC)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rvC" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rvC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|sC") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Shading (<ESC>|#sC)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|sC" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|sC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1C") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Single high & wide (<ESC>|1C)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|1C" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|1C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Double wide (<ESC>|2C)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|2C" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|2C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|3C") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Double high (<ESC>|3C)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|3C" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|3C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|4C") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Double high & wide (<ESC>|4C)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|4C" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|4C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    For i = 1 To 8
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & i & "hC") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Scale horizontally (<ESC>|" & i & "hC)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "hC" & "StarMicronics" & vbNewLine))
            
            If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "hC" & "スター精密株式会社" & vbNewLine))
            End If
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        End If
    Next i
    
    For i = 1 To 8
        If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & i & "vC") = OPOS_SUCCESS Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Scale vertically (<ESC>|" & i & "vC)" & vbNewLine))
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "vC" & "StarMicronics" & vbNewLine))
            
            If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "vC" & "スター精密株式会社" & vbNewLine))
            End If
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        End If
    Next i
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Center (<ESC>|cA)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Right justify (<ESC>|rA)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|N") = OPOS_SUCCESS Then
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Normal (<ESC>|N)" & vbNewLine))
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|N" & "     " & "StarMicronics" & vbNewLine))
        
        If OPOSPOSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|N" & "     " & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To OPOSPOSPrinter1.RecLinesToPaperCut
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If OPOSPOSPrinter1.CapSlpEmptySensor = False Or OPOSPOSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                OPOSPOSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (OPOSPOSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (OPOSPOSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case OPOSPOSPrinter1.ResultCode
                    Case OPOS_SUCCESS:      Message = "BeginInsertion : OPOS_SUCCESS"
                    Case OPOS_E_CLOSED:     Message = "BeginInsertion : OPOS_E_CLOSED"
                    Case OPOS_E_CLAIMED:    Message = "BeginInsertion : OPOS_E_CLAIMED"
                    Case OPOS_E_NOTCLAIMED: Message = "BeginInsertion : OPOS_E_NOTCLAIMED"
                    Case OPOS_E_NOSERVICE:  Message = "BeginInsertion : OPOS_E_NOSERVICE"
                    Case OPOS_E_DISABLED:   Message = "BeginInsertion : OPOS_E_DISABLED"
                    Case OPOS_E_ILLEGAL:    Message = "BeginInsertion : OPOS_E_ILLEGAL"
                    Case OPOS_E_NOHARDWARE: Message = "BeginInsertion : OPOS_E_NOHARDWARE"
                    Case OPOS_E_OFFLINE:    Message = "BeginInsertion : OPOS_E_OFFLINE"
                    Case OPOS_E_NOEXIST:    Message = "BeginInsertion : OPOS_E_NOEXIST"
                    Case OPOS_E_EXISTS:     Message = "BeginInsertion : OPOS_E_EXISTS"
                    Case OPOS_E_FAILURE:    Message = "BeginInsertion : OPOS_E_FAILURE"
                    Case OPOS_E_TIMEOUT:    Message = "BeginInsertion : OPOS_E_TIMEOUT"
                    Case OPOS_E_BUSY:       Message = "BeginInsertion : OPOS_E_BUSY"
                    Case OPOS_E_EXTENDED:   Message = "BeginInsertion : OPOS_E_EXTENDED"
                    Case Else:              Message = "BeginInsertion : ResultCode Error !?"
                End Select
                
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    OPOSPOSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        OPOSPOSPrinter1.AsyncMode = True
        
        ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    OPOSPOSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command8_Click()
    Dim DateMes As String
    Dim TimeMes As String
    Dim Message As String
    Dim Station As Long
    Dim i As Long
    
    While OPOSPOSPrinter1.State <> OPOS_S_IDLE
        Select Case OPOSPOSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & OPOSPOSPrinter1.State & ")"
        End Select
        
        If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then Exit Sub
    Wend
    
    If Option1.Value = True Then
        Station = PTR_S_JOURNAL
    ElseIf Option2.Value = True Then
        Station = PTR_S_RECEIPT
    ElseIf Option3.Value = True Then
        Station = PTR_S_SLIP
    Else
        Exit Sub
    End If
    
    DateMes = Format(Date, "Medium date")
    TimeMes = Format(Time, "Short Time")
    
    ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    Select Case Station
        Case PTR_S_JOURNAL:
            ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
            
            If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
            Else
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.JrnLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
            End If
            
            Select Case OPOSPOSPrinter1.CapCharacterSet
                Case PTR_CCS_ASCII:
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Apple" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Apple$20.00")) & "$20.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Banana" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Banana$30.00")) & "$30.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Grape" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Grape$40.00")) & "$40.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Lemon" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Lemon$50.00")) & "$50.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Orange" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Orange$60.00")) & "$60.00" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Subtotal" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Subtotal") - Len("$200.00")) & "$200.00" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "Tax" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Tax" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.JrnLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "Total" & Space(OPOSPOSPrinter1.JrnLineChars / 2 - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Received" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "Change" & Space(OPOSPOSPrinter1.JrnLineChars / 2 - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Total" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Received" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Change" & Space(OPOSPOSPrinter1.JrnLineChars - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    End If
                Case PTR_CCS_KANA:
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾘﾝｺﾞ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ﾘﾝｺﾞ\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾊﾞﾅﾅ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ﾊﾞﾅﾅ\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾌﾞﾄﾞｳ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ﾌﾞﾄﾞｳ\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾚﾓﾝ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ﾚﾓﾝ\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾐｶﾝ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ﾐｶﾝ\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｼｮｳｹｲ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｼｮｳｹｲ") - Len("\20,000")) & "\20,000" & vbNewLine))
                
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "ｼｮｳﾋｾﾞｲ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｼｮｳﾋｾﾞｲ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.JrnLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "ｺﾞｳｹｲ" & Space(OPOSPOSPrinter1.JrnLineChars / 2 - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "ｵﾂﾘ" & Space(OPOSPOSPrinter1.JrnLineChars / 2 - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｺﾞｳｹｲ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵﾂﾘ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
                Case PTR_CCS_KANJI:
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "りんご" & Space(OPOSPOSPrinter1.JrnLineChars - Len("りんご") * 2 - Len("\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "バナナ" & Space(OPOSPOSPrinter1.JrnLineChars - Len("バナナ") * 2 - Len("\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ぶどう" & Space(OPOSPOSPrinter1.JrnLineChars - Len("ぶどう") * 2 - Len("\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "レモン" & Space(OPOSPOSPrinter1.JrnLineChars - Len("レモン") * 2 - Len("\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "みかん" & Space(OPOSPOSPrinter1.JrnLineChars - Len("みかん") * 2 - Len("\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "小計" & Space(OPOSPOSPrinter1.JrnLineChars - Len("小計") * 2 - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "消費税" & Space(OPOSPOSPrinter1.JrnLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "消費税" & Space(OPOSPOSPrinter1.JrnLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.JrnLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "合計" & Space(OPOSPOSPrinter1.JrnLineChars / 2 - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お預かり" & Space(OPOSPOSPrinter1.JrnLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "お釣り" & Space(OPOSPOSPrinter1.JrnLineChars / 2 - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "合計" & Space(OPOSPOSPrinter1.JrnLineChars - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お預かり" & Space(OPOSPOSPrinter1.JrnLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お釣り" & Space(OPOSPOSPrinter1.JrnLineChars - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
            End Select
        Case PTR_S_RECEIPT:
            ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
            
            Select Case OPOSPOSPrinter1.CapCharacterSet
                Case PTR_CCS_ASCII:
                    ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_RIGHT))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.RecLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.RecLineChars - Len("Thank you for your coming. ")) / 2) & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.RecLineChars - Len("We hope you'll visit again.")) / 2) & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.RecLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Apple" & Space(OPOSPOSPrinter1.RecLineChars - Len("Apple$20.00")) & "$20.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Banana" & Space(OPOSPOSPrinter1.RecLineChars - Len("Banana$30.00")) & "$30.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Grape" & Space(OPOSPOSPrinter1.RecLineChars - Len("Grape$40.00")) & "$40.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Lemon" & Space(OPOSPOSPrinter1.RecLineChars - Len("Lemon$50.00")) & "$50.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Orange" & Space(OPOSPOSPrinter1.RecLineChars - Len("Orange$60.00")) & "$60.00" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Subtotal" & Space(OPOSPOSPrinter1.RecLineChars - Len("Subtotal") - Len("$200.00")) & "$200.00" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "Tax" & Space(OPOSPOSPrinter1.RecLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Tax" & Space(OPOSPOSPrinter1.RecLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.RecLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "Total" & Space(OPOSPOSPrinter1.RecLineChars / 2 - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Received" & Space(OPOSPOSPrinter1.RecLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "Change" & Space(OPOSPOSPrinter1.RecLineChars / 2 - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Total" & Space(OPOSPOSPrinter1.RecLineChars - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Received" & Space(OPOSPOSPrinter1.RecLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Change" & Space(OPOSPOSPrinter1.RecLineChars - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    End If
                Case PTR_CCS_KANA:
                    ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_RIGHT))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.RecLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.RecLineChars - Len("ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡")) / 2) & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.RecLineChars - Len("ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ ")) / 2) & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.RecLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾘﾝｺﾞ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ﾘﾝｺﾞ\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾊﾞﾅﾅ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ﾊﾞﾅﾅ\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾌﾞﾄﾞｳ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ﾌﾞﾄﾞｳ\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾚﾓﾝ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ﾚﾓﾝ\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾐｶﾝ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ﾐｶﾝ\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｼｮｳｹｲ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｼｮｳｹｲ") - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "ｼｮｳﾋｾﾞｲ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｼｮｳﾋｾﾞｲ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.RecLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "ｺﾞｳｹｲ" & Space(OPOSPOSPrinter1.RecLineChars / 2 - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "ｵﾂﾘ" & Space(OPOSPOSPrinter1.RecLineChars / 2 - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｺﾞｳｹｲ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵﾂﾘ" & Space(OPOSPOSPrinter1.RecLineChars - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
                Case PTR_CCS_KANJI:
                    ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.RecLineWidth / 2, PTR_BM_RIGHT))

                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.RecLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.RecLineChars - Len("お買い上げありがとうございました。") * 2) / 2) & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.RecLineChars - Len("またのご来店をお待ちしております。") * 2) / 2) & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.RecLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If

                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "りんご" & Space(OPOSPOSPrinter1.RecLineChars - Len("りんご") * 2 - Len("\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "バナナ" & Space(OPOSPOSPrinter1.RecLineChars - Len("バナナ") * 2 - Len("\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ぶどう" & Space(OPOSPOSPrinter1.RecLineChars - Len("ぶどう") * 2 - Len("\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "レモン" & Space(OPOSPOSPrinter1.RecLineChars - Len("レモン") * 2 - Len("\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "みかん" & Space(OPOSPOSPrinter1.RecLineChars - Len("みかん") * 2 - Len("\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "小計" & Space(OPOSPOSPrinter1.RecLineChars - Len("小計") * 2 - Len("\20,000")) & "\20,000" & vbNewLine))

                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "消費税" & Space(OPOSPOSPrinter1.RecLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "消費税" & Space(OPOSPOSPrinter1.RecLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.RecLineChars, "-") & vbNewLine))
                    End If

                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "合計" & Space(OPOSPOSPrinter1.RecLineChars / 2 - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お預かり" & Space(OPOSPOSPrinter1.RecLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "お釣り" & Space(OPOSPOSPrinter1.RecLineChars / 2 - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "合計" & Space(OPOSPOSPrinter1.RecLineChars - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お預かり" & Space(OPOSPOSPrinter1.RecLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お釣り" & Space(OPOSPOSPrinter1.RecLineChars - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
            End Select
            
            For i = 1 To OPOSPOSPrinter1.RecLinesToPaperCut
                ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, vbNewLine))
            Next i
            
            ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
        Case PTR_S_SLIP:
            ViewResultCode (OPOSPOSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
            
            Select Case OPOSPOSPrinter1.CapCharacterSet
                Case PTR_CCS_ASCII:
                    ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_RIGHT))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.SlpLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.SlpLineChars - Len("Thank you for your coming. ")) / 2) & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.SlpLineChars - Len("We hope you'll visit again.")) / 2) & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.SlpLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Apple" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Apple$20.00")) & "$20.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Banana" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Banana$30.00")) & "$30.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Grape" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Grape$40.00")) & "$40.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Lemon" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Lemon$50.00")) & "$50.00" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Orange" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Orange$60.00")) & "$60.00" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Subtotal" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Subtotal") - Len("$200.00")) & "$200.00" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "Tax" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Tax" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.SlpLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "Total" & Space(OPOSPOSPrinter1.SlpLineChars / 2 - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Received" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "Change" & Space(OPOSPOSPrinter1.SlpLineChars / 2 - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Total" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Received" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "Change" & Space(OPOSPOSPrinter1.SlpLineChars - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    End If
                Case PTR_CCS_KANA:
                    ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_RIGHT))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.SlpLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.SlpLineChars - Len("ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡")) / 2) & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.SlpLineChars - Len("ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ ")) / 2) & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.SlpLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾘﾝｺﾞ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ﾘﾝｺﾞ\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾊﾞﾅﾅ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ﾊﾞﾅﾅ\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾌﾞﾄﾞｳ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ﾌﾞﾄﾞｳ\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾚﾓﾝ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ﾚﾓﾝ\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ﾐｶﾝ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ﾐｶﾝ\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｼｮｳｹｲ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｼｮｳｹｲ") - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "ｼｮｳﾋｾﾞｲ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｼｮｳﾋｾﾞｲ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.SlpLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "ｺﾞｳｹｲ" & Space(OPOSPOSPrinter1.SlpLineChars / 2 - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "ｵﾂﾘ" & Space(OPOSPOSPrinter1.SlpLineChars / 2 - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｺﾞｳｹｲ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ｵﾂﾘ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
                Case PTR_CCS_KANJI:
                    ViewResultCode (OPOSPOSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", OPOSPOSPrinter1.SlpLineWidth / 2, PTR_BM_RIGHT))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.SlpLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.SlpLineChars - Len("お買い上げありがとうございました。") * 2) / 2) & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space((OPOSPOSPrinter1.SlpLineChars - Len("またのご来店をお待ちしております。") * 2) / 2) & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Space(OPOSPOSPrinter1.SlpLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "りんご" & Space(OPOSPOSPrinter1.SlpLineChars - Len("りんご") * 2 - Len("\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "バナナ" & Space(OPOSPOSPrinter1.SlpLineChars - Len("バナナ") * 2 - Len("\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "ぶどう" & Space(OPOSPOSPrinter1.SlpLineChars - Len("ぶどう") * 2 - Len("\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "レモン" & Space(OPOSPOSPrinter1.SlpLineChars - Len("レモン") * 2 - Len("\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "みかん" & Space(OPOSPOSPrinter1.SlpLineChars - Len("みかん") * 2 - Len("\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "小計" & Space(OPOSPOSPrinter1.SlpLineChars - Len("小計") * 2 - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "消費税" & Space(OPOSPOSPrinter1.SlpLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "消費税" & Space(OPOSPOSPrinter1.SlpLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, String(OPOSPOSPrinter1.SlpLineChars, "-") & vbNewLine))
                    End If
                    
                    If OPOSPOSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "合計" & Space(OPOSPOSPrinter1.SlpLineChars / 2 - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お預かり" & Space(OPOSPOSPrinter1.SlpLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "お釣り" & Space(OPOSPOSPrinter1.SlpLineChars / 2 - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "合計" & Space(OPOSPOSPrinter1.SlpLineChars - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お預かり" & Space(OPOSPOSPrinter1.SlpLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (OPOSPOSPrinter1.PrintNormal(Station, "お釣り" & Space(OPOSPOSPrinter1.SlpLineChars - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
            End Select
    End Select
    
    If Station = PTR_S_SLIP Then
        Do
            If OPOSPOSPrinter1.CapSlpEmptySensor = False Or OPOSPOSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                OPOSPOSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (OPOSPOSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (OPOSPOSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case OPOSPOSPrinter1.ResultCode
                    Case OPOS_SUCCESS:      Message = "BeginInsertion : OPOS_SUCCESS"
                    Case OPOS_E_CLOSED:     Message = "BeginInsertion : OPOS_E_CLOSED"
                    Case OPOS_E_CLAIMED:    Message = "BeginInsertion : OPOS_E_CLAIMED"
                    Case OPOS_E_NOTCLAIMED: Message = "BeginInsertion : OPOS_E_NOTCLAIMED"
                    Case OPOS_E_NOSERVICE:  Message = "BeginInsertion : OPOS_E_NOSERVICE"
                    Case OPOS_E_DISABLED:   Message = "BeginInsertion : OPOS_E_DISABLED"
                    Case OPOS_E_ILLEGAL:    Message = "BeginInsertion : OPOS_E_ILLEGAL"
                    Case OPOS_E_NOHARDWARE: Message = "BeginInsertion : OPOS_E_NOHARDWARE"
                    Case OPOS_E_OFFLINE:    Message = "BeginInsertion : OPOS_E_OFFLINE"
                    Case OPOS_E_NOEXIST:    Message = "BeginInsertion : OPOS_E_NOEXIST"
                    Case OPOS_E_EXISTS:     Message = "BeginInsertion : OPOS_E_EXISTS"
                    Case OPOS_E_FAILURE:    Message = "BeginInsertion : OPOS_E_FAILURE"
                    Case OPOS_E_TIMEOUT:    Message = "BeginInsertion : OPOS_E_TIMEOUT"
                    Case OPOS_E_BUSY:       Message = "BeginInsertion : OPOS_E_BUSY"
                    Case OPOS_E_EXTENDED:   Message = "BeginInsertion : OPOS_E_EXTENDED"
                    Case Else:              Message = "BeginInsertion : ResultCode Error !?"
                End Select
                
                ViewResultCode (OPOSPOSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    OPOSPOSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        OPOSPOSPrinter1.AsyncMode = True
        
        ViewResultCode (OPOSPOSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    OPOSPOSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command9_Click()
    OPOSPOSPrinter1.DeviceEnabled = False
    
    ViewResultCode (OPOSPOSPrinter1.ResultCode)
    
    If OPOSPOSPrinter1.ResultCode = OPOS_SUCCESS Then     'OPOSPOSPrinter1.ResultCode <> OPOS_E_BUSY
        Check1.Enabled = False
        Check2.Enabled = False
        Check3.Enabled = False
        Check4.Enabled = False
        Check5.Enabled = False
    End If
End Sub

Private Sub Command10_Click()
    ViewResultCode (OPOSPOSPrinter1.ReleaseDevice)
    
    Check1.Enabled = False
    Check2.Enabled = False
    Check3.Enabled = False
    Check4.Enabled = False
    Check5.Enabled = False
End Sub

Private Sub Command11_Click()
    ViewResultCode (OPOSPOSPrinter1.Close)
    
    Check1.Enabled = False
    Check2.Enabled = False
    Check3.Enabled = False
    Check4.Enabled = False
    Check5.Enabled = False
    
    Option1.Enabled = False
    Option2.Enabled = False
    Option3.Enabled = False
End Sub

Private Sub Command12_Click()
'   While Not (OPOSPOSPrinter1.State = OPOS_S_CLOSED Or OPOSPOSPrinter1.State = OPOS_S_IDLE)
'       DoEvents
'   Wend
    
    End
End Sub

Private Sub ViewResultCode(ResultCode As Long)
    Select Case ResultCode
        Case OPOS_SUCCESS:      Text1.Text = Text1.Text + "ResultCode : OPOS_SUCCESS" + vbNewLine
        Case OPOS_E_CLOSED:     Text1.Text = Text1.Text + "ResultCode : OPOS_E_CLOSED" + vbNewLine
        Case OPOS_E_CLAIMED:    Text1.Text = Text1.Text + "ResultCode : OPOS_E_CLAIMED" + vbNewLine
        Case OPOS_E_NOTCLAIMED: Text1.Text = Text1.Text + "ResultCode : OPOS_E_NOTCLAIMED" + vbNewLine
        Case OPOS_E_NOSERVICE:  Text1.Text = Text1.Text + "ResultCode : OPOS_E_NOSERVICE" + vbNewLine
        Case OPOS_E_DISABLED:   Text1.Text = Text1.Text + "ResultCode : OPOS_E_DISABLED" + vbNewLine
        Case OPOS_E_ILLEGAL:    Text1.Text = Text1.Text + "ResultCode : OPOS_E_ILLEGAL" + vbNewLine
        Case OPOS_E_NOHARDWARE: Text1.Text = Text1.Text + "ResultCode : OPOS_E_NOHARDWARE" + vbNewLine
        Case OPOS_E_OFFLINE:    Text1.Text = Text1.Text + "ResultCode : OPOS_E_OFFLINE" + vbNewLine
        Case OPOS_E_NOEXIST:    Text1.Text = Text1.Text + "ResultCode : OPOS_E_NOEXIST" + vbNewLine
        Case OPOS_E_EXISTS:     Text1.Text = Text1.Text + "ResultCode : OPOS_E_EXISTS" + vbNewLine
        Case OPOS_E_FAILURE:    Text1.Text = Text1.Text + "ResultCode : OPOS_E_FAILURE" + vbNewLine
        Case OPOS_E_TIMEOUT:    Text1.Text = Text1.Text + "ResultCode : OPOS_E_TIMEOUT" + vbNewLine
        Case OPOS_E_BUSY:       Text1.Text = Text1.Text + "ResultCode : OPOS_E_BUSY" + vbNewLine
        Case OPOS_E_EXTENDED:   Text1.Text = Text1.Text + "ResultCode : OPOS_E_EXTENDED" + vbNewLine
        Case Else:              Text1.Text = Text1.Text + "ResultCode : ResultCode Error !?" + vbNewLine
    End Select
End Sub

