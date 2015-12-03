---
layout: post
title: VS 2015 编译 Qt 5.5.1
description: ""
tags:
date: 2015-12-03 12:30
---

{% highlight bat %}

@echo off

cd/d "%~dp0"

set ARCH=amd64
SET "QT_ROOT=%~dp0"
SET PATH=%QT_ROOT%\qtbase\bin;%PATH%
SET QMAKESPEC=win32-msvc2015

::Set Visual studion 2015 environment
call "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat" %arch%

::configure -platform win32-msvc2015 -prefix c:\Qt\5.3.0.2015\msvc2013 -opensource -confirm-license -c++11 -opengl desktop -nomake examples -nomake tests -qt-sql-sqlite -icu -I C:\Qt\icu_52_1_msvc_2013_32_devel\icu\include -L C:\Qt\icu_52_1_msvc_2013_32_devel\icu\lib -openssl -I C:\Qt\openssl-1.0.1h.VS2013\include -L C:\Qt\openssl-1.0.1h.VS2013\lib -plugin-sql-mysql -I C:\Qt\MySql5.1\include -L C:\Qt\MySql5.1\lib\opt
configure   -platform win32-msvc2015 ^
            -release ^
            -shared ^
            -ltcg ^
            -opensource -confirm-license -c++11 ^
            -opengl desktop ^
            -nomake examples -nomake tests ^
            -qt-sql-sqlite

::call %QT_SRC_PATH%\configure

cmd /k

{% endhighlight %}

what
