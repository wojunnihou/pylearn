rabbitmq
==========

安装
-------

    * 安装salt-minion

    * salt-master执行命令(在minion id 为5.202上面安装rabbitmq)::

        salt '5.202' state.sls rabbitmq.install

