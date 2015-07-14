---
layout: post
title: 解密 ios app
description: ""
tags: [逆向]
date: 2015-07-14 15:47
---

源码在这里

    https://github.com/stefanesser/dumpdecrypted/

编译好后把 ```dumpdecrypted.dylib``` 放到 ```/usr/lib/dumpdecrypted.dylib```

连上 ssh

{% highlight bash %}

    iPhone:/ root# cd /

    iPhone:/ root# DYLD_INSERT_LIBRARIES=/usr/lib/dumpdecrypted.dylib /var/mobile/Containers/Bundle/Application/7F3190A0-6BE1-4562-BA54-AE0069FA5B1D/IF.app/IF

    mach-o decryption dumper

    DISCLAIMER: This tool is only meant for security research purposes, not for application crackers.

    [+] detected 32bit ARM binary in memory.

    [+] offset to cryptid found: @0xa2a08(from 0xa2000) = a08

    [+] Found encrypted data at address 00004000 of length 13139968 bytes - type 1.

    [+] Opening /private/var/mobile/Containers/Bundle/Application/7F3190A0-6BE1-4562-BA54-AE0069FA5B1D/IF.app/IF for reading.

    [+] Reading header

    [+] Detecting header type

    [+] Executable is a FAT image - searching for right architecture

    [+] Correct arch is at offset 16384 in the file

    [+] Opening IF.decrypted for writing.

    [+] Copying the not encrypted start of the file

    [+] Dumping the decrypted data into the file

    [+] Copying the not encrypted remainder of the file

    [+] Setting the LC_ENCRYPTION_INFO->cryptid to 0 at offset 4a08

    [+] Closing original file

    [+] Closing dump file

    iPhone:/ root#

会在当前目录生成 IF.decrypted, 拷出来, 拖进 IDA