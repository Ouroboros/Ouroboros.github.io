---
layout: post
title: 从程序中快速获取 zip 密码
description: ""
tags: [破解]
comments: true
share: true
---

~~~
~~~

大概半年前，我尚未远离汉化，不懂珍惜生命的时候，发现一些游戏的资源是打包在有密码的 zip 里的。
虽然不用分析封包很开心，不过找 zip 密码也是很麻烦的事情。

后来拍了拍脑袋，翻了翻 zlib 源码，发现个 init_keys 函数：

[zlib\contrib\minizip\crypt.h](https://github.com/madler/zlib/blob/master/contrib/minizip/crypt.h#L66){:target="_blank"}

{% highlight c %}
/***********************************************************************
 * Initialize the encryption keys and the random header according to
 * the given password.
 */
static void init_keys(const char* passwd,unsigned long* pkeys,const unsigned long* pcrc_32_tab)
{
    *(pkeys+0) = 305419896L;    // 305419896 == 0x12345678
    *(pkeys+1) = 591751049L;    // 591751049 == 0x23456789
    *(pkeys+2) = 878082192L;    // 878082192 == 0x34567890
    while (*passwd != '\0') {
        update_keys(pkeys,pcrc_32_tab,(int)*passwd);
        passwd++;
    }
}

{% endhighlight %}

根据注释和代码，猜测第一个参数 passwd 就是明文密码。

接下来就简单了：

* OD 加载
* 查找这三个 key 定位 init_keys
* 下条件断点输出 passwd
* 收工
