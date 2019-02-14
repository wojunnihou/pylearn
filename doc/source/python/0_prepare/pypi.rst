pypi
=========

    `官网 <https://pypi.org/>`_
    `pip官网手册 <https://pip.pypa.io/en/stable/user_guide/>`_

    软件开发过程中一些代码通用，比如通讯、数据爬取、建网站等等；为了大量减少开发工作量，因此开源社区中很多开源项目都在github等开源代码
    平台开放自己代码.python开源代码都会根据自己都开发进度到一定时间点会打包成一个代码集合（包）；放到这个平台供所有人使用。不同语言有不同的开源包管
    理平台；而python的开源管理平台就是pypi。但这个平台在国外，访问会比较慢；因此国内就出现了不少点镜像平台如阿里云、豆瓣等。

安装
-----------

    Python 2.7.9 + 或 Python 3.4+ 以上版本都自带 pip 工具(pypi客户端交互命令),也可以通过系统包管理工具安装如ubuntu

    .. code-block:: bash

        sudo apt-get install python-pip

    `官网安装说明 <https://pip.pypa.io/en/stable/installing/>`_

国内pypi镜像源
---------------------------

    镜像源列表：
        * 阿里云 http://mirrors.aliyun.com/pypi/simple/
        * 豆瓣(douban) http://pypi.douban.com/simple/

    配置从镜像源安装包,pip文件路径::

        linux(macos)系统下pip配置文件路径: ~/.pip/pip.conf
        windwos系统下(xx为电脑用户名): C:\Users\xx\pip\pip.conf

    配置内容::

        [global]
        trusted-host=mirrors.aliyun.com
        index-url=https://mirrors.aliyun.com/pypi/simple/
        format=columns


安装三方包
----------

    `官网包安装说明 <https://packaging.python.org/tutorials/installing-packages/>`_

    安装一个包

    .. code-block:: bash

        pip install "SomeProject"
        pip install "SomeProject==1.4"
        pip install "SomeProject>=1,<2"
        pip install "SomeProject~=1.4.2"


    安装一系列的包

    .. code-block:: bash

        pip install -r requirements.txt

    从其他非pypi官网源安装包

    .. code-block:: bash

        pip install --index-url=https://mirrors.aliyun.com/pypi/simple/ SomeProject

    从vcs上面安装，如github上面安装sanic

    .. code-block:: bash

        pip install -e git+https://github.com/huge-success/sanic.git#egg=sanic

    从本地某个路径安装

    .. code-block:: bash

        pip install -e <path>

    从源码包安装

    .. code-block:: bash

        pip install ./downloads/SomeProject-1.0.4.tar.gz

升级包
----------------

    更新包

    .. code-block:: bash

        pip install --upgrade SomeProject

卸载
----------------

    .. code-block:: bash

        pip uninstall SomeProject


搜索
---------------

    .. code-block:: bash

        pip search SomeProject

显示安装包信息
-----------------

    简略

    .. code-block:: bash

        pip show SomeProject

    详细

    .. code-block:: bash

        pip show -f SomeProject

显示安装列表
------------

    已经安装的包列表

    .. code-block:: bash

        pip list

    可以升级的包列表

    .. code-block:: bash

        pip list -o

    过期包列表

    .. code-block:: bash

        pip list --outdated

导出项目依赖包到requirements.txt中
---------------------------------------

    .. code-block:: bash

        pip freeze > requirements.txt

pip命令自动补齐
------------------------

    bash

    .. code-block:: bash

        pip completion --bash >> ~/.profile

    zsh

    .. code-block:: bash

        pip completion --zsh >> ~/.zprofile