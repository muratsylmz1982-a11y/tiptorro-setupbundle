Attribute VB_Name = "Module1"
Rem *///////////////////////////////////////////////////////////////////
Rem *///////////////////////////////////////////////////////////////////
Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OPOSALL.BAS
Rem *
Rem *   Includes all OPOS Device Classes.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 96-03-18 OPOS Release 1.01                                    CRM
Rem * 96-04-22 OPOS Release 1.1                                     CRM
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem * 98-03-06 OPOS Release 1.3                                     CRM
Rem * 99-06-18 OPOS Release 1.4 and 1.5                             CRM
Rem * 00-09-24 OPOS Release 1.5                                     BKS
Rem * 01-07-15 OPOS Release 1.6                                 THH/BKS
Rem * 02-08-17 OPOS Release 1.7                                     CRM
Rem * 04-03-22 OPOS Release 1.8                                     CRM
Rem *
Rem *  Note: This file is not actively maintained.
Rem *        The recommended source of up-to-date constants is the
Rem *          file Opos_Constants.dll. Add a reference to it, then
Rem *          use VB's Object Browser to find the constants.
Rem *
Rem *///////////////////////////////////////////////////////////////////
Rem *///////////////////////////////////////////////////////////////////
Rem *///////////////////////////////////////////////////////////////////



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * Opos.h
Rem *
Rem *   General header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem *   Add OPOS_FOREVER.
Rem *   Add BinaryConversion values.
Rem * 98-03-06 OPOS Release 1.3                                     CRM
Rem *   Add CapPowerReporting, PowerState, and PowerNotify values.
Rem *   Add power reporting values for StatusUpdateEvent.
Rem * 00-09-24 OPOS Release 1.5                                     CRM
Rem *   Add OpenResult status values.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * OPOS "State" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_S_CLOSED = 1
Public Const OPOS_S_IDLE = 2
Public Const OPOS_S_BUSY = 3
Public Const OPOS_S_ERROR = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * OPOS "ResultCode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_SUCCESS = 0
Public Const OPOS_E_CLOSED = 101
Public Const OPOS_E_CLAIMED = 102
Public Const OPOS_E_NOTCLAIMED = 103
Public Const OPOS_E_NOSERVICE = 104
Public Const OPOS_E_DISABLED = 105
Public Const OPOS_E_ILLEGAL = 106
Public Const OPOS_E_NOHARDWARE = 107
Public Const OPOS_E_OFFLINE = 108
Public Const OPOS_E_NOEXIST = 109
Public Const OPOS_E_EXISTS = 110
Public Const OPOS_E_FAILURE = 111
Public Const OPOS_E_TIMEOUT = 112
Public Const OPOS_E_BUSY = 113
Public Const OPOS_E_EXTENDED = 114

Public Const OPOSERR = 100       ' Base for ResultCode errors.
Public Const OPOSERREXT = 200    ' Base for ResultCodeExtendedErrors.


Rem *///////////////////////////////////////////////////////////////////
Rem * OPOS "OpenResult" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Rem * The following can be set by the control object.
Public Const OPOS_OR_ALREADYOPEN = 301
    ' Control Object already open.
Public Const OPOS_OR_REGBADNAME = 302
    ' The registry does not contain a key for the specified
    ' device name.
Public Const OPOS_OR_REGPROGID = 303
    ' Could not read the device name key's default value, or
    ' could not convert this Prog ID to a valid Class ID.
Public Const OPOS_OR_CREATE = 304
    ' Could not create a service object instance, or
    ' could not get its IDispatch interface.
Public Const OPOS_OR_BADIF = 305
    ' The service object does not support one or more of the
    ' method required by its release.
Public Const OPOS_OR_FAILEDOPEN = 306
    ' The service object returned a failure status from its
    ' open call, but doesn't have a more specific failure code.
Public Const OPOS_OR_BADVERSION = 307
    ' The service object major version number is not 1.

Rem * The following can be returned by the service object if it
Rem * returns a failure status from its open call.
Public Const OPOS_ORS_NOPORT = 401
    ' Port access required at open, but configured port
    ' is invalid or inaccessible.
Public Const OPOS_ORS_NOTSUPPORTED = 402
    ' Service Object does not support the specified device.
Public Const OPOS_ORS_CONFIG = 403
    ' Configuration information error.
Public Const OPOS_ORS_SPECIFIC = 450
    ' Errors greater than this value are SO-specific.


Rem *///////////////////////////////////////////////////////////////////
Rem * OPOS "BinaryConversion" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_BC_NONE = 0
Public Const OPOS_BC_NIBBLE = 1
Public Const OPOS_BC_DECIMAL = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "CheckHealth" Method: "Level" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_CH_INTERNAL = 1
Public Const OPOS_CH_EXTERNAL = 2
Public Const OPOS_CH_INTERACTIVE = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * OPOS "CapPowerReporting", "PowerState", "PowerNotify" Property
Rem *   Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_PR_NONE = 0
Public Const OPOS_PR_STANDARD = 1
Public Const OPOS_PR_ADVANCED = 2

Public Const OPOS_PN_DISABLED = 0
Public Const OPOS_PN_ENABLED = 1

Public Const OPOS_PS_UNKNOWN = 2000
Public Const OPOS_PS_ONLINE = 2001
Public Const OPOS_PS_OFF = 2002
Public Const OPOS_PS_OFFLINE = 2003
Public Const OPOS_PS_OFF_OFFLINE = 2004


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorEvent" Event: "ErrorLocus" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EL_OUTPUT = 1
Public Const OPOS_EL_INPUT = 2
Public Const OPOS_EL_INPUT_DATA = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorEvent" Event: "ErrorResponse" Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ER_RETRY = 11
Public Const OPOS_ER_CLEAR = 12
Public Const OPOS_ER_CONTINUEINPUT = 13


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event: Common "Status" Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_SUE_POWER_ONLINE = 2001
Public Const OPOS_SUE_POWER_OFF = 2002
Public Const OPOS_SUE_POWER_OFFLINE = 2003
Public Const OPOS_SUE_POWER_OFF_OFFLINE = 2004


Rem *///////////////////////////////////////////////////////////////////
Rem * General Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_FOREVER = -1



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposBb.h
Rem *
Rem *   Bump Bar header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 98-03-06 OPOS Release 1.3                                     BB
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CurrentUnitID" and "UnitsOnline" Properties
Rem *   and "Units" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const BB_UID_1 = &H1
Public Const BB_UID_2 = &H2
Public Const BB_UID_3 = &H4
Public Const BB_UID_4 = &H8
Public Const BB_UID_5 = &H10
Public Const BB_UID_6 = &H20
Public Const BB_UID_7 = &H40
Public Const BB_UID_8 = &H80
Public Const BB_UID_9 = &H100
Public Const BB_UID_10 = &H200
Public Const BB_UID_11 = &H400
Public Const BB_UID_12 = &H800
Public Const BB_UID_13 = &H1000
Public Const BB_UID_14 = &H2000
Public Const BB_UID_15 = &H4000
Public Const BB_UID_16 = &H8000
Public Const BB_UID_17 = &H10000
Public Const BB_UID_18 = &H20000
Public Const BB_UID_19 = &H40000
Public Const BB_UID_20 = &H80000
Public Const BB_UID_21 = &H100000
Public Const BB_UID_22 = &H200000
Public Const BB_UID_23 = &H400000
Public Const BB_UID_24 = &H800000
Public Const BB_UID_25 = &H1000000
Public Const BB_UID_26 = &H2000000
Public Const BB_UID_27 = &H4000000
Public Const BB_UID_28 = &H8000000
Public Const BB_UID_29 = &H10000000
Public Const BB_UID_30 = &H20000000
Public Const BB_UID_31 = &H40000000
Public Const BB_UID_32 = &H80000000


Rem *///////////////////////////////////////////////////////////////////
Rem * "DataEvent" Event: "Status" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const BB_DE_KEY = &H1



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposCash.h
Rem *
Rem *   Cash Drawer header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 98-03-06 OPOS Release 1.3                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CASH_SUE_DRAWERCLOSED = 0
Public Const CASH_SUE_DRAWEROPEN = 1



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposCAT.h
Rem *
Rem *   CAT header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 98-06-01 OPOS Release 1.4                                  OPOS-J
Rem * 00-09-24 OPOS Release 1.5                                     BKS
Rem *   Added the following constants:
Rem *     CAT_PAYMENT_DEBIT, CAT_MEDIA_UNSPECIFIED, CAT_MEDIA_NONDEFINE,
Rem *     CAT_MEDIA_CREDIT, CAT_MEDIA_DEBIT
Rem *
Rem *
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * Payment Condition Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CAT_PAYMENT_LUMP = 10
Public Const CAT_PAYMENT_BONUS_1 = 21
Public Const CAT_PAYMENT_BONUS_2 = 22
Public Const CAT_PAYMENT_BONUS_3 = 23
Public Const CAT_PAYMENT_BONUS_4 = 24
Public Const CAT_PAYMENT_BONUS_5 = 25
Public Const CAT_PAYMENT_INSTALLMENT_1 = 61
Public Const CAT_PAYMENT_INSTALLMENT_2 = 62
Public Const CAT_PAYMENT_INSTALLMENT_3 = 63
Public Const CAT_PAYMENT_BONUS_COMBINATION_1 = 31
Public Const CAT_PAYMENT_BONUS_COMBINATION_2 = 32
Public Const CAT_PAYMENT_BONUS_COMBINATION_3 = 33
Public Const CAT_PAYMENT_BONUS_COMBINATION_4 = 34
Public Const CAT_PAYMENT_REVOLVING = 80
Public Const CAT_PAYMENT_DEBIT = 110


