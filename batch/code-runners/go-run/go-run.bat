@echo off

cmd /c go build %1

set name=%1
set exeName=%name:go=exe%

cmd /c %exeName% %2
