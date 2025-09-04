///////////////////////////////////////////////////////////////////////////

   - TSP100LAN Telnet Script -
        Readme File                                            2016/12/22

    Copyright (C) 2016 Star Micronics Co., Ltd. All rights reserved.
///////////////////////////////////////////////////////////////////////////

Easy to change #9100 port setting of TSP100LAN using script.
Refer to following "how to use" script.


=============
1. Support OS
=============

  * Windows
      Windows 7   (32bit/64bit)
      Windows 8   (32bit/64bit)
      Windows 8.1 (32bit/64bit)
      Windows 10  (32bit/64bit)

  * Linux
      Red Hat Enterprise Linux 6.7
      openSUSE 13.1
      Fedora 20
      ubuntu 16.04 LTS
      CentOS 6.8

  * Mac
      Mac OS X 10.9
      Mac OS X 10.10
      Mac OS X 10.11
      Mac OS X 10.12


==========
2. Windows
==========

2-1. To use Telnet command, check the following contents first.

  * Windows7
      1). From the [Start] menu, open the [Control Panel].
      2). Select [Program and Features].
      3). Under [Tasks], select [Turn Windows features on or off].
      4). When the User Account Control dialog appears, click [Continue].
      5). If [Telnet Client] is not yet checked, place a check next to it.
          Then click [OK].

  * Windows8/8.1
      1). On the "Desk Top", from the [Charm bar], select [Settings], 
          then open the [Control Panel]
      2). Select [Programs].
      3). Under [Program and Features], select [Turn Windows features on or off].
      4). When the User Account Control dialog appears, click [Continue].
      5). If [Telnet Client] is not yet checked, place a check next to it.
          Then click [OK].

  * Windows10
      1). From the [Start] menu, select [All apps] and select [Windows System],
          then open the [Control Panel].
      2). Select [Programs].
      3). Under [Program and Features], select [Turn Windows features on or off].
      4). When the User Account Control dialog appears, click [Continue].
      5). If [Telnet Client] is not yet checked, place a check next to it.
          Then click [OK].


2-2. Set an IP address and a password in a bat file.

    Change an IP address and a password in a bat file depending on your environment.
     Defaut settings
        IP address: "192.168.123.45"
        Password  : "public"

      1). Disable #9100 port multi session
            Change "Execute_9100Single.bat"

      2). Enable #9100 port multi session
            Change "Execute_9100Multi.bat"

      Note: The factory setting of the password is "public".


2-3. Execute a bat file.

    Double click a bat file.

      1).  Disable #9100 port multi session
            Double click "Execute_9100Single.bat".

      2).  Enable #9100 port multi session
            Double click "Execute_9100Multi.bat".

==============
3. Linux / Mac
==============

3-1. Need to install the following package to execute a bat file in Linux environment.

  * Neccesarry packages
     - expect
     - telnet

  * How to install
     Execute terminal (console).
     Execute the following commands as a Administrator.
      * To execute a command, need to connect internet.

     - Red Hat Enterprise Linux6.7/CentOS6.8
         # yum install expect
         # yum install telnet

     - Fedora20
         # yum install expect

     - openSUSE13.1
         # zypper in expect

     - ubuntu16.04 LTS
         $ suto apt-get install expect


3-2. Execute script
     Execute terminal (console).

     Set an IP address in the first argument and a password in the second argument, 
     then execute script.

      1). Disable #9100 port multi session

          Example)
          /bin/bash 9100Single.sh "192.168.123.45" "public"

      2). Enable #9100 port multi session

          Example)
          /bin/bash 9100Multi.sh "192.168.123.45" "public"

     Note: The factory setting of the password is "public".

