@echo off

echo machsched [action]
echo.
echo [action] => start, pause, continue
echo.
echo.

echo Modifying machine schedules > o:\root\tero\junk\machsched.log

call j:\users\tero\prog\machsched.bat mach1 %1
call j:\users\tero\prog\machsched.bat mach2 %1
call j:\users\tero\prog\machsched.bat mach3 %1
call j:\users\tero\prog\machsched.bat mach4 %1
call j:\users\tero\prog\machsched.bat mach5 %1
call j:\users\tero\prog\machsched.bat mach6 %1
call j:\users\tero\prog\machsched.bat mach7 %1
call j:\users\tero\prog\machsched.bat mach8 %1
call j:\users\tero\prog\machsched.bat mach9 %1
call j:\users\tero\prog\machsched.bat mach11 %1
call j:\users\tero\prog\machsched.bat mach12 %1
call j:\users\tero\prog\machsched.bat wwc %1
call j:\users\tero\prog\machsched.bat healthtr %1
call j:\users\tero\prog\machsched.bat pc36 %1

:end