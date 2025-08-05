@echo off
chcp 65001>nul
:AS_ADMIN
if not "%1"=="admin" (
    echo Запрос прав администратора...
    cmd /c powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/c \"\"%~f0\" admin\"' -Verb RunAs"
    exit /b
)


::SET
setlocal
setlocal EnableDelayedExpansion
set this.d=%~dp0
set this=%~f0


::PRODUCTS
cd %this.d%
if not exist products (
	mkdir products
)


:menu
::LOGO
cd %this.d%
if not exist settings (
	mkdir settings
	cd settings
	mkdir logo
	cd logo
	echo _>1
	start cmd /c "%this%"
	exit
) else (
	cd settings\logo
	for /f "delims=" %%a in ('dir /b') do (
		set logo=%%a
	)
)
goto programm

:logo1
mode con: cols=55 lines=35
echo ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo ░░██████╗██████╗██████╗██████╗██████╗██████╗██████╗░░░
echo ░░╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝░░░
echo ░░██████╗██████╗██████╗██████╗██████╗██████╗██████╗░░░
echo ░░╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝░░░
echo ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo ░░░░░░████████╗░██████╗██╗░░██╗░█████╗░██████╗░░░░░░░░
echo ░░░░░░╚══██╔══╝██╔════╝██║░░██║██╔══██╗██╔══██╗░░░░░░░
echo ░░░░░░░░░██║░░░╚█████╗░███████║██║░░██║██████╔╝░░░░░░░
echo ░░░░░░░░░██║░░░░╚═══██╗██╔══██║██║░░██║██╔═══╝░░░░░░░░
echo ░░░░░░░░░██║░░░██████╔╝██║░░██║╚█████╔╝██║░░░░░░░░░░░░
echo ░░░░░░░░░╚═╝░░░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░░░░░░░░
echo ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
echo ░░██████╗██████╗██████╗██████╗██████╗██████╗██████╗░░░
echo ░░╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝░░░
echo ░░██████╗██████╗██████╗██████╗██████╗██████╗██████╗░░░
echo ░░╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝╚═════╝░░░
echo ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
exit /b


:programm
cls
call :logo%logo%
echo.
echo 1. Полезные таблички Forsaken
echo 2. Утилиты для Roblox
echo 3. Твики
echo 4. Администрирование системы
echo.
echo 8. Проверить обновления
echo 9. Настройки
echo 0. Выход
choice /c 0123489
if %errorlevel%==1 (
	exit /b
) else if %errorlevel%==2 (
	goto menu1
) else if %errorlevel%==3 (
	goto menu2
) else if %errorlevel%==4 (
	goto menu3
) else if %errorlevel%==5 (
	goto menu4
) else if %errorlevel%==6 (
	goto check_updates
) else if %errorlevel%==7 (
	goto settings
) else (
	goto error
)

::Полезные_таблички_Forsaken
:menu1
cls
call :logo%logo%
echo 1. Таблица "Какого выжывшего брать против киллера"
echo.
echo 0. Назад
choice /c 10
if %errorlevel%==1 (
	cmd /c C:\Windows\notepad.exe %this.d%table1.txt
) else if %errorlevel%==2 (
	goto menu
)
goto menu1



::Утилиты_для_Roblox
:menu2
cls
call :logo%logo%
echo.
echo 1. Roblox Updater
choice /c 1
if %errorlevel%==1 (
	call :product_menu "Roblox Updater"
)









:product_menu
cls
call :logo%logo%
echo.
echo 1. Запустить %~1
cd %this.d%\products
if exist %~1 (
	echo 2. Проверить обновления для %~1
) else (
	echo 2. Установить %~1
)
echo 3. Удалить %~1
choice /c 123





:error
cls
echo ОЙ! Что-то пошло не так.
echo Продолжение работы может плохо сказаться на будущей работе приложения. Все настройки будут изменены на значение по умолчанию. Если ошибка не была исправлена напишите суда:
echo tshopizyt@gmail.com
echo Нажмите любую кнопку для выхода из приложения.
pause > nul
cd %this.d%
rmdir /q /s settings
exit