rabbitmq
==========

安装
-------

    * 安装salt-minion

    * salt-master执行命令(在minion id 为202上面安装rabbitmq)::

        salt '202' state.sls state.rabbitmq.intsall

