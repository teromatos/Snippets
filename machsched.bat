@echo off

echo %1 >> o:\root\tero\junk\machsched.log
O:\Download\Monitor\pstools\psservice.exe \\%1 -u domain\user -p password %2 schedule >> o:\root\tero\junk\machsched.log
echo. >> o:\root\tero\junk\machsched.log