---
layout: post
title: Windows 下 jekyll 环境搭建
description: ""
tags: 杂
comments: true
share: true
date: 2014-03-18 17:50
---

虽然网上教程不少，但照着做也折腾了我一个下午，可见还是有问题的。

现在以 Windows 8.1 x64 为例，把流程记录一下：

1. 安装 ruby，假设安装目录是 C:\ruby

    [google 搜索 rubyinstaller](https://www.google.com/search?ie=UTF-8&q=rubyinstaller){:target="_blank"}

    [x64 安装包](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p451-x64.exe?direct)，安装程序可以自动添加 ruby 目录进 PATH

    [x64 7z压缩包](http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.0.0-p451-x64-mingw32.7z?direct)，需要手动添加 ruby 目录进 PATH，或者写个 run.bat 保存到 ruby 目录：

    `@set path=%~dp0;%path% & @cmd /k`

2. 更新 RubyGems 到最新版

    cmd 下执行 `gem update --system`

3. 下载 DevKit

    [http://rubyinstaller.org/downloads/](http://rubyinstaller.org/downloads/)

    [DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe](http://cdn.rubyinstaller.org/archives/devkits/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe)

    解压到`C:\ruby\devkit`

4. 安装 DevKit

    1. 切换到 devkit 目录`cd/d C:\ruby\devkit`

    2. `ruby dk.rb init`

        此时会生成一个 `C:\ruby\devkit\config.yml`。

        打开它，把最后一行的

        `---`

        改成

        `- C:/ruby`

    3. `ruby dk.rb install`

5. 切换到淘宝的 RubyGems 镜像

    [http://ruby.taobao.org/](http://ruby.taobao.org/)

6. 安装 jekyll、wdm、kramdown

    1. `gem install jekyll --version=1.4.2 --platform=ruby`

        当前最新版本是`1.4.3`，[据说跟 Windows 相性不好](http://stackoverflow.com/questions/21137096/jekyll-error-running-jekyll-serve){:target="_blank"}

    2. `gem install wdm`

        当前最新版是`0.1.0`

    3. `gem install kramdown`

        当前最新版是`1.3.2`


另外还有些小问题：

* 使用绿色版的 python 2.x

{% highlight ruby %}
# C:\ruby\lib\ruby\gems\2.0.0\gems\pygments.rb-0.5.4\lib\pygments\popen.rb:47

def python_binary
  @python_binary ||= begin
    'D:/Dev/Python27/python.exe'
    #`which python2`
    #$?.success? ? "python2" : "python"
  end
end
{% endhighlight %}

* ruby 自带的 httpserver 不支持[带中文的 path]({{ site.url }}/bin/軌跡/碧の軌跡/RecordViewer.rar)

{% highlight ruby %}
# C:\ruby\lib\ruby\2.0.0\webrick\httprequest.rb:217

#@path = HTTPUtils::unescape(@request_uri.path)
@path = HTTPUtils::unescape(@request_uri.path).force_encoding('UTF-8')

{% endhighlight %}

* jekyll 不支持中文，只需要在`_config.yml`里加上一行`encoding: "utf-8"`

最后可以写个[批处理](https://github.com/Arianrhod/Arianrhod.github.io/blob/master/start.bat){:target="_blank"}启动 jekyll

