elasticsearch
===============

安装配置
-----------

    salt命令::

        salt  '*' state.sls elasticsearch.install

    开通防火墙策略::

        iptables -I INPUT -p tcp -s 192.168.5.0/24 --dport 9200 -j ACCEPT
        iptables-save > /etc/iptables