Rem *///////////////////////////////////////////////////////////////////
Rem * Transaction Type Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CAT_TRANSACTION_SALES = 10
Public Const CAT_TRANSACTION_VOID = 20
Public Const CAT_TRANSACTION_REFUND = 21
Public Const CAT_TRANSACTION_VOIDPRESALES = 29
Public Const CAT_TRANSACTION_COMPLETION = 30
Public Const CAT_TRANSACTION_PRESALES = 40
Public Const CAT_TRANSACTION_CHECKCARD = 41


Rem *///////////////////////////////////////////////////////////////////
Rem * "PaymentMedia' Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CAT_MEDIA_UNSPECIFIED = 0
Public Const CAT_MEDIA_NONDEFINE = 0
Public Const CAT_MEDIA_CREDIT = 1
Public Const CAT_MEDIA_DEBIT = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * ResultCodeExtended Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ECAT_CENTERERROR = 1
Public Const OPOS_ECAT_COMMANDERROR = 90
Public Const OPOS_ECAT_RESET = 91
Public Const OPOS_ECAT_COMMUNICATIONERROR = 92
Public Const OPOS_ECAT_DAILYLOGOVERFLOW = 200


Rem *///////////////////////////////////////////////////////////////////
Rem * "Daily Log" Property  & Argument Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CAT_DL_NONE = 0                    ' None of them
Public Const CAT_DL_REPORTING = 1               ' Only Reporting
Public Const CAT_DL_SETTLEMENT = 2              ' Only Settlement
Public Const CAT_DL_REPORTING_SETTLEMENT = 3    ' Both of them



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposChan.h
Rem *
Rem *   Cash Changer header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem * 00-09-24 OPOS Release 1.5                                  OPOS-J
Rem *   Add DepositStatus constants.
Rem *   Add EndDeposit constants.
Rem *   Add PauseDeposit constants.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "DeviceStatus" and "FullStatus" Property Constants
Rem * "StatusUpdateEvent" Event Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHAN_STATUS_OK = 0            ' DeviceStatus, FullStatus

Public Const CHAN_STATUS_EMPTY = 11        ' DeviceStatus, StatusUpdateEvent
Public Const CHAN_STATUS_NEAREMPTY = 12    ' DeviceStatus, StatusUpdateEvent
Public Const CHAN_STATUS_EMPTYOK = 13      ' StatusUpdateEvent

Public Const CHAN_STATUS_FULL = 21         ' FullStatus, StatusUpdateEvent
Public Const CHAN_STATUS_NEARFULL = 22     ' FullStatus, StatusUpdateEvent
Public Const CHAN_STATUS_FULLOK = 23       ' StatusUpdateEvent

Public Const CHAN_STATUS_JAM = 31          ' DeviceStatus, StatusUpdateEvent
Public Const CHAN_STATUS_JAMOK = 32        ' StatusUpdateEvent

Public Const CHAN_STATUS_ASYNC = 91        ' StatusUpdateEvent


Rem *///////////////////////////////////////////////////////////////////
Rem * "DepositStatus" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHAN_STATUS_DEPOSIT_START = 1
Public Const CHAN_STATUS_DEPOSIT_END = 2
Public Const CHAN_STATUS_DEPOSIT_NONE = 3
Public Const CHAN_STATUS_DEPOSIT_COUNT = 4
Public Const CHAN_STATUS_DEPOSIT_JAM = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "EndDeposit" Method: "Success" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHAN_DEPOSIT_CHANGE = 1
Public Const CHAN_DEPOSIT_NOCHANGE = 2
Public Const CHAN_DEPOSIT_REPAY = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "PauseDeposit" Method: "Control" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHAN_DEPOSIT_PAUSE = 11
Public Const CHAN_DEPOSIT_RESTART = 12


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ECHAN_OVERDISPENSE = 201



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposChk.h
Rem *
Rem *   Check Scanner header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 02-08-17 OPOS Release 1.7                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapColor" Capability Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_CCL_MONO = &H1
Public Const CHK_CCL_GRAYSCALE = &H2
Public Const CHK_CCL_16 = &H4
Public Const CHK_CCL_256 = &H8
Public Const CHK_CCL_FULL = &H10


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapImageFormat" Capability Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_CIF_NATIVE = &H1
Public Const CHK_CIF_TIFF = &H2
Public Const CHK_CIF_BMP = &H4
Public Const CHK_CIF_JPEG = &H8
Public Const CHK_CIF_GIF = &H10


Rem *///////////////////////////////////////////////////////////////////
Rem * "Color" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_CL_MONO = 1
Public Const CHK_CL_GRAYSCALE = 2
Public Const CHK_CL_16 = 3
Public Const CHK_CL_256 = 4
Public Const CHK_CL_FULL = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "ImageFormat" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_IF_NATIVE = 1
Public Const CHK_IF_TIFF = 2
Public Const CHK_IF_BMP = 3
Public Const CHK_IF_JPEG = 4
Public Const CHK_IF_GIF = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "ImageMemoryStatus" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_IMS_EMPTY = 1
Public Const CHK_IMS_OK = 2
Public Const CHK_IMS_FULL = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "MapMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_MM_DOTS = 1
Public Const CHK_MM_TWIPS = 2
Public Const CHK_MM_ENGLISH = 3
Public Const CHK_MM_METRIC = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "ClearImage" Method Constants:
Rem *///////////////////////////////////////////////////////////////////

Rem *   "By" Parameter
Public Const CHK_CLR_ALL = 1
Public Const CHK_CLR_BY_FILEID = 2
Public Const CHK_CLR_BY_FILEINDEX = 3
Public Const CHK_CLR_BY_IMAGETAGDATA = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "DefineCropArea" Method Constants:
Rem *///////////////////////////////////////////////////////////////////

Rem * "CropAreaID" Parameter or index number
Public Const CHK_CROP_AREA_ENTIRE_IMAGE = -1
Public Const CHK_CROP_AREA_RESET_ALL = -2

Rem * "CX" Parameter or integer width
Public Const CHK_CROP_AREA_RIGHT = -1

Rem * "CY" Parameter or integer height
Public Const CHK_CROP_AREA_BOTTOM = -1


Rem *///////////////////////////////////////////////////////////////////
Rem * "RetrieveMemory" Method Constants:
Rem *///////////////////////////////////////////////////////////////////

Rem * "By" Parameter
Public Const CHK_LOCATE_BY_FILEID = 1
Public Const CHK_LOCATE_BY_FILEINDEX = 2
Public Const CHK_LOCATE_BY_IMAGETAGDATA = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "RetrieveImage" and "StoreImage" Method Constant:
Rem *///////////////////////////////////////////////////////////////////

Rem * "CropAreaID" Parameter or index number
Rem *Public Const CHK_CROP_AREA_ENTIRE_IMAGE   = -1 //(Defined above)


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event: "Data" Parameter Constant
Rem *///////////////////////////////////////////////////////////////////

Public Const CHK_SUE_SCANCOMPLETE = 11


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants for Check Scanner
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ECHK_NOCHECK = 201    ' endInsertion
Public Const OPOS_ECHK_CHECK = 202      ' endRemoval
Public Const OPOS_ECHK_NOROOM = 203     ' storeImage



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposCoin.h
Rem *
Rem *   Coin Dispenser header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "DispenserStatus" Property Constants
Rem * "StatusUpdateEvent" Event: "Data" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const COIN_STATUS_OK = 1
Public Const COIN_STATUS_EMPTY = 2
Public Const COIN_STATUS_NEAREMPTY = 3
Public Const COIN_STATUS_JAM = 4



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposDisp.h
Rem *
Rem *   Line Display header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 96-03-18 OPOS Release 1.01                                    CRM
Rem *   Add DISP_MT_INIT constant and MarqueeFormat constants.
Rem * 96-04-22 OPOS Release 1.1                                     CRM
Rem *   Add CapCharacterSet values for Kana and Kanji.
Rem * 00-09-24 OPOS Release 1.5                                     BKS
Rem *   Add CapCharacterSet and CharacterSet values for Unicode
Rem * 01-07-15 OPOS Release 1.6                                     BKS
Rem *   Add CapCursorType, CapReadBack, CapReverse, CursorType
Rem *     property constants.
Rem *   Add DefineGlyph, DisplayText and DisplayTextAt parameter
Rem *     constants.
Rem * 02-08-17 OPOS Release 1.7                                     CRM
Rem *   Add DisplayBitmap and SetBitmap parameter constants.
Rem * 04-03-22 OPOS Release 1.8                                     CRM
Rem *   Add more values for CapCursorType and CursorType.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapBlink" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CB_NOBLINK = 0
Public Const DISP_CB_BLINKALL = 1
Public Const DISP_CB_BLINKEACH = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapCharacterSet" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CCS_NUMERIC = 0
Public Const DISP_CCS_ALPHA = 1
Public Const DISP_CCS_ASCII = 998
Public Const DISP_CCS_KANA = 10
Public Const DISP_CCS_KANJI = 11
Public Const DISP_CCS_UNICODE = 997


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapCursorType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CCT_NONE = &H0
Public Const DISP_CCT_FIXED = &H1
Public Const DISP_CCT_BLOCK = &H2
Public Const DISP_CCT_HALFBLOCK = &H4
Public Const DISP_CCT_UNDERLINE = &H8
Public Const DISP_CCT_REVERSE = &H10
Public Const DISP_CCT_OTHER = &H20
Public Const DISP_CCT_BLINK = &H40       ' (added in 1.8)


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapReadBack" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CRB_NONE = &H0
Public Const DISP_CRB_SINGLE = &H1


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapReverse" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CR_NONE = &H0
Public Const DISP_CR_REVERSEALL = &H1
Public Const DISP_CR_REVERSEEACH = &H2


