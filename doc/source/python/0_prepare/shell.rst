交互解析器（shell）
=====================

python
------------

    python解析器本身就可以交互式使用；安装python过后直接可用。有些缺陷如交互不友好

    .. image:: shell-python.png

ipython
---------

    一款比较友好的python交互解析器

    ``安装``

    .. code-block:: bash

        pip install ipython

    .. image:: shell-ipython.png

    特点:

        * tab自动补齐
        * %command 执行命令::

            In [9]: %ls
            README.md  doc/       src/


        * %timeit 查看表达式执行时间::

            In [8]: %timeit range(10)
            277 ns ± 9.96 ns per loop (mean ± std. dev. of 7 runs, 1000000 loops each)

        * ·_·执行上一条::

            In [24]: 12+43
            Out[24]: 55

            In [25]: _
            Out[25]: 55


bpython
----------

    自动补齐，语法高亮交互解析器

    `安装`

    .. code-block:: bash

        pip install bpython

    .. image:: shell-bpython.png