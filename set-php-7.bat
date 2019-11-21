@echo off
set root=c:\xampp\
echo Stoping Apache
%root%apache\bin\httpd.exe -k stop
pause
rmdir C:\xampp\phpMyAdmin
mklink /J C:\xampp\phpMyAdmin C:\xampp\phpMyAdmin7
rmdir C:\xampp\apache
mklink /J C:\xampp\apache C:\xampp\apache7
rmdir C:\xampp\php
mklink /J C:\xampp\php C:\xampp\php7
echo The version of PHP7 is set
echo Starting Apache ...

%root%apache\bin\httpd.exe -k start

if errorlevel 255 goto finish
if errorlevel 1 goto error
goto finish

:error
echo.
echo Apache konnte nicht gestartet werden
echo Apache could not be started
pause
:finish
echo Starting mysql ...
%root%mysql\bin\mysqld.exe --defaults-file=%root%mysql\bin\my.ini --standalone --console
pause

