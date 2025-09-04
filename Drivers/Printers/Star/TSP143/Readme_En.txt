///////////////////////////////////////////////////////////////////////////

    - Star TSP100 futurePRNT -
        Readme text file                                    11/30/2022

    (C) 2005 - 2022 Star Micronics Co., Ltd. All rights reserved.
///////////////////////////////////////////////////////////////////////////

* This text applies to Star TSP100 version 7.7.0

Thank you very much for purchasing Star TSP100 futurePRNT.

This README file contains the following sections:

 1.  How to Use SDK
 2.  TSP100GT/TSP100LAN Software Upgrade
 3.  Silent Installations
 4.  Silent Uninstallations
 5.  Uninstallations for Windows 7//8.1/10/11(32bit/64bit)
 6.  How to Install Printer Driver manually
 7.  How to use Croatian or Slovenian
 8.  JavaPOS CO(Control Object) Version
 9.  Plug and Play Instruction not completed
10.  Cash Drawer usage through the Windows Driver
11.  Notification for Existing TSP100 Series Customers
12.  TSP100LAN User
13.  Windows Patch
14.  Supplementary Explanation Concerning Star Micronics Cloud
15.  Release history

* For Windows 7     (32bit/64bit)
      Windows 8.1   (32bit/64bit)
      Windows 10    (32bit/64bit)
      Windows 11    (64bit)

==================
1.  How to Use SDK
==================
This software include SDK(Software Development Kit) to use the TSP100
functions effectively.
1. Open "Windows" folder -> Open "SDK" folder.
2. Refer to the sample program in "SDK" folder.

=======================================
2.  TSP100GT/TSP100LAN Software Upgrade
=======================================
Uninstall the TSP100GT/TSP100LAN software before installing the V5.0.0 or later
futurePRNT Software.

Note:
 * When upgrading to futurePRNT 5.0 or later from an earlier version, any settings
   made in futurePRNT will not be carried over.  Before uninstalling the older version,
   export all settings to the PC.  Refer to the TSP100 Software Manual, section 4.1.1.

========================
3.  Silent Installations
========================
Silent installations are installations that run without a user interface
you can run the command Setup.exe /s /v"/qn" or Setup_x64.exe /s /v"/qn"

Windows 7/8.1/10/11: Execute command prompt as administrator.

Setup_x86.exe and Setup_x64.exe pass is D:\Setup
    ("D" is the drive letter of your PC.)

    for 32bit OS
        Setup_x86.exe /s /v"/qn"

    for 64bit OS
        Setup_x64.exe /s /v"/qn"

If a previous version of futurePRNT is installed and you would like to upgrade
to V7.7.0 via silent installation, follow these directions for your model.

    (1) Silent uninstall TSP100GT V1.0.0  then silent install V7.7.0

        start /wait msiexec.exe /qn /x {19170D85-0B64-4331-BFBE-27E4D8431DE1}
        start /wait Setup_x64.exe /s /v"/qn"
        ( start /wait Setup_x86.exe /s /v"/qn" )

    (2) Silent uninstall TSP100LAN V1.0.0 then silent install V7.7.0

        start /wait msiexec.exe /qn /x {46E4BCEA-60B6-4C5D-82DC-5992919938D6}
        start /wait Setup_x64.exe /s /v"/qn"
        ( start /wait Setup_x86.exe /s /v"/qn" )

    (3) Silent uninstall TSP100LAN V1.1.0 then silent install V7.7.0

        start /wait msiexec.exe /qn /x {1B014364-8197-4E75-8506-49C330A41515}
        start /wait Setup_x64.exe /s /v"/qn"
        ( start /wait Setup_x86.exe /s /v"/qn" )

==========================
4.  Silent Uninstallations
==========================
Silent Uninstallation is uninstallation that no on-screen messages will be
displayed at any time during the execution of the Silent Uninstallation.

Windows 7/8.1/10/11: Execute command prompt as administrator.

