@echo off
cd/d "%~dp0"
set rubypath=D:\Dev\ruby\bin
set PATH=%rubypath%\;%PATH%
set jekyll=ruby.exe "%rubypath%\jekyll"

start "" %jekyll% serve --port 80 --watch --trace --config _config.yml,_config.local.yml
