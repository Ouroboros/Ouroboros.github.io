---
layout: page
title: 「十三工房」
tagline:
---
{% include JB/setup %}

test

测试

[link](http://www.baidu.com/)

Complete usage and documentation available at: [Jekyll Bootstrap](http://jekyllbootstrap.com)

## Update Author Attributes

In `_config.yml` remember to specify your own data:

    code :
      block : fuck

The theme should reference these variables whenever needed.

{% highlight python %}

def fuck():
    print('fuck')

{% endhighlight %}

{% highlight c %}

void fuck()
{
    printf("fuck\n");
}

{% endhighlight %}


{% highlight c# %}

namespce fuck
{
    public void fuck()
    {
        Console.WriteLine("fuck");
    }
}

{% endhighlight %}