you can run the command as follows;

    msiexec.exe /qn /x {3A67E289-0888-4BD5-A334-B0CECABF7128}

=======================================================
5.  Uninstallations for Windows 7/8.1/10/11(32bit/64bit)
=======================================================
If the print spooler and on demand confirmation dialog box appears,
select Do not close applications, and then click the OK button.
(Although A reboot will be required is indicated, the computer will not restart.)

If the reboot dialog box appears, click OK.

==========================================
6.  How to Install Printer Driver manually
==========================================
In the special environment such as Windows Embedded, the installer
might not work correctly.
If you get any error using standard installer, please install driver
manually.
This install set is located at
    "D:\Windows\PrinterDriver"
    ("D" is the drive letter of your PC.)
But if you use this install set, you cannot use following functions.
    - Configuration utility
    - OPOS/JavaPOS
    - Value added function

====================================
7.  How to Use Croatian or Slovenian
====================================

// How to change setting //

1. Open Control Panel from start menu.
2. Open Regional and Language option.
3. Select Advanced tab.
4. Set Croatian or Slovenian in "Language for non-Unicode programs".


======================================
8.  JavaPOS CO(Control Object) Version
======================================
Star JavaPOS uses CO(Control Object) file of version 1.13
(jpos113-controls.jar). If you want to use CO version above 1.13,
you can download co following web site and please recompile sample program
(StarReceiptTest.java).

http://www.javapos.com/

============================================
9.  Plug and Play Instruction not completed
============================================
After installing futurePRNT 7.7, USB models (TSP100IIU, TSP100U, TSP100PUSB, TSP100GT)
will automatically install.  However, if the ethernet TSP100LAN is connected,
the Plug and Play installation may not complete.  In this case, refer to the following
instruction.

 9-1.  Installation software available
        [32bit OS]
         D:\Windows\PrinterDriver\i386

        [64bit OS]
         D:\Windows\PrinterDriver\amd64

        *: "D" is the drive letter of your PC.

 9-2.  Installation software not available
        [32bit OS]
         C:\Program Files\StarMicronics\TSP100\Software\20221130\PrinterDriver\i386

        [64bit OS]
         C:\Program Files (x86)\StarMicronics\TSP100\Software\20221130\PrinterDriver\amd64

        *: "C" is current PC's Windows system installed Drive letter.

=================================================
10.  Cash Drawer usage through the Windows Driver
=================================================
When upgrading to futurePRNT 5.0 or later from an earlier version and the driver was set to
control the cash drawer, this setting will not carry over.  Refer to the TSP100 Software
Manual for information on triggering the cash drawer through the Windows Driver.

======================================================
11.  Notification for Existing TSP100 Series Customers
======================================================
 11-1. Upgrading  from an earlier software version

       (1)TSP100IIU/TSP100U
          - Update from current version to V5.0.0 or later Software, no extra configuration
            necessary.

       (2)TSP100GT/TSP100LAN
          - Uninstall the current software version, and then install V5.0.0 or later.
          - Before uninstallation the older version, export all futurePRNT settings to the PC.
            Refer to the TSP100 Software Manual, section 4.1.1.

 11-2. Adding or Replacing the TSP100 Series

       (1)Replacing an existing TSP100IIU/TSP100U with a new TSP100IIU/TSP100U
          - Requires no configuration modification.

       (2)Replacing an existing TSP100IIU/TSP100U with a new TSP100GT/TSP100LAN
          - Upgrade to version 5.0.0 or later

       (3)Replacing an existing TSP100GT/TSP100LAN with a new TSP100GT/TSP100LAN
          - No software upgrade necessary
          - If upgrading to V5.0.0 or later, uninstall the current software version,
            then install the upgrade.
          - Export all configuration settings before uninstalling the current software version.
            Refer to the TSP100 Software Manual, section 4.1.1.

       (4)Replacing an existing TSP100GT/TSP100LAN with a new TSP100IIU/TSP100U
          - Upgrade to V5.0.0 or later is necessary
          - Uninstall the current software version, then install the upgrade.
          - Export all configuration settings before uninstalling the current software version.
            Refer to the TSP100 Software Manual, section 4.1.1.

