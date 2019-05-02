nginx
=============

安装
-----------

#. 下载

    http://nginx.org/en/download.html

    上传

    解压::

        tar zxvf  nginx-1.16.0.tar.gz 

#. 准备环境::
    
    yum install -y gcc gcc-c++ automake pcre pcre-devel zlip zlib-devel openssl openssl-devel 

#. make::

    ./configure  --prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --error-log-path=/var/log/nginx/error.log  --http-log-path=/var/log/nginx/access.log  --pid-path=/var/run/nginx/nginx.pid --lock-path=/var/lock/nginx.lock  --user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module --with-http_gzip_static_module --http-client-body-temp-path=/var/tmp/nginx/client/ --http-proxy-temp-path=/var/tmp/nginx/proxy/ --http-fastcgi-temp-path=/var/tmp/nginx/fcgi/ --http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --http-scgi-temp-path=/var/tmp/nginx/scgi --with-pcre
    make && make install

#. 启动前预备工作::

    useradd -s /sbin/nologin -M nginx
    mkdir -p /var/tmp/nginx/client/
    ln -s  /usr/local/nginx/sbin/nginx  /usr/bin/nginx
