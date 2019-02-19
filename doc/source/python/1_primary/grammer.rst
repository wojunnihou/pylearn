基础语法
============

    .. literalinclude:: example.py
        :language: python
        :linenos:
        :caption: example.py

解析器
----------

    .. literalinclude:: example.py
        :lines: 1

    同python一样的脚本语言有很多种，**example.py** 首行表示该源码（脚本）由python解析器执行，*/bin/python*  在
    linux下是python解析器的绝对路径，这行注释必须写在文件首行。linux上对相应文件加上可执行权限后，不用再指定解析器。

文件编码
--------------

    .. literalinclude:: example.py
        :lines: 2

    当前源码文件格编码格式，常用的编码格式如：utf-8,gbk等;此项设置一般在指明解析器后面一行；若源码中未指明解析器，
    则一般在首行指明文件编码格式。python3中一般不用指明。
