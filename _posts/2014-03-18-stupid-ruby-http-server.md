---
layout: post
title: stupid ruby httprequest
description: ""
tags: 杂
comments: true
share: true
date: 2014-03-18 02:40
---

竟然不支持[中文路径]({{ site.url }}/bin/軌跡/碧の軌跡/RecordViewer.rar)

\ruby\lib\ruby\2.0.0\webrick\httprequest.rb:217

{% highlight ruby linenos %}

@path = HTTPUtils::unescape(@request_uri.path)
-->
@path = HTTPUtils::unescape(@request_uri.path).force_encoding('UTF-8')

{% endhighlight %}
