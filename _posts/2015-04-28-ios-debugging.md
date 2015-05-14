---
layout: post
title: Debugging on iOS
description: ""
tags:
date: 2015-04-28 18:08
---

test

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
