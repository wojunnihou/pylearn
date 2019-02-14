hello world
============

输出"hello world"
--------------------

    * 创建一个文本输入以下代码(假如文本路径: C:\hello_world.txt)

        .. code-block:: python

            print('hello world')


    * 保存退出


    * 打开命令行（windows10下面可以在搜索框输入cmd）

    * 命令行输入以下命令，完成"hello world"

        .. code-block:: bash

            python C:\hello_world.txt

每隔3秒输出'I like python'
--------------------------

    代码

        .. code-block:: python

             import time

             while 1:
                print('I like python')
                time.sleep(3)

    按 `ctrl + c` 可以中断执行