Rem *///////////////////////////////////////////////////////////////////
Rem * "CharacterSet" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CS_UNICODE = 997
Public Const DISP_CS_ASCII = 998
Public Const DISP_CS_WINDOWS = 999


Rem *///////////////////////////////////////////////////////////////////
Rem * "CursorType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_CT_NONE = 0
Public Const DISP_CT_FIXED = 1
Public Const DISP_CT_BLOCK = 2
Public Const DISP_CT_HALFBLOCK = 3
Public Const DISP_CT_UNDERLINE = 4
Public Const DISP_CT_REVERSE = 5
Public Const DISP_CT_OTHER = 6
Public Const DISP_CT_BLINK = &H10000000    ' (added in 1.8)


Rem *///////////////////////////////////////////////////////////////////
Rem * "MarqueeType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_MT_NONE = 0
Public Const DISP_MT_UP = 1
Public Const DISP_MT_DOWN = 2
Public Const DISP_MT_LEFT = 3
Public Const DISP_MT_RIGHT = 4
Public Const DISP_MT_INIT = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "MarqueeFormat" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_MF_WALK = 0
Public Const DISP_MF_PLACE = 1


Rem *///////////////////////////////////////////////////////////////////
Rem * "DefineGlyph" Method: "GlyphType" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_GT_SINGLE = 1


Rem *///////////////////////////////////////////////////////////////////
Rem * "DisplayText" Method: "Attribute" Property Constants
Rem * "DisplayTextAt" Method: "Attribute" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_DT_NORMAL = 0
Public Const DISP_DT_BLINK = 1
Public Const DISP_DT_REVERSE = 2
Public Const DISP_DT_BLINK_REVERSE = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "ScrollText" Method: "Direction" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_ST_UP = 1
Public Const DISP_ST_DOWN = 2
Public Const DISP_ST_LEFT = 3
Public Const DISP_ST_RIGHT = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "SetDescriptor" Method: "Attribute" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const DISP_SD_OFF = 0
Public Const DISP_SD_ON = 1
Public Const DISP_SD_BLINK = 2


Rem *///////////////////////////////////////////////////////////////////
Rem *///////////////////////////////////////////////////////////////////
Rem * The following were added in Release 1.7
Rem *///////////////////////////////////////////////////////////////////
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "DisplayBitmap" and "SetBitmap" Method Constants:
Rem *///////////////////////////////////////////////////////////////////

Rem *   "Width" Parameter

Public Const DISP_BM_ASIS = -11

Rem *   "AlignmentX" Parameter

Public Const DISP_BM_LEFT = -1
Public Const DISP_BM_CENTER = -2
Public Const DISP_BM_RIGHT = -3

Rem *   "AlignmentY" Parameter

Public Const DISP_BM_TOP = -1
Rem *Public Const DISP_BM_CENTER = -2
Public Const DISP_BM_BOTTOM = -3



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposFptr.h
Rem *
Rem *   Fiscal Printer header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 98-03-06 OPOS Release 1.3                                     PDU
Rem * 01-07-15 OPOS Release 1.6                                     TNN
Rem *   Add values for all 1.6 added properties and method
Rem *   parameters
Rem * 04-03-22 OPOS Release 1.8                                     CRM
Rem *   Add more values for StatusUpdateEvent.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * Fiscal Printer Station Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_S_JOURNAL = 1
Public Const FPTR_S_RECEIPT = 2
Public Const FPTR_S_SLIP = 4

Public Const FPTR_S_JOURNAL_RECEIPT = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "ActualCurrency" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_AC_BRC = 1
Public Const FPTR_AC_BGL = 2
Public Const FPTR_AC_EUR = 3
Public Const FPTR_AC_GRD = 4
Public Const FPTR_AC_HUF = 5
Public Const FPTR_AC_ITL = 6
Public Const FPTR_AC_PLZ = 7
Public Const FPTR_AC_ROL = 8
Public Const FPTR_AC_RUR = 9
Public Const FPTR_AC_TRL = 10


Rem *///////////////////////////////////////////////////////////////////
Rem * "ContractorId" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_CID_FIRST = 1
Public Const FPTR_CID_SECOND = 2
Public Const FPTR_CID_SINGLE = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "CountryCode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_CC_BRAZIL = 1
Public Const FPTR_CC_GREECE = 2
Public Const FPTR_CC_HUNGARY = 4
Public Const FPTR_CC_ITALY = 8
Public Const FPTR_CC_POLAND = 16
Public Const FPTR_CC_TURKEY = 32
Public Const FPTR_CC_RUSSIA = 64
Public Const FPTR_CC_BULGARIA = 128
Public Const FPTR_CC_ROMANIA = 256


Rem *///////////////////////////////////////////////////////////////////
Rem * "DateType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_DT_CONF = 1
Public Const FPTR_DT_EOD = 2
Public Const FPTR_DT_RESET = 3
Public Const FPTR_DT_RTC = 4
Public Const FPTR_DT_VAT = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorLevel" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_EL_NONE = 1
Public Const FPTR_EL_RECOVERABLE = 2
Public Const FPTR_EL_FATAL = 3
Public Const FPTR_EL_BLOCKED = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorState", "PrinterState" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_PS_MONITOR = 1
Public Const FPTR_PS_FISCAL_RECEIPT = 2
Public Const FPTR_PS_FISCAL_RECEIPT_TOTAL = 3
Public Const FPTR_PS_FISCAL_RECEIPT_ENDING = 4
Public Const FPTR_PS_FISCAL_DOCUMENT = 5
Public Const FPTR_PS_FIXED_OUTPUT = 6
Public Const FPTR_PS_ITEM_LIST = 7
Public Const FPTR_PS_LOCKED = 8
Public Const FPTR_PS_NONFISCAL = 9
Public Const FPTR_PS_REPORT = 10


Rem *///////////////////////////////////////////////////////////////////
Rem * "FiscalReceiptStation" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_RS_RECEIPT = 1
Public Const FPTR_RS_SLIP = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "FiscalReceiptType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_RT_CASH_IN = 1
Public Const FPTR_RT_CASH_OUT = 2
Public Const FPTR_RT_GENERIC = 3
Public Const FPTR_RT_SALES = 4
Public Const FPTR_RT_SERVICE = 5
Public Const FPTR_RT_SIMPLE_INVOICE = 6


Rem *///////////////////////////////////////////////////////////////////
Rem * "MessageType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_MT_ADVANCE = 1
Public Const FPTR_MT_ADVANCE_PAID = 2
Public Const FPTR_MT_AMOUNT_TO_BE_PAID = 3
Public Const FPTR_MT_AMOUNT_TO_BE_PAID_BACK = 4
Public Const FPTR_MT_CARD = 5
Public Const FPTR_MT_CARD_NUMBER = 6
Public Const FPTR_MT_CARD_TYPE = 7
Public Const FPTR_MT_CASH = 8
Public Const FPTR_MT_CASHIER = 9
Public Const FPTR_MT_CASH_REGISTER_NUMBER = 10
Public Const FPTR_MT_CHANGE = 11
Public Const FPTR_MT_CHEQUE = 12
Public Const FPTR_MT_CLIENT_NUMBER = 13
Public Const FPTR_MT_CLIENT_SIGNATURE = 14
Public Const FPTR_MT_COUNTER_STATE = 15
Public Const FPTR_MT_CREDIT_CARD = 16
Public Const FPTR_MT_CURRENCY = 17
Public Const FPTR_MT_CURRENCY_VALUE = 18
Public Const FPTR_MT_DEPOSIT = 19
Public Const FPTR_MT_DEPOSIT_RETURNED = 20
Public Const FPTR_MT_DOT_LINE = 21
Public Const FPTR_MT_DRIVER_NUMB = 22
Public Const FPTR_MT_EMPTY_LINE = 23
Public Const FPTR_MT_FREE_TEXT = 24
Public Const FPTR_MT_FREE_TEXT_WITH_DAY_LIMIT = 25
Public Const FPTR_MT_GIVEN_DISCOUNT = 26
Public Const FPTR_MT_LOCAL_CREDIT = 27
Public Const FPTR_MT_MILEAGE_KM = 28
Public Const FPTR_MT_NOTE = 29
Public Const FPTR_MT_PAID = 30
Public Const FPTR_MT_PAY_IN = 31
Public Const FPTR_MT_POINT_GRANTED = 32
Public Const FPTR_MT_POINTS_BONUS = 33
Public Const FPTR_MT_POINTS_RECEIPT = 34
Public Const FPTR_MT_POINTS_TOTAL = 35
Public Const FPTR_MT_PROFITED = 36
Public Const FPTR_MT_RATE = 37
Public Const FPTR_MT_REGISTER_NUMB = 38
Public Const FPTR_MT_SHIFT_NUMBER = 39
Public Const FPTR_MT_STATE_OF_AN_ACCOUNT = 40
Public Const FPTR_MT_SUBSCRIPTION = 41
Public Const FPTR_MT_TABLE = 42
Public Const FPTR_MT_THANK_YOU_FOR_LOYALTY = 43
Public Const FPTR_MT_TRANSACTION_NUMB = 44
Public Const FPTR_MT_VALID_TO = 45
Public Const FPTR_MT_VOUCHER = 46
Public Const FPTR_MT_VOUCHER_PAID = 47
Public Const FPTR_MT_VOUCHER_VALUE = 48
Public Const FPTR_MT_WITH_DISCOUNT = 49
Public Const FPTR_MT_WITHOUT_UPLIFT = 50


