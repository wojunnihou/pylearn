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
