---
layout: post
title: google jp ime updater
description: ""
tags:
date: 2015-03-22 21:59
---

获取 google 日语输入法安装包下载地址

{% highlight python %}

from ml import *
import asyncio

stable = r'''<?xml version="1.0" encoding="UTF-8"?>
<request protocol="3.0">
    <os platform="win" version="6.1" sp="" arch="x86"/>
    <app appid="{DDCCD2A9-025E-4142-BCEB-F467B88CF830}" ap="external-stable-universal">
        <updatecheck/>
    </app>
</request>
'''

dev = r'''<?xml version="1.0" encoding="UTF-8"?>
<request protocol="3.0">
    <os platform="win" version="6.1" sp="" arch="x86"/>
    <app appid="{DDCCD2A9-025E-4142-BCEB-F467B88CF830}" ap="external-dev-universal">
        <updatecheck/>
    </app>
</request>
'''

@asyncio.coroutine
def query_chrome(ver):
    http = AsyncHttp()
    http.SetProxy('localhost', 7777)

    response = yield from http.request('post', 'http://tools.google.com/service/update2', data = ver)

    info = ET.fromstring(response.text())
    app = info.find('app')
    updatecheck = app.find('updatecheck')
    urls = updatecheck.find('urls')
    manifest = updatecheck.find('manifest')

    name = manifest.find('packages')[0].attrib['name']
    dllist = [(x.attrib['codebase'] + name) for x in urls]

    for url in dllist:
        print(url.split('://', maxsplit = 1)[1])
    print()

    return dllist

@asyncio.coroutine
def run():
    dl = (yield from query_chrome(stable))[-1]

def main():
    asyncio.get_event_loop().run_until_complete(run())

    PauseConsole('done')

if __name__ == '__main__':
    TryInvoke(main)

{% endhighlight %}
