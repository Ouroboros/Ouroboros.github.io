---
layout: post
title: 碧之轨迹逆向系列（1）——场景攻击
description: ""
tags: [轨迹系列 碧之轨迹]
comments: true
share: true
date: 2014-03-19 12:10
---

# 序

去年碧轨 PC 版刚出来的时候，我花了很多时间去分析它的各种二进制文件。

包括 itp、itc、剧情脚本、战斗脚本、物品脚本等等，可以说是除了 3D 模型之外的东西，差不多都分析完了。

之后我用 python 写了一套工具——这也是我第一次用 python 写快餐脚本以外的东西，很多地方删删改改，看起来很混乱。
这套工具能将二进制文件转换为 python 代码，通过执行 python 代码又可以生成对应的二进制文件。

编写这样一套工具，是我六年前学编程的目标和动力，现在，终于达成了。

接下来我将通过一系列文章，把分析的成果记录下来。

# 场景攻击

从零之轨迹开始，在大地图下可以直接攻击魔兽，等级高于魔兽 10 级以上时，可以直接秒杀，节省战斗时间的同时还可以刷耀晶片。
它的学名叫作 FieldAttack（FA）。

下图是我自定义的七柱的攻击动作：

<figure>
    <a href="/images/posts/EDAO-Reverse-Engineering-01-FieldAttack/Arianrhod-Field-Attack.jpg" target="_blank"><img src="/images/posts/EDAO-Reverse-Engineering-01-FieldAttack/Arianrhod-Field-Attack.jpg" alt=""></a>
</figure>

每个人的攻击动作都保存在 FA 脚本中：`\ED_AO\data\system\fachrXXX._bn`，XXX 是角色编号（10进制）。

所有可控角色对应编号如下：

<!--
<table class="kdexample">
    <tr>
        <td>
            <pre class="kdexample-before" align="center">编号</pre>
            <pre class="kdexample-before" align="center"><code>0x0000</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0001</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0002</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0003</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0004</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0005</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0006</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0007</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0008</code></pre>
            <pre class="kdexample-before" align="center"><code>0x0009</code></pre>
            <pre class="kdexample-before" align="center"><code>0x000A</code></pre>
            <pre class="kdexample-before" align="center"><code>0x000F</code></pre>
        </td>
        <td>
            <pre class="kdexample-after-source" align="center">角色</pre>
            <pre class="kdexample-before" align="center"><code>罗伊德</code></pre>
            <pre class="kdexample-before" align="center"><code>艾莉</code></pre>
            <pre class="kdexample-before" align="center"><code>缇欧</code></pre>
            <pre class="kdexample-before" align="center"><code>兰迪</code></pre>
            <pre class="kdexample-before" align="center"><code>瓦吉</code></pre>
            <pre class="kdexample-before" align="center"><code>银</code></pre>
            <pre class="kdexample-before" align="center"><code>神狼蔡特</code></pre>
            <pre class="kdexample-before" align="center"><code>亚里欧斯</code></pre>
            <pre class="kdexample-before" align="center"><code>诺艾尔上士</code></pre>
            <pre class="kdexample-before" align="center"><code>达德利搜查官</code></pre>
            <pre class="kdexample-before" align="center"><code>加尔西亚</code></pre>
            <pre class="kdexample-before" align="center"><code>※魔兽</code></pre>
        </td>
    </tr>
</table>
 -->

|--------|--------------|
|  编号  |  角色        |
|:------:|:-------------|
| 0x0000 | 罗伊德       |
|--------|--------------|
| 0x0001 | 艾莉         |
|--------|--------------|
| 0x0002 | 缇欧         |
|--------|--------------|
| 0x0003 | 兰迪         |
|--------|--------------|
| 0x0004 | 瓦吉         |
|--------|--------------|
| 0x0005 | 银           |
|--------|--------------|
| 0x0006 | 神狼蔡特     |
|--------|--------------|
| 0x0007 | 亚里欧斯     |
|--------|--------------|
| 0x0008 | 诺艾尔上士   |
|--------|--------------|
| 0x0009 | 达德利搜查官 |
|--------|--------------|
| 0x000A | 加尔西亚     |
|--------|--------------|
{: rules="groups"}


# 文件结构

下图是罗伊德的 FA 脚本`\ED_AO\data\system\fachr000._bn`

<figure>
    <a href="/images/posts/EDAO-Reverse-Engineering-01-FieldAttack/Field-Attack-File.jpg" target="_blank"><img src="/images/posts/EDAO-Reverse-Engineering-01-FieldAttack/Field-Attack-File.jpg" alt=""></a>
</figure>

<span style="background-color: rgb(175,195,241)">
两字节，头部大小，包含自身、itc 索引和 eff 文件名
</span>

