---
layout: post
title: Force Microsoft Yahei Font
description: ""
tags:
date: 2014-06-22 09:06
---

令[这个](https://chrome.google.com/webstore/detail/ojlocjfaheiilmgjdgnoehhdigfedhjl){:target="_blank"}扩展正确显示 github 的 icon font

不懂 css，不知道有没有简单的写法

{% highlight css %}

/* for github.com */
span .octicon, .octicon-home, .octicon-gist-fork, .octicon-file-media, .octicon-history, .octicon-chevron-down, .octicon-lock, .octicon-log-in, .octicon-gist, .octicon-gist-secret, .octicon-radio-tower, .octicon-repo-clone, .octicon-ruby, .octicon-repo, .octicon-playback-pause, .octicon-arrow-down, .octicon-chevron-right, .octicon-hourglass, .octicon-device-camera-video, .octicon-file-zip, .octicon-mirror, .octicon-heart, .octicon-code, .octicon-repo-force-push, .octicon-alert, .octicon-triangle-right, .octicon-podium, .octicon-git-compare, .octicon-location, .octicon-mirror-public, .octicon-stop, .octicon-calendar, .octicon-terminal, .octicon-plus, .octicon-paintcan, .octicon-book, .octicon-remove-close, .octicon-screen-normal, .octicon-issue-opened, .octicon-playback-fast-forward, .octicon-rocket, .octicon-mortar-board, .octicon-repo-pull, .octicon-list-unordered, .octicon-search, .octicon-tag-add, .octicon-eye, .octicon-link-external, .octicon-ellipsis, .octicon-gift, .octicon-person-add, .octicon-mirror-private, .octicon-repo-push, .octicon-device-camera, .octicon-mark-github, .octicon-repo-delete, .octicon-trashcan, .octicon-check, .octicon-logo-github, .octicon-squirrel, .octicon-steps, .octicon-bug, .octicon-mail-reply, .octicon-move-down, .octicon-git-fork-private, .octicon-file-binary, .octicon-comment, .octicon-jersey, .octicon-plug, .octicon-color-mode, .octicon-arrow-right, .octicon-move-left, .octicon-playback-play, .octicon-split, .octicon-chevron-up, .octicon-file-code, .octicon-key, .octicon-sign-out, .octicon-gist-private, .octicon-mention, .octicon-issue-closed, .octicon-arrow-small-right, .octicon-credit-card, .octicon-circuit-board, .octicon-browser, .octicon-move-up, .octicon-quote, .octicon-star, .octicon-list-ordered, .octicon-horizontal-rule, .octicon-arrow-small-left, .octicon-eye-watch, .octicon-light-bulb, .octicon-telescope, .octicon-alignment-aligned-to, .octicon-device-mobile, .octicon-cloud-download, .octicon-checklist, .octicon-globe, .octicon-star-add, .octicon-file-add, .octicon-triangle-left, .octicon-triangle-up, .octicon-unmute, .octicon-comment-discussion, .octicon-jump-right, .octicon-zap, .octicon-puzzle, .octicon-sign-in, .octicon-log-out, .octicon-rss, .octicon-octoface, .octicon-tag, .octicon-file-directory-create, .octicon-organization, .octicon-git-branch, .octicon-tag-remove, .octicon-file-submodule, .octicon-briefcase, .octicon-device-desktop, .octicon-diff-modified, .octicon-star-delete, .octicon-file-pdf, .octicon-search-save, .octicon-arrow-up, .octicon-primitive-dot, .octicon-mute, .octicon-triangle-down, .octicon-microscope, .octicon-diff-ignored, .octicon-alignment-unalign, .octicon-clippy, .octicon-server, .octicon-markdown, .octicon-hubot, .octicon-dashboard, .octicon-inbox, .octicon-gear, .octicon-mail-read, .octicon-package, .octicon-clock, .octicon-screen-full, .octicon-question, .octicon-unfold, .octicon-beer, .octicon-diff-added, .octicon-git-pull-request-abandoned, .octicon-three-bars, .octicon-graph, .octicon-x, .octicon-pencil, .octicon-playback-rewind, .octicon-gist-new, .octicon-dash, .octicon-issue-reopened, .octicon-cloud-upload, .octicon-diff-removed, .octicon-fold, .octicon-pulse, .octicon-file-directory, .octicon-git-merge, .octicon-versions, .octicon-git-pull-request, .octicon-git-branch-delete, .octicon-file-symlink-file, .octicon-sync, .octicon-move-right, .octicon-repo-forked, .octicon-repo-sync, .octicon-file-symlink-directory, .octicon-primitive-square, .octicon-eye-unwatch, .octicon-settings, .octicon-person-follow, .octicon-git-branch-create, .octicon-alignment-align, .octicon-diff-renamed, .octicon-database, .octicon-mail, .octicon-git-commit, .octicon-pin, .octicon-diff, .octicon-milestone, .octicon-jump-left, .octicon-megaphone, .octicon-circle-slash, .octicon-no-newline, .octicon-repo-create, .octicon-link, .octicon-arrow-small-up, .octicon-file-text, .octicon-comment-add, .octicon-person, .octicon-tools, .octicon-keyboard, .octicon-jump-up, .octicon-jump-down, .octicon-bookmark, .octicon-flame, .octicon-arrow-small-down, .octicon-broadcast, .octicon-chevron-left, .octicon-arrow-left, .octicon-info {
  font-family: octicons !important;
}

{% endhighlight %}


{% highlight css %}

[class*="octicon"] {
  font-family: octicons !important;
}

{% endhighlight %}



[Force MS Yahei Font Allowing Exceptions](https://chrome.google.com/webstore/detail/dplldmamfgeklcbmjehjajfbafeimjaf){:target="_blank"}

```font.js```

{% highlight js %}

hosts =
[
    "leetcode.com",
    "github.com",
    "github.io",
    "taobao.com",
    "tmall.com",
    "100offer.com",
    "qingcloud.com",
]

exts =
[
    ".pdf",
    "displayPDF",
    "PdfView",
    "/pdf/",
    "arxiv.org/submit/",
]

function check()
{
    for (var i in hosts)
    {
        if (location.hostname.indexOf(hosts[i]) != -1)
            return
    }

    for (var i in exts)
    {
        if (location.href.indexOf(exts[i]) != -1)
            return
    }

    var link = document.createElement("link");
    link.href = chrome.extension.getURL("font.css");
    link.type = "text/css";
    link.rel = "stylesheet";
    document.documentElement.insertBefore(link, null);
}

check()

{% endhighlight %}


```font.css```

{% highlight css %}
* {
  font-family: "WenQuanYi Micro Hei Mono", "WenQuanYi Micro Hei", "Microsoft Yahei Mono", "Microsoft Yahei", sans-serif, "Simsun" !important;
}

/* for taobao.com, alipay.com, tmail.com */
.iconfont {
  font-family: "iconfont", "shop-iconfont", "global-iconfont", "global", "uxiconfont", "rei" !important;
}

.mui-iconfont {
  font-family: "mui-iconfont", "iconfont", "shop-iconfont", "global-iconfont", "uxiconfont", "rei" !important;
}

a .icon {
  font-family: "vip-font", "iconfont", "shop-iconfont", "global-iconfont", "uxiconfont", "rei" !important;
}

/* for github.com */
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


::-webkit-scrollbar { background: #e0e0e0; }
::-webkit-scrollbar-corner { background: #e0e0e0; }

::-webkit-scrollbar:vertical { width: 15px; }
::-webkit-scrollbar:horizontal { height: 15px; }

::-webkit-scrollbar-button:vertical { width: 15px; }
::-webkit-scrollbar-button:horizontal { width: 15px; }
::-webkit-scrollbar-button:vertical:start:decrement { background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALDgAACw4BQL7hQQAAAAd0SU1FB9oGCAUcL37o6kkAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAABJ0lEQVQoz5WSQW4CMQxFnxE7yi1G5Tz0qpyDkZBYIFGJDcO+dNiN/btIMplRQWojRUkc+8d+ju33ezVNQ7gTEhGBu6cZTnjgQ9q7O+GORxARLCjDDCQk8XoYsnpazO8MwwCBgWFJrASYQL+CNS5CJG9DCDNDxUNk8UlwEZPVR5CSQUUqzZK2lWDLlvzWWN/t1uV4VfHMRFhOu/ir5nG/f7Hb7ei/v0dxNAWm18DatuVyudC27f+A9f2Dw+EAwPF4pH88/g7sdDpxvV4B6LqOz/P5KbBlAZZQicBYr9dstx+AcHdWb6unwJajjNLGTGzeNzRNQ4QzeODDgEdkgZJ4AVZLRprTN5RB1m5oVrMpwxQznGb1w0z+dxFfTNs8OtdWIoFN7art+gGdG76G0rxG4gAAAABJRU5ErkJggg=='); }
::-webkit-scrollbar-button:vertical:end:increment { background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALDgAACw4BQL7hQQAAAAd0SU1FB9oGCAUeDgC3mJUAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAABNElEQVQoz22SMXICMQxF399JFRZmKAk0O4GEhmHgHqEIB+UkHIAr0NJiKYXtXXuDZ3YtS5b05f91vV59vf7EzDEzQgjDHoxnePbn/JkZZkYD4KTlvRWXQAIv/RIomg2APJ5coo+UxVT48L5bkzvkTSqgCByBe3Qp/nKphhp3bJYueVEkJygXQrxFuJ7QCGHcbjfu9zsgQngyn8/pug55Hg2Ex+SMVA4GPB4PLpdLP+Xv+YwXdzLYhtHQQmy336xWKwCWyyVfm02eBB9mzMnD6zpO207Z7/cA7HY7Ju+TFFdFRlPRIqE00/F4pOs6DodDRZN8lOz4wGUKzmYzTj8n2nZaiaY0GmpZ9NkCFh+LyjeQ7SVs/VOTF/Ksy796MCUljfU9Eru/fLBUQBlWos3dS3mVjfkDwiGKPG/FyeEAAAAASUVORK5CYII='); }
::-webkit-scrollbar-button:horizontal:start:decrement { background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALDgAACw4BQL7hQQAAAAd0SU1FB9oGCAgLN2DfZdoAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAABNUlEQVQoz52SvXLCQAyEP2Vc4jYUlJDhVWjpeE7yHHjGHTHD0DChxoFUJynFHcfxkxRRJfu0q9VKslqtnH+GHI/HAuw4IAgP/1xAAAcXR4DKzFKNg0hKLec3FJ4/8Ay+AL0QYYnAITaNmqKKWF+ZGo4jGRzluTuCxDfAEEQ88ccmlVqIgCdxOn2xXn9Q1zXT6ZTUPEelZnmW5Ad939M0DW3bst/vmc/nTCZvXIdO4IvsixGHzwPL9yW73a5cCqoheuhkL15CCJgapoaq8TocslgsmM1mjEYjAFQDakZQQ01RDQQNyHa79aua26HO32e6zYZ6MGA8GRddo8HSdd2fF1bS3flFpaZxkfeuISDxGoRUwq1nlQbNdQUy8wkSj8QdvzoG7sV5Fs7er+ThJSVPwL+BHkl/AHQPwWnDP22eAAAAAElFTkSuQmCC'); }
::-webkit-scrollbar-button:horizontal:end:increment { background-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAPCAYAAAA71pVKAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALDgAACw4BQL7hQQAAAAd0SU1FB9oGCAgLCji3KcsAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAABKUlEQVQoz52TsW4CMRBE30jXcZAeKINEgYR0/8Gvhi+hRQJx3VWkCSJ0nCeFbXIHJFLiyprd9c7MrrXZbMw/j06nDxuQBQIMllEMx6xnGFCE4BQ3ZA63a4fUPWZThBDAxlJ60xghpyY2iCeYKNq2zQqQcm4gRCQyQg+YpNS5Q22333E+n5nP55TloKfxlpSwTud4jsd31us3ptMpy+WSqqoYjV5ikdQVTxHa0NOWI03T0DQN2+2W1WrFeDwBuSMFimt7jQ8STclMJpMJi8WCqqooh0NC20bjHPUCqK5rO7mHzaE+cPm88DqbUQ4GnRnrW22irf1+70cr+nd+wPqGpYiyJwKsqPUew6k4u4hQXhinrVN67AkW55xqBYQ/fIz+kuRNuw3jNwy+AN7osiq7f/qvAAAAAElFTkSuQmCC'); }

::-webkit-scrollbar-track:vertical {
min-width: 15px;
background-position: top left;
border-width: 4px 0 4px 0;
-webkit-border-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA8AAAAkCAYAAABWvWC/AAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALDgAACw4BQL7hQQAAAAd0SU1FB9oGCAcyG1ffw74AAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAAB40lEQVRIx41WW5LCMAyT3MIPA5fYvf9NuAwsf421H84TStvMANNOHFuWrMD7/a7f3x+4C+6OlFL7TY4lLfW5fNwd7g4DAImIJQCE6pMAEhLqu7ITAOb6RoBAEIKnhOfziZQSTuczTvMMyeF5MwGAjMyMyHyq8Hg88PyLYLhjMsP5fOrrAaQIjgNVC3+9XkCGIgaMaZ7rc1lWAgBWYMuygBkKFS/NpihZDbl1KAACJDDnLP1y95xZtUpDS91+v65oadln9bRSubgRHLQNmFkC1LO8Ekqh9Yut23pXwFrRb0qxnqZ9zHmTggrDoJpK70bsB88aDt7JW79tlHsMxrIsH0FmlivUe7fzeRnLdl5WUdkAg/stVwfSRgnsgyY4Yi4iUYzpgYYNPOdAHeCaJQGLDWVZMhqyNVWAstLUMpeZOTBYkb01TN1UH6g7G+JoBgeGg3hzkmZqbUa+R78prKqER6aKtbE2lLOTlRzJ/rShjfRSb0NasSFuD0avwIHnfczM99eaGSjU9n2ec5UaTL9aZ9x+8xzY2K4X9xRp+OEkjS4CuFwulU8qWphyNeyMey6aBovgidvtBpJxS5ohuXdQ2hU797wRggOwacL1eo1/Au5IS4JL61dso4fomY57Kejhihn8A/v/DIguHcrTAAAAAElFTkSuQmCC') 4 0 4 0 stretch stretch;
}

::-webkit-scrollbar-thumb:vertical {
min-width: 15px;
background-position: top left;
border-width: 9px 0 9px 0;
-webkit-border-image: url('data:image/png;base64,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') 9 0 9 0 stretch stretch;
}

::-webkit-scrollbar-thumb:vertical:hover {
min-width: 15px;
background-position: top left;
border-width: 9px 0 9px 0;
-webkit-border-image: url('data:image/png;base64,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') 9 0 9 0 stretch stretch;
}

::-webkit-scrollbar-track:horizontal {
min-width: 15px;
background-position: top left;
border-width: 0 4px 0 4px;
-webkit-border-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAPCAYAAACMa21tAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALDgAACw4BQL7hQQAAAAd0SU1FB9oGCAgCLUx/J+kAAAAZdEVYdENvbW1lbnQAQ3JlYXRlZCB3aXRoIEdJTVBXgQ4XAAABv0lEQVRIx82VSZYaMRBEfwhBL3hw/0txFzfDTsrwQlINuNzgDc+1oIpUZuQc0uVyMf/Ro+/vX7YFAtFiMyAEBsvI6trtxF0Dg8SkN1TchWI6bLgDS2BMR21fBsnkCHcjsJ+djqP+z3PQEO3Xze1CvQMt7IbzjjXr9mB7MjbkiGDEOwHbjOSe36NYI2wsQrPayBRWij3ZDUzc3TVBrrX2BnmRUW8F4NCiKj0gM5raKiWILps9NbkWE2rUgvVUxI6hUe9WIQNRK9frlcfjQSmFnPNbQ1hK2ZS/sh8+jscj5/OZtNshGBWC2+3G/XEH6+1g3nH8k50N98cdSZxOpyaPGhhTa+Xr8LWYzE/seHvVWqm1IkQutYDE/nBgH4El5M9ENPlKiRoBdp8hwz5ndinxaZYUUCOopSL1GWqbHqTDnl3OpLSj0cHrJ6W0KX9ln1IiolJLoZRC2OuhjtXGzBxKX9V/66L+GEQJ7BUBbQ5rbsM0g7S+dppHjbQ0MwleXDBivkJW9Log2gVJDizTrpBG0jNTmompn3PqjObnpIeWZ+4Ti+rNBLuqtOIHrLXvKaAn5O39JDaaojd44u8tevb9G3lpMr/Vd0WwAAAAAElFTkSuQmCC') 0 4 0 4 stretch stretch;
}

::-webkit-scrollbar-thumb:horizontal {
min-width: 15px;
background-position: top left;
border-width: 0 9px 0 9px;
-webkit-border-image: url('data:image/png;base64,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') 0 9 0 9 stretch stretch;
}

::-webkit-scrollbar-thumb:horizontal:hover {
min-width: 15px;
background-position: top left;
border-width: 0 9px 0 9px;
-webkit-border-image: url('data:image/png;base64,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') 0 9 0 9 stretch stretch;
}

{% endhighlight %}
