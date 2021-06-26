rem: @echo off
rem: Note %~dp0 get path of this batch file
rem: Need to change drive if My Documents is on a drive other than C:
set driverLetter=%~dp0
set driverLetter=%driverLetter:~0,2%
%driverLetter%
cd %~dp0
rem: the two line below are needed to fix path issues with incorrect slashes before the bin file name
set tmpBinFilePath=%1
set tmpBinFilePath=%tmpBinFilePath:/=\%

rem: create commander script file with the tmp bin that the Arduino IDE creates

@echo loadbin %tmpbinfilepath% 0x08000000 >> %tmpbinfilepath%.gdlink
@echo r >> %tmpbinfilepath%.gdlink
 
GD_Link_CLI\GD_Link_CLI.exe -commandfile %tmpBinFilePath%.gdlink
