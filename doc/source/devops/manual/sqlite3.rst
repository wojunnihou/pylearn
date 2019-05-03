sqlite3
===========

linux下安装升级
----------------

    #. 下载(https://www.sqlite.org/download.html)

    #. 备份原有sqlite3::

        mv /usr/bin/sqlite3 /usr/bin/sqlite3.bak

    #. 解压安装::

        cd sqlite-autoconf-3280000
        ./configure
        make && make install
        ln -s /usr/local/bin/sqlite3 /usr/bin/sqlite3