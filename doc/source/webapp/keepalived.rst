keepalived
============

配置
---------

    安装后默认配置，说明参见
    `blog <https://blog.csdn.net/mofiu/article/details/76644012>`_
    `blog2 <https://blog.csdn.net/fruler/article/details/53334082>`_

    .. literalinclude:: keepalived-example.conf
        :language: text


    开通vrrp策略::

        firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 --in-interface eth0 --destination 224.0.0.18 --protocol vrrp -j ACCEPT
        firewall-cmd --reload
