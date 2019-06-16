rpm命令
=========

    * 列出所有安装包::

        rpm -qa

    * 查看应用相关文件(比如查看rabbitmq-server相关文件路径)

        rpm -ql rabbitmq-server

    * 查看应用配置文件路径(比如查看rabbitmq-server配置文件路径)

        rpm -qc rabbitmq-server