Rem *///////////////////////////////////////////////////////////////////
Rem * "SlipSelection" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_SS_FULL_LENGTH = 1
Public Const FPTR_SS_VALIDATION = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "TotalizerType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_TT_DOCUMENT = 1
Public Const FPTR_TT_DAY = 2
Public Const FPTR_TT_RECEIPT = 3
Public Const FPTR_TT_GRAND = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "GetData" Method Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_GD_CURRENT_TOTAL = 1
Public Const FPTR_GD_DAILY_TOTAL = 2
Public Const FPTR_GD_RECEIPT_NUMBER = 3
Public Const FPTR_GD_REFUND = 4
Public Const FPTR_GD_NOT_PAID = 5
Public Const FPTR_GD_MID_VOID = 6
Public Const FPTR_GD_Z_REPORT = 7
Public Const FPTR_GD_GRAND_TOTAL = 8
Public Const FPTR_GD_PRINTER_ID = 9
Public Const FPTR_GD_FIRMWARE = 10
Public Const FPTR_GD_RESTART = 11
Public Const FPTR_GD_REFUND_VOID = 12
Public Const FPTR_GD_NUMB_CONFIG_BLOCK = 13
Public Const FPTR_GD_NUMB_CURRENCY_BLOCK = 14
Public Const FPTR_GD_NUMB_HDR_BLOCK = 15
Public Const FPTR_GD_NUMB_RESET_BLOCK = 16
Public Const FPTR_GD_NUMB_VAT_BLOCK = 17
Public Const FPTR_GD_FISCAL_DOC = 18
Public Const FPTR_GD_FISCAL_DOC_VOID = 19
Public Const FPTR_GD_FISCAL_REC = 20
Public Const FPTR_GD_FISCAL_REC_VOID = 21
Public Const FPTR_GD_NONFISCAL_DOC = 22
Public Const FPTR_GD_NONFISCAL_DOC_VOID = 23
Public Const FPTR_GD_NONFISCAL_REC = 24
Public Const FPTR_GD_SIMP_INVOICE = 25
Public Const FPTR_GD_TENDER = 26
Public Const FPTR_GD_LINECOUNT = 27
Public Const FPTR_GD_DESCRIPTION_LENGTH = 28

Public Const FPTR_PDL_CASH = 1
Public Const FPTR_PDL_CHEQUE = 2
Public Const FPTR_PDL_CHITTY = 3
Public Const FPTR_PDL_COUPON = 4
Public Const FPTR_PDL_CURRENCY = 5
Public Const FPTR_PDL_DRIVEN_OFF = 6
Public Const FPTR_PDL_EFT_IMPRINTER = 7
Public Const FPTR_PDL_EFT_TERMINAL = 8
Public Const FPTR_PDL_TERMINAL_IMPRINTER = 9
Public Const FPTR_PDL_FREE_GIFT = 10
Public Const FPTR_PDL_GIRO = 11
Public Const FPTR_PDL_HOME = 12
Public Const FPTR_PDL_IMPRINTER_WITH_ISSUER = 13
Public Const FPTR_PDL_LOCAL_ACCOUNT = 14
Public Const FPTR_PDL_LOCAL_ACCOUNT_CARD = 15
Public Const FPTR_PDL_PAY_CARD = 16
Public Const FPTR_PDL_PAY_CARD_MANUAL = 17
Public Const FPTR_PDL_PREPAY = 18
Public Const FPTR_PDL_PUMP_TEST = 19
Public Const FPTR_PDL_SHORT_CREDIT = 20
Public Const FPTR_PDL_STAFF = 21
Public Const FPTR_PDL_VOUCHER = 22

Public Const FPTR_LC_ITEM = 1
Public Const FPTR_LC_ITEM_VOID = 2
Public Const FPTR_LC_DISCOUNT = 3
Public Const FPTR_LC_DISCOUNT_VOID = 4
Public Const FPTR_LC_SURCHARGE = 5
Public Const FPTR_LC_SURCHARGE_VOID = 6
Public Const FPTR_LC_REFUND = 7
Public Const FPTR_LC_REFUND_VOID = 8
Public Const FPTR_LC_SUBTOTAL_DISCOUNT = 9
Public Const FPTR_LC_SUBTOTAL_DISCOUNT_VOID = 10
Public Const FPTR_LC_SUBTOTAL_SURCHARGE = 11
Public Const FPTR_LC_SUBTOTAL_SURCHARGE_VOID = 12
Public Const FPTR_LC_COMMENT = 13
Public Const FPTR_LC_SUBTOTAL = 14
Public Const FPTR_LC_TOTAL = 15

Public Const FPTR_DL_ITEM = 1
Public Const FPTR_DL_ITEM_ADJUSTMENT = 2
Public Const FPTR_DL_ITEM_FUEL = 3
Public Const FPTR_DL_ITEM_FUEL_VOID = 4
Public Const FPTR_DL_NOT_PAID = 5
Public Const FPTR_DL_PACKAGE_ADJUSTMENT = 6
Public Const FPTR_DL_REFUND = 7
Public Const FPTR_DL_REFUND_VOID = 8
Public Const FPTR_DL_SUBTOTAL_ADJUSTMENT = 9
Public Const FPTR_DL_TOTAL = 10
Public Const FPTR_DL_VOID = 11
Public Const FPTR_DL_VOID_ITEM = 12


Rem *///////////////////////////////////////////////////////////////////
Rem * "GetTotalizer" Method Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_GT_GROSS = 1
Public Const FPTR_GT_NET = 2
Public Const FPTR_GT_DISCOUNT = 3
Public Const FPTR_GT_DISCOUNT_VOID = 4
Public Const FPTR_GT_ITEM = 5
Public Const FPTR_GT_ITEM_VOID = 6
Public Const FPTR_GT_NOT_PAID = 7
Public Const FPTR_GT_REFUND = 8
Public Const FPTR_GT_REFUND_VOID = 9
Public Const FPTR_GT_SUBTOTAL_DISCOUNT = 10
Public Const FPTR_GT_SUBTOTAL_DISCOUNT_VOID = 11
Public Const FPTR_GT_SUBTOTAL_SURCHARGES = 12
Public Const FPTR_GT_SUBTOTAL_SURCHARGES_VOID = 13
Public Const FPTR_GT_SURCHARGE = 14
Public Const FPTR_GT_SURCHARGE_VOID = 15
Public Const FPTR_GT_VAT = 16
Public Const FPTR_GT_VAT_CATEGORY = 17


Rem *///////////////////////////////////////////////////////////////////
Rem * "AdjustmentType" arguments in diverse methods
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_AT_AMOUNT_DISCOUNT = 1
Public Const FPTR_AT_AMOUNT_SURCHARGE = 2
Public Const FPTR_AT_PERCENTAGE_DISCOUNT = 3
Public Const FPTR_AT_PERCENTAGE_SURCHARGE = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "ReportType" argument in "PrintReport" method
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_RT_ORDINAL = 1
Public Const FPTR_RT_DATE = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "NewCurrency" argument in "SetCurrency" method
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_SC_EURO = 1


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event: "Data" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const FPTR_SUE_COVER_OPEN = 11
Public Const FPTR_SUE_COVER_OK = 12
Public Const FPTR_SUE_JRN_COVER_OPEN = 60    ' (added in 1.8)
Public Const FPTR_SUE_JRN_COVER_OK = 61      ' (added in 1.8)
Public Const FPTR_SUE_REC_COVER_OPEN = 62    ' (added in 1.8)
Public Const FPTR_SUE_REC_COVER_OK = 63      ' (added in 1.8)
Public Const FPTR_SUE_SLP_COVER_OPEN = 64    ' (added in 1.8)
Public Const FPTR_SUE_SLP_COVER_OK = 65      ' (added in 1.8)

Public Const FPTR_SUE_JRN_EMPTY = 21
Public Const FPTR_SUE_JRN_NEAREMPTY = 22
Public Const FPTR_SUE_JRN_PAPEROK = 23

Public Const FPTR_SUE_REC_EMPTY = 24
Public Const FPTR_SUE_REC_NEAREMPTY = 25
Public Const FPTR_SUE_REC_PAPEROK = 26

Public Const FPTR_SUE_SLP_EMPTY = 27
Public Const FPTR_SUE_SLP_NEAREMPTY = 28
Public Const FPTR_SUE_SLP_PAPEROK = 29

