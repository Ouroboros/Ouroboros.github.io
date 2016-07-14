---
layout: post
title: Force Microsoft Yahei Font
description: ""
tags:
date: 2014-06-22 09:06
---

`font.js`

{% highlight js %}

// ==UserScript==
// @name        font
// @namespace   font
// @version     1
// @match       http*://*/*
// @grant       none
// @run-at document-start
// ==/UserScript==

hosts =[
    'tower.im',
    'qingcloud.com',
    'alipay.com',
    'qunar.com',
    'play.golang.org',
    'atatech.org',
    'knewone.com',
    'coolapk.com',
    '100offer.com',
    'virustotal.com',
    'www.sonkwo.com',
    'v2ex.com',
    'github.com',
    'tmall.com',
    'atom.io',
    //'taobao.com',
    'leetcode.com',
    'qt.io',
    'uber.com',
    'tudou.com',
    'coding.net',
    'faceplusplus.com',
    'alibaba-inc.com',
    'sumisora.org',
    'msdn.itellyou.cn',
    'iosre.com',
    'live.com',
    'android.com',
    '36kr.com',
    'jsonformatter.curiousconcept.com',
    'meituan.com',
    'github.io',
    'acfun.tv',
    'id.apple.com',
    'wholetomato.com',
    'bilibili.com',
    "microsoft.com",
    "vultr.com",
    "aliyun.com",
    "play.rust-lang.org",
];

exts = [
    ".pdf",
    "displayPDF",
    "PdfView",
    "/pdf/",
    "arxiv.org/submit/",
];

function rstr(f) {
  return f.toString().
      replace(/^[^\/]+\/\*!?/, '').
      replace(/\*\/[^\/]+$/, '');
}

var style = rstr(function() {/*!
* {
  font-family: "YaHei Consolas Hybrid", "WenQuanYi Micro Hei Mono", "WenQuanYi Micro Hei", "Microsoft Yahei Mono", "Microsoft Yahei", sans-serif, "Simsun" !important;
}

// for taobao.com, alipay.com, tmail.com
.iconfont {
  font-family: "iconfont", "shop-iconfont", "global-iconfont", "global", "uxiconfont", "rei" !important;
}

.mui-iconfont {
  font-family: "mui-iconfont", "iconfont", "shop-iconfont", "global-iconfont", "uxiconfont", "rei" !important;
}

a .icon {
  font-family: "vip-font", "iconfont", "shop-iconfont", "global-iconfont", "uxiconfont", "rei" !important;
}

// for github.com
[class*="octicon"] {
  font-family: octicons !important;
}

input:focus, input[type="text"]:focus, input[type="password"]:focus, textarea:focus {
outline: 2px solid #6FA1D9 !important;
-webkit-box-shadow:0px 0px 5px #6FA1D9 !important;
}

input[type="checkbox"]:focus,input[type="submit"]:focus,input[type="reset"]:focus, input[type="radio"]:focus {
outline: 1px solid #6FA1D9 !important;
}

input[type="text"], input[type="password"], textarea {
border:#ccc 1px solid;
border-radius: 6px;
-moz-border-radius: 6px;
-webkit-border-radius: 6px;
}

input[type="text"]:focus, input[type="password"]:focus, textarea:focus {
border: 2px solid #6FA1D9 !important;
-webkit-box-shadow:0px 0px 5px #6FA1D9 !important;outline:none
}

input[type="checkbox"]:focus,input[type="submit"]:focus,input[type="reset"]:focus, input[type="radio"]:focus {
border: 1px solid #6FA1D9 !important; outline:none
}


*/});

(function () {
    for (var h of hosts) {
        if (location.hostname.indexOf(h) != -1)
            return;
    }

    for (var e of exts) {
        if (location.href.indexOf(e) != -1)
            return;
    }

    var link = document.createElement("link");
    link.href = 'data:text/css;base64,' + btoa(style);
    link.type = "text/css";
    link.rel = "stylesheet";
    document.documentElement.insertBefore(link, null);
})();

{% endhighlight %}

`aliway.js`

{% highlight js %}

// ==UserScript==
// @name        aliway
// @namespace   aliway
// @version     1
// @grant       none
// @run-at document-end
// ==/UserScript==

function rstr(f) {
  return f.toString().
      replace(/^[^\/]+\/\*!?/, '').
      replace(/\*\/[^\/]+$/, '');
}

var style = rstr(function() {/*!
body {
    -moz-user-select: text !important;
    -webkit-user-select: text !important;
    -ms-user-select: text !important;
    -khtml-user-select: text !important;
    user-select: text !important;
}

.tpc_content {
    background: none !important;
}

.score {
    background: none !important;
}

*/});

(function () {

    if (location.hostname.indexOf('www.aliway.com') == -1)
        return;

    document.onselectstart = null;
    document.oncontextmenu = null;
    document.body.ondrag = null;

    var link = document.createElement("link");
    link.href = "data:text/css;base64," + window.btoa(style)
    link.type = "text/css";
    link.rel = "stylesheet";
    document.documentElement.insertBefore(link, null);

})()

{% endhighlight %}


`zhihu.js`

{% highlight js %}

// ==UserScript==
// @name        zhihu
// @namespace   zhihu
// @version     1
// @grant       none
// @run-at document-idle
// ==/UserScript==

function removeCopy() {
    var answers = $('div[class*=zm-item-rich-text][class*=js-collapse-body]');

    for (var i = 0; i != answers.length; ++i) {
        var e = answers[i]
        var events = $._data(e, 'events');
        events && delete(events.copy)
    }
}

(function () {

    if (location.hostname.indexOf('www.zhihu.com') == -1)
        return;

    setTimeout(removeCopy, 1)
})()

{% endhighlight %}



`login.taobao.com.js`

{% highlight js %}

// ==UserScript==
// @name        taobao login
// @namespace   taobao login
// @version     1
// @match       http*://*/*
// @grant       none
// @run-at document-idle
// ==/UserScript==

(function () {
    if (location.hostname.indexOf('login.taobao.com') == -1)
        return;

    var switched = false;

    var id = setInterval(function() {
            var loginBox = document.getElementById('J_LoginBox');
            if (loginBox === null) {
                //console.log('not found');
                return;
            }

            if (loginBox.attributes.class.value.indexOf('module-quick') == -1) {
                //console.log('not found 2');
                return;
            }

            //console.log('clicked');
            document.getElementById('J_Quick2Static').click();
            clearInterval(id);

            document.getElementById('TPL_password_1').focus();

        }, 100
    );
})();

{% endhighlight %}