===================
12.  TSP100LAN User
===================
Please refer to below notifications.

Depending on environment, need to check #9100 multi session settings (Enable or Disable)

 * When TSP100LAN is controlled by one host device
   Do not care of #9100 setting.

 * When TSP100LAN is controlled by multiple host devices;
   Need to use  multi session setting to "Disable"
   #9100 port changing script is included in software, "TelnetScript" folder.
    Please refer to "Readme_En.txt" in this folder.
    After confirming #9100 setting, check the following combinations.

    +------------+-----------+-----------+-----------+-----------+
    | HostDevice |  Windows  |    CUPS   |    iOS    |  Android  |
    +------------+-----------+-----------+-----------+-----------+
    | Windows    |     *1    |    *1     |    *1     |    *1     |
    +------------+-----------+-----------+-----------+-----------+
    | CUPS       |     *2    |    -      |    *2     |    *2     |
    +------------+-----------+-----------+-----------+-----------+
    | iOS        |     -     |    -      |    -      |    -      |
    +------------+-----------+-----------+-----------+-----------+
    | Android    |     -     |    -      |    -      |    -      |
    +------------+-----------+-----------+-----------+-----------+
      *1: Need to use V7.7.0.
      *2: Need to use #9100 port.
      - : Do not need to change settings.

==================
13.  Windows Patch
==================
This includes patches.
Browse to the "Windows_Patch" folder to access these files.

13-1. Language Monitor Patch
    "TSP100_V760_LMUpdatePatch_for_T100U-FW11_T100IIU-FW20.zip"

    Target Printer:  TSP100U F/W Ver.1.1, TSP100IIU F/W Ver. 1.0 to 2.0
      When the problem that printer job is accumulated in the spooler, apply this patch program.
      For details, refer to "Readme_En.txt" file which is included in
          "TSP100_V760_LMUpdatePatch_for_T100U-FW11_T100IIU-FW20.zip"

=============================================================
14. Supplementary Explanation Concerning Star Micronics Cloud
=============================================================
14-1 ESC/POS Support
    If you use
      - Virtual Serial Port
      - Virtual TCP/IP Port (TSP100LAN only) or
      - Write Printer
    at ESC/POS mode, you can use the print data upload function and manage the registered device
    from dashboard which allows you to upload print data to Star Micronics Cloud.

14-2 Resending print data to Star Micronics Cloud
    When "Print Data Upload" to Star Micronics Cloud is enabled, the upload to the cloud server
    sometimes fails for some reason. In this case, the print data you failed to upload will be
    resent automatically at the timing shown below.

    If the connection of your PC and Star Micronics Cloud server is online when the next print
    processing is executed, the print data you failed to upload will be automatically resent.

====================
15.  Release history
====================
Rev. 1.0    Initial release.
08/31/2005

Rev. 1.1    Added Journal.
09/20/2005  Added 7 languages configuration utility.
            Added "check health" function in port emulator.
            Fixed many bugs.

Rev. 1.2    Added localized software manuals.
10/04/2005  Added SDK (include Drawer Kick Tool).
            Fixed many bugs.

Rev. 1.2.1  Bug-fix OPOS (works with MS POS and RetailPro)
10/28/2005  Modified Installer (message of setup type U/I)

Rev. 2.0    Added ESC/POS Mode and Multi Copy.
12/28/2005

Rev. 2.0.1  Modified ESCPOSSE.dll
01/18/2006  ESC/POS status commands full supported.
            Added following new commands.
                <GS>r/ <ESC>u/ <ESC>v
            Modified TSP100LM.dll
                Fixed bug allowing "Limited User" type accounts
                to use the printer.

