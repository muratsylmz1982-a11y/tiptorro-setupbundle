VERSION 5.00
Object = "{C3EC6C43-B03D-11D1-89AC-00C04FCAF6E3}#1.0#0"; "POSPrinterCO.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
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
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   200
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   400
      Width           =   3300
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
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
      ScrollBars      =   3  'Both
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   4850
      Width           =   3300
   End
   Begin VB.Frame Frame2 
      BorderStyle     =   0  'None
      Height          =   1900
      Left            =   100
      TabIndex        =   15
      Top             =   5850
      Width           =   1700
      Begin VB.CheckBox Check1 
         Caption         =   "CoverOpen"
         DragMode        =   1  'Automatic
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
         DragMode        =   1  'Automatic
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
         DragMode        =   1  'Automatic
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
         DragMode        =   1  'Automatic
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
         DragMode        =   1  'Automatic
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
      BorderStyle     =   0  'None
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
      BorderStyle     =   0  'None
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
   Begin SMJOPOSPOSPrinterControlObjectLib.POSPrinter POSPrinter1 
      Left            =   195
      Top             =   7305
      _Version        =   65536
      _ExtentX        =   2487
      _ExtentY        =   1402
      _StockProps     =   0
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

Private Sub POSPrinter1_ErrorEvent(ByVal ResultCode As Long, ByVal ResultCodeExtended As Long, ByVal ErrorLocus As Long, pErrorResponse As Long)
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

Private Sub POSPrinter1_StatusUpdateEvent(ByVal Status As Long)
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
'   While Not (POSPrinter1.State = OPOS_S_CLOSED Or POSPrinter1.State = OPOS_S_IDLE)
'       DoEvents
'   Wend
    
    End
End Sub

Private Sub Command1_Click()
    ViewResultCode (POSPrinter1.Open(Combo1.Text))
    
    If POSPrinter1.CapSlpPresent = True Then Option3.Enabled = True: Option3.Value = True
    If POSPrinter1.CapRecPresent = True Then Option2.Enabled = True: Option2.Value = True
    If POSPrinter1.CapJrnPresent = True Then Option1.Enabled = True: Option1.Value = True
End Sub

Private Sub Command2_Click()
    ViewResultCode (POSPrinter1.ClaimDevice(0))
End Sub

Private Sub Command3_Click()
    POSPrinter1.PowerNotify = OPOS_PN_ENABLED
    
    POSPrinter1.DeviceEnabled = True
    
    ViewResultCode (POSPrinter1.ResultCode)
    
    If POSPrinter1.ResultCode = OPOS_SUCCESS Then
        If POSPrinter1.CapCoverSensor = True Then Check1.Enabled = True
        If POSPrinter1.CapJrnEmptySensor = True Then Check2.Enabled = True
        If POSPrinter1.CapRecEmptySensor = True Then Check3.Enabled = True
        If POSPrinter1.CapSlpEmptySensor = True Then Check4.Enabled = True
        
        If POSPrinter1.CoverOpen = True Then
            Check1.Value = 1
        Else
            Check1.Value = 0
        End If
        
        If POSPrinter1.JrnEmpty = True Then
            Check2.Value = 1
            Check2.Caption = "JrnEmpty"
        ElseIf POSPrinter1.JrnNearEnd = True Then
            Check2.Value = 1
            Check2.Caption = "JrnNearEnd"
        Else
            Check2.Value = 0
            Check2.Caption = "JrnEmpty"
        End If
        
        If POSPrinter1.RecEmpty = True Then
            Check3.Value = 1
            Check3.Caption = "RecEmpty"
        ElseIf POSPrinter1.RecNearEnd = True Then
            Check3.Value = 1
            Check3.Caption = "RecNearEnd"
        Else
            Check3.Value = 0
            Check3.Caption = "RecEmpty"
        End If
        
        If POSPrinter1.SlpEmpty = True Then
            Check4.Value = 1
            Check4.Caption = "SlpEmpty"
        ElseIf POSPrinter1.SlpNearEnd = True Then
            Check4.Value = 1
            Check4.Caption = "SlpNearEnd"
        Else
            Check4.Value = 0
            Check4.Caption = "SlpEmpty"
        End If
        
        Check5.Enabled = True
        Check5.Value = 0
        
        POSPrinter1.FlagWhenIdle = True
    End If
End Sub

