---
layout: post
title: Rebuild Explorer icon cache
description: ""
tags:
date: 2016-06-28 11:19
---

{% highlight bat %}

@ECHO OFF

::TaskKill /im "Explorer.exe" /f
echo waiting for explorer exited
pause

Attrib -s -h -r "%UserProfile%\AppData\Local\IconCache.db"
Del /q "%UserProfile%\AppData\Local\IconCache.db"
Del /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db"

pushd %CD%
cd/d "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\"

for /f "delims=" %%i in ('dir/b/a thumbcache_*.db') do (
    attrib -s -h -r "%%~fi"
    Del /q "%%~fi"
)

popd %CD%

reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream /f

Start Explorer.exe

{% endhighlight %}
