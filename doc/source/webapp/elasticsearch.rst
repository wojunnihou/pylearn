elasticsearch
===============

安装配置
-----------

    salt命令::

        salt  '*' state.sls elasticsearch.install

    开通防火墙策略::

        firewall-cmd --zone=public --add-port=9200/tcp --permanent
        firewall-cmd --zone=public --add-port=9300/tcp --permanent
        firewall-cmd --reload