---
layout: post
title: pyqt5 mouseMoveEvent bug
description: ""
tags:
date: 2014-06-10 01:34
---

在没有鼠标按键的情况下，会接收不到 mouseMoveEvent，相当困扰。OD 跟了一小时，毫无进展

省略掉过程

结果当然是解决了

{% highlight python %}

class EventDispatcher(QObject):
    def eventFilter(self, Receiver, Event):
        type = Event.type()
        if type == QEvent.MouseMove and isinstance(Receiver, QWidget):
            try:
                f = Receiver.mouseMoveEvent
            except AttributeError:
                f = None

            if f:
                f(Event)
                return False

        return super().eventFilter(Receiver, Event)


Dispatcher = EventDispatcher()
app = QApplication(sys.argv)
app.installEventFilter(Dispatcher)

{% endhighlight %}

搞定……真是好 SB 的 BUG（？）