Rev. 2.0.2  Fixed bug whereby OPOS or JavaPOS driver usage would
02/07/2006  fail under some circumstances.
            Fixed file import function of configuration utility.
            Modified portemu.exe (Serial Port Emulator):
                After printer returns to online, the data received
                in off-line can be printed.
                Note: Serial communication
                (1) Can't use the CTS or the DSR signal line
                    for monitoring printer on/off line.
                (2) Can't use the status commands in printer off-line.

Rev. 2.1.0  Support Multi Languages. (Added 13 Languages)
03/16/2006  Configuration Utility
                Added "Select Language" function.
                Protect barcodes from being merged with
                background/watermark images.
            Serial Port Emulator
                Fixed  bugs about :
                (1) Data lost when application sends over 8KB data with
                    No flow control.
                (2) Print result is not correct once after virtual serial
                    port creation.
                (3) Response for status request command is sometimes
                    delayed.
                (4) Can't use the CTS or the DSR signal line for
                    monitoring printer on/off line.
                (5) Can't use the status commands in printer off-line.
            OPOS
                Fixed can not open cash drawer after printer cover open.
Rev. 2.2.0  Added Serial Port Emulator Setting Tool.
04/27/2006

Rev. 2.3.0  Bug-fix OPOS
08/11/2006      Immediately after user logged on Windows, OPOS printing
                does not work correctly. After tens of seconds passed,
                OPOS printing works correctly.
            Printer driver for Windows 2000/XP
                Added QR code.
                Fixed bug allowing "Limited User" type accounts
                to use the printer when you use printer driver only.
            SDK
                Added sample program for QR code.
                (Visual C++ 6.0 and Visual Basic 6.0)
            Added Font Replacement function.
                NOTE: Only support Star Line Mode(SBCS).
                      Not support ESC/POS Mode.
            Modified Text Processing function.
                Added kind of character to key.
            Serial Port Emulator Setting Tool
                Add the version information dialog.
                Bug-Fix of user interface.

