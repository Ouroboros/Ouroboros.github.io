---
layout: post
title: Debugging on iOS
description: ""
tags:
date: 2015-04-28 18:08
---

{% highlight bat %}

(gdb) set sharedlibrary load-rules ".*" ".*" none
(gdb) set inferior-auto-start-dyld off
(gdb) set sharedlibrary preload-libraries off
(gdb) b *0x00008FE6
Breakpoint 1 at 0x8fe6

{% endhighlight %}
