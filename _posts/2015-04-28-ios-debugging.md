---
layout: post
title: Debugging on iOS
description: ""
tags:
date: 2015-04-28 18:08
---

test

{% highlight bat %}

proc conn
br set -a $pc+0x80
c

br del -f
s

m w -f bytes 0x1580EE 00 00
x 0x1580EE

br set -a 0x1580EE
c

wat s e -w read -s 8 -- $r0+0x124
wat s e -w read -s 8 -- 0x27dfda60

br set -a 0x00158112
c

m w -f bytes $r0+292 00 00 00 00 00 00 00 00



{% endhighlight %}

{% highlight bat %}

b *0x003C79AA
delete 1
set $r0 &= ~0x800

b ptrace
c
delete 2
set $r0 = -1

b *0x00550BF2

set inferior-auto-start-dyld off
set sharedlibrary load-rules ".*" ".*" none
set sharedlibrary preload-libraries off
b *0x00008FE6

Breakpoint 1 at 0x8fe6

{% endhighlight %}