Rev. 2.4.0  JavaPOS [Add/Bug Fix]
11/30/2006      Fixed can not open cash drawer after printer cover open.
                Added JavaPOS for Linux.
                    Location is
                    "D:\Linux\starjavapos-tsp100_linuxX86K26_20060915.zip"
                    ("D" is current PC's drive letter.)
            Configuration Utility [Add]
                Added HexDump function.
            Font Replacement function [Add]
                Support "Shift_JIS".
                NOTE: Only support Star Line Mode.
                      Not support ESC/POS Mode.
            Readme.txt [Add]
                Added "How to Install TSP100 CD on Windows 2000 without
                Service Pack"

Rev. 3.0.0  Support Printer Driver with WHQL certified for both
06/29/2007      Windows Vista x86(32bit) and Windows Vista x64(64bit).
            Support Configuration Utility on Windows Vista x86(32bit).

Rev. 3.0.0a Add Software Manual (multi languages version) for Rev. 3.0.0
07/23/2008  in TSP100 CD.
            Add Installation Manual for Windows Vista (multi languages
            version) in TSP100 CD.
                Location
                "D:\Install_Manual_Vista"
                ("D" is current PC's drive letter.)
            Add "Linux, Mac Supported Operating Systems" in Readme.txt.

Rev. 3.1.0  OPOS [Add]
07/24/2009      - Support print width 51mm.
            OPOS [Bug Fix]
                - Fixed bug of OPOS Japanese character space.
            Language Monitor [Bug Fix]
                - Fixed OPOS may not print for timeout error.
            Command Emulator [Fix]
                - Fixed emphasized printing command (ESC E)
                  Specifies emphasized printing for Kanji and ANK
                  characters.
            SDK [Fix/Add]
                - Clean up sample program.
                - Add get status sample program(ESC/POS, Star Line mode).
            Manual [Add]
                - Added OPOS Application Development Guide
            Installer [Bug Fix]
                - Fixed mfc70.dll, mfc70u.dll, msvcr70.dll are copied to
                  unexpected folder.
            Software License Agreement [Add]
                - Add the terms of Third-party Software.
            Configuration Utility  [Bug Fix]
                - On Windows Vista, preview function is disabled.
                  But user control UI by keyboard and display preview
                  window.
                - User didn't install OPOS, JavaPOS and Virtual Serial
                  Ports. But user control UI by keyboard and display these
                  functions window.
                - On Windows Vista, some font names are displayed to "???"
                  in font replacement.
            Configuration Utility - Printer Font [Bug Fix]
                - Printer Font tool read font data only .ttf and .ttc
                  files. Only small character. .TTF and .TTC files can't
                  be displayed in list of UI.
                - If Printer Font dll can't understand a font file,
                  configuration utility happens runtime error when launch.
            Configuration Utility - Virtual Serial Ports [Bug Fix]
                - Fixed user can add same port name using another star
                  printer.
                - 1. User register virtual serial ports on Star Line mode.
                  2. User register virtual serial ports on ESC/POS mode.
                  After user cannot use com port set by Star Line mode.
            Configuration Utility - Hex Dump [Bug Fix]
                - Fixed hex dump windows cannot be displayed after delete
                  specified folder.
            Configuration Utility - Simplified Chinese UI[Bug Fix]
                - Some characters are Traditional Chinese.
                  Modify to Simplified Chinese.
            Configuration Utility - Image List [Bug Fix]
                - Fixed user can use 2 byte character in Rename view.
            Configuration Utility - OPOS [Bug Fix]
                - Fixed configuration utility register Star OPOS CO
                  forcibly.
            Configuration Utility - JavaPOS [Bug Fix]
                - Fixed user can add device name include "\" character.
                  JavaPOS not support "\" character in device name.

Rev. 4.0.0  Support TSP100IIU printer.
03/30/2010     - Add ECO function in TSP100 Configuration Utility
            Manual [Fix]
               - Delete manual in installer.
                 Please read the manual in CD menu -> "Documents/SDK".

Rev. 4.0.0a Manual [Revision]
08/18/2010      Revised Hardware manuals.
            JavaPOS [Bug Fix]
                Fixed JavaPOS for Linux.
                    D:\Linux\JavaPOS\starjavapos_1.9.15_linux_20100618.zip
                    ("D" is current PC's drive letter.)
            Patch [Add]
                Added the patch file and readme.txt.
                    D:\Patch_and_Manual\TSP100IIU_V4.0.0_patch_20100621.zip
                    ("D" is current PC's drive letter.)
            Readme.txt [Revision]
                Added "Patch and Manual".

Rev. 5.0.0  futurePRNT Multi Model.
03/11/2011     - Support TSP100 series All Models.
                  (TSP100U/PU, TSP100IIU, TSP100GT, TSP100LAN)
               - TSP100GT/LAN supported Windows7 newly.
            OPOS [Fix]
               - Support OPOS V1.13.
               - Added OPOS CCO(Common Control Object).
            JavaPOS [Fix]
               - Support JavaPOS V1.13.
            Command Emulator [Add]
               - Add FontB (Star Line mode).
               - Add PDF417(Star Line mode).
            SDK [Add]
               - Add sample program for PDF417.(VC++ 6.0 and VB 6.0)
               - Add C# sample program of the Status Monitor.(Visual Studio 2005)
               - Add sample program for Virtual Serial Port. (Visual Studio 2005)
            Manual [Revision]
               - Revised Hardware manuals.
               - Revised Software manuals.

Rev. 5.1.0  Serial Port Emulator [Add]
06/07/2011     - Support .NET SerialPort Component.
            OPOS [Add]
               - Support 180dpi compatible mode.
            JavaPOS [Add/Fix]
               - Support DBCS.(Shift-JIS, GB2312, Big5, Korean)
               - Debug 180 degree rotation command.
                 When set 180 rotation, cannot set rotation if data is only text.
               - Debug error output bug.
                 When JavaPOS driver receives less than one line data,
                 JavaPOS driver output "NullPointerException".
            Configuration Utility [Bug Fix]
               - Fixed bug of Import function.
            Printer Driver installation [Bug Fix]
               - Fixed bug of Plug and Play installation may not complete.
            Manual [Revision]
               - Revised Hardware manuals.
               - Revised Software manuals.

Rev. 5.2.0  Configuration Utility [Add]
10/27/2011     - Added "multi trigger single coupon" function.
            Command Emulator [Add]
               - Added Thai code pages.
            Command Emulator [Bug Fix]
               - Fixed bug for which temporary file is made when Journal
                 function is used.
            Language Monitor [Bug Fix]
               - Fixed print delay.
            Manual [Revision]
               - Revised Software manuals.

Rev. 5.3.0  Command Emulator [change specification]
10/19/2012     - Modified Japanese Kanji(JIS2004e)
            Support Windows 8
            Language Monitor [Bug Fix]
               - Fixed memory Leak(Only TSP100LAN)
            Configuration Utility [Bug Fix]
               - Fixed Import function.
            Virtual Port Emulator [Bug Fix]
               - Fixed service start timing

Rev. 5.4.0  Language Monitor/LPR Port Monitor [Bug Fix]
06/22/2013     - When control TSP100LAN from multiple PCs simultaneously,
                 data will be mixed.
            JavaPOS [Bug Fix]
               - Debug following clearOutput() issues.
                   When set asyncMode, cannot perform clearOutput().
                   When perform clearOutput(), cannot release tranzactionPrint()
                   and rotatePrint().
               - Debug following setLogo issue.
                   When perform setLogo(), can set top or bottom logo by escape
                   sequence.
               - Debug following barcode print issue
                   can set alignment which is over printableArea.
               - Debug specify printableArea
                   cannot set printableArea value of 58mm.
            CUPS [Fix]
               - Mac OS X 10.8 support.
            Patch [Add]
                Added the patch file.
                  "D:\Windows_Patch"
                    ("D" is current PC's drive letter.)
            Manual [Revision]
               - Revised Hardware manuals.(Only Japanese/English of TSP100LAN)
               - Revised Software manuals.

Rev. 5.5.0  Modified Language Monitor/LPR Port Monitor [Bug Fix]
10/18/2013     - Failed to reprint after power off and on while priting data.
            Added Telnet script [Add]
               - Telnet script for TSP100LAN to change #9100 port setting
                 in "D:/TelnetScript" folder
            Manual [Revision]
               - Revise Hardware manual (only TSP100LAN) and Software manual.

Rev. 6.0.0  Support Star Cloud Services
06/09/2015     - For details to the link:
                   http://www.starcloudservice.com/retailers/welcome.html

Rev. 6.1.0  Support Configuration Utility on Windows 10.
09/17/2015  Improvement of UI.

Rev. 6.2.0  Modified Star Cloud Services
10/30/2015     - Added ESC/POS mode support
               - Made the password changeable 
               - Enabled to resend print data when the upload of print data
                 failed during network failure.

Rev. 7.0.0  Support TSP100IIIW/LAN
12/28/2015  Configuration Utility [Add]
               - Added log output function for communication error.
               - Added Clone Serial Number setting function.(for TSP100IIIW/LAN)
            OPOS [Add]
               - Added support QR code and PDF417.
            Star Cloud Services [Add]
               - Added support for 4 new languages.
                 French, German, Spanish, Portuguese
            JavaPOS [Add]
               - Added support TSP100IIIW/LAN.
            Manual [Revision]
               - Revised Software manuals.

Rev. 7.1.0  Support TSP100IIIBI
06/24/2016  Configuration Utility [Add]
               - Added printer connection setting function.(for TSP100IIIBI)
               - Added print mode setting function.        (for TSP100IIIBI)
            Command Emulator [Bug Fix]
               - Fixed Print Speed and Print Density printing.
            Language Monitor [Bug Fix]
               - While the USB model (TSP100IIU / TSP100U / TSP100GT) connected to a PC with
                 the power ON, Windows10 xml file save the settings of the major update and
                 implement TSP100 configuration utility has been fixed a bug that is initialized.
            Ethernet Setting Tool [Add]
               - Added support TSP100IIIBI.
                 (Renamed to "LAN / Bluetooth Setting Tool".)
            Star Cloud Services [Add]
               - Added support for Finnish language.
            JavaPOS [Add]
               - Added support TSP100IIIBI.
               - Added support QR code and PDF417. (for Windows)
            CUPS [Add]
               - Added support TSP100IIIBI.
            Manual [Revision]
               - Revised Software manuals.

Rev. 7.2.0  Modified Star Cloud Services
01/11/2017     - Added Micro Receipt function.
            Modified Printer Driver
               - Changed the default paper size setting.
            CUPS [Add]
               - Added support Star Cloud Services.
               - Added support for Mac OS X 10.12.
                 NOTE: Mac OS X 10.5 to 10.8 end of support.
            Manual [Revision]
               - Revised Software manuals.

Rev. 7.3.0  Support TSP100IIIU
04/10/2017  Added USB Serial Number Setting Tool.
            Manual [Revision]
               - Revised Software manuals.

Rev. 7.3.0a Modified Start Menu Screen
09/07/2017     - Changed part of the screen image.
               - Changed the URL of the Star Cloud Services.
            Manual [Revision]
               - Revised Software manuals.

Rev. 7.4.0  Command Emulator [change specification]
07/09/2018     You can use the following functions of the TSP100 Configuration Application
               when "NoCut" is set in the printer driver property settings.
                   - Copy function
                   - Vertical Monut Mode
                   - On demand printing
            Modified Star Micronics Cloud
               - Added to print Star Micronics Cloud information.
            Manual [Revision]
               - Added support for TSP100 futurePRNT Ver 7.4.0.
               
Rev. 7.5.0  Command Emulator [change specification]
08/05/2020     - Change Chinese font (GB2312) design.
            LAN / Bluetooth Setting Tool [Add / Bug Fix]
               The following functions can be used
               even if the LAN printer is not displayed in the search results.
                   - Assign a temporary IP address
                   - Create a printer queue by specifying the IP address
               Fixed a problem that Bluetooth printer may not be found.
            Star Micronics Cloud [change specification]
               - Adjusted the size of the QR code.
            JavaPOS [Add]
               - Added support for Linux 64bit.
            Document [Revision]
               - Revised Software manuals for TSP100 futurePRNT Ver 7.5.0.
               - Revised Software license agreements.

Rev. 7.5.1  Printer Driver [modification]
07/13/2021     -  Modified the driver to take care of a specification change for 
                  USB printers related to Windows update on June 8th, 2021.
                  * If the latest Windows update is applied, 
                    it may not work properly with the driver Rev. 7.5.0 or earlier.

Rev. 7.6.0  Windows11 support.
10/29/2021  Star Micronics Cloud [change specification]
               -  WhenÅgPrint Data UploadÅhis checked, the QR code and information are not added
                  on the receipt and the data of printed receipt is uploaded on the Star Micronics Cloud.
               -  Delete QR Code Print Size setting and Micro Receipt setting.
            Configuration Utility [modification]
               - Fixed a problem that Configuration Utility may not be opened.
            Language Monitor [modification]
               - Fixed a problem that JavaPOS may crash.
            Printer Driver [modification]
               - Fixed a problem that can not print after recovering from printer error.
            OPOS [Add]
               - Support PrintMemoryBitmap Method.

Rev. 7.7.0 LAN / Bluetooth setting tool [specification change]
2022/11/30     - Change Bluetooth printer detection procedure.
           Software manual [Revision]
               - Change install method.
           Mac / Linux [specification change]
               - Delete Max/Linux software from the package.
                 Please download each software from below URL.
                 https://www.star-m.jp/prjump/000171.html
           Documents/HardwareManualÅ@[specification change]
               - Delete hardware manual from the packagae.
                 Please download each hardware manual from below URL.
                 https://www.star-m.jp/prjump/000171.html
