@echo off 
rem Add path to Subversion executable 
set path=%path%;c:\Program Files\Subversion\bin 

Date /T           >> C:\JUnk\pre-commit.log 
Time /T           >> C:\Junk\pre-commit.log 
echo %CMDCMDLINE% >> C:\Junk\pre-commit.log 
echo %1           >> C:\Junk\pre-commit.log
echo %2           >> C:\Junk\pre-commit.log

SVNLOOK.exe log -t "%2" "%1" | C:\WORKSERVER\VB.NET\App\_Releases\SVNPreCommit\SVNPreCommit.exe

goto exitcode%ERRORLEVEL%
:exitcode1
echo Commit NOT PERMITTED >> C:\Junk\pre-commit.log 
echo. >> C:\Junk\pre-commit.log 
exit 1

:exitcode0
echo Commit Permitted >> C:\Junk\pre-commit.log 
echo. >> C:\Junk\pre-commit.log 
exit 0
