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
    'taobao.com',
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
]

exts = [
    ".pdf",
    "displayPDF",
    "PdfView",
    "/pdf/",
    "arxiv.org/submit/",
];

(function ()
{
    for (var h of hosts)
    {
        if (location.hostname.indexOf(h) != -1)
            return
    }

    for (var e of exts)
    {
        if (location.href.indexOf(e) != -1)
            return
    }

    var link = document.createElement("link");
    link.href = "data:text/css;base64,KiB7CiAgZm9udC1mYW1pbHk6ICJXZW5RdWFuWWkgTWljcm8gSGVpIE1vbm8iLCAiV2VuUXVhbllpIE1pY3JvIEhlaSIsICJNaWNyb3NvZnQgWWFoZWkgTW9ubyIsICJNaWNyb3NvZnQgWWFoZWkiLCBzYW5zLXNlcmlmLCAiU2ltc3VuIiAhaW1wb3J0YW50Owp9CgovKiBmb3IgdGFvYmFvLmNvbSwgYWxpcGF5LmNvbSwgdG1haWwuY29tICovCi5pY29uZm9udCB7CiAgZm9udC1mYW1pbHk6ICJpY29uZm9udCIsICJzaG9wLWljb25mb250IiwgImdsb2JhbC1pY29uZm9udCIsICJnbG9iYWwiLCAidXhpY29uZm9udCIsICJyZWkiICFpbXBvcnRhbnQ7Cn0KCi5tdWktaWNvbmZvbnQgewogIGZvbnQtZmFtaWx5OiAibXVpLWljb25mb250IiwgImljb25mb250IiwgInNob3AtaWNvbmZvbnQiLCAiZ2xvYmFsLWljb25mb250IiwgInV4aWNvbmZvbnQiLCAicmVpIiAhaW1wb3J0YW50Owp9CgphIC5pY29uIHsKICBmb250LWZhbWlseTogInZpcC1mb250IiwgImljb25mb250IiwgInNob3AtaWNvbmZvbnQiLCAiZ2xvYmFsLWljb25mb250IiwgInV4aWNvbmZvbnQiLCAicmVpIiAhaW1wb3J0YW50Owp9CgovKiBmb3IgZ2l0aHViLmNvbSAqLwpbY2xhc3MqPSJvY3RpY29uIl0gewogIGZvbnQtZmFtaWx5OiBvY3RpY29ucyAhaW1wb3J0YW50Owp9CgppbnB1dDpmb2N1cywgaW5wdXRbdHlwZT0idGV4dCJdOmZvY3VzLCBpbnB1dFt0eXBlPSJwYXNzd29yZCJdOmZvY3VzLCB0ZXh0YXJlYTpmb2N1cyB7Cm91dGxpbmU6IDJweCBzb2xpZCAjNkZBMUQ5ICFpbXBvcnRhbnQ7Ci13ZWJraXQtYm94LXNoYWRvdzowcHggMHB4IDVweCAjNkZBMUQ5ICFpbXBvcnRhbnQ7Cn0KCmlucHV0W3R5cGU9ImNoZWNrYm94Il06Zm9jdXMsaW5wdXRbdHlwZT0ic3VibWl0Il06Zm9jdXMsaW5wdXRbdHlwZT0icmVzZXQiXTpmb2N1cywgaW5wdXRbdHlwZT0icmFkaW8iXTpmb2N1cyB7Cm91dGxpbmU6IDFweCBzb2xpZCAjNkZBMUQ5ICFpbXBvcnRhbnQ7Cn0KCmlucHV0W3R5cGU9InRleHQiXSwgaW5wdXRbdHlwZT0icGFzc3dvcmQiXSwgdGV4dGFyZWEgewpib3JkZXI6I2NjYyAxcHggc29saWQ7CmJvcmRlci1yYWRpdXM6IDZweDsKLW1vei1ib3JkZXItcmFkaXVzOiA2cHg7Ci13ZWJraXQtYm9yZGVyLXJhZGl1czogNnB4Owp9CgppbnB1dFt0eXBlPSJ0ZXh0Il06Zm9jdXMsIGlucHV0W3R5cGU9InBhc3N3b3JkIl06Zm9jdXMsIHRleHRhcmVhOmZvY3VzIHsKYm9yZGVyOiAycHggc29saWQgIzZGQTFEOSAhaW1wb3J0YW50Owotd2Via2l0LWJveC1zaGFkb3c6MHB4IDBweCA1cHggIzZGQTFEOSAhaW1wb3J0YW50O291dGxpbmU6bm9uZQp9CgppbnB1dFt0eXBlPSJjaGVja2JveCJdOmZvY3VzLGlucHV0W3R5cGU9InN1Ym1pdCJdOmZvY3VzLGlucHV0W3R5cGU9InJlc2V0Il06Zm9jdXMsIGlucHV0W3R5cGU9InJhZGlvIl06Zm9jdXMgewpib3JkZXI6IDFweCBzb2xpZCAjNkZBMUQ5ICFpbXBvcnRhbnQ7IG91dGxpbmU6bm9uZQp9Cg=="
    link.type = "text/css";
    link.rel = "stylesheet";
    document.documentElement.insertBefore(link, null);
})()

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
