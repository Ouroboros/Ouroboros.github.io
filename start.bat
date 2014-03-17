@echo off
cd/d "%~dp0"
set PATH=D:\Dev\ruby\bin\;%PATH%
set jekyll=D:\Dev\ruby\bin\jekyll.bat

call %jekyll% serve --port 80 --watch --trace --config _config.yml,_config.local.yml
exit