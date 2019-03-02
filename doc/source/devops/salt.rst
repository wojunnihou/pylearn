salt
=======

    多服务器管理软件,可以远程执行命令,开源地址:`源码 <https://github.com/saltstack/salt>`_
    `官网文档 <https://docs.saltstack.com/en/latest/>`_


安装
-----------

    `官网安装 <https://github.com/saltstack/salt-bootstrap>`_

    以下在centos7下安装，安装方式有好几种，这儿采用curl进行安装

    * `salt-master` ::

        curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
        sudo sh bootstrap-salt.sh -M -N git develop

    * `salt-minion` ::

        curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
        sudo sh bootstrap-salt.sh git develop

    .. note::

        如果遇见以下错误，建议升级git :ref:`centos7升级git <centos7-update-git>`

        .. image:: git-version.png

配置
------

    1. 修改配置

        `salt-master` 监听ip和 `salt-minion` 配置的master一样,都为 `salter-master` 的ip地址

        * `salt-master` 配置启动监听地址::

            vi /etc/salt/master

            interface: 192.168.5.200

        * `salt-minion` 配置master地址::

            vi /etc/salt/minion

            master: 192.168.5.200

    #. `salt-master` 开启防火墙::

        firewall-cmd --permanent --zone=public --add-port=4505-4506/tcp
        firewall-cmd --reload

    #. 检查修改并重启服务

        `salt-master`::

            grep -Ev '^#|^$' /etc/salt/master
            systemctl restart salt-master.service

        `salt-minion`::

            grep -Ev '^#|^$' /etc/salt/minion
            systemctl restart salt-minion.service


salt认证
---------

    1. 查看keys状态::

        salt-key -L

    #. 接收所有未接收带keys::

        salt-key -A -y

    #. 接收某个key::

        salt-key -a 192.168.5.201 -y

    #. 删除某个key::

        salt-key -d 192.168.5.201 -y

    #. 删除所有keys:

        salt-key -D -y

    .. note::

        当keys被删除过后，可以通过重启加入到 `Unaccepted Keys`


salt运行指令
--------------

    执行salt命令::

        salt '*' test.ping

    执行shell命令(下面例子查看当前目录)::

        salt '*' cmd.run 'pwd'


salt命令
----------

    salt命令通过python实现，其源码目录在salt工程目录的modules中,其命令使用方法如下图:

    .. image:: salt-cmd-syntax.png

    其中参数可以通过位置参数、关键值参数两种方式传递例子如下::

        salt '*' user.add fred shell=/bash/bin
        salt '*' pkg.install pkgs=['bind9','bind9-docs','bind-utils']
        salt '*' pkg.install sources='[{"foo":"salt://foo.deb"},{"bar":"salt://bar.deb"}}'

    查看连接状态::

        salt '*' test.ping

    查看磁盘使用率::

        salt '*' disk.usage

    安装软件::

        salt '*' pkg.install tree




