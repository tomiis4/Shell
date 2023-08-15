@echo off



chcp 65001
setlocal enabledelayedexpansion

set mode=insert

set /A mouse.Line=0
set /A mouse.Letter=0

:get_line
	set /p line=
	
	:: check for mode
	if "%mode%" == "normal" goto exit
	
	:: functions
	if "%line%" == ":w" goto save
	if "%line%" == ":q" goto exit 
	
	set /a i=!i!+1
	set buffer[!i!]=%line%
	set line=
	
	:: load file
	cls
	
	:: load message
	echo ^| Text Edit ^| Filename: %1 ^|
	echo.
	
	for /L %%i in (1,1,%i%) do (
		echo !buffer[%%i]!
	)
goto get_line


:save
	echo.>%1
	for /L %%i in (1,1,%i%) do (
		echo !buffer[%%i]!>>%1
	)
:exit

:exit
exit
