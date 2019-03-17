redis
=======

    一个高效的缓存服务

install
---------

    `源码下载地址 <https://github.com/antirez/redis/releases>`_

    通过salt安装::

        salt -G 'role:redis' state.sls redis.install

    修改配置::

        salt -G 'role:redis' state.sls redis.config

    防火墙策略开通::

        firewall-cmd --zone=public --add-port=6379/tcp --permanent
        firewall-cmd --reload

keepalived
------------

    因为keepalived脚本采用python3书写因此需要安装python3::

        salt -G 'role:redis' state.sls python.install


