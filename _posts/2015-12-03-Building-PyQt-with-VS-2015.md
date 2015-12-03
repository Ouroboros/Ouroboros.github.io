---
layout: post
title: VS 2015 编译 PyQt
description: ""
tags:
date: 2015-12-03 12:30
---

qt\build.bat

{% highlight bat %}

@echo off

cd/d "%~dp0"

set ARCH=amd64
set "QT_ROOT=%~dp0"
set QMAKESPEC=win32-msvc2015
set CL=/MP3 /GL
set LINK=/OPT:REF /LTCG:INCREMENTAL

if not defined QT_INITIALIED (
    set "PATH=%QT_ROOT%qtbase\bin;D:\Dev\Python;%PATH%"
)

if not defined QT_INITIALIED (
    call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" %ARCH%
    set QT_INITIALIED=1
)

::configure -platform win32-msvc2015 -prefix c:\Qt\5.3.0.2015\msvc2013 -opensource -confirm-license -c++11 -opengl desktop -nomake examples -nomake tests -qt-sql-sqlite -icu -I C:\Qt\icu_52_1_msvc_2013_32_devel\icu\include -L C:\Qt\icu_52_1_msvc_2013_32_devel\icu\lib -openssl -I C:\Qt\openssl-1.0.1h.VS2013\include -L C:\Qt\openssl-1.0.1h.VS2013\lib -plugin-sql-mysql -I C:\Qt\MySql5.1\include -L C:\Qt\MySql5.1\lib\opt
configure   -platform win32-msvc2015 ^
            -release ^
            -shared ^
            -ltcg ^
            -opensource -confirm-license -c++11 ^
            -opengl desktop ^
            -direct2d ^
            -directwrite ^
            -nomake examples ^
            -nomake tests ^
            -qt-sql-sqlite

{% endhighlight %}


pyqt\build.bat

{% highlight bat %}
@echo off

cd/d "%~dp0"

set ARCH=amd64
set "QT_ROOT=D:\Desktop\pyqt\qt5\5.5\Src\"
set QMAKESPEC=win32-msvc2015
set CL=/MP3 /GL
set LINK=/OPT:REF /LTCG:INCREMENTAL

if not defined QT_INITIALIED (
    set "INCLUDE=D:\Desktop\pyqt\sip-4.17\siplib;%INCLUDE%"
    set "PATH=%QT_ROOT%qtbase\bin;D:\Dev\Python;D:\Desktop\pyqt\sip-4.17\sipgen;%PATH%"
)

if not defined QT_INITIALIED (
    call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" %ARCH%
    set QT_INITIALIED=1
)

call configure.py --confirm-license

{% endhighlight %}
