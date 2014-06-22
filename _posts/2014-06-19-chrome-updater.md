---
layout: post
title: chrome updater
description: ""
tags:
date: 2014-06-19 12:45
---

自动获取最新版 chrome 下载地址

{% highlight python %}

from ml import *

stable = r'''<?xml version='1.0' encoding='UTF-8'?><request protocol='3.0' ismachine='0'><app appid='{4DC8B4CA-1BDA-483E-B5FA-D3C12E15B62D}' ap='-multi-chrome'><updatecheck/></app></request>'''
beta = r'''<?xml version='1.0' encoding='UTF-8'?><request protocol='3.0' ismachine='0'><app appid='{4DC8B4CA-1BDA-483E-B5FA-D3C12E15B62D}' ap='1.1-beta'><updatecheck/></app></request>'''
dev = r'''<?xml version='1.0' encoding='UTF-8'?><request protocol='3.0' ismachine='0'><app appid='{4DC8B4CA-1BDA-483E-B5FA-D3C12E15B62D}' ap='2.0-dev'><updatecheck/></app></request>'''

def query_chrome(ver):
    Proxies = \
    {
        'http' : 'http://127.0.0.1:8087',
        'https' : 'https://127.0.0.1:8087',
    }

    req = AsyncHttpRequest()
    req.SetProxy(Proxies)
    ret = req.Request('post', 'https://tools.google.com/service/update2', SendData = ver)

    info = ET.fromstring(ret.response.content)
    app = info.find('app')
    updatecheck = app.find('updatecheck')
    urls = updatecheck.find('urls')
    manifest = updatecheck.find('manifest')

    name = manifest.find('packages')[0].attrib['name']
    dllist = [(x.attrib['codebase'] + name) for x in urls]

    for url in dllist:
        print(url.split('://', maxsplit = 1)[1])
    print()

def main():
    query_chrome(stable)
    query_chrome(beta)
    query_chrome(dev)
    PauseConsole()

if __name__ == '__main__':
    TryInvoke(main)

{% endhighlight %}
