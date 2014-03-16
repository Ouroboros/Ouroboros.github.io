@echo off
cd/d "%~dp0"

set git=D:\Dev\PortableGit\bin\git.exe

%git% pull origin master
%git% status
%git% add .
%git% commit * -m "."
%git% push origin master

%git% gc

if not [%ERRORLEVEL%]==[0] pause
