---
layout: post
title: WNDR4300 安装 openwrt 小记
description: ""
tags:
date: 2015-08-01 23:19
---

先来这里下载最新的固件, 现在最新的是 ```openwrt-15.05-rc3-ar71xx-nand-wndr4300-ubi-factory.img```

<https://downloads.openwrt.org/chaos_calmer/15.05-rc3/ar71xx/nand/>

刷好后, 设置好 root 密码启用 ssh

可以在这里下到各种软件的 bin

<https://github.com/aa65535/>

<https://github.com/shadowsocks/openwrt-shadowsocks>

<http://sourceforge.net/projects/openwrt-dist/files/shadowsocks-libev/2.2.2-89e0f7f/ar71xx/>

<http://sourceforge.net/projects/openwrt-dist/files/luci-app/shadowsocks-spec/>

wget ss-libev 和 ss-luci-app, ```opkg install x.ipk```

    wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /etc/shadowsocks/ignore.list2

在 ```/etc/dnsmasq.conf``` 里添加下面几行

    no-resolv
    server=208.67.222.222#5353
    server=208.67.220.220#5353

    server=/cn/114.114.114.114
    server=/bilibili.com/114.114.114.114
    server=/weibo.com/114.114.114.114
    server=/alicdn.com/114.114.114.114
    server=/tbcdn.com/114.114.114.114
    server=/taobao.com/114.114.114.114
    server=/alipay.com/114.114.114.114
    server=/tmall.com/114.114.114.114

```/etc/init.d/dnsmasq restart```