Public Const FPTR_SUE_IDLE = 1001


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EFPTR_COVER_OPEN = 201                    ' (Several)
Public Const OPOS_EFPTR_JRN_EMPTY = 202                     ' (Several)
Public Const OPOS_EFPTR_REC_EMPTY = 203                     ' (Several)
Public Const OPOS_EFPTR_SLP_EMPTY = 204                     ' (Several)
Public Const OPOS_EFPTR_SLP_FORM = 205                      ' EndRemoval
Public Const OPOS_EFPTR_MISSING_DEVICES = 206               ' (Several)
Public Const OPOS_EFPTR_WRONG_STATE = 207                   ' (Several)
Public Const OPOS_EFPTR_TECHNICAL_ASSISTANCE = 208          ' (Several)
Public Const OPOS_EFPTR_CLOCK_ERROR = 209                   ' (Several)
Public Const OPOS_EFPTR_FISCAL_MEMORY_FULL = 210            ' (Several)
Public Const OPOS_EFPTR_FISCAL_MEMORY_DISCONNECTED = 211    ' (Several)
Public Const OPOS_EFPTR_FISCAL_TOTALS_ERROR = 212           ' (Several)
Public Const OPOS_EFPTR_BAD_ITEM_QUANTITY = 213             ' (Several)
Public Const OPOS_EFPTR_BAD_ITEM_AMOUNT = 214               ' (Several)
Public Const OPOS_EFPTR_BAD_ITEM_DESCRIPTION = 215          ' (Several)
Public Const OPOS_EFPTR_RECEIPT_TOTAL_OVERFLOW = 216        ' (Several)
Public Const OPOS_EFPTR_BAD_VAT = 217                       ' (Several)
Public Const OPOS_EFPTR_BAD_PRICE = 218                     ' (Several)
Public Const OPOS_EFPTR_BAD_DATE = 219                      ' (Several)
Public Const OPOS_EFPTR_NEGATIVE_TOTAL = 220                ' (Several)
Public Const OPOS_EFPTR_WORD_NOT_ALLOWED = 221              ' (Several)
Public Const OPOS_EFPTR_BAD_LENGTH = 222                    ' (Several)
Public Const OPOS_EFPTR_MISSING_SET_CURRENCY = 223          ' (Several)



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposKbd.h
Rem *
Rem *   POS Keyboard header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 96-04-22 OPOS Release 1.1                                     CRM
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem *   Add "EventTypes" and "POSKeyEventType" values.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "EventTypes" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const KBD_ET_DOWN = 1
Public Const KBD_ET_DOWN_UP = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "POSKeyEventType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const KBD_KET_KEYDOWN = 1
Public Const KBD_KET_KEYUP = 2



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposLock.h
Rem *
Rem *   Keylock header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "KeyPosition" Property Constants
Rem * "WaitForKeylockChange" Method: "KeyPosition" Parameter
Rem * "StatusUpdateEvent" Event: "Data" Parameter
Rem *///////////////////////////////////////////////////////////////////

Public Const LOCK_KP_ANY = 0     ' WaitForKeylockChange Only
Public Const LOCK_KP_LOCK = 1
Public Const LOCK_KP_NORM = 2
Public Const LOCK_KP_SUPR = 3



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposMicr.h
Rem *
Rem *   MICR header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 02-08-17 OPOS Release 1.7                                     CRM
Rem *   Add new ResultCodeExtended constants.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CheckType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const MICR_CT_PERSONAL = 1
Public Const MICR_CT_BUSINESS = 2
Public Const MICR_CT_UNKNOWN = 99


Rem *///////////////////////////////////////////////////////////////////
Rem * "CountryCode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const MICR_CC_USA = 1
Public Const MICR_CC_CANADA = 2
Public Const MICR_CC_MEXICO = 3
Public Const MICR_CC_UNKNOWN = 99


Rem *////////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EMICR_NOCHECK = 201    ' EndInsertion
Public Const OPOS_EMICR_CHECK = 202      ' EndRemoval

Rem * The following were added in Release 1.7
Public Const OPOS_EMICR_BADDATA = 203
Public Const OPOS_EMICR_NODATA = 204
Public Const OPOS_EMICR_BADSIZE = 205
Public Const OPOS_EMICR_JAM = 206
Public Const OPOS_EMICR_CHECKDIGIT = 207
Public Const OPOS_EMICR_COVEROPEN = 208



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposMotion.h
Rem *
Rem *   Motion Sensor header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 02-08-17 OPOS Release 1.7                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * Status Update Event "Status" Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const MOTION_M_PRESENT = 1
Public Const MOTION_M_ABSENT = 2



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposMsr.h
Rem *
Rem *   Magnetic Stripe Reader header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem *   Add ErrorReportingType values.
Rem * 00-09-24 OPOS Release 1.5                                     BKS
Rem *   Add constants relating to Track 4 Data.
Rem *   (01-07-15 Added omitted MSR_TR_1_3_4 property)
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "TracksToRead" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const MSR_TR_1 = 1
Public Const MSR_TR_2 = 2
Public Const MSR_TR_3 = 4
Public Const MSR_TR_4 = 8

Public Const MSR_TR_1_2 = &H3
Public Const MSR_TR_1_3 = &H5
Public Const MSR_TR_1_4 = &H9
Public Const MSR_TR_2_3 = &H6
Public Const MSR_TR_2_4 = &HA
Public Const MSR_TR_3_4 = &HC

Public Const MSR_TR_1_2_3 = &H7
Public Const MSR_TR_1_2_4 = &HB
Public Const MSR_TR_1_3_4 = &HD
Public Const MSR_TR_2_3_4 = &HE

Public Const MSR_TR_1_2_3_4 = &HF


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorReportingType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const MSR_ERT_CARD = 0
Public Const MSR_ERT_TRACK = 1


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorEvent" Event: "ResultCodeExtended" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EMSR_START = 201
Public Const OPOS_EMSR_END = 202
Public Const OPOS_EMSR_PARITY = 203
Public Const OPOS_EMSR_LRC = 204



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposPcrw.H
Rem *
Rem *   Point Card Reader Writer header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 00-09-24 OPOS Release 1.5                                     BKS
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapCharacterSet" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_CCS_ALPHA = 1
Public Const PCRW_CCS_ASCII = 998
Public Const PCRW_CCS_KANA = 10
Public Const PCRW_CCS_KANJI = 11
Public Const PCRW_CCS_UNICODE = 997


Rem *///////////////////////////////////////////////////////////////////
Rem * "CardState" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_STATE_NOCARD = 1
Public Const PCRW_STATE_REMAINING = 2
Public Const PCRW_STATE_INRW = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * CapTrackToRead and TrackToWrite Property constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_TRACK1 = &H1
Public Const PCRW_TRACK2 = &H2
Public Const PCRW_TRACK3 = &H4
Public Const PCRW_TRACK4 = &H8
Public Const PCRW_TRACK5 = &H10
Public Const PCRW_TRACK6 = &H20


Rem *///////////////////////////////////////////////////////////////////
Rem * "CharacterSet" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_CS_UNICODE = 997
Public Const PCRW_CS_ASCII = 998
Public Const PCRW_CS_WINDOWS = 999


Rem *///////////////////////////////////////////////////////////////////
Rem * "MappingMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_MM_DOTS = 1
Public Const PCRW_MM_TWIPS = 2
Public Const PCRW_MM_ENGLISH = 3
Public Const PCRW_MM_METRIC = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EPCRW_READ = 201
Public Const OPOS_EPCRW_WRITE = 202
Public Const OPOS_EPCRW_JAM = 203
Public Const OPOS_EPCRW_MOTOR = 204
Public Const OPOS_EPCRW_COVER = 205
Public Const OPOS_EPCRW_PRINTER = 206
Public Const OPOS_EPCRW_RELEASE = 207
Public Const OPOS_EPCRW_DISPLAY = 208
Public Const OPOS_EPCRW_NOCARD = 209


Rem *///////////////////////////////////////////////////////////////////
Rem * Magnetic read/write status Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EPCRW_START = 211
Public Const OPOS_EPCRW_END = 212
Public Const OPOS_EPCRW_PARITY = 213
Public Const OPOS_EPCRW_ENCODE = 214
Public Const OPOS_EPCRW_LRC = 215
Public Const OPOS_EPCRW_VERIFY = 216


Rem *///////////////////////////////////////////////////////////////////
Rem * "RotatedPrint" Method: "Rotation" Parameter Constants
Rem * "RotateSpecial" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_RP_NORMAL = &H1
Public Const PCRW_RP_RIGHT90 = &H101
Public Const PCRW_RP_LEFT90 = &H102
Public Const PCRW_RP_ROTATE180 = &H103


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" "Status" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PCRW_SUE_NOCARD = 1
Public Const PCRW_SUE_REMAINING = 2
Public Const PCRW_SUE_INRW = 4



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposPpad.h
Rem *
Rem *   PIN Pad header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 98-03-06 OPOS Release 1.3                                     JDB
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapDisplay" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PPAD_DISP_UNRESTRICTED = 1
Public Const PPAD_DISP_PINRESTRICTED = 2
Public Const PPAD_DISP_RESTRICTED_LIST = 3
Public Const PPAD_DISP_RESTRICTED_ORDER = 4
Public Const PPAD_DISP_NONE = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "AvailablePromptsList" and "Prompt" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PPAD_MSG_ENTERPIN = 1
Public Const PPAD_MSG_PLEASEWAIT = 2
Public Const PPAD_MSG_ENTERVALIDPIN = 3
Public Const PPAD_MSG_RETRIESEXCEEDED = 4
Public Const PPAD_MSG_APPROVED = 5
Public Const PPAD_MSG_DECLINED = 6
Public Const PPAD_MSG_CANCELED = 7
Public Const PPAD_MSG_AMOUNTOK = 8
Public Const PPAD_MSG_NOTREADY = 9
Public Const PPAD_MSG_IDLE = 10
Public Const PPAD_MSG_SLIDE_CARD = 11
Public Const PPAD_MSG_INSERTCARD = 12
Public Const PPAD_MSG_SELECTCARDTYPE = 13


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapLanguage" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PPAD_LANG_NONE = 1
Public Const PPAD_LANG_ONE = 2
Public Const PPAD_LANG_PINRESTRICTED = 3
Public Const PPAD_LANG_UNRESTRICTED = 4

