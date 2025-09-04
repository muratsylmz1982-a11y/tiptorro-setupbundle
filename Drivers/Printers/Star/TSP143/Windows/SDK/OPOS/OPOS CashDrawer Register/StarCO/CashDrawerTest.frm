VERSION 5.00
Object = "{B9F4E283-B024-11D1-89AC-00C04FCAF6E3}#1.0#0"; "CashDrawerCO.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "OPOS CashDrawerTest"
   ClientHeight    =   6165
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3405
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6165
   ScaleWidth      =   3405
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   200
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   400
      Width           =   3000
   End
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Height          =   2940
      Left            =   100
      TabIndex        =   2
      Top             =   800
      Width           =   3200
      Begin VB.CommandButton Command1 
         Caption         =   "Open"
         Height          =   250
         Left            =   100
         TabIndex        =   3
         Top             =   100
         Width           =   3000
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Claim (0)"
         Height          =   250
         Left            =   100
         TabIndex        =   4
         Top             =   450
         Width           =   3000
      End
      Begin VB.CommandButton Command3 
         Caption         =   "DeviceEnabled (True)"
         Height          =   250
         Left            =   100
         TabIndex        =   5
         Top             =   800
         Width           =   3000
      End
      Begin VB.CommandButton Command4 
         Caption         =   "OpenDrawer"
         Height          =   250
         Left            =   100
         TabIndex        =   6
         Top             =   1150
         Width           =   3000
      End
      Begin VB.CommandButton Command5 
         Caption         =   "WaitForDrawerClose (0)"
         Height          =   250
         Left            =   100
         TabIndex        =   7
         Top             =   1500
         Width           =   3000
      End
      Begin VB.CommandButton Command6 
         Caption         =   "DeviceEnabled (False)"
         Height          =   250
         Left            =   100
         TabIndex        =   8
         Top             =   1850
         Width           =   3000
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Release"
         Height          =   250
         Left            =   100
         TabIndex        =   9
         Top             =   2200
         Width           =   3000
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Close"
         Height          =   250
         Left            =   100
         TabIndex        =   10
         Top             =   2550
         Width           =   3000
      End
   End
   Begin VB.TextBox Text1 
      Height          =   1005
      Left            =   200
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   3800
      Width           =   3000
   End
   Begin VB.Frame Frame2 
      BorderStyle     =   0  'None
      Height          =   500
      Left            =   100
      TabIndex        =   12
      Top             =   4920
      Width           =   3200
      Begin VB.CheckBox Check1 
         Caption         =   "DrawerOpened"
         DragMode        =   1  'Automatic
         Enabled         =   0   'False
         Height          =   250
         Left            =   100
         TabIndex        =   13
         TabStop         =   0   'False
         Top             =   100
         Width           =   3000
      End
   End
   Begin VB.Frame Frame3 
      BorderStyle     =   0  'None
      Height          =   500
      Left            =   100
      TabIndex        =   14
      Top             =   5520
      Width           =   3200
      Begin VB.CommandButton Command9 
         Caption         =   "&Exit"
         Height          =   250
         Left            =   1600
         TabIndex        =   15
         Top             =   100
         Width           =   1500
      End
   End
   Begin SMJOPOSCashDrawerControlObjectLib.CashDrawer CashDrawer1 
      Left            =   195
      Top             =   4965
      _Version        =   65536
      _ExtentX        =   2487
      _ExtentY        =   1402
      _StockProps     =   0
   End
   Begin VB.Label Label1 
      Caption         =   "CashDrawer Select"
      Height          =   255
      Left            =   200
      TabIndex        =   0
      Top             =   100
      Width           =   3000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub CashDrawer1_StatusUpdateEvent(ByVal Status As Long)
    Select Case Status
        Case OPOS_SUE_POWER_ONLINE:      Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_ONLINE" + vbNewLine
        Case OPOS_SUE_POWER_OFF:         Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_OFF" + vbNewLine
        Case OPOS_SUE_POWER_OFFLINE:     Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_OFFLINE" + vbNewLine
        Case OPOS_SUE_POWER_OFF_OFFLINE: Text1.Text = Text1.Text + "Event : OPOS_SUE_POWER_OFF_OFFLINE" + vbNewLine
        Case CASH_SUE_DRAWERCLOSED:      Text1.Text = Text1.Text + "Event : CASH_SUE_DRAWERCLOSED" + vbNewLine
        Case CASH_SUE_DRAWEROPEN:        Text1.Text = Text1.Text + "Event : CASH_SUE_DRAWEROPEN" + vbNewLine
        Case Else:                       Text1.Text = Text1.Text + "Event : Status Error !?" + vbNewLine
    End Select
    
    Select Case Status
        Case CASH_SUE_DRAWERCLOSED: Check1.Value = 0
        Case CASH_SUE_DRAWEROPEN:   Check1.Value = 1
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
    
    Res = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "Software\OLEforRetail\ServiceOPOS\CashDrawer", 0, KEY_READ, KeyHandle)
    
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

Private Sub Command1_Click()
    ViewResultCode (CashDrawer1.Open(Combo1.Text))
End Sub

Private Sub Command2_Click()
    ViewResultCode (CashDrawer1.ClaimDevice(0))
End Sub

Private Sub Command3_Click()
    CashDrawer1.PowerNotify = OPOS_PN_ENABLED
    
    CashDrawer1.DeviceEnabled = True
    
    ViewResultCode (CashDrawer1.ResultCode)
    
    If CashDrawer1.CapStatus = True Then Check1.Enabled = True
    
    If CashDrawer1.DrawerOpened = True Then
        Check1.Value = 1
    Else
        Check1.Value = 0
    End If
End Sub

Private Sub Command4_Click()
    ViewResultCode (CashDrawer1.OpenDrawer)
End Sub

Private Sub Command5_Click()
    ViewResultCode (CashDrawer1.WaitForDrawerClose(0, 0, 0, 0))
End Sub

Private Sub Command6_Click()
    CashDrawer1.DeviceEnabled = False
    
    ViewResultCode (CashDrawer1.ResultCode)
    
    Check1.Enabled = False
End Sub

Private Sub Command7_Click()
    ViewResultCode (CashDrawer1.ReleaseDevice)
    
'   Check1.Enabled = False
End Sub

Private Sub Command8_Click()
    ViewResultCode (CashDrawer1.Close)
    
    Check1.Enabled = False
End Sub

Private Sub Command9_Click()
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

