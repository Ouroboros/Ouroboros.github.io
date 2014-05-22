---
layout: post
title: nexus 5 custom recovery
description: ""
tags:
date: 2014-05-22 13:23
---

1. [还是先装这个驱动](http://developer.android.com/sdk/win-usb.html){:target="_blank"}

2. <div markdown="0"><a href="{{ site.url }}/bin/Tools/Android/adb-fastboot-win.7z" class="btn btn-success">再下载 adb-fastboot</a></div>

3. 然后再选择一个喜欢的第三方 recovery，个人推荐 TWRP，因为支持触屏

    [ClockworkMod Recovery](http://forum.xda-developers.com/google-nexus-5/development/recovery-clockworkmod-recovery-nexus-5-t2511952){:target="_blank"}

    [TWRP Recovery](http://techerrata.com/browse/twrp2/hammerhead){:target="_blank"}


4. 2和3下载的东西放到一起，如图
    <figure> <a href="/images/posts/nexus-5-custom-recovery/adb-fastboot-win-folder.png" target="_blank"><img src="/images/posts/nexus-5-custom-recovery/adb-fastboot-win-folder.png" alt=""></a></figure>


5. 关机。按住电源键和音量下，进入 bootloader/fastboot

6. <figure> <a href="/images/posts/nexus-5-custom-recovery/fastboot-flash-cmd.png" target="_blank"><img src="/images/posts/nexus-5-custom-recovery/fastboot-flash-cmd.png" alt=""></a></figure>

7. 用音量键切换到 Restart Bootloader，按电源键选择。重启后再切换到 Recovery Mode，按电源键
