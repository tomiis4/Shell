@echo off

:: start cmd
start cmd.exe /k "cd C:\ProgrammingOthers\%1"

:: start nvim
start cmd.exe /k "cd C:\ProgrammingOthers\%1 & nvim.exe"
