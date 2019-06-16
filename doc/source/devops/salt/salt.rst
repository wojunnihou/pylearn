salt安装
=============

    多服务器管理软件,可以远程执行命令,开源地址:`源码 <https://github.com/saltstack/salt>`_
    `官网文档 <https://docs.saltstack.com/en/latest/>`_

salt-master安装
------------------

    命令::

        curl -L https://bootstrap.saltstack.com -o install_salt.sh
        sudo sh install_salt.sh -M
        echo 'interface: 0.0.0.0' > /etc/salt/master
        firewall-cmd --permanent --zone=public --add-port=4505-4506/tcp
        firewall-cmd --reload
        systemctl restart salt-master.service

        yum install -y git
        git clone https://github.com/wojunnihou/pylearn.git  /usr/local/src/pylearn
        ln -s /usr/local/src/pylearn/doc/source/devops/salt/state/ /srv/salt

salt-minion安装
------------------

    命令::

        curl -L https://bootstrap.saltstack.com -o install_salt.sh
        sudo sh install_salt.sh
        echo 'master: 192.168.5.200
        id: 5.201'  > /etc/salt/minion
        systemctl restart salt-minion.service

    salt-master接收::

        salt-key -A -y


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

配置文件
----------

    /etc/salt/minion::

        master:192.168.5.200  # 配置salt master地址
        id: 201  # 配置本机minion的id

salt运行指令
--------------

    salt命令通过python实现，其源码目录在salt工程目录的modules中,其命令使用方法如下图:

    .. image:: salt-cmd-syntax.png

    其中参数可以通过位置参数、关键值参数两种方式传递例子如下::

        salt '*' user.add fred shell=/bash/bin
        salt '*' pkg.install pkgs=['bind9','bind9-docs','bind-utils']
        salt '*' pkg.install sources='[{"foo":"salt://foo.deb"},{"bar":"salt://bar.deb"}}'


    执行salt命令::

        salt '*' test.ping

    执行shell命令(下面例子查看当前目录)::

        salt '*' cmd.run 'pwd'


target
------------

    * 通过`minion id`方式::

        salt 'minion1' test.ping

    * 通过glob模式匹配::

        salt 'minion*' test.ping

    * 通过正则::

        salt -E 'minion[0-9]' test.ping

    * 通过明确的`minion id`列表::

        salt -L 'minion1,minion2' test.ping

    * 通过Grains::

        salt -G 'os:Ubuntu' test.ping

    * 通过多目标方式::

        salt -C 'G@os:Ubuntu and minion* or S@192.168.50.*' test.ping

salt命令
----------


    查看模块文档::

        salt '*' sys.doc
        salt '*' sys.doc pkg.install

    查看连接状态::

        salt '*' test.ping

    输出一个字符串::

        salt '*' test.echo 123

    查看磁盘使用率::

        salt '*' disk.usage

    安装软件::

        salt '*' pkg.install tree

    查看网卡::

        salt '*' network.interfaces

state
--------

    通过yaml格式编写执行逻辑,例子如下:

    python function::

        salt.states.user.present(name, uid=None, gid=None, gid_from_name=False,
        groups=None, optional_groups=None, remove_groups=True, home=None,
        createhome=True, password=None, hash_password=False, enforce_password=True,
        empty_password=False, shell=None, unique=True, system=False, fullname=None,
        roomnumber=None, workphone=None, homephone=None, loginclass=None, date=None,
        mindays=None, maxdays=None, inactdays=None, warndays=None, expire=None,
        win_homedrive=None, win_profile=None, win_logonscript=None,
        win_description=None)

    state格式编写::

        a state example that calls user.present:
          user.present:
            - name: fred
            - shell: /bin/zsh


    如果参数是列表格式::

        install bind packages:
          pkg.installed:
            - pkgs:
              - bind9
              - bind9-docs
              - bind-utils

    字典参数::

        Install some packages using other sources:
          pkg.installed:
            - name: mypkgs
            - sources:
              - foo: salt://foo.deb
              - bar: http://somesite.org/bar.deb

    state执行::

        salt '*' state.sls  techo
        salt '*' state.apply  techo

    查看state执行顺序::

         salt '200' state.show_sls techo

