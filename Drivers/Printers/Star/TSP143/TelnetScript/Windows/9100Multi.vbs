Set oArgs    = WScript.Arguments
Set WshShell = WScript.CreateObject("WScript.Shell")

nArgc = oArgs.Count
if nArgc = 2 then

    ip_addr = oArgs(0)  'IP Address
    passKey = oArgs(1)  'Login password

    WshShell.AppActivate "TSP100LAN 9100 Multi Session"
    WScript.Sleep 1000
    WshShell.SendKeys "telnet " & ip_addr & "~"
    WScript.Sleep 1000
    WshShell.SendKeys "root~"
    WScript.Sleep 1000
    WshShell.SendKeys passKey & "~"
    WScript.Sleep 1000
    WshShell.SendKeys 2 & "~"       'System Configuration
    WScript.Sleep 1000
    WshShell.SendKeys 2 & "~"       '#9100 Multi Session
    WScript.Sleep 1000
    WshShell.SendKeys 1 & "~"       'ENABLE
    WScript.Sleep 1000
    WshShell.SendKeys 99 & "~"      'Back to Main Menu
    WScript.Sleep 1000
    WshShell.SendKeys 98 & "~"      'Save & Restart
    WScript.Sleep 1000
    WshShell.SendKeys 2 & "~"       'Save & Restart device
    WScript.Sleep 1000
    WshShell.SendKeys "exit~"       'exit
else
    WshShell.AppActivate "TSP100LAN 9100 Multi Session"
    WshShell.SendKeys "exit~"       'exit
    WScript.Echo "Parameter Error!!"
end if

Set WshShell = nothing
Set ArgParam = nothing
