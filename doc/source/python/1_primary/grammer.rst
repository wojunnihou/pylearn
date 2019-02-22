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
    则一般在首行指明文件编码格式。python3中默认使用utf-8编码，所以不用指明（文件编码非utf-8编码除外）。

标识
-----------

    *Python* 中定义变量、函数、类都需要为其取一个标识，标识有以下规则

    .. literalinclude:: example.py
        :lines: 30-34

    1. 标识由由字母、数字、下划线组成,如标识：`Name2_`
    #. 所有标识符可以包括英文、数字以及下划线(_)，但不能以数字开头,如:上面标识中都没有以数字开头的定义
    #. 标识符是区分大小写的,如`gender` 与`Gender`表示不同标识
    #. :doc:`keywords` 不能作为标识::

        'False', 'None', 'True', 'and', 'as', 'assert',
        'async', 'await', 'break', 'class', 'continue',
        'def', 'del', 'elif', 'else', 'except', 'finally',
        'for', 'from', 'global', 'if', 'import', 'in', 'is',
        'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise',
        'return', 'try', 'while', 'with', 'yield'

    .. note::

        * 一根下划线开头变量代表不能直接访问的类属性，需通过类提供的接口进行访问，不能用 from xxx import * 而导入,如: `_age`

        *  双下划线开头代表类私有成员,如: `__age`

        * 双下划线开头结尾代表 *python* 特殊专用的标识,如: `__class__`

注释
---------------

    文档中的注释属于书面描述，当程序执行的时候不会执行对应文本描述;程序中适当的注释有利于软件长期维护

    .. literalinclude:: example.py
        :lines: 39-47

    * 单行注释采用，以 `#` 开头到行尾都标识注释;
    * 多行注释，三个单引号 `'` 或者双引号  `"` 开始结束其中的文字标识注释,其中文字描述可以换

空行
-------------

    空行不是python语法中的一部分，空行或者不空行不会影响程序的运行；但一般情况函数之间或类的方法之间用空行分隔，
    表示一段新的代码的开始；空行分隔两段不同功能含义代码,便于日后维护

行与缩进
-----------

    python通过缩进相同空白数量表示代码块如：

    .. literalinclude:: example.py
        :lines: 10-25

    .. note::

        由于tab键缩进在不同系统下缩进空白不一样，因此建议编码的时候不要使用tab缩进

多行语句
-----------

    如果某些语句过长，通过`\` 分开多行,如 :

    .. literalinclude:: example.py
        :lines: 54-55

一行写多条语句
----------------

    通过分号`;`可以实现一行写多条语句，但这种语法非常不利于维护，所以建议如此书写

    .. literalinclude:: example.py
        :lines: 60