Private Sub Command4_Click()
    Dim Message As String
    Dim Station As Long
    Dim i As Long
    
    While POSPrinter1.State <> OPOS_S_IDLE
        Select Case POSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & POSPrinter1.State & ")"
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
    
    ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    Select Case POSPrinter1.BinaryConversion
        Case OPOS_BC_NONE:    ViewResultCode (POSPrinter1.PrintNormal(Station, "BinaryConversion         = OPOS_BC_NONE" & vbNewLine))
        Case OPOS_BC_NIBBLE:  ViewResultCode (POSPrinter1.PrintNormal(Station, "BinaryConversion         = OPOS_BC_NIBBLE" & vbNewLine))
        Case OPOS_BC_DECIMAL: ViewResultCode (POSPrinter1.PrintNormal(Station, "BinaryConversion         = OPOS_BC_DECIMAL" & vbNewLine))
        Case Else:            ViewResultCode (POSPrinter1.PrintNormal(Station, "BinaryConversion         = Error !?" & POSPrinter1.BinaryConversion & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.CapPowerReporting
        Case OPOS_PR_NONE:     ViewResultCode (POSPrinter1.PrintNormal(Station, "CapPowerReporting        = OPOS_PR_NONE" & vbNewLine))
        Case OPOS_PR_STANDARD: ViewResultCode (POSPrinter1.PrintNormal(Station, "CapPowerReporting        = OPOS_PR_STANDARD" & vbNewLine))
        Case OPOS_PR_ADVANCED: ViewResultCode (POSPrinter1.PrintNormal(Station, "CapPowerReporting        = OPOS_PR_ADVANCED" & vbNewLine))
        Case Else:             ViewResultCode (POSPrinter1.PrintNormal(Station, "CapPowerReporting        = Error !? (" & POSPrinter1.CapPowerReporting & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapStatisticsReporting   = " & POSPrinter1.CapStatisticsReporting & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapUpdateStatistics      = " & POSPrinter1.CapUpdateStatistics & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CheckHealthText          = " & POSPrinter1.CheckHealthText & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "Claimed                  = " & POSPrinter1.Claimed & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "DeviceEnabled            = " & POSPrinter1.DeviceEnabled & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "FreezeEvents             = " & POSPrinter1.FreezeEvents & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "OpenResult               = " & POSPrinter1.OpenResult & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "OutputID                 = " & POSPrinter1.OutputID & vbNewLine))
    
    Select Case POSPrinter1.PowerNotify
        Case OPOS_PN_DISABLED: ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerNotify              = OPOS_PN_DISABLED" & vbNewLine))
        Case OPOS_PN_ENABLED:  ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerNotify              = OPOS_PN_ENABLED" & vbNewLine))
        Case Else:             ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerNotify              = Error !? (" & POSPrinter1.PowerNotify & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.PowerState
        Case OPOS_PS_UNKNOWN:     ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_UNKNOWN" & vbNewLine))
        Case OPOS_PS_ONLINE:      ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_ONLINE" & vbNewLine))
        Case OPOS_PS_OFF:         ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_OFF" & vbNewLine))
        Case OPOS_PS_OFFLINE:     ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_OFFLINE" & vbNewLine))
        Case OPOS_PS_OFF_OFFLINE: ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerState               = OPOS_PS_OFF_OFFLINE" & vbNewLine))
        Case Else:                ViewResultCode (POSPrinter1.PrintNormal(Station, "PowerState               = Error !? (" & POSPrinter1.PowerState & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.ResultCode
        Case OPOS_SUCCESS:      ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_SUCCESS" & vbNewLine))
        Case OPOS_E_CLOSED:     ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_CLOSED" & vbNewLine))
        Case OPOS_E_CLAIMED:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_CLAIMED" & vbNewLine))
        Case OPOS_E_NOTCLAIMED: ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOTCLAIMED" & vbNewLine))
        Case OPOS_E_NOSERVICE:  ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOSERVICE" & vbNewLine))
        Case OPOS_E_DISABLED:   ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_DISABLED" & vbNewLine))
        Case OPOS_E_ILLEGAL:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_ILLEGAL" & vbNewLine))
        Case OPOS_E_NOHARDWARE: ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOHARDWARE" & vbNewLine))
        Case OPOS_E_OFFLINE:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_OFFLINE" & vbNewLine))
        Case OPOS_E_NOEXIST:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_NOEXIST" & vbNewLine))
        Case OPOS_E_EXISTS:     ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_EXISTS" & vbNewLine))
        Case OPOS_E_FAILURE:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_FAILURE" & vbNewLine))
        Case OPOS_E_TIMEOUT:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_TIMEOUT" & vbNewLine))
        Case OPOS_E_BUSY:       ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_BUSY" & vbNewLine))
        Case OPOS_E_EXTENDED:   ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = OPOS_E_EXTENDED" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCode               = Error !? (" & POSPrinter1.ResultCode & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.ResultCodeExtended
        Case OPOS_EPTR_COVER_OPEN: ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_COVER_OPEN" & vbNewLine))
        Case OPOS_EPTR_JRN_EMPTY:  ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_JRN_EMPTY" & vbNewLine))
        Case OPOS_EPTR_REC_EMPTY:  ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_REC_EMPTY" & vbNewLine))
        Case OPOS_EPTR_SLP_EMPTY:  ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCodeExtended       = OPOS_EPTR_SLP_EMPTY" & vbNewLine))
        Case Else:                 ViewResultCode (POSPrinter1.PrintNormal(Station, "ResultCodeExtended       = Error !? (" & POSPrinter1.ResultCodeExtended & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.State
        Case OPOS_S_CLOSED: ViewResultCode (POSPrinter1.PrintNormal(Station, "State                    = OPOS_S_CLOSED" & vbNewLine))
        Case OPOS_S_IDLE:   ViewResultCode (POSPrinter1.PrintNormal(Station, "State                    = OPOS_S_IDLE" & vbNewLine))
        Case OPOS_S_BUSY:   ViewResultCode (POSPrinter1.PrintNormal(Station, "State                    = OPOS_S_BUSY" & vbNewLine))
        Case OPOS_S_ERROR:  ViewResultCode (POSPrinter1.PrintNormal(Station, "State                    = OPOS_S_ERROR" & vbNewLine))
        Case Else:          ViewResultCode (POSPrinter1.PrintNormal(Station, "State                    = Error !? (" & POSPrinter1.State & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "ControlObjectDescription = " & POSPrinter1.ControlObjectDescription & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "ControlObjectVersion     = " & POSPrinter1.ControlObjectVersion & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "ServiceObjectDescription = " & POSPrinter1.ServiceObjectDescription & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "ServiceObjectVersion     = " & POSPrinter1.ServiceObjectVersion & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "DeviceDescription        = " & POSPrinter1.DeviceDescription & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "DeviceName               = " & POSPrinter1.DeviceName & vbNewLine))
    
    Select Case POSPrinter1.CapCharacterSet
        Case PTR_CCS_ALPHA:   ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_ALPHA" & vbNewLine))
        Case PTR_CCS_ASCII:   ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_ASCII" & vbNewLine))
        Case PTR_CCS_KANA:    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_KANA" & vbNewLine))
        Case PTR_CCS_KANJI:   ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_KANJI" & vbNewLine))
        Case PTR_CCS_UNICODE: ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCharacterSet          = PTR_CCS_UNICODE" & vbNewLine))
        Case Else:            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCharacterSet          = Error !? (" & POSPrinter1.CapCharacterSet & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapConcurrentJrnRec      = " & POSPrinter1.CapConcurrentJrnRec & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapConcurrentJrnSlp      = " & POSPrinter1.CapConcurrentJrnSlp & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapConcurrentRecSlp      = " & POSPrinter1.CapConcurrentRecSlp & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapCoverSensor           = " & POSPrinter1.CapCoverSensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapMapCharacterSet       = " & POSPrinter1.CapMapCharacterSet & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapTransaction           = " & POSPrinter1.CapTransaction & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnPresent            = " & POSPrinter1.CapJrnPresent & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrn2Color             = " & POSPrinter1.CapJrn2Color & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnBold               = " & POSPrinter1.CapJrnBold & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnDhigh              = " & POSPrinter1.CapJrnDhigh & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnDwide              = " & POSPrinter1.CapJrnDwide & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnDwideDhigh         = " & POSPrinter1.CapJrnDwideDhigh & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnEmptySensor        = " & POSPrinter1.CapJrnEmptySensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnItalic             = " & POSPrinter1.CapJrnItalic & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnNearEndSensor      = " & POSPrinter1.CapJrnNearEndSensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnUnderline          = " & POSPrinter1.CapJrnUnderline & vbNewLine))
    
    If POSPrinter1.CapJrnCartridgeSensor And (PTR_CART_REMOVED Or PTR_CART_EMPTY Or PTR_CART_NEAREND Or PTR_CART_CLEANING) Then
        If POSPrinter1.CapJrnCartridgeSensor And PTR_CART_REMOVED Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_REMOVED" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnCartridgeSensor And PTR_CART_EMPTY Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_EMPTY" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnCartridgeSensor And PTR_CART_NEAREND Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_NEAREND" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnCartridgeSensor And PTR_CART_CLEANING Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = PTR_CART_CLEANING" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnCartridgeSensor    = Error !? (" & POSPrinter1.CapJrnCartridgeSensor & ")" & vbNewLine))
    End If
    
    If POSPrinter1.CapJrnColor <> 0 Then
        If POSPrinter1.CapJrnColor And PTR_COLOR_PRIMARY Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_PRIMARY" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM1 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM1" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM2 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM2" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM3 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM3" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM4 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM4" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM5 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM5" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CUSTOM6 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CUSTOM6" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_CYAN Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_CYAN" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_MAGENTA Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_MAGENTA" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_YELLOW Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_YELLOW" & vbNewLine))
        End If
        
        If POSPrinter1.CapJrnColor And PTR_COLOR_FULL Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = PTR_COLOR_FULL" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapJrnColor              = 0" & vbNewLine))
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecPresent            = " & POSPrinter1.CapRecPresent & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRec2Color             = " & POSPrinter1.CapRec2Color & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecBarCode            = " & POSPrinter1.CapRecBarCode & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecBitmap             = " & POSPrinter1.CapRecBitmap & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecBold               = " & POSPrinter1.CapRecBold & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecDhigh              = " & POSPrinter1.CapRecDhigh & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecDwide              = " & POSPrinter1.CapRecDwide & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecDwideDhigh         = " & POSPrinter1.CapRecDwideDhigh & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecEmptySensor        = " & POSPrinter1.CapRecEmptySensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecItalic             = " & POSPrinter1.CapRecItalic & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecLeft90             = " & POSPrinter1.CapRecLeft90 & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecNearEndSensor      = " & POSPrinter1.CapRecNearEndSensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecPapercut           = " & POSPrinter1.CapRecPapercut & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecRight90            = " & POSPrinter1.CapRecRight90 & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecRotate180          = " & POSPrinter1.CapRecRotate180 & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecStamp              = " & POSPrinter1.CapRecStamp & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecUnderline          = " & POSPrinter1.CapRecUnderline & vbNewLine))
    
    If POSPrinter1.CapRecCartridgeSensor And (PTR_CART_REMOVED Or PTR_CART_EMPTY Or PTR_CART_NEAREND Or PTR_CART_CLEANING) Then
        If POSPrinter1.CapRecCartridgeSensor And PTR_CART_REMOVED Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_REMOVED" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecCartridgeSensor And PTR_CART_EMPTY Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_EMPTY" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecCartridgeSensor And PTR_CART_NEAREND Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_NEAREND" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecCartridgeSensor And PTR_CART_CLEANING Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = PTR_CART_CLEANING" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecCartridgeSensor    = Error !? (" & POSPrinter1.CapRecCartridgeSensor & ")" & vbNewLine))
    End If
    
    If POSPrinter1.CapRecColor <> 0 Then
        If POSPrinter1.CapRecColor And PTR_COLOR_PRIMARY Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_PRIMARY" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CUSTOM1 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM1" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CUSTOM2 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM2" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CUSTOM3 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM3" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CUSTOM4 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM4" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CUSTOM5 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM5" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CUSTOM6 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CUSTOM6" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_CYAN Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_CYAN" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_MAGENTA Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_MAGENTA" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_YELLOW Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_YELLOW" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecColor And PTR_COLOR_FULL Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = PTR_COLOR_FULL" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecColor              = 0" & vbNewLine))
    End If
    
    If POSPrinter1.CapRecMarkFeed <> 0 Then
        If POSPrinter1.CapRecMarkFeed And PTR_MF_TO_TAKEUP Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_TAKEUP" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecMarkFeed And PTR_MF_TO_CUTTER Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_CUTTER" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecMarkFeed And PTR_MF_TO_CURRENT_TOF Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_CURRENT_TOF" & vbNewLine))
        End If
        
        If POSPrinter1.CapRecMarkFeed And PTR_MF_TO_NEXT_TOF Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = PTR_MF_TO_NEXT_TOF" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapRecMarkFeed           = 0" & vbNewLine))
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpPresent            = " & POSPrinter1.CapSlpPresent & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpFullslip           = " & POSPrinter1.CapSlpFullslip & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlp2Color             = " & POSPrinter1.CapSlp2Color & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpBarCode            = " & POSPrinter1.CapSlpBarCode & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpBitmap             = " & POSPrinter1.CapSlpBitmap & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpBold               = " & POSPrinter1.CapSlpBold & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpDhigh              = " & POSPrinter1.CapSlpDhigh & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpDwide              = " & POSPrinter1.CapSlpDwide & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpDwideDhigh         = " & POSPrinter1.CapSlpDwideDhigh & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpEmptySensor        = " & POSPrinter1.CapSlpEmptySensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpItalic             = " & POSPrinter1.CapSlpItalic & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpLeft90             = " & POSPrinter1.CapSlpLeft90 & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpNearEndSensor      = " & POSPrinter1.CapSlpNearEndSensor & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpRight90            = " & POSPrinter1.CapSlpRight90 & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpRotate180          = " & POSPrinter1.CapSlpRotate180 & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpUnderline          = " & POSPrinter1.CapSlpUnderline & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpBothSidesPrint     = " & POSPrinter1.CapSlpBothSidesPrint & vbNewLine))
    
    If POSPrinter1.CapSlpCartridgeSensor And (PTR_CART_REMOVED Or PTR_CART_EMPTY Or PTR_CART_NEAREND Or PTR_CART_CLEANING) Then
        If POSPrinter1.CapSlpCartridgeSensor And PTR_CART_REMOVED Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_REMOVED" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpCartridgeSensor And PTR_CART_EMPTY Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_EMPTY" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpCartridgeSensor And PTR_CART_NEAREND Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_NEAREND" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpCartridgeSensor And PTR_CART_CLEANING Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = PTR_CART_CLEANING" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpCartridgeSensor    = Error !? (" & POSPrinter1.CapSlpCartridgeSensor & ")" & vbNewLine))
    End If
    
    If POSPrinter1.CapSlpColor <> 0 Then
        If POSPrinter1.CapSlpColor And PTR_COLOR_PRIMARY Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_PRIMARY" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM1 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM1" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM2 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM2" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM3 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM3" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM4 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM4" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM5 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM5" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CUSTOM6 Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CUSTOM6" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_CYAN Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_CYAN" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_MAGENTA Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_MAGENTA" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_YELLOW Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_YELLOW" & vbNewLine))
        End If
        
        If POSPrinter1.CapSlpColor And PTR_COLOR_FULL Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = PTR_COLOR_FULL" & vbNewLine))
        End If
    Else
        ViewResultCode (POSPrinter1.PrintNormal(Station, "CapSlpColor              = 0" & vbNewLine))
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "AsyncMode                = " & POSPrinter1.AsyncMode & vbNewLine))
    
    Select Case POSPrinter1.CartridgeNotify
        Case PTR_CN_DISABLED: ViewResultCode (POSPrinter1.PrintNormal(Station, "CartridgeNotify          = PTR_CN_DISABLED" & vbNewLine))
        Case PTR_CN_ENABLED:  ViewResultCode (POSPrinter1.PrintNormal(Station, "CartridgeNotify          = PTR_CN_ENABLED" & vbNewLine))
        Case Else:            ViewResultCode (POSPrinter1.PrintNormal(Station, "CartridgeNotify          = Error !? (" & POSPrinter1.CartridgeNotify & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CharacterSet             = " & POSPrinter1.CharacterSet & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CharacterSetList         = " & POSPrinter1.CharacterSetList & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CoverOpen                = " & POSPrinter1.CoverOpen & vbNewLine))
    
    Select Case POSPrinter1.ErrorLevel
        Case PTR_EL_NONE:        ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorLevel               = PTR_EL_NONE" & vbNewLine))
        Case PTR_EL_RECOVERABLE: ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorLevel               = PTR_EL_RECOVERABLE" & vbNewLine))
        Case PTR_EL_FATAL:       ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorLevel               = PTR_EL_FATAL" & vbNewLine))
        Case Else:               ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorLevel               = Error !? (" & POSPrinter1.ErrorLevel & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.ErrorStation
        Case PTR_S_JOURNAL:           ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_JOURNAL" & vbNewLine))
        Case PTR_S_RECEIPT:           ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_RECEIPT" & vbNewLine))
        Case PTR_S_SLIP:              ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_SLIP" & vbNewLine))
        Case PTR_S_JOURNAL_RECEIPT:   ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_JOURNAL_RECEIPT" & vbNewLine))
        Case PTR_S_JOURNAL_SLIP:      ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_JOURNAL_SLIP" & vbNewLine))
        Case PTR_S_RECEIPT_SLIP:      ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_S_RECEIPT_SLIP" & vbNewLine))
        Case PTR_TWO_RECEIPT_JOURNAL: ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_TWO_RECEIPT_JOURNAL" & vbNewLine))
        Case PTR_TWO_SLIP_JOURNAL:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_TWO_SLIP_JOURNAL" & vbNewLine))
        Case PTR_TWO_SLIP_RECEIPT:    ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = PTR_TWO_SLIP_RECEIPT" & vbNewLine))
        Case Else:                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorStation             = Error !? (" & POSPrinter1.ErrorStation & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "ErrorString              = " & POSPrinter1.ErrorString & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "FontTypefaceList         = " & POSPrinter1.FontTypefaceList & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "FlagWhenIdle             = " & POSPrinter1.FlagWhenIdle & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "MapCharacterSet          = " & POSPrinter1.MapCharacterSet & vbNewLine))
    
    Select Case POSPrinter1.MapMode
        Case PTR_MM_DOTS:    ViewResultCode (POSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_DOTS" & vbNewLine))
        Case PTR_MM_TWIPS:   ViewResultCode (POSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_TWIPS" & vbNewLine))
        Case PTR_MM_ENGLISH: ViewResultCode (POSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_ENGLISH" & vbNewLine))
        Case PTR_MM_METRIC:  ViewResultCode (POSPrinter1.PrintNormal(Station, "MapMode                  = PTR_MM_METRIC" & vbNewLine))
        Case Else:           ViewResultCode (POSPrinter1.PrintNormal(Station, "MapMode                  = Error !? (" & POSPrinter1.MapMode & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.RotateSpecial
        Case PTR_RP_NORMAL:    ViewResultCode (POSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_NORMAL" & vbNewLine))
        Case PTR_RP_RIGHT90:   ViewResultCode (POSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_RIGHT90" & vbNewLine))
        Case PTR_RP_LEFT90:    ViewResultCode (POSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_LEFT90" & vbNewLine))
        Case PTR_RP_ROTATE180: ViewResultCode (POSPrinter1.PrintNormal(Station, "RotateSpecial            = PTR_RP_ROTATE180" & vbNewLine))
        Case Else:             ViewResultCode (POSPrinter1.PrintNormal(Station, "RotateSpecial            = Error !? (" & POSPrinter1.RotateSpecial & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLineChars             = " & POSPrinter1.JrnLineChars & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLineCharsList         = " & POSPrinter1.JrnLineCharsList & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLineHeight            = " & POSPrinter1.JrnLineHeight & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLineSpacing           = " & POSPrinter1.JrnLineSpacing & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLineWidth             = " & POSPrinter1.JrnLineWidth & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLetterQuality         = " & POSPrinter1.JrnLetterQuality & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnEmpty                 = " & POSPrinter1.JrnEmpty & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnNearEnd               = " & POSPrinter1.JrnNearEnd & vbNewLine))
    
    Select Case POSPrinter1.JrnCartridgeState
        Case PTR_CART_UNKNOWN:  ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_UNKNOWN" & vbNewLine))
        Case PTR_CART_REMOVED:  ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_REMOVED" & vbNewLine))
        Case PTR_CART_EMPTY:    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_EMPTY" & vbNewLine))
        Case PTR_CART_CLEANING: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_CLEANING" & vbNewLine))
        Case PTR_CART_NEAREND:  ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_NEAREND" & vbNewLine))
        Case PTR_CART_OK:       ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = PTR_CART_OK" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCartridgeState        = Error !? (" & POSPrinter1.JrnCartridgeState & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.JrnCurrentCartridge
        Case PTR_COLOR_PRIMARY: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_PRIMARY" & vbNewLine))
        Case PTR_COLOR_CUSTOM1: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM1" & vbNewLine))
        Case PTR_COLOR_CUSTOM2: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM2" & vbNewLine))
        Case PTR_COLOR_CUSTOM3: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM3" & vbNewLine))
        Case PTR_COLOR_CUSTOM4: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM4" & vbNewLine))
        Case PTR_COLOR_CUSTOM5: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM5" & vbNewLine))
        Case PTR_COLOR_CUSTOM6: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CUSTOM6" & vbNewLine))
        Case PTR_COLOR_CYAN:    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_CYAN" & vbNewLine))
        Case PTR_COLOR_MAGENTA: ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_MAGENTA" & vbNewLine))
        Case PTR_COLOR_YELLOW:  ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_YELLOW" & vbNewLine))
        Case PTR_COLOR_FULL:    ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = PTR_COLOR_FULL" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnCurrentCartridge      = Error !? (" & POSPrinter1.JrnCurrentCartridge & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLineChars             = " & POSPrinter1.RecLineChars & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLineCharsList         = " & POSPrinter1.RecLineCharsList & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLineHeight            = " & POSPrinter1.RecLineHeight & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLineSpacing           = " & POSPrinter1.RecLineSpacing & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLineWidth             = " & POSPrinter1.RecLineWidth & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLetterQuality         = " & POSPrinter1.RecLetterQuality & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecEmpty                 = " & POSPrinter1.RecEmpty & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecNearEnd               = " & POSPrinter1.RecNearEnd & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecSidewaysMaxLines      = " & POSPrinter1.RecSidewaysMaxLines & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecSidewaysMaxChars      = " & POSPrinter1.RecSidewaysMaxChars & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLinesToPaperCut       = " & POSPrinter1.RecLinesToPaperCut & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecBarCodeRotationList   = " & POSPrinter1.RecBarCodeRotationList & vbNewLine))
    
    Select Case POSPrinter1.RecCartridgeState
        Case PTR_CART_UNKNOWN:  ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_UNKNOWN" & vbNewLine))
        Case PTR_CART_REMOVED:  ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_REMOVED" & vbNewLine))
        Case PTR_CART_EMPTY:    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_EMPTY" & vbNewLine))
        Case PTR_CART_CLEANING: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_CLEANING" & vbNewLine))
        Case PTR_CART_NEAREND:  ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_NEAREND" & vbNewLine))
        Case PTR_CART_OK:       ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = PTR_CART_OK" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCartridgeState        = Error !? (" & POSPrinter1.RecCartridgeState & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.RecCurrentCartridge
        Case PTR_COLOR_PRIMARY: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_PRIMARY" & vbNewLine))
        Case PTR_COLOR_CUSTOM1: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM1" & vbNewLine))
        Case PTR_COLOR_CUSTOM2: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM2" & vbNewLine))
        Case PTR_COLOR_CUSTOM3: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM3" & vbNewLine))
        Case PTR_COLOR_CUSTOM4: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM4" & vbNewLine))
        Case PTR_COLOR_CUSTOM5: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM5" & vbNewLine))
        Case PTR_COLOR_CUSTOM6: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CUSTOM6" & vbNewLine))
        Case PTR_COLOR_CYAN:    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_CYAN" & vbNewLine))
        Case PTR_COLOR_MAGENTA: ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_MAGENTA" & vbNewLine))
        Case PTR_COLOR_YELLOW:  ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_YELLOW" & vbNewLine))
        Case PTR_COLOR_FULL:    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = PTR_COLOR_FULL" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "RecCurrentCartridge      = Error !? (" & POSPrinter1.RecCurrentCartridge & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "RecBitmapRotationList    = " & POSPrinter1.RecBitmapRotationList & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLineChars             = " & POSPrinter1.SlpLineChars & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLineCharsList         = " & POSPrinter1.SlpLineCharsList & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLineHeight            = " & POSPrinter1.SlpLineHeight & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLineSpacing           = " & POSPrinter1.SlpLineSpacing & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLineWidth             = " & POSPrinter1.SlpLineWidth & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLetterQuality         = " & POSPrinter1.SlpLetterQuality & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpEmpty                 = " & POSPrinter1.SlpEmpty & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpNearEnd               = " & POSPrinter1.SlpNearEnd & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpSidewaysMaxLines      = " & POSPrinter1.SlpSidewaysMaxLines & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpSidewaysMaxChars      = " & POSPrinter1.SlpSidewaysMaxChars & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpMaxLines              = " & POSPrinter1.SlpMaxLines & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLinesNearEndToEnd     = " & POSPrinter1.SlpLinesNearEndToEnd & vbNewLine))
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpBarCodeRotationList   = " & POSPrinter1.SlpBarCodeRotationList & vbNewLine))
    
    Select Case POSPrinter1.SlpPrintSide
        Case PTR_PS_UNKNOWN:  ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_UNKNOWN" & vbNewLine))
        Case PTR_PS_SIDE1:    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_SIDE1" & vbNewLine))
        Case PTR_PS_SIDE2:    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_SIDE2" & vbNewLine))
        Case PTR_PS_OPPOSITE: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpPrintSide             = PTR_PS_OPPOSITE" & vbNewLine))
        Case Else:            ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpPrintSide             = Error !? (" & POSPrinter1.SlpPrintSide & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.SlpCartridgeState
        Case PTR_CART_UNKNOWN:  ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_UNKNOWN" & vbNewLine))
        Case PTR_CART_REMOVED:  ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_REMOVED" & vbNewLine))
        Case PTR_CART_EMPTY:    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_EMPTY" & vbNewLine))
        Case PTR_CART_CLEANING: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_CLEANING" & vbNewLine))
        Case PTR_CART_NEAREND:  ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_NEAREND" & vbNewLine))
        Case PTR_CART_OK:       ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = PTR_CART_OK" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCartridgeState        = Error !? (" & POSPrinter1.SlpCartridgeState & ")" & vbNewLine))
    End Select
    
    Select Case POSPrinter1.SlpCurrentCartridge
        Case PTR_COLOR_PRIMARY: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_PRIMARY" & vbNewLine))
        Case PTR_COLOR_CUSTOM1: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM1" & vbNewLine))
        Case PTR_COLOR_CUSTOM2: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM2" & vbNewLine))
        Case PTR_COLOR_CUSTOM3: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM3" & vbNewLine))
        Case PTR_COLOR_CUSTOM4: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM4" & vbNewLine))
        Case PTR_COLOR_CUSTOM5: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM5" & vbNewLine))
        Case PTR_COLOR_CUSTOM6: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CUSTOM6" & vbNewLine))
        Case PTR_COLOR_CYAN:    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_CYAN" & vbNewLine))
        Case PTR_COLOR_MAGENTA: ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_MAGENTA" & vbNewLine))
        Case PTR_COLOR_YELLOW:  ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_YELLOW" & vbNewLine))
        Case PTR_COLOR_FULL:    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = PTR_COLOR_FULL" & vbNewLine))
        Case Else:              ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpCurrentCartridge      = Error !? (" & POSPrinter1.SlpCurrentCartridge & ")" & vbNewLine))
    End Select
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpBitmapRotationList    = " & POSPrinter1.SlpBitmapRotationList & vbNewLine))
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To POSPrinter1.RecLinesToPaperCut
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If POSPrinter1.CapSlpEmptySensor = False Or POSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.EndInsertion)
                
                POSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (POSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (POSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case POSPrinter1.ResultCode
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
                
                ViewResultCode (POSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    POSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        POSPrinter1.AsyncMode = True
        
        ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    POSPrinter1.FlagWhenIdle = True
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
    
    While POSPrinter1.State <> OPOS_S_IDLE
        Select Case POSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & POSPrinter1.State & ")"
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
    
    ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, "CharacterSet = " & POSPrinter1.CharacterSet & vbNewLine))
    
    For i = &H20 To &H7F Step 16
        PrintMessage = ""
        
        For j = 0 To 15
            PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
        Next j
        
        POSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
        
        POSPrinter1.BinaryConversion = OPOS_BC_NONE
    Next i
    
    If POSPrinter1.CharacterSet = 932 Then     ' Kanji
        For i = &HA0 To &HDF Step 16
            PrintMessage = ""
            
            For j = 0 To 15
                PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
            Next j
            
            POSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
            
            POSPrinter1.BinaryConversion = OPOS_BC_NONE
        Next i
    Else
        For i = &H80 To &HFF Step 16
            PrintMessage = ""
            
            For j = 0 To 15
                PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
            Next j
            
            POSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
            
            POSPrinter1.BinaryConversion = OPOS_BC_NONE
        Next i
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    
    CharacterSetBackup = POSPrinter1.CharacterSet
    
    Position = 1
    CharacterSet = 0
    
    Do
        ListCharacter = Mid(POSPrinter1.CharacterSetList, Position, 1)
        Position = Position + 1
        
        If ListCharacter = "" Or ListCharacter = "," Then
            POSPrinter1.CharacterSet = CharacterSet
            CharacterSet = 0
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, "CharacterSet = " & POSPrinter1.CharacterSet & vbNewLine))
            
            If POSPrinter1.CharacterSet = 932 Then     ' Kanji
                For i = &HA0 To &HDF Step 16
                    PrintMessage = ""
                    
                    For j = 0 To 15
                        PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
                    Next j
                    
                    POSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
                    
                    POSPrinter1.BinaryConversion = OPOS_BC_NONE
                Next i
            Else
                For i = &H80 To &HFF Step 16
                    PrintMessage = ""
                    
                    For j = 0 To 15
                        PrintMessage = PrintMessage + Right(Str(1000 + i + j), 3) + "032"
                    Next j
                    
                    POSPrinter1.BinaryConversion = OPOS_BC_DECIMAL
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "032032032032032" & PrintMessage & "013010"))
                    
                    POSPrinter1.BinaryConversion = OPOS_BC_NONE
                Next i
            End If
        
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
            
            If ListCharacter = "" Then Exit Do
        Else
            CharacterSet = CharacterSet * 10 + Val(ListCharacter)
        End If
    Loop
    
    POSPrinter1.CharacterSet = CharacterSetBackup
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To POSPrinter1.RecLinesToPaperCut
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If POSPrinter1.CapSlpEmptySensor = False Or POSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.EndInsertion)
                
                POSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (POSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (POSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case POSPrinter1.ResultCode
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
                
                ViewResultCode (POSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    POSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        POSPrinter1.AsyncMode = True
        
        ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    POSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command6_Click()
    Dim Message As String
    Dim Station As Long
    Dim LineChars As Long
    Dim i As Long
    
    While POSPrinter1.State <> OPOS_S_IDLE
        Select Case POSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & POSPrinter1.State & ")"
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
    
    ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    Select Case Station
        Case PTR_S_JOURNAL:
            LineChars = POSPrinter1.JrnLineChars
            POSPrinter1.JrnLineChars = 1
            
            Do
                i = POSPrinter1.JrnLineChars
                
                POSPrinter1.JrnLineChars = LineChars
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, "JrnLineChars (" & i & ")" & vbNewLine))
                
                POSPrinter1.JrnLineChars = i
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.JrnLineChars, "H") & vbNewLine))
                
                If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, String(Int(POSPrinter1.JrnLineChars / 2), "Ｈ") & vbNewLine))
                End If
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                
                POSPrinter1.JrnLineChars = POSPrinter1.JrnLineChars + 1
            Loop While i <> POSPrinter1.JrnLineChars
            
            POSPrinter1.JrnLineChars = LineChars
        Case PTR_S_RECEIPT:
            LineChars = POSPrinter1.RecLineChars
            POSPrinter1.RecLineChars = 1
            
            Do
                i = POSPrinter1.RecLineChars
                
                POSPrinter1.RecLineChars = LineChars
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, "RecLineChars (" & i & ")" & vbNewLine))
                
                POSPrinter1.RecLineChars = i
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.RecLineChars, "H") & vbNewLine))
                
                If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, String(Int(POSPrinter1.RecLineChars / 2), "Ｈ") & vbNewLine))
                End If
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                
                POSPrinter1.RecLineChars = POSPrinter1.RecLineChars + 1
            Loop While i <> POSPrinter1.RecLineChars
            
            POSPrinter1.RecLineChars = LineChars
        Case PTR_S_SLIP:
            LineChars = POSPrinter1.SlpLineChars
            POSPrinter1.SlpLineChars = 1
            
            Do
                i = POSPrinter1.SlpLineChars
                
                POSPrinter1.SlpLineChars = LineChars
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, "SlpLineChars (" & i & ")" & vbNewLine))
                
                POSPrinter1.SlpLineChars = i
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.SlpLineChars, "H") & vbNewLine))
                
                If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, String(Int(POSPrinter1.SlpLineChars / 2), "Ｈ") & vbNewLine))
                End If
                
                ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                
                POSPrinter1.SlpLineChars = POSPrinter1.SlpLineChars + 1
            Loop While i <> POSPrinter1.SlpLineChars
            
            POSPrinter1.SlpLineChars = LineChars
    End Select
    
    POSPrinter1.MapMode = PTR_MM_METRIC
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If POSPrinter1.CapRecBarCode = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                POSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (POSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, POSPrinter1.RecLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If POSPrinter1.CapSlpBarCode = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                POSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (POSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, POSPrinter1.SlpLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    POSPrinter1.MapMode = PTR_MM_DOTS
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If POSPrinter1.CapRecBitmap = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If POSPrinter1.CapSlpBitmap = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    If POSPrinter1.ResultCode = OPOS_SUCCESS Then
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (POSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (POSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1B") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|1B)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|1B" & vbNewLine))
        End If
        
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (POSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (POSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2B") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|2B)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2B" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.SetLogo(PTR_L_TOP, "StarMicronics(TopLogo)" & vbNewLine))
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|tL") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|tL)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|tL" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.SetLogo(PTR_L_BOTTOM, "StarMicronics(BottomLogo)" & vbNewLine))
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bL") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|bL)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bL" & vbNewLine))
        End If
    End If
    
    ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_ROTATE180 Or PTR_RP_BITMAP Or PTR_RP_BARCODE))
    
    POSPrinter1.MapMode = PTR_MM_METRIC
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If POSPrinter1.CapRecBarCode = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                POSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (POSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, POSPrinter1.RecLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If POSPrinter1.CapSlpBarCode = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBarCode (PTR_BCS_Code39)" & vbNewLine))
                
                POSPrinter1.RotateSpecial = PTR_RP_NORMAL
                
                ViewResultCode (POSPrinter1.PrintBarCode(Station, "1234567890", PTR_BCS_Code39, 1000, POSPrinter1.SlpLineWidth / 2, PTR_BC_CENTER, PTR_BC_TEXT_BELOW))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    POSPrinter1.MapMode = PTR_MM_DOTS
    
    Select Case Station
        Case PTR_S_RECEIPT:
            If POSPrinter1.CapRecBitmap = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
        Case PTR_S_SLIP:
            If POSPrinter1.CapSlpBitmap = True Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "PrintBitmap (StarLogo1.bmp)" & vbNewLine))
                
                ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
                
                If POSPrinter1.ResultCode = OPOS_SUCCESS Then
                    ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
                Else
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "Not Support !?" & vbNewLine & vbNewLine))
                End If
            End If
    End Select
    
    If POSPrinter1.ResultCode = OPOS_SUCCESS Then
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (POSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (POSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1B") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|1B)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|1B" & vbNewLine))
        End If
        
        Select Case Station
            Case PTR_S_RECEIPT: ViewResultCode (POSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
            Case PTR_S_SLIP:    ViewResultCode (POSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
        End Select
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2B") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetBitmap (<ESC>|2B)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2B" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.SetLogo(PTR_L_TOP, "StarMicronics(TopLogo)" & vbNewLine))
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|tL") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|tL)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|tL" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.SetLogo(PTR_L_BOTTOM, "StarMicronics(BottomLogo)" & vbNewLine))
        
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bL") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "SetLogo (<ESC>|bL)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bL" & vbNewLine))
        End If
    End If
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To POSPrinter1.RecLinesToPaperCut
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If POSPrinter1.CapSlpEmptySensor = False Or POSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.EndInsertion)
                
                POSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (POSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (POSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case POSPrinter1.ResultCode
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
                
                ViewResultCode (POSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    POSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        POSPrinter1.AsyncMode = True
        
        ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    POSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command7_Click()
    Dim Message As String
    Dim Station As Long
    Dim i As Long
    
    While POSPrinter1.State <> OPOS_S_IDLE
        Select Case POSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & POSPrinter1.State & ")"
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
    
    ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|90P") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Paper cut (<ESC>|#P)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & vbNewLine))
        
        If Station = PTR_S_RECEIPT Then
            For i = 1 To POSPrinter1.RecLinesToPaperCut
                ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
            Next i
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|90P"))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|90fP") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed and Paper cut (<ESC>|#fP)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & vbNewLine & Chr$(&H1B) & "|90fP"))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|90sP") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed, Paper cut, and Stamp (<ESC>|#sP)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & vbNewLine & Chr$(&H1B) & "|90sP"))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|sL") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Fire stamp (<ESC>|sL)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|sL" & vbNewLine))
    End If
    
    Select Case Station
        Case PTR_S_RECEIPT: ViewResultCode (POSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
        Case PTR_S_SLIP:    ViewResultCode (POSPrinter1.SetBitmap(1, Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
    End Select
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1B") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Print bitmap (<ESC>|1B)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|1B" & vbNewLine))
    End If
    
    Select Case Station
        Case PTR_S_RECEIPT: ViewResultCode (POSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_CENTER))
        Case PTR_S_SLIP:    ViewResultCode (POSPrinter1.SetBitmap(2, Station, App.Path & "\\StarLogo2.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_CENTER))
    End Select
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2B") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Print bitmap (<ESC>|2B)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2B" & vbNewLine))
    End If
    
    ViewResultCode (POSPrinter1.SetLogo(PTR_L_TOP, "StarMicronics(TopLogo)" & vbNewLine))
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|tL") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Print top logo (<ESC>|tL)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|tL" & vbNewLine))
    End If
    
    ViewResultCode (POSPrinter1.SetLogo(PTR_L_BOTTOM, "StarMicronics(BottomLogo)" & vbNewLine))
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bL") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Print bottom logo (<ESC>|bL)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bL" & vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2lF") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed lines (<ESC>|#lF)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|2lF"))
    End If
    
    Select Case Station
        Case PTR_S_JOURNAL:
            If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & POSPrinter1.JrnLineSpacing * 2 & "uF") = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed units (<ESC>|#uF)" & vbNewLine))
                ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|" & POSPrinter1.JrnLineSpacing * 2 & "uF"))
            End If
        Case PTR_S_RECEIPT:
            If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & POSPrinter1.RecLineSpacing * 2 & "uF") = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed units (<ESC>|#uF)" & vbNewLine))
                ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|" & POSPrinter1.RecLineSpacing * 2 & "uF"))
            End If
        Case PTR_S_SLIP:
            If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & POSPrinter1.SlpLineSpacing * 2 & "uF") = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed units (<ESC>|#uF)" & vbNewLine))
                ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics" & Chr$(&H1B) & "|" & POSPrinter1.SlpLineSpacing * 2 & "uF"))
            End If
    End Select
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2rF") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Feed reverse (<ESC>|#rF)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & "StarMicronics(1)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2rF" & "     " & "StarMicronics(2)" & vbNewLine & vbNewLine & vbNewLine))
    End If
    
    For i = 1 To 8
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & i & "fT") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "Font typeface selection (<ESC>|" & i & "fT)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "fT" & "StarMicronics" & vbNewLine))
            
            If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "fT" & "スター精密株式会社" & vbNewLine))
            End If
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        End If
    Next i
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|0fT") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Font typeface selection (<ESC>|0fT)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|0fT" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|0fT" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|bC") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Bold (<ESC>|bC)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bC" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|bC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Underline (<ESC>|#uC)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|uC" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|uC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|iC") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Italic (<ESC>|iC)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|iC" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|iC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rC") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Alternate color (Red) (<ESC>|rC)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rC" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rvC") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Reverse video (<ESC>|rvC)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rvC" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|rvC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|sC") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Shading (<ESC>|#sC)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|sC" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|sC" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|1C") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Single high & wide (<ESC>|1C)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|1C" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|1C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Double wide (<ESC>|2C)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|2C" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|2C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|3C") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Double high (<ESC>|3C)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|3C" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|3C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|4C") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Double high & wide (<ESC>|4C)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|4C" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|4C" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    For i = 1 To 8
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & i & "hC") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "Scale horizontally (<ESC>|" & i & "hC)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "hC" & "StarMicronics" & vbNewLine))
            
            If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "hC" & "スター精密株式会社" & vbNewLine))
            End If
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        End If
    Next i
    
    For i = 1 To 8
        If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|" & i & "vC") = OPOS_SUCCESS Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, "Scale vertically (<ESC>|" & i & "vC)" & vbNewLine))
            ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "vC" & "StarMicronics" & vbNewLine))
            
            If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, "     " & Chr$(&H1B) & "|" & i & "vC" & "スター精密株式会社" & vbNewLine))
            End If
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        End If
    Next i
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Center (<ESC>|cA)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Right justify (<ESC>|rA)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|N") = OPOS_SUCCESS Then
        ViewResultCode (POSPrinter1.PrintNormal(Station, "Normal (<ESC>|N)" & vbNewLine))
        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|N" & "     " & "StarMicronics" & vbNewLine))
        
        If POSPrinter1.CapCharacterSet = PTR_CCS_KANJI Then
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|N" & "     " & "スター精密株式会社" & vbNewLine))
        End If
        
        ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
    End If
    
    If Station = PTR_S_RECEIPT Then
        For i = 1 To POSPrinter1.RecLinesToPaperCut
            ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
        Next i
    End If
    
    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
    
    If Station = PTR_S_SLIP Then
        Do
            If POSPrinter1.CapSlpEmptySensor = False Or POSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.EndInsertion)
                
                POSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (POSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (POSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case POSPrinter1.ResultCode
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
                
                ViewResultCode (POSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    POSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        POSPrinter1.AsyncMode = True
        
        ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    POSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command8_Click()
    Dim DateMes As String
    Dim TimeMes As String
    Dim Message As String
    Dim Station As Long
    Dim i As Long
    
    While POSPrinter1.State <> OPOS_S_IDLE
        Select Case POSPrinter1.State
            Case OPOS_S_CLOSED: Message = "State = OPOS_S_CLOSED"
            Case OPOS_S_IDLE:   Message = "State = OPOS_S_IDLE"
            Case OPOS_S_BUSY:   Message = "State = OPOS_S_BUSY"
            Case OPOS_S_ERROR:  Message = "State = OPOS_S_ERROR"
            Case Else:          Message = "State = Error !? (" & POSPrinter1.State & ")"
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
    
    ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_TRANSACTION))
    
    Select Case Station
        Case PTR_S_JOURNAL:
            ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
            
            If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
            Else
                ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.JrnLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
            End If
            
            Select Case POSPrinter1.CapCharacterSet
                Case PTR_CCS_ASCII:
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Apple" & Space(POSPrinter1.JrnLineChars - Len("Apple$20.00")) & "$20.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Banana" & Space(POSPrinter1.JrnLineChars - Len("Banana$30.00")) & "$30.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Grape" & Space(POSPrinter1.JrnLineChars - Len("Grape$40.00")) & "$40.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Lemon" & Space(POSPrinter1.JrnLineChars - Len("Lemon$50.00")) & "$50.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Orange" & Space(POSPrinter1.JrnLineChars - Len("Orange$60.00")) & "$60.00" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Subtotal" & Space(POSPrinter1.JrnLineChars - Len("Subtotal") - Len("$200.00")) & "$200.00" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "Tax" & Space(POSPrinter1.JrnLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Tax" & Space(POSPrinter1.JrnLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.JrnLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "Total" & Space(POSPrinter1.JrnLineChars / 2 - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Received" & Space(POSPrinter1.JrnLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "Change" & Space(POSPrinter1.JrnLineChars / 2 - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Total" & Space(POSPrinter1.JrnLineChars - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Received" & Space(POSPrinter1.JrnLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Change" & Space(POSPrinter1.JrnLineChars - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    End If
                Case PTR_CCS_KANA:
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾘﾝｺﾞ" & Space(POSPrinter1.JrnLineChars - Len("ﾘﾝｺﾞ\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾊﾞﾅﾅ" & Space(POSPrinter1.JrnLineChars - Len("ﾊﾞﾅﾅ\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾌﾞﾄﾞｳ" & Space(POSPrinter1.JrnLineChars - Len("ﾌﾞﾄﾞｳ\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾚﾓﾝ" & Space(POSPrinter1.JrnLineChars - Len("ﾚﾓﾝ\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾐｶﾝ" & Space(POSPrinter1.JrnLineChars - Len("ﾐｶﾝ\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｼｮｳｹｲ" & Space(POSPrinter1.JrnLineChars - Len("ｼｮｳｹｲ") - Len("\20,000")) & "\20,000" & vbNewLine))
                
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "ｼｮｳﾋｾﾞｲ" & Space(POSPrinter1.JrnLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｼｮｳﾋｾﾞｲ" & Space(POSPrinter1.JrnLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.JrnLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "ｺﾞｳｹｲ" & Space(POSPrinter1.JrnLineChars / 2 - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(POSPrinter1.JrnLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "ｵﾂﾘ" & Space(POSPrinter1.JrnLineChars / 2 - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｺﾞｳｹｲ" & Space(POSPrinter1.JrnLineChars - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(POSPrinter1.JrnLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵﾂﾘ" & Space(POSPrinter1.JrnLineChars - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
                Case PTR_CCS_KANJI:
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "りんご" & Space(POSPrinter1.JrnLineChars - Len("りんご") * 2 - Len("\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "バナナ" & Space(POSPrinter1.JrnLineChars - Len("バナナ") * 2 - Len("\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ぶどう" & Space(POSPrinter1.JrnLineChars - Len("ぶどう") * 2 - Len("\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "レモン" & Space(POSPrinter1.JrnLineChars - Len("レモン") * 2 - Len("\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "みかん" & Space(POSPrinter1.JrnLineChars - Len("みかん") * 2 - Len("\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "小計" & Space(POSPrinter1.JrnLineChars - Len("小計") * 2 - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "消費税" & Space(POSPrinter1.JrnLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "消費税" & Space(POSPrinter1.JrnLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.JrnLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "合計" & Space(POSPrinter1.JrnLineChars / 2 - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お預かり" & Space(POSPrinter1.JrnLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "お釣り" & Space(POSPrinter1.JrnLineChars / 2 - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "合計" & Space(POSPrinter1.JrnLineChars - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お預かり" & Space(POSPrinter1.JrnLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お釣り" & Space(POSPrinter1.JrnLineChars - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
            End Select
        Case PTR_S_RECEIPT:
            ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
            
            Select Case POSPrinter1.CapCharacterSet
                Case PTR_CCS_ASCII:
                    ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_RIGHT))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.RecLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.RecLineChars - Len("Thank you for your coming. ")) / 2) & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.RecLineChars - Len("We hope you'll visit again.")) / 2) & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.RecLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Apple" & Space(POSPrinter1.RecLineChars - Len("Apple$20.00")) & "$20.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Banana" & Space(POSPrinter1.RecLineChars - Len("Banana$30.00")) & "$30.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Grape" & Space(POSPrinter1.RecLineChars - Len("Grape$40.00")) & "$40.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Lemon" & Space(POSPrinter1.RecLineChars - Len("Lemon$50.00")) & "$50.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Orange" & Space(POSPrinter1.RecLineChars - Len("Orange$60.00")) & "$60.00" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Subtotal" & Space(POSPrinter1.RecLineChars - Len("Subtotal") - Len("$200.00")) & "$200.00" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "Tax" & Space(POSPrinter1.RecLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Tax" & Space(POSPrinter1.RecLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.RecLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "Total" & Space(POSPrinter1.RecLineChars / 2 - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Received" & Space(POSPrinter1.RecLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "Change" & Space(POSPrinter1.RecLineChars / 2 - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Total" & Space(POSPrinter1.RecLineChars - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Received" & Space(POSPrinter1.RecLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Change" & Space(POSPrinter1.RecLineChars - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    End If
                Case PTR_CCS_KANA:
                    ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_RIGHT))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.RecLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.RecLineChars - Len("ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡")) / 2) & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.RecLineChars - Len("ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ ")) / 2) & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.RecLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾘﾝｺﾞ" & Space(POSPrinter1.RecLineChars - Len("ﾘﾝｺﾞ\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾊﾞﾅﾅ" & Space(POSPrinter1.RecLineChars - Len("ﾊﾞﾅﾅ\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾌﾞﾄﾞｳ" & Space(POSPrinter1.RecLineChars - Len("ﾌﾞﾄﾞｳ\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾚﾓﾝ" & Space(POSPrinter1.RecLineChars - Len("ﾚﾓﾝ\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾐｶﾝ" & Space(POSPrinter1.RecLineChars - Len("ﾐｶﾝ\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｼｮｳｹｲ" & Space(POSPrinter1.RecLineChars - Len("ｼｮｳｹｲ") - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "ｼｮｳﾋｾﾞｲ" & Space(POSPrinter1.RecLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｼｮｳﾋｾﾞｲ" & Space(POSPrinter1.RecLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.RecLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "ｺﾞｳｹｲ" & Space(POSPrinter1.RecLineChars / 2 - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(POSPrinter1.RecLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "ｵﾂﾘ" & Space(POSPrinter1.RecLineChars / 2 - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｺﾞｳｹｲ" & Space(POSPrinter1.RecLineChars - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(POSPrinter1.RecLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵﾂﾘ" & Space(POSPrinter1.RecLineChars - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
                Case PTR_CCS_KANJI:
                    ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.RecLineWidth / 2, PTR_BM_RIGHT))

                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.RecLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.RecLineChars - Len("お買い上げありがとうございました。") * 2) / 2) & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.RecLineChars - Len("またのご来店をお待ちしております。") * 2) / 2) & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.RecLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If

                    ViewResultCode (POSPrinter1.PrintNormal(Station, "りんご" & Space(POSPrinter1.RecLineChars - Len("りんご") * 2 - Len("\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "バナナ" & Space(POSPrinter1.RecLineChars - Len("バナナ") * 2 - Len("\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ぶどう" & Space(POSPrinter1.RecLineChars - Len("ぶどう") * 2 - Len("\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "レモン" & Space(POSPrinter1.RecLineChars - Len("レモン") * 2 - Len("\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "みかん" & Space(POSPrinter1.RecLineChars - Len("みかん") * 2 - Len("\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "小計" & Space(POSPrinter1.RecLineChars - Len("小計") * 2 - Len("\20,000")) & "\20,000" & vbNewLine))

                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "消費税" & Space(POSPrinter1.RecLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "消費税" & Space(POSPrinter1.RecLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.RecLineChars, "-") & vbNewLine))
                    End If

                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "合計" & Space(POSPrinter1.RecLineChars / 2 - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お預かり" & Space(POSPrinter1.RecLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "お釣り" & Space(POSPrinter1.RecLineChars / 2 - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "合計" & Space(POSPrinter1.RecLineChars - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お預かり" & Space(POSPrinter1.RecLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お釣り" & Space(POSPrinter1.RecLineChars - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
            End Select
            
            For i = 1 To POSPrinter1.RecLinesToPaperCut
                ViewResultCode (POSPrinter1.PrintNormal(Station, vbNewLine))
            Next i
            
            ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|P"))
        Case PTR_S_SLIP:
            ViewResultCode (POSPrinter1.RotatePrint(Station, PTR_RP_NORMAL))
            
            Select Case POSPrinter1.CapCharacterSet
                Case PTR_CCS_ASCII:
                    ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_RIGHT))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.SlpLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.SlpLineChars - Len("Thank you for your coming. ")) / 2) & "Thank you for your coming. " & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.SlpLineChars - Len("We hope you'll visit again.")) / 2) & "We hope you'll visit again." & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.SlpLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Apple" & Space(POSPrinter1.SlpLineChars - Len("Apple$20.00")) & "$20.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Banana" & Space(POSPrinter1.SlpLineChars - Len("Banana$30.00")) & "$30.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Grape" & Space(POSPrinter1.SlpLineChars - Len("Grape$40.00")) & "$40.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Lemon" & Space(POSPrinter1.SlpLineChars - Len("Lemon$50.00")) & "$50.00" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "Orange" & Space(POSPrinter1.SlpLineChars - Len("Orange$60.00")) & "$60.00" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Subtotal" & Space(POSPrinter1.SlpLineChars - Len("Subtotal") - Len("$200.00")) & "$200.00" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "Tax" & Space(POSPrinter1.SlpLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Tax" & Space(POSPrinter1.SlpLineChars - Len("Tax") - Len("$10.00")) & "$10.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.SlpLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "Total" & Space(POSPrinter1.SlpLineChars / 2 - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Received" & Space(POSPrinter1.SlpLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "Change" & Space(POSPrinter1.SlpLineChars / 2 - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "Total" & Space(POSPrinter1.SlpLineChars - Len("Total") - Len("$210.00")) & "$210.00" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Received" & Space(POSPrinter1.SlpLineChars - Len("Received") - Len("$300.00")) & "$300.00" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "Change" & Space(POSPrinter1.SlpLineChars - Len("Change") - Len("$90.00")) & "$90.00" & vbNewLine))
                    End If
                Case PTR_CCS_KANA:
                    ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_RIGHT))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.SlpLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.SlpLineChars - Len("ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡")) / 2) & "ｵｶｲｱｹﾞｱﾘｶﾞﾄｳｺﾞｻﾞｲﾏｼﾀ｡" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.SlpLineChars - Len("ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ ")) / 2) & "ﾏﾀﾉｺﾞﾗｲﾃﾝｦｵﾏﾁｼﾃｵﾘﾏｽ｡ " & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.SlpLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾘﾝｺﾞ" & Space(POSPrinter1.SlpLineChars - Len("ﾘﾝｺﾞ\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾊﾞﾅﾅ" & Space(POSPrinter1.SlpLineChars - Len("ﾊﾞﾅﾅ\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾌﾞﾄﾞｳ" & Space(POSPrinter1.SlpLineChars - Len("ﾌﾞﾄﾞｳ\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾚﾓﾝ" & Space(POSPrinter1.SlpLineChars - Len("ﾚﾓﾝ\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ﾐｶﾝ" & Space(POSPrinter1.SlpLineChars - Len("ﾐｶﾝ\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｼｮｳｹｲ" & Space(POSPrinter1.SlpLineChars - Len("ｼｮｳｹｲ") - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "ｼｮｳﾋｾﾞｲ" & Space(POSPrinter1.SlpLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｼｮｳﾋｾﾞｲ" & Space(POSPrinter1.SlpLineChars - Len("ｼｮｳﾋｾﾞｲ") - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.SlpLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "ｺﾞｳｹｲ" & Space(POSPrinter1.SlpLineChars / 2 - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(POSPrinter1.SlpLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "ｵﾂﾘ" & Space(POSPrinter1.SlpLineChars / 2 - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "ｺﾞｳｹｲ" & Space(POSPrinter1.SlpLineChars - Len("ｺﾞｳｹｲ") - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵｱｽﾞｶﾘ" & Space(POSPrinter1.SlpLineChars - Len("ｵｱｽﾞｶﾘ") - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "ｵﾂﾘ" & Space(POSPrinter1.SlpLineChars - Len("ｵﾂﾘ") - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
                Case PTR_CCS_KANJI:
                    ViewResultCode (POSPrinter1.PrintBitmap(Station, App.Path & "\\StarLogo1.bmp", POSPrinter1.SlpLineWidth / 2, PTR_BM_RIGHT))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|rA") = OPOS_SUCCESS And POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|cA") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|cA" & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|rA" & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.SlpLineChars - Len("TEL 9999-99-9999")) & "TEL 9999-99-9999" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.SlpLineChars - Len("お買い上げありがとうございました。") * 2) / 2) & "お買い上げありがとうございました。" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space((POSPrinter1.SlpLineChars - Len("またのご来店をお待ちしております。") * 2) / 2) & "またのご来店をお待ちしております。" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Space(POSPrinter1.SlpLineChars - Len(DateMes & "  " & TimeMes)) & DateMes & "  " & TimeMes & vbNewLine & vbNewLine))
                    End If
                    
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "りんご" & Space(POSPrinter1.SlpLineChars - Len("りんご") * 2 - Len("\2,000")) & "\2,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "バナナ" & Space(POSPrinter1.SlpLineChars - Len("バナナ") * 2 - Len("\3,000")) & "\3,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "ぶどう" & Space(POSPrinter1.SlpLineChars - Len("ぶどう") * 2 - Len("\4,000")) & "\4,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "レモン" & Space(POSPrinter1.SlpLineChars - Len("レモン") * 2 - Len("\5,000")) & "\5,000" & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, "みかん" & Space(POSPrinter1.SlpLineChars - Len("みかん") * 2 - Len("\6,000")) & "\6,000" & vbNewLine & vbNewLine))
                    ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "小計" & Space(POSPrinter1.SlpLineChars - Len("小計") * 2 - Len("\20,000")) & "\20,000" & vbNewLine))
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|uC") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|uC" & "消費税" & Space(POSPrinter1.SlpLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "消費税" & Space(POSPrinter1.SlpLineChars - Len("消費税") * 2 - Len("\1,000")) & "\1,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, String(POSPrinter1.SlpLineChars, "-") & vbNewLine))
                    End If
                    
                    If POSPrinter1.ValidateData(Station, Chr$(&H1B) & "|2C") = OPOS_SUCCESS Then
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & Chr$(&H1B) & "|2C" & "合計" & Space(POSPrinter1.SlpLineChars / 2 - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お預かり" & Space(POSPrinter1.SlpLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|2C" & "お釣り" & Space(POSPrinter1.SlpLineChars / 2 - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    Else
                        ViewResultCode (POSPrinter1.PrintNormal(Station, Chr$(&H1B) & "|bC" & "合計" & Space(POSPrinter1.SlpLineChars - Len("合計") * 2 - Len("\21,000")) & "\21,000" & vbNewLine & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お預かり" & Space(POSPrinter1.SlpLineChars - Len("お預かり") * 2 - Len("\30,000")) & "\30,000" & vbNewLine))
                        ViewResultCode (POSPrinter1.PrintNormal(Station, "お釣り" & Space(POSPrinter1.SlpLineChars - Len("お釣り") * 2 - Len("\9,000")) & "\9,000" & vbNewLine))
                    End If
            End Select
    End Select
    
    If Station = PTR_S_SLIP Then
        Do
            If POSPrinter1.CapSlpEmptySensor = False Or POSPrinter1.BeginInsertion(5000) = OPOS_SUCCESS Then
                ViewResultCode (POSPrinter1.EndInsertion)
                
                POSPrinter1.AsyncMode = False     'Synchronous
                
                ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
                
                ViewResultCode (POSPrinter1.BeginRemoval(OPOS_FOREVER))
                
                ViewResultCode (POSPrinter1.EndRemoval)
                
                Exit Do
            Else
                Select Case POSPrinter1.ResultCode
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
                
                ViewResultCode (POSPrinter1.EndInsertion)
                
                If MsgBox(Message, vbRetryCancel + vbQuestion) = vbCancel Then
                    POSPrinter1.ClearOutput
                    
                    Exit Do
                End If
            End If
        Loop While True
    Else
        POSPrinter1.AsyncMode = True
        
        ViewResultCode (POSPrinter1.TransactionPrint(Station, PTR_TP_NORMAL))
    End If
    
    Check5.Value = 0
    
    POSPrinter1.FlagWhenIdle = True
End Sub

Private Sub Command9_Click()
    POSPrinter1.DeviceEnabled = False
    
    ViewResultCode (POSPrinter1.ResultCode)
    
    If POSPrinter1.ResultCode = OPOS_SUCCESS Then     'POSPrinter1.ResultCode <> OPOS_E_BUSY
        Check1.Enabled = False
        Check2.Enabled = False
        Check3.Enabled = False
        Check4.Enabled = False
        Check5.Enabled = False
    End If
End Sub

Private Sub Command10_Click()
    ViewResultCode (POSPrinter1.ReleaseDevice)
    
    Check1.Enabled = False
    Check2.Enabled = False
    Check3.Enabled = False
    Check4.Enabled = False
    Check5.Enabled = False
End Sub

Private Sub Command11_Click()
    ViewResultCode (POSPrinter1.Close)
    
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
'   While Not (POSPrinter1.State = OPOS_S_CLOSED Or POSPrinter1.State = OPOS_S_IDLE)
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