pillar
------------

    #. pillar默认配置路径(/srv/pillar)文件结构::

        [22:40:12][root@localhost:/srv/pillar]# tree
        .
        ├── default.sls
        └── top.sls

    #. 刷新minion配置::

        salt '*' saltutil.refresh_pillar

    #. 查看pillar变量::

        salt '*' pillar.get testecho

    #. state中引用pillar参数::

        testecho:
          test.echo:
            - name: {{pillar['testecho']}}

    #. 命令行中使用pillar::

        salt '*' state.sls techo pillar='{"testecho":"123"}'

grains
-------------

    配置grains方法大概有以下三种

    I. 通过修改minion配置文件

        1. 修改配置文件 `salt minion`  配置文件(/etc/salt/minion),添加列入下面的内容::

            grains:
              roles:
                - app
                - redis
              applications:
                - shop
                - auth

        #. 重启 `salt minion` ::

            systemctl restart salt-minion.service

        #. 在 `salt master` 通过以下命令可以查看grains信息::

            salt '*' grains.items
            salt '*' grains.item roles
            salt '*' grains.item roles applications

    #. 通过修改grains文件方式

        1. 修改配置文件 `salt minion`  配置文件(/etc/salt/grains),添加列入下面的内容::

            database:
              - shared1
              - shared2
        #. 在 `salt master` 刷新grains::

            salt '*' saltutil.sync_grains

        #. 在 `salt master` 通过以下命令可以查看grains信息::

            salt '*' grains.item database

    #. 通过python脚本扩展grains

        1. 在 `salt master`  的 `_grains` 目录(/srv/salt/_grains)下创建脚本文件(/srv/salt/_grains/test_grains.py),内容如下:

            .. literalinclude:: test_grains.py

        #. 同步脚本文件到minion(/var/cache/salt/minion/extmods/grains)::

            salt '*' saltutil.sync_grains

        #. 在 `salt master` 通过以下命令可以查看grains信息::

            salt '*' grains.item ipstr

salt常用目录文件注释
------------------------

    * /etc/salt/

        `salt master` 和 `salt minion` 配置文件路径

    * /etc/salt/master

        `salt master` 配置文件

    * /etc/salt/minion

        `salt minion` 配置文件

    * /etc/salt/grains

        `salt minion` grains配置文件

    * /etc/salt/pki/

        salt 认证密钥存放路径

    * /srv/salt/

        `salt master` state/脚本等文件目录

    * /srv/salt/_grains/

        `salt master` 配置grains的python脚本文件存放路径

    * /srv/pillar

        `salt master` 默认放pillar配置信息文件夹，可以通过配置master(/etc/salt/master)文件修改路劲,如::

            pillar_roots:
                base:
                  - /srv/salt/pillar

    * /srv/pillar/top.sls

        `salt master` pillar与minion匹配映射关系指定文件,如::

            base:
              '*':
                - default

    `salt master` 配置文件路径树形图::

        [22:55:30][root@localhost:/etc/salt]# tree
        .
        ├── master
        ├── minion
        ├── minion.d
        │   └── _schedule.conf
        └── pki
            ├── master
            │   ├── master.pem
            │   ├── master.pub
            │   ├── minions
            │   │   ├── 200
            │   │   ├── 201
            │   │   └── 202
            │   ├── minions_autosign
            │   ├── minions_denied
            │   ├── minions_pre
            │   └── minions_rejected
            └── minion
                ├── minion_master.pub
                ├── minion.pem
                └── minion.pub

    `salt master` srv项目文件路径树形图::

        [22:57:32][root@localhost:/srv]# tree
        .
        ├── pillar
        │   ├── default.sls
        │   └── top.sls
        └── salt
            ├── _grains
            │   └── test_grains.py
            ├── init.sls
            └── techo.sls

常见问题
--------------

    #. 修改minion id步骤

        * salt master上面删除对应id::

             salt-key -d "id名称" -y

        * 停止salt-minion服务，salt-minion上删除pki文件夹以及minion_id::

             systemctl stop salt-minion
             rm -rf /etc/salt/pki
             rm -rf /etc/salt/minion_id

        * 修改salt-minion配置文件id::

            vi /etc/salt/minion

                id:id名称

        * 启动salt-minion::

            systemctl start salt-minion

        * salt master上面接受::

            salt-key -a "id名称" -y



