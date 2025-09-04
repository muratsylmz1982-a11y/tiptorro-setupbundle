@echo off
cd /d %~dp0
rem _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
rem
rem       TSP100LAN 9100 Single Session
rem
rem _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

start "TSP100LAN 9100 Single Session"
cscript 9100Single.vbs "192.168.123.45" "public"
