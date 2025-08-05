@echo off
title 
cmd /c cmd /c rpi.exe
timeout /nobreak 10
taskkill /im RobloxPlayerBeta.exe
cmd /c cmd /c rsi.exe
timeout /nobreak 10
taskkill /im RobloxStudioBeta.exe
exit
