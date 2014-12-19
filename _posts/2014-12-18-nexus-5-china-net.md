---
layout: post
title: nexus 5 刷电信 3G
description: ""
tags:
date: 2014-12-20 01:43
---

新买的白色 Nexus 5，要装电信 3G 卡，过程曲折离奇，困难重重，特记录于此，望能救后人于苦海

1. <a href="{{site.url}}/bin/Tools/Android/adb-fastboot-win.7z" class="btn btn-success">准备好 adb 和 fastboot</a>
    ，然后把手机卡拆下来

2. 首先，要下载 <a href="https://developers.google.com/android/nexus/images" class="btn btn-success" target="_blank">4.4.2 的 Factory Image</a>

    因为大神做的
    <a href="{{site.url}}/bin/Tools/Android/ChinaNet/boot_with_diag.img" class="btn btn-success">boot_with_diag.img</a>
    是基于 4.4.2 的

    然后开始刷系统：

   1. 打开 USB 调试，```adb reboot-bootloader```
   2. 命令行进入 4.4.2 镜像目录，执行 ```flash-all.bat```

3. 刷好后再次进入 bootloader，把
    <a href="{{site.url}}/bin/Tools/Android/openrecovery-twrp-2.8.1.0-hammerhead.img" class="btn btn-success">TWRP 2.8.1.0</a>
    刷进去

    因为已经下不到 4.4.2 的CF-Auto-Root，所以直接用 TWRP 来 ROOT

    ```fastboot.exe flash recovery openrecovery-twrp-2.8.1.0-hammerhead.img```

    ```fastboot.exe reboot-bootloader```

    现在进入 recovery，点击 reboot -> system，把 supersu 刷进去。如果刚才没有拆掉手机卡，这时候进系统会更新半天……

4. 进系统后，先把 supersu 装好，然后上 Play 装一个 Nexus 5 Field Test Mode，至于怎么上，自己想办法

5. 进去 Nexus 5 Field Test Mode -> Settings -> LTE，这时候先别点，在命令行里输入

    ```adb shell logcat```

    然后才点 Edit

    ```D/LG_SVC_CMD( 5768): itemID = 200, Value = XXXXXX```

    看到日志里有这么一行的，把后面的 Value 记下来，这是你的 SPC，停掉 logcat。把 SPC 输入到 Service Code 里，修改成这样：

    <figure><a href="/images/posts/nexus-5-china-net/Field-Test-Mode.jpg" target="_blank"><img src="/images/posts/nexus-5-china-net/Field-Test-Mode.jpg" alt=""></a></figure>

    然后点返回，会自动重启手机，此时紧按音量下键，直接进入 bootloader，把上面的 boot_with_diag.img 刷进去

    ```fastboot flash boot boot_with_diag.img```
    ```fastboot reboot```

6. 装好后，打开 USB 调试：

    ```>adb shell```

    ```shell@hammerhead:/ $ su```

    ```root@hammerhead:/ # setprop sys.usb.config diag,adb```

    这时候系统会提示找到新设备，这时候就要安装
    [LG United Mobile Driver]({{site.url}}/bin/Tools/Android/LG United Mobile Driver/LGUnitedMobileDriver_S51MAN312AP22_ML_WHQL_Ver_3.12.3.exe)
    ，否则会变成无法识别的设备

    装好后启动[DFS]({{site.url}}/bin/Tools/Android/ChinaNet/Setup_DFS_4.7.0.2.exe)，
    如下图，双击添加端口

    <figure><a href="/images/posts/nexus-5-china-net/DFS-add-port.png" target="_blank"><img src="/images/posts/nexus-5-china-net/DFS-add-port.png" alt=""></a></figure>

    填写 SPC，点击旁边的 Send SPC

    <figure><a href="/images/posts/nexus-5-china-net/DFS-send-SPC.png" target="_blank"><img src="/images/posts/nexus-5-china-net/DFS-send-SPC.png" alt=""></a></figure>

    然后按照下面的图，分别修改，注意要先点 Read，修改后再点 Write，并且只修改图中标注的地方

    注意第一张图的 RumiOnly

    <figure><a href="/images/posts/nexus-5-china-net/DFS-PROG-GEN.png" target="_blank"><img src="/images/posts/nexus-5-china-net/DFS-PROG-GEN.png" alt=""></a></figure>

    [302.prl]({{site.url}}/bin/Tools/Android/ChinaNet/302.prl)

    <figure><a href="/images/posts/nexus-5-china-net/DFS-PROG-NAM.png" target="_blank"><img src="/images/posts/nexus-5-china-net/DFS-PROG-NAM.png" alt=""></a></figure>

    <figure><a href="/images/posts/nexus-5-china-net/DFS-PROG-DATA.png" target="_blank"><img src="/images/posts/nexus-5-china-net/DFS-PROG-DATA.png" alt=""></a></figure>

    <figure><a href="/images/posts/nexus-5-china-net/DFS-PROG-MBIP.png" target="_blank"><img src="/images/posts/nexus-5-china-net/DFS-PROG-MBIP.png" alt=""></a></figure>

    全部改完后，点 Ports 旁边的小插头断开连接，然后重启手机

7. 重启后再进 DFS 查看 RumiOnly，如果没有变回 NV_ONLY，那么下面就没你什么事了。

    1. 现在把卡插进去，提示重启，不管它，直接关机
    2. 拔卡，再开机。这时候显示有信号，并且运营商显示 SPRINT（或者是禁用漫游指示符）
    3. 再进 DFS，这时候会发现已经是 RumiOnly 了，再重启
    4. 这次会显示无信号了，关机插卡
    5. 开机，这时候已经能正确识别电信了

    最后这步参考了[这个帖子](http://bbs.gfan.com/android-7137082-1-1.html){:target="_blank"}

8. 最后，进 TWRP 备份你的 EFS

9. 最后最后，发现手机识别不了 5G Wifi 了，据说解决方法是把路由器 5G 的频段设为两位数即可

10. 嗯，还没结束。保留数据刷到 5.0.1，方法是去掉 bat 里的 -w 参数，over。是的，over。