Rem *///////////////////////////////////////////////////////////////////
Rem * "TransactionType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PPAD_TRANS_DEBIT = 1
Public Const PPAD_TRANS_CREDIT = 2
Public Const PPAD_TRANS_INQ = 3
Public Const PPAD_TRANS_RECONCILE = 4
Public Const PPAD_TRANS_ADMIN = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "EndEFTTransaction" Method Completion Code Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PPAD_EFT_NORMAL = 1
Public Const PPAD_EFT_ABNORMAL = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "DataEvent" Event Status Constants
Rem *///////////////////////////////////////////////////////////////////
Public Const PPAD_SUCCESS = 1
Public Const PPAD_CANCEL = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EPPAD_BAD_KEY = 201



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposPtr.h
Rem *
Rem *   POS Printer header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 96-04-22 OPOS Release 1.1                                     CRM
Rem *   Add CapCharacterSet values.
Rem *   Add ErrorLevel values.
Rem *   Add TransactionPrint Control values.
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem *   Remove PTR_RP_NORMAL_ASYNC.
Rem *   Add more barcode symbologies.
Rem * 98-03-06 OPOS Release 1.3                                     CRM
Rem *   Add more PrintTwoNormal constants.
Rem * 00-09-24 OPOS Release 1.5                               EPSON/BKS
Rem *   Add CapRecMarkFeed values and MarkFeed constants.
Rem *   Add ChangePrintSide constants.
Rem *   Add StatusUpdateEvent constants.
Rem *   Add ResultCodeExtended values.
Rem *   Add CapXxxCartridgeSensor and XxxCartridgeState values.
Rem *   Add CartridgeNotify values.
Rem *   Add CapCharacterset and CharacterSet values for UNICODE.
Rem * 03-05-29 OPOS Release 1.7                                     CRM
Rem *   Add more PTR_RP_* values for RotatePrint.
Rem * 04-03-22 OPOS Release 1.8                                     CRM
Rem *   Add more values for PrintBarCode method and StatusUpdateEvent.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * Printer Station Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_S_JOURNAL = 1
Public Const PTR_S_RECEIPT = 2
Public Const PTR_S_SLIP = 4

Public Const PTR_S_JOURNAL_RECEIPT = &H3
Public Const PTR_S_JOURNAL_SLIP = &H5
Public Const PTR_S_RECEIPT_SLIP = &H6

Public Const PTR_TWO_RECEIPT_JOURNAL = &H8003
Public Const PTR_TWO_SLIP_JOURNAL = &H8005
Public Const PTR_TWO_SLIP_RECEIPT = &H8006


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapCharacterSet" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_CCS_ALPHA = 1
Public Const PTR_CCS_ASCII = 998
Public Const PTR_CCS_KANA = 10
Public Const PTR_CCS_KANJI = 11
Public Const PTR_CCS_UNICODE = 997


Rem *///////////////////////////////////////////////////////////////////
Rem * "CharacterSet" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_CS_UNICODE = 997
Public Const PTR_CS_ASCII = 998
Public Const PTR_CS_WINDOWS = 999


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorLevel" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_EL_NONE = 1
Public Const PTR_EL_RECOVERABLE = 2
Public Const PTR_EL_FATAL = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "MapMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_MM_DOTS = 1
Public Const PTR_MM_TWIPS = 2
Public Const PTR_MM_ENGLISH = 3
Public Const PTR_MM_METRIC = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapXxxColor" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_COLOR_PRIMARY = &H1
Public Const PTR_COLOR_CUSTOM1 = &H2
Public Const PTR_COLOR_CUSTOM2 = &H4
Public Const PTR_COLOR_CUSTOM3 = &H8
Public Const PTR_COLOR_CUSTOM4 = &H10
Public Const PTR_COLOR_CUSTOM5 = &H20
Public Const PTR_COLOR_CUSTOM6 = &H40
Public Const PTR_COLOR_CYAN = &H100
Public Const PTR_COLOR_MAGENTA = &H200
Public Const PTR_COLOR_YELLOW = &H400
Public Const PTR_COLOR_FULL = &H80000000


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapXxxCartridgeSensor" and  "XxxCartridgeState" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_CART_UNKNOWN = &H10000000
Public Const PTR_CART_OK = &H0
Public Const PTR_CART_REMOVED = &H1
Public Const PTR_CART_EMPTY = &H2
Public Const PTR_CART_NEAREND = &H4
Public Const PTR_CART_CLEANING = &H8


Rem *///////////////////////////////////////////////////////////////////
Rem * "CartridgeNotify"  Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_CN_DISABLED = &H0
Public Const PTR_CN_ENABLED = &H1


Rem *///////////////////////////////////////////////////////////////////
Rem * "CutPaper" Method Constant
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_CP_FULLCUT = 100


Rem *///////////////////////////////////////////////////////////////////
Rem * "PrintBarCode" Method Constants:
Rem *///////////////////////////////////////////////////////////////////

Rem *   "Alignment" Parameter
Rem *     Either the distance from the left-most print column to the start
Rem *     of the bar code, or one of the following:

Public Const PTR_BC_LEFT = -1
Public Const PTR_BC_CENTER = -2
Public Const PTR_BC_RIGHT = -3

Rem *   "TextPosition" Parameter

Public Const PTR_BC_TEXT_NONE = -11
Public Const PTR_BC_TEXT_ABOVE = -12
Public Const PTR_BC_TEXT_BELOW = -13

Rem *   "Symbology" Parameter:

Rem *     One dimensional symbologies
Public Const PTR_BCS_UPCA = 101              ' Digits
Public Const PTR_BCS_UPCE = 102              ' Digits
Public Const PTR_BCS_JAN8 = 103              ' = EAN 8
Public Const PTR_BCS_EAN8 = 103              ' = JAN 8 (added in 1.2)
Public Const PTR_BCS_JAN13 = 104             ' = EAN 13
Public Const PTR_BCS_EAN13 = 104             ' = JAN 13 (added in 1.2)
Public Const PTR_BCS_TF = 105                ' (Discrete 2 of 5) Digits
Public Const PTR_BCS_ITF = 106               ' (Interleaved 2 of 5) Digits
Public Const PTR_BCS_Codabar = 107           ' Digits, -, $, :, /, ., +
                                             '   4 start/stop characters
                                             '   (a, b, c, d)
Public Const PTR_BCS_Code39 = 108            ' Alpha, Digits, Space, -, .,
                                             '   $, /, +, % start/stop (*)
                                             ' Also has Full ASCII feature
Public Const PTR_BCS_Code93 = 109            ' Same characters as Code 39
Public Const PTR_BCS_Code128 = 110           ' 128 data characters
Rem *        (The following were added in Release 1.2)
Public Const PTR_BCS_UPCA_S = 111            ' UPC-A with supplemental
                                             '   barcode
Public Const PTR_BCS_UPCE_S = 112            ' UPC-E with supplemental
                                             '   barcode
Public Const PTR_BCS_UPCD1 = 113             ' UPC-D1
Public Const PTR_BCS_UPCD2 = 114             ' UPC-D2
Public Const PTR_BCS_UPCD3 = 115             ' UPC-D3
Public Const PTR_BCS_UPCD4 = 116             ' UPC-D4
Public Const PTR_BCS_UPCD5 = 117             ' UPC-D5
Public Const PTR_BCS_EAN8_S = 118            ' EAN 8 with supplemental
                                             '   barcode
Public Const PTR_BCS_EAN13_S = 119           ' EAN 13 with supplemental
                                             '   barcode
Public Const PTR_BCS_EAN128 = 120            ' EAN 128
Public Const PTR_BCS_OCRA = 121              ' OCR "A"
Public Const PTR_BCS_OCRB = 122              ' OCR "B"
Rem *        (The following were added in Release 1.8)
Public Const PTR_BCS_Code128_Parsed = 123    ' Code 128 with parsing
Public Const PTR_BCS_RSS14 = 131             ' Reduced Space Symbology - 14 digit GTIN
Public Const PTR_BCS_RSS_EXPANDED = 132      ' RSS - 14 digit GTIN plus additional fields

Rem *     Two dimensional symbologies
Public Const PTR_BCS_PDF417 = 201
Public Const PTR_BCS_MAXICODE = 202

Rem *     Start of Printer-Specific bar code symbologies
Public Const PTR_BCS_OTHER = 501


Rem *///////////////////////////////////////////////////////////////////
Rem * "PrintBitmap" Method Constants:
Rem *///////////////////////////////////////////////////////////////////

Rem *   "Width" Parameter
Rem *     Either bitmap width or:

Public Const PTR_BM_ASIS = -11    ' One pixel per printer dot

Rem *   "Alignment" Parameter
Rem *     Either the distance from the left-most print column to the start
Rem *     of the bitmap, or one of the following:

Public Const PTR_BM_LEFT = -1
Public Const PTR_BM_CENTER = -2
Public Const PTR_BM_RIGHT = -3


Rem *///////////////////////////////////////////////////////////////////
Rem * "RotatePrint" Method: "Rotation" Parameter Constants
Rem * "RotateSpecial" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_RP_NORMAL = &H1
Public Const PTR_RP_RIGHT90 = &H101
Public Const PTR_RP_LEFT90 = &H102
Public Const PTR_RP_ROTATE180 = &H103

Rem * Version 1.7
Rem *   For "RotatePrint", one or both of the following values may be
Rem *   ORed with one of the above values.
Public Const PTR_RP_BARCODE = &H1000
Public Const PTR_RP_BITMAP = &H2000


Rem *///////////////////////////////////////////////////////////////////
Rem * "SetLogo" Method: "Location" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_L_TOP = 1
Public Const PTR_L_BOTTOM = 2


Rem *///////////////////////////////////////////////////////////////////
Rem * "TransactionPrint" Method: "Control" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_TP_TRANSACTION = 11
Public Const PTR_TP_NORMAL = 12


Rem *///////////////////////////////////////////////////////////////////
Rem * "MarkFeed" Method: "Type" Parameter Constants
Rem * "CapRecMarkFeed" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_MF_TO_TAKEUP = 1
Public Const PTR_MF_TO_CUTTER = 2
Public Const PTR_MF_TO_CURRENT_TOF = 4
Public Const PTR_MF_TO_NEXT_TOF = 8


