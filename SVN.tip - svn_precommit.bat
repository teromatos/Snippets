@echo off 
rem Add path to Subversion executable 
set path=%path%;c:\Program Files\Subversion\bin 
rem Add path to grep.exe 
set path=%path%;c:\Program Files\Borland\Delphi7\Bin 
Date /T >> D:\pre-commit.log 
Time /T >> D:\pre-commit.log 
echo %CMDCMDLINE% >> D:\pre-commit.log 
SVNLOOK.exe log -t "%2" "%1" | grep.exe "[a-zA-Z0-9]" > nul || exit 1 
echo Commit Permitted >> D:\pre-commit.log 
exit 0 
