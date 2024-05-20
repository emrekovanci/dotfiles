@echo off

REM HKEY_CLASSES_ROOT\Directory\Background\shell
REM 1. Create new Key(Folder)
  REM 1.1 Create new Expandable String in previously created key then name it Icon
  REM 1.1.1 Icon Value = C:\Program Files\Microsoft VS Code\Code.exe
REM 2. Create new Key(Folder) under previosly created key(Folder) then name it command
REM 2.2. Default Data Value = C:\users\kovan\Documents\run_vscode.bat "%V"

SET TEMP=%CD%\.vscode\TMPDIR
SET TMP=%CD%\.vscode\TMPDIR

call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
start /B "" code -n . --profile "Default"
