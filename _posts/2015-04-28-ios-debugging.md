---
layout: post
title: Debugging on iOS
description: ""
tags:
date: 2015-04-28 18:08
---

test

{% highlight bat %}

set inferior-auto-start-dyld off
set sharedlibrary load-rules ".*" ".*" none
set sharedlibrary preload-libraries off
b *0x00008FE6

Breakpoint 1 at 0x8fe6

{% endhighlight %}
