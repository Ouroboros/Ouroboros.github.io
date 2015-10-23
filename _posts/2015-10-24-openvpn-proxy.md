---
layout: post
title: 在 Windows 10 上用 openvpn 搭建代理服务器
description: ""
tags:
date: 2015-10-24 04:04
---

[参考链接](https://forums.openvpn.net/topic7806.html){:target="_blank"}

首先下载最新的 [openvpn](https://openvpn.net/index.php/open-source/downloads.html){:target="_blank"}

{% highlight bat %}

cd/d C:\Program Files\OpenVPN\easy-rsa
init-config.bat


{% endhighlight %}

然后可以编辑一下 `vars.bat`

{% highlight bat %}

@echo off

set HOME=%~dp0
set KEY_CONFIG=openssl-1.0.0.cnf
set KEY_DIR=keys
set KEY_SIZE=2048
set KEY_COUNTRY=CN
set KEY_PROVINCE=BJ
set KEY_CITY=Ouroboros
set KEY_ORG=Ouroboros
set KEY_EMAIL=Ouroboros@Ouroboros.com
set KEY_CN=Ouroboros
set KEY_NAME=Ouroboros
set KEY_OU=Ouroboros
set PKCS11_MODULE_PATH=changeme
set PKCS11_PIN=1234

{% endhighlight %}

调用 `vars.bat` 初始化变量, 调用 `clean-all.bat` 初始化 `keys` 目录

{% highlight bat %}

C:\Program Files\OpenVPN\easy-rsa>vars.bat

C:\Program Files\OpenVPN\easy-rsa>clean-all.bat
The system cannot find the file specified.
        1 file(s) copied.
        1 file(s) copied.

C:\Program Files\OpenVPN\easy-rsa>

{% endhighlight %}

`build-ca.bat`

{% highlight bat %}

C:\Program Files\OpenVPN\easy-rsa>build-ca.bat
WARNING: can't open config file: /etc/ssl/openssl.cnf
Loading 'screen' into random state - done
Generating a 2048 bit RSA private key
.............................+++
.....................................................................................+++
writing new private key to 'keys\ca.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [CN]:
State or Province Name (full name) [BJ]:
Locality Name (eg, city) [Ouroboros]:
Organization Name (eg, company) [Ouroboros]:
Organizational Unit Name (eg, section) [Ouroboros]:
Common Name (eg, your name or your server's hostname) [Ouroboros]:
Name [Ouroboros]:
Email Address [Ouroboros@Ouroboros.com]:

C:\Program Files\OpenVPN\easy-rsa>

{% endhighlight %}

`build-key-server.bat server`

{% highlight bat %}

C:\Program Files\OpenVPN\easy-rsa>build-key-server.bat server
WARNING: can't open config file: /etc/ssl/openssl.cnf
Loading 'screen' into random state - done
Generating a 2048 bit RSA private key
......................+++
........+++
writing new private key to 'keys\server.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [CN]:
State or Province Name (full name) [BJ]:
Locality Name (eg, city) [Ouroboros]:
Organization Name (eg, company) [Ouroboros]:
Organizational Unit Name (eg, section) [Ouroboros]:
Common Name (eg, your name or your server's hostname) [Ouroboros]:server
Name [Ouroboros]:
Email Address [Ouroboros@Ouroboros.com]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:123456
An optional company name []:
WARNING: can't open config file: /etc/ssl/openssl.cnf
Using configuration from openssl-1.0.0.cnf
Loading 'screen' into random state - done
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'CN'
stateOrProvinceName   :PRINTABLE:'BJ'
localityName          :PRINTABLE:'Ouroboros'
organizationName      :PRINTABLE:'Ouroboros'
organizationalUnitName:PRINTABLE:'Ouroboros'
commonName            :PRINTABLE:'server'
name                  :PRINTABLE:'Ouroboros'
emailAddress          :IA5STRING:'Ouroboros@Ouroboros.com'
Certificate is to be certified until Oct 20 20:20:52 2025 GMT (3650 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated

C:\Program Files\OpenVPN\easy-rsa>

{% endhighlight %}

`build-key.bat client_someone`

{% highlight bat %}

C:\Program Files\OpenVPN\easy-rsa>build-key.bat client_someone
WARNING: can't open config file: /etc/ssl/openssl.cnf
Loading 'screen' into random state - done
Generating a 2048 bit RSA private key
.........................................................................+++
...........................................................+++
writing new private key to 'keys\client_someone.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [CN]:
State or Province Name (full name) [BJ]:
Locality Name (eg, city) [Ouroboros]:
Organization Name (eg, company) [Ouroboros]:
Organizational Unit Name (eg, section) [Ouroboros]:
Common Name (eg, your name or your server's hostname) [Ouroboros]:client_someone
Name [Ouroboros]:
Email Address [Ouroboros@Ouroboros.com]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:123456
An optional company name []:
WARNING: can't open config file: /etc/ssl/openssl.cnf
Using configuration from openssl-1.0.0.cnf
Loading 'screen' into random state - done
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'CN'
stateOrProvinceName   :PRINTABLE:'BJ'
localityName          :PRINTABLE:'Ouroboros'
organizationName      :PRINTABLE:'Ouroboros'
organizationalUnitName:PRINTABLE:'Ouroboros'
commonName            :T61STRING:'client_someone'
name                  :PRINTABLE:'Ouroboros'
emailAddress          :IA5STRING:'Ouroboros@Ouroboros.com'
Certificate is to be certified until Oct 20 20:22:03 2025 GMT (3650 days)
Sign the certificate? [y/n]:y


1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated

C:\Program Files\OpenVPN\easy-rsa>

{% endhighlight %}

`build-dh.bat`

{% highlight bat %}

C:\Program Files\OpenVPN\easy-rsa>build-dh.bat
WARNING: can't open config file: /etc/ssl/openssl.cnf
Loading 'screen' into random state - done
Generating DH parameters, 2048 bit long safe prime, generator 2
This is going to take a long time

..........................................................................
....+........+.....+............................+.................+.......
....+.......+......+.........+............................................
.
.
....................................................................++*++*

C:\Program Files\OpenVPN\easy-rsa>

{% endhighlight %}

好了, 现在到 keys 里看看, 有这么些文件

    01.pem
    02.pem
    ca.crt
    ca.key
    client_someone.crt
    client_someone.csr
    client_someone.key
    dh2048.pem
    index.txt
    index.txt.attr
    serial
    server.crt
    server.csr
    server.key

其中, 这些放到服务端 `openvpn\config` 下:

    ca.key
    ca.crt
    server.crt
    server.key

这些放到客户端 `openvpn\config` 下:

    ca.crt
    client_someone.crt
    client_someone.key

再编写 `server.ovpn` 和 `client.ovpn`. 首先是 `server.ovpn`:

{% highlight bash %}

port 2333
proto tcp
dev tap
server 10.8.0.0 255.255.255.0

ca ca.crt
cert server.crt
key server.key
dh dh2048.pem

push "redirect-gateway def1"
push "dhcp-option DNS 114.114.114.114"

keepalive 10 120
comp-lzo
persist-key
persist-tun
verb 3

{% endhighlight %}

接着是 `client.ovpn`:

{% highlight bash %}

client
dev tap
proto tcp

remote OPEN_VPN_SERVER_IP 2333

resolv-retry infinite
nobind
persist-key
persist-tun

ca ca.crt
cert client_someone.crt
key client_someone.key

remote-cert-tls server
comp-lzo
verb 3

{% endhighlight %}

分别把这两个 `.ovpn` 放到对应的 `openvpn\config` 下

最后还要配置一下服务器:

1. 启动 `Routing and Remote Access` 服务, 最好设为自动
2. 在 `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters` 下新建名为 `IPEnableRouter` 的 `DWORD`, 设为 `1`
3. 最后设置一下联网的网卡的连接共享, 注意 TAP 的名字, 最好不要有中文, 如下图

<figure><a href="/images/posts/openvpn-proxy/openvpn_server_ICS.png" target="_blank"><img src="/images/posts/openvpn-proxy/openvpn_server_ICS.png" alt=""></a></figure>

设置完后重启即可