Rem *///////////////////////////////////////////////////////////////////
Rem * "ChangePrintSide" Method: "Side" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_PS_UNKNOWN = 0
Public Const PTR_PS_SIDE1 = 1
Public Const PTR_PS_SIDE2 = 2
Public Const PTR_PS_OPPOSITE = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event: "Data" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PTR_SUE_COVER_OPEN = 11
Public Const PTR_SUE_COVER_OK = 12
Public Const PTR_SUE_JRN_COVER_OPEN = 60    ' (added in 1.8)
Public Const PTR_SUE_JRN_COVER_OK = 61      ' (added in 1.8)
Public Const PTR_SUE_REC_COVER_OPEN = 62    ' (added in 1.8)
Public Const PTR_SUE_REC_COVER_OK = 63      ' (added in 1.8)
Public Const PTR_SUE_SLP_COVER_OPEN = 64    ' (added in 1.8)
Public Const PTR_SUE_SLP_COVER_OK = 65      ' (added in 1.8)

Public Const PTR_SUE_JRN_EMPTY = 21
Public Const PTR_SUE_JRN_NEAREMPTY = 22
Public Const PTR_SUE_JRN_PAPEROK = 23

Public Const PTR_SUE_REC_EMPTY = 24
Public Const PTR_SUE_REC_NEAREMPTY = 25
Public Const PTR_SUE_REC_PAPEROK = 26

Public Const PTR_SUE_SLP_EMPTY = 27
Public Const PTR_SUE_SLP_NEAREMPTY = 28
Public Const PTR_SUE_SLP_PAPEROK = 29

Public Const PTR_SUE_JRN_CARTRIDGE_EMPTY = 41
Public Const PTR_SUE_JRN_CARTRIDGE_NEAREMPTY = 42
Public Const PTR_SUE_JRN_HEAD_CLEANING = 43
Public Const PTR_SUE_JRN_CARTRIDGE_OK = 44

Public Const PTR_SUE_REC_CARTRIDGE_EMPTY = 45
Public Const PTR_SUE_REC_CARTRIDGE_NEAREMPTY = 46
Public Const PTR_SUE_REC_HEAD_CLEANING = 47
Public Const PTR_SUE_REC_CARTRIDGE_OK = 48

Public Const PTR_SUE_SLP_CARTRIDGE_EMPTY = 49
Public Const PTR_SUE_SLP_CARTRIDGE_NEAREMPTY = 50
Public Const PTR_SUE_SLP_HEAD_CLEANING = 51
Public Const PTR_SUE_SLP_CARTRIDGE_OK = 52

Public Const PTR_SUE_IDLE = 1001


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EPTR_COVER_OPEN = 201               ' (Several)
Public Const OPOS_EPTR_JRN_EMPTY = 202                ' (Several)
Public Const OPOS_EPTR_REC_EMPTY = 203                ' (Several)
Public Const OPOS_EPTR_SLP_EMPTY = 204                ' (Several)
Public Const OPOS_EPTR_SLP_FORM = 205                 ' EndRemoval
Public Const OPOS_EPTR_TOOBIG = 206                   ' PrintBitmap
Public Const OPOS_EPTR_BADFORMAT = 207                ' PrintBitmap
Public Const OPOS_EPTR_JRN_CARTRIDGE_REMOVED = 208    ' (Several)
Public Const OPOS_EPTR_JRN_CARTRIDGE_EMPTY = 209      ' (Several)
Public Const OPOS_EPTR_JRN_HEAD_CLEANING = 210        ' (Several)
Public Const OPOS_EPTR_REC_CARTRIDGE_REMOVED = 211    ' (Several)
Public Const OPOS_EPTR_REC_CARTRIDGE_EMPTY = 212      ' (Several)
Public Const OPOS_EPTR_REC_HEAD_CLEANING = 213        ' (Several)
Public Const OPOS_EPTR_SLP_CARTRIDGE_REMOVED = 214    ' (Several)
Public Const OPOS_EPTR_SLP_CARTRIDGE_EMPTY = 215      ' (Several)
Public Const OPOS_EPTR_SLP_HEAD_CLEANING = 216        ' (Several)



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposPwr.h
Rem *
Rem *   POSPower header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 00-09-24 OPOS Release 1.5                                     TH
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "UPSChargeState" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const PWR_UPS_FULL = 1
Public Const PWR_UPS_WARNING = 2
Public Const PWR_UPS_LOW = 4
Public Const PWR_UPS_CRITICAL = 8


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event: "Status" Parameter
Rem *///////////////////////////////////////////////////////////////////

Public Const PWR_SUE_UPS_FULL = 11
Public Const PWR_SUE_UPS_WARNING = 12
Public Const PWR_SUE_UPS_LOW = 13
Public Const PWR_SUE_UPS_CRITICAL = 14
Public Const PWR_SUE_FAN_STOPPED = 15
Public Const PWR_SUE_FAN_RUNNING = 16
Public Const PWR_SUE_TEMPERATURE_HIGH = 17
Public Const PWR_SUE_TEMPERATURE_OK = 18
Public Const PWR_SUE_SHUTDOWN = 19



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposRod.h
Rem *
Rem *   Remote Order Display header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 98-03-06 OPOS Release 1.3                                     BB
Rem * 00-09-24 OPOS Release 1.5                                     BKS
Rem *   Added CharacterSet value for UNICODE.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CurrentUnitID" and "UnitsOnline" Properties
Rem *   and "Units" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_UID_1 = &H1
Public Const ROD_UID_2 = &H2
Public Const ROD_UID_3 = &H4
Public Const ROD_UID_4 = &H8
Public Const ROD_UID_5 = &H10
Public Const ROD_UID_6 = &H20
Public Const ROD_UID_7 = &H40
Public Const ROD_UID_8 = &H80
Public Const ROD_UID_9 = &H100
Public Const ROD_UID_10 = &H200
Public Const ROD_UID_11 = &H400
Public Const ROD_UID_12 = &H800
Public Const ROD_UID_13 = &H1000
Public Const ROD_UID_14 = &H2000
Public Const ROD_UID_15 = &H4000
Public Const ROD_UID_16 = &H8000
Public Const ROD_UID_17 = &H10000
Public Const ROD_UID_18 = &H20000
Public Const ROD_UID_19 = &H40000
Public Const ROD_UID_20 = &H80000
Public Const ROD_UID_21 = &H100000
Public Const ROD_UID_22 = &H200000
Public Const ROD_UID_23 = &H400000
Public Const ROD_UID_24 = &H800000
Public Const ROD_UID_25 = &H1000000
Public Const ROD_UID_26 = &H2000000
Public Const ROD_UID_27 = &H4000000
Public Const ROD_UID_28 = &H8000000
Public Const ROD_UID_29 = &H10000000
Public Const ROD_UID_30 = &H20000000
Public Const ROD_UID_31 = &H40000000
Public Const ROD_UID_32 = &H80000000


Rem *///////////////////////////////////////////////////////////////////
Rem * Broadcast Methods: "Attribute" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_ATTR_BLINK = &H80

Public Const ROD_ATTR_BG_BLACK = &H0
Public Const ROD_ATTR_BG_BLUE = &H10
Public Const ROD_ATTR_BG_GREEN = &H20
Public Const ROD_ATTR_BG_CYAN = &H30
Public Const ROD_ATTR_BG_RED = &H40
Public Const ROD_ATTR_BG_MAGENTA = &H50
Public Const ROD_ATTR_BG_BROWN = &H60
Public Const ROD_ATTR_BG_GRAY = &H70

Public Const ROD_ATTR_INTENSITY = &H8

Public Const ROD_ATTR_FG_BLACK = &H0
Public Const ROD_ATTR_FG_BLUE = &H1
Public Const ROD_ATTR_FG_GREEN = &H2
Public Const ROD_ATTR_FG_CYAN = &H3
Public Const ROD_ATTR_FG_RED = &H4
Public Const ROD_ATTR_FG_MAGENTA = &H5
Public Const ROD_ATTR_FG_BROWN = &H6
Public Const ROD_ATTR_FG_GRAY = &H7


Rem *///////////////////////////////////////////////////////////////////
Rem * "DrawBox" Method: "BorderType" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_BDR_SINGLE = 1
Public Const ROD_BDR_DOUBLE = 2
Public Const ROD_BDR_SOLID = 3


Rem *///////////////////////////////////////////////////////////////////
Rem * "ControlClock" Method: "Function" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_CLK_START = 1
Public Const ROD_CLK_PAUSE = 2
Public Const ROD_CLK_RESUME = 3
Public Const ROD_CLK_MOVE = 4
Public Const ROD_CLK_STOP = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "ControlCursor" Method: "Function" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_CRS_LINE = 1
Public Const ROD_CRS_LINE_BLINK = 2
Public Const ROD_CRS_BLOCK = 3
Public Const ROD_CRS_BLOCK_BLINK = 4
Public Const ROD_CRS_OFF = 5


Rem *///////////////////////////////////////////////////////////////////
Rem * "SelectCharacterSet" Method: "CharacterSet" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_CS_UNICODE = 997
Public Const ROD_CS_ASCII = 998
Public Const ROD_CS_WINDOWS = 999


Rem *///////////////////////////////////////////////////////////////////
Rem * "TransactionDisplay" Method: "Function" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_TD_TRANSACTION = 11
Public Const ROD_TD_NORMAL = 12


