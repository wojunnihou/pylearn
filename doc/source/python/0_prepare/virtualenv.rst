虚拟环境
========

简介
----------

    在python项目中，不同的项目通常依赖的三方包不同；偶尔也会出现不同项目依赖同一个三方包，但是版本不一样等问题。此时为了在同一台电脑上运行不同
    项目就需要用到python虚拟环境；python虚拟环境实际就是python包管理工具，把属于同一个项目依赖的三方包管理到一个文件夹中，通过不同文件夹可以
    管理不同到虚拟环境。

venv(pyvenv)
-------------------

    python3.6以后官方推荐的管理工具，系统自带。`官网说明 <https://docs.python.org/3/library/venv.html>`_
    pyvenv 是python3.3-3.5虚拟环境管理的一个脚本，python3.6以后版本不再推荐

    创建虚拟环境

    .. code-block:: bash

        python -m venv env

    激活虚拟环境

    .. code-block:: bash

        . env/bin/activate


    取消激活虚拟环境

    .. code-block:: bash

        deactivate

pyenv
--------------------

    一款多版本python管理的脚本工具 `源码及手册 <https://github.com/pyenv/pyenv>`_

    安装

    .. code-block:: bash

        curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

    查看可安装列表

    .. code-block:: bash

        pyenv install --list

    安装(卸载)指定版本的python

    .. code-block:: bash

        pyenv install 3.6.5
        pyenv uninstall 3.6.5

    创建(删除)-个指定python版本的虚拟环境

    .. code-block:: bash

        pyenv virtualenv 3.6.5 someenv
        pyenv uninstall someenv

    激活(取消)虚拟环境

    .. code-block:: bash

        pyenv activate someenv
        pyenv deactivate

    设置某个文件夹下面默认使用(取消)某个虚拟环境

    .. code-block:: bash

        pyenv local someenv
        pyenv local --unset


    查看本地pyenv管理的python环境

    .. code-block:: bash

        pyenv versions


anaconda
-------------

    一个开源的python环境，安装后有交互界面进行管理虚拟环境，并且默认安装了大量的数据分析、人工智能等方面等三方包 `官网 <https://www.anaconda.com/>`_

pycharm
-----------

    最新pycharm支持python解析器等管理

    .. image:: pycharm-virtual.png