<span style="background-color: rgb(191,175,241)">四字节，itc 索引，也就是人物的贴图，索引格式看</span>
[这里](https://github.com/Arianrhod/Arianrhod/blob/master/Source/Hooks/EDAO/Decompiler/Base/EDAOBase.py#L177){:target="_blank"}
</span>

<span style="background-color: rgb(237,160,191)">
以单字节 0 结尾的字符串，不包含后缀的 eff 文件名。\\
只能指定 \ED_AO\data\effect\eff\ 目录下的 .eff 文件。\\
eff 文件决定了攻击范围，击中效果，击中音效。\\
另外有的 eff 是无法击中目标的。
</span>

<span style="background-color: rgb(224,237,160)">
不定长，FA Byte Code
</span>

# FA Byte Code

FA 脚本一共 14 条 Byte Code，相比其它两个脚本，数量是相当少，当初只花了不到半小时就搞定了，
代码[在这](https://github.com/Arianrhod/Arianrhod/blob/master/Source/Hooks/EDAO/Decompiler/FieldAttackChr.py#L14){:target="_blank"}。

|----------|----------------|---------------|
| ByteCode | 助记符         |     参数      |
|:---------|:---------------|:--------------|
|  0x00    | Return         | NO_OPERAND    |
|----------|----------------|---------------|
|  0x01    | SetChrSubChip  |  C            |
|----------|----------------|---------------|
|  0x02    | Sleep          |  H            |
|----------|----------------|---------------|
|  0x03    | PlayEffect     |  WHHHHHB      |
|----------|----------------|---------------|
|  0x04    | Sound          |  H            |
|----------|----------------|---------------|
|  0x05    | Voice          |  HHHH         |
|----------|----------------|---------------|
|  0x06    | FA_06          | NO_OPERAND    |
|----------|----------------|---------------|
|  0x07    | FA_07          | NO_OPERAND    |
|----------|----------------|---------------|
|  0x08    | FA_08          |  h            |
|----------|----------------|---------------|
|  0x09    | FA_09          |  HH           |
|----------|----------------|---------------|
|  0x0A    | BlurSwitch     |  HH           |
|----------|----------------|---------------|
|  0x0B    | FA_0B          |  H            |
|----------|----------------|---------------|
|  0x0C    | FA_0C          |  WW           |
|----------|----------------|---------------|
|  0x0D    | FA_0D          | NO_OPERAND    |
|----------|----------------|---------------|
{: rules="groups"}


表中的参数定义[在这](https://github.com/Arianrhod/Arianrhod/blob/master/Source/Hooks/EDAO/Decompiler/Assembler/InstructionTable.py#L263){:target="_blank"}。
基本原则是小写有符号，大写无符号

|--------|---------------|-----------------|
|  参数  | 类型          | 字节            |
|:-------|:--------------|:----------------|
| c/b    | CHAR          | 1               |
|--------|---------------|-----------------|
| C/B    | UCHAR         | 1               |
|--------|---------------|-----------------|
| w/h    | SHORT         | 2               |
|--------|---------------|-----------------|
| W/H    | USHORT        | 2               |
|--------|---------------|-----------------|
| l/i    | LONG          | 4               |
|--------|---------------|-----------------|
| L/I    | ULONG         | 4               |
|--------|---------------|-----------------|
| q      | LONG64        | 8               |
|--------|---------------|-----------------|
| Q      | ULONG64       | 8               |
|--------|---------------|-----------------|
| f      | FLOAT         | 4               |
|--------|---------------|-----------------|
| d      | DOUBLE        | 8               |
|--------|---------------|-----------------|
| s      | bytes         | len             |
|--------|---------------|-----------------|
| S      | str           | encoded len + 1 |
|--------|---------------|-----------------|
| o      | short label   | 2               |
|--------|---------------|-----------------|
| O      | long label    | 4               |
|--------|---------------|-----------------|
{: rules="groups"}


所以上面那个 FA 脚本会被反汇编成：

{% highlight python %}
from FieldAttackChr import *

def main():
    CreateFieldAttack("fachr000._bn", "chr/ch00052.itc", "sysatk00")

    SetChrSubChip(3)
    Sleep(60)
    SetChrSubChip(0)
    Sleep(60)
    Voice(2006, 2007, 2008, 0)
    Sound(533)
    PlayEffect(0xFCE0, 0, 0, 0, 0, 65446, 0x0)
    Sleep(100)
    SetChrSubChip(1)
    Sleep(80)
    SetChrSubChip(2)
    Sleep(80)
    SetChrSubChip(3)
    Sleep(150)
    Voice(3087, 3088, 3089, 0)
    Sound(533)
    PlayEffect(0x3E8, 0, 0, 65516, 45, 110, 0x0)
    SetChrSubChip(4)
    Sleep(80)
    SetChrSubChip(5)
    Sleep(80)
    SetChrSubChip(6)
    Sleep(100)
    Return()

TryInvoke(main)

{% endhighlight %}


图中七柱的 FA 脚本：

{% highlight python %}
from FieldAttackChr import *

def main():
    #CreateFieldAttack("fachr176._bn", "chr/ch04258.itc", "cr035301")
    CreateFieldAttack("fachr176._bn", "chr/ch04258.itc", "sysatk07")
    SetChrSubChip(0)
    Sleep(120)
    SetChrSubChip(1)
    Sleep(90)
    Voice(3867, 3866, 3876, 0)
    Sound(248)
    BlurSwitch(0x0, 10)
    FA_0B(500)
    PlayEffect(0x0, 1000, 0, 0, 0, 0, 0x0)
    SetChrSubChip(2)
    Sleep(120)
    SetChrSubChip(3)
    Sleep(120)
    SetChrSubChip(4)
    Sleep(120)
    SetChrSubChip(5)
    Sleep(120)
    SetChrSubChip(6)
    Sleep(250)
    Return()

TryInvoke(main)
{% endhighlight %}


FA 脚本的分析到此就结束了，最后附上解析 FA Byte Code 的代码位置：

~~~
006F6B48   . /0F84 8A0A0000     je      0x6F75D8
006F6B4E   . |8B45 E8           mov     eax, dword ptr [ebp-0x18]
006F6B51   . |0FB608            movzx   ecx, byte ptr [eax]
006F6B54   . |898D 80FCFFFF     mov     dword ptr [ebp-0x380], ecx
006F6B5A   . |83BD 80FCFFFF 0D  cmp     dword ptr [ebp-0x380], 0xD
006F6B61   . |0F87 6C0A0000     ja      0x6F75D3
006F6B67   . |8B95 80FCFFFF     mov     edx, dword ptr [ebp-0x380]
006F6B6D   . |FF2495 04786F00   jmp     dword ptr [edx*4+0x6F7804]
~~~