Rem *///////////////////////////////////////////////////////////////////
Rem * "UpdateVideoRegionAttribute" Method: "Function" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_UA_SET = 1
Public Const ROD_UA_INTENSITY_ON = 2
Public Const ROD_UA_INTENSITY_OFF = 3
Public Const ROD_UA_REVERSE_ON = 4
Public Const ROD_UA_REVERSE_OFF = 5
Public Const ROD_UA_BLINK_ON = 6
Public Const ROD_UA_BLINK_OFF = 7


Rem *///////////////////////////////////////////////////////////////////
Rem * "EventTypes" Property and "DataEvent" Event: "Status" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const ROD_DE_TOUCH_UP = &H1
Public Const ROD_DE_TOUCH_DOWN = &H2
Public Const ROD_DE_TOUCH_MOVE = &H4


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants for Remote Order Display
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_EROD_BADCLK = 201       ' ControlClock
Public Const OPOS_EROD_NOCLOCKS = 202     ' ControlClock
Public Const OPOS_EROD_NOREGION = 203     ' RestoreVideo Region
Public Const OPOS_EROD_NOBUFFERS = 204    ' SaveVideoRegion
Public Const OPOS_EROD_NOROOM = 205       ' SaveVideoRegion



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposScal.h
Rem *
Rem *   Scale header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "WeightUnit" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SCAL_WU_GRAM = 1
Public Const SCAL_WU_KILOGRAM = 2
Public Const SCAL_WU_OUNCE = 3
Public Const SCAL_WU_POUND = 4


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ESCAL_OVERWEIGHT = 201   ' ReadWeight



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposScan.h
Rem *
Rem *   Scanner header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem *   Add "ScanDataType" values.
Rem * 04-03-22 OPOS Release 1.8                                     CRM
Rem *   Add more values for ScanDataType.
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "ScanDataType" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Rem * One dimensional symbologies
Public Const SCAN_SDT_UPCA = 101            ' Digits
Public Const SCAN_SDT_UPCE = 102            ' Digits
Public Const SCAN_SDT_JAN8 = 103            ' = EAN 8
Public Const SCAN_SDT_EAN8 = 103            ' = JAN 8 (added in 1.2)
Public Const SCAN_SDT_JAN13 = 104           ' = EAN 13
Public Const SCAN_SDT_EAN13 = 104           ' = JAN 13 (added in 1.2)
Public Const SCAN_SDT_TF = 105              ' (Discrete 2 of 5) Digits
Public Const SCAN_SDT_ITF = 106             ' (Interleaved 2 of 5) Digits
Public Const SCAN_SDT_Codabar = 107         ' Digits, -, $, :, /, ., +
                                            '   4 start/stop characters
                                            '   (a, b, c, d)
Public Const SCAN_SDT_Code39 = 108          ' Alpha, Digits, Space, -, .,
                                            '   $, /, +, % start/stop (*)
                                            ' Also has Full ASCII feature
Public Const SCAN_SDT_Code93 = 109          ' Same characters as Code 39
Public Const SCAN_SDT_Code128 = 110         ' 128 data characters

Public Const SCAN_SDT_UPCA_S = 111          ' UPC-A with supplemental
                                            '   barcode
Public Const SCAN_SDT_UPCE_S = 112          ' UPC-E with supplemental
                                            '   barcode
Public Const SCAN_SDT_UPCD1 = 113           ' UPC-D1
Public Const SCAN_SDT_UPCD2 = 114           ' UPC-D2
Public Const SCAN_SDT_UPCD3 = 115           ' UPC-D3
Public Const SCAN_SDT_UPCD4 = 116           ' UPC-D4
Public Const SCAN_SDT_UPCD5 = 117           ' UPC-D5
Public Const SCAN_SDT_EAN8_S = 118          ' EAN 8 with supplemental
                                            '   barcode
Public Const SCAN_SDT_EAN13_S = 119         ' EAN 13 with supplemental
                                            '   barcode
Public Const SCAN_SDT_EAN128 = 120          ' EAN 128
Public Const SCAN_SDT_OCRA = 121            ' OCR "A"
Public Const SCAN_SDT_OCRB = 122            ' OCR "B"

Rem *  - One dimensional symbologies (Added in Release 1.8)
Public Const SCAN_SDT_RSS14 = 131           ' Reduced Space Symbology - 14 digit GTIN
Public Const SCAN_SDT_RSS_EXPANDED = 132    ' RSS - 14 digit GTIN plus additional fields

Rem *  - Composite Symbologies (Added in Release 1.8)
Public Const SCAN_SDT_CCA = 151             ' Composite Component A.
Public Const SCAN_SDT_CCB = 152             ' Composite Component B.
Public Const SCAN_SDT_CCC = 153             ' Composite Component C.

Rem * Two dimensional symbologies
Public Const SCAN_SDT_PDF417 = 201
Public Const SCAN_SDT_MAXICODE = 202

Rem * Special cases
Public Const SCAN_SDT_OTHER = 501     ' Start of Scanner-Specific bar
                                      '   code symbologies
Public Const SCAN_SDT_UNKNOWN = 0     ' Cannot determine the barcode
                                      '   symbology.



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposScrw.H
Rem *
Rem *   Smart Card Reader Writer header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 04-03-22 OPOS Release 1.8                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapInterfaceMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_CMODE_TRANS = 1    ' Simple Transaction Command and Data Mode.
Public Const SC_CMODE_BLOCK = 2    ' Block Data Mode.
Public Const SC_CMODE_APDU = 4     ' Same as Block Data Mode except APDU Standard Commands are used.
Public Const SC_CMODE_XML = 8      ' XML Block Data Mode.


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapIsoEmvMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_CMODE_ISO = 1    ' APDU messaging format conforms to the ISO standard.
Public Const SC_CMODE_EMV = 2    ' APDU messaging format conforms to the EMV standard.


Rem *///////////////////////////////////////////////////////////////////
Rem * "CapTransmissionProtocol" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_CTRANS_PROTOCOL_T0 = 1    ' Asynchronous, Half Duplex, Character, Transmission Protocol Mode.
Public Const SC_CTRANS_PROTOCOL_T1 = 2    ' Asynchronous, Half Duplex, Block Transmission Protocol Mode.


Rem *///////////////////////////////////////////////////////////////////
Rem * "InterfaceMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_MODE_TRANS = 1    ' Simple Transaction Command and Data Mode.
Public Const SC_MODE_BLOCK = 2    ' Block Data Mode.
Public Const SC_MODE_APDU = 4     ' Same as Block Data Mode except APDU Standard Defines the Commands and data.
Public Const SC_MODE_XML = 8      ' XML Block Data Mode.


Rem *///////////////////////////////////////////////////////////////////
Rem * "IsoEmvMode" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_MODE_ISO = 1    ' APDU messaging format currently in use conforms to the ISO standard.
Public Const SC_MODE_EMV = 2    ' APDU messaging format currently in use conforms to the EMV standard.


Rem *///////////////////////////////////////////////////////////////////
Rem * "TransmissionProtocol" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_TRANS_PROTOCOL_T0 = 1    ' Asynchronous, Half Duplex, Character, Transmission Protocol Mode.
Public Const SC_TRANS_PROTOCOL_T1 = 2    ' Asynchronous, Half Duplex, Block Transmission Protocol Mode.


Rem *///////////////////////////////////////////////////////////////////
Rem * "ReadData" Method: "Action" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_READ_DATA = 11
Public Const SC_READ_PROGRAM = 12
Public Const SC_EXECUTE_AND_READ_DATA = 13
Public Const SC_XML_READ_BLOCK_DATA = 14


Rem *///////////////////////////////////////////////////////////////////
Rem * "WriteData" Method: "Action" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_STORE_DATA = 21
Public Const SC_STORE_PROGRAM = 22
Public Const SC_EXECUTE_DATA = 23
Public Const SC_XML_BLOCK_DATA = 24
Public Const SC_SECURITY_FUSE = 25
Public Const SC_RESET = 26


Rem *///////////////////////////////////////////////////////////////////
Rem * "StatusUpdateEvent" Event: "Data" Parameter Constant
Rem *///////////////////////////////////////////////////////////////////

Public Const SC_SUE_NO_CARD = 1         ' No card detected in the SCR/W Device.
Public Const SC_SUE_CARD_PRESENT = 2    ' There is a card in the device.


Rem *///////////////////////////////////////////////////////////////////
Rem * "ErrorEvent" Event: "ResultCodeExtended" Parameter Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ESC_READ = 201       ' There was a read error.
Public Const OPOS_ESC_WRITE = 202      ' There was a write error.
Public Const OPOS_ESC_TORN = 203       ' The smart card was prematurely removed from the SCR/W unexpectedly. Note: CapCardErrorDetection capability must be true before this can be set.
Public Const OPOS_ESC_NO_CARD = 204    ' There is no card detected in the SCR/W but a card was expected.



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposSig.h
Rem *
Rem *   Signature Capture header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem * No definitions required for this version.



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposTone.h
Rem *
Rem *   Tone Indicator header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 97-06-04 OPOS Release 1.2                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem * No definitions required for this version.



Rem *///////////////////////////////////////////////////////////////////
Rem *
Rem * OposTot.h
Rem *
Rem *   Hard Totals header file for OPOS Applications.
Rem *
Rem * Modification history
Rem * ------------------------------------------------------------------
Rem * 95-12-08 OPOS Release 1.0                                     CRM
Rem *
Rem *///////////////////////////////////////////////////////////////////


Rem *///////////////////////////////////////////////////////////////////
Rem * "ResultCodeExtended" Property Constants
Rem *///////////////////////////////////////////////////////////////////

Public Const OPOS_ETOT_NOROOM = 201        ' Create, Write
Public Const OPOS_ETOT_VALIDATION = 202    ' Read, Write



Rem *End of OPOSALL.BAS*
