python
==========

源码安装
-----------

    #. 下载源码包（https://www.python.org/downloads）

    #. 安装依赖::

        yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel libffi-devel tk-devel gcc make

    #. 解压编译安装::

        xz -d Python-3.7.3.tar.xz 
        tar -xvf Python-3.7.3.tar
        cd Python-3.7.3
        ./configure 
        make && make install
