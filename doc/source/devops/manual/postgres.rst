postgres
===========

centos自带postgres启用过程
---------------------------

    初始化数据库::

        postgresql-setup initdb
    
    启动服务::

        systemctl start postgresql.service

    开机启动::

        systemctl enable postgresql.service

    允许局域网访问::

        echo "host    all             all             192.168.5.0/24          md5" >> /var/lib/pgsql/data/pg_hba.conf 
    
    配置监听ip::

         echo "listen_addresses = '*'" >> /var/lib/pgsql/data/postgresql.conf
    
    开通防火墙::

        firewall-cmd --permanent --zone=public --add-port=5432/tcp
        firewall-cmd --reload


    修改数据库postgres用户密码::

        ALTER USER postgres WITH PASSWORD 'xxxxxx';

    创建数据库::

        su postgres
        psql
        create database uc;
