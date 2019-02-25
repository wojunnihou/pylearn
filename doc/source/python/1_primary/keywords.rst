保留字
========

.. _keywords:


None
------------

    表示空 ，函数么有return的时候返回结果为None，判断是否为none需要用is，例如:

    .. literalinclude:: keywords.py
        :start-after: # None
        :end-before: print(a is None)

    运行结果::

        2
        None
        True
        True

True/False
------------

    布尔值只有两个值：True,False或者1，0表示真或假,在Python中可以直接用True,False来表示布尔值，也可以通过计算得到；

        >>> True
        True
        >>> False
        False
        >>> 3 > 2
        True
        >>> 3 > 5
        False


and/or/not
------------

    `and` 和 `or` 是Python中的两个逻辑运算符，可以进行多个条件的判断

    `and` 表示所有条件为真时，该条件才为真：

        >>> True and True
        True
        >>> True and False
        False
        >>> False and False
        False
        >>> 5 > 3 and 3 > 1
        True

    .. note::

        当and前面一个表达式为False的时候，and后面表达式不会执行

    or表示只有一个条件为真，该条件就为真：

        >>> True or True
        True
        >>> True or False
        True
        >>> False or False
        False
        >>> 5 > 3 or 1 > 3
        True

    .. note::

        当or前面一个表达为True的时候，or后面表达式不会执行

    not是非运算，把True变成False，或把False变成Ture:

        >>> not True
        False
        >>> not False
        True
        >>> not 1 > 2
        True


in/not in
-----------------------------


    in用来判断值是存在列表当中，not in与in相反，用来判断值不存在列表当中：

        >>> name=['bob','lancy','mark','jony']
        >>> if 'bob' in name:
        ...   print('bob' 'is exists')
        ... else:
        ...   print('bob' 'is not exists')

    输出

     bob is exists


is
-----------------------------


    is是Python中的同一运算符，用来比较对象间的身份标识(id)是否相同：

        >>> A=B=(1,2,3,4)
        >>> C=(1,2,3,4)
        >>> A is B
        True
        >>> A is C
        False
        >>> id(A)
        2597831708328
        >>> id(B)
        2597831708328
        >>> id(C)
        2597831708248

    ==也是起对对象进行比较判断的作用，但是==与is本质的区别是：==是用来比较值（value）是否相等：

        >>> A=B=(1,2,3,4)
        >>> C=(1,2,3,4)
        >>> A is B
        True
        >>> A is C
        False
        >>> id(A)
        2597831708328
        >>> id(B)
        2597831708328
        >>> id(C)
        2597831708248
        >>> A==B
        True
        >>> A==C
        True

del
-----------------

    del,remove,pop都是Python中的删除方法。但是他们三者的用法又有不同。

    del是对列表的下标进行检索删除，不返回删除值：

        >>> L=[7,8,9,10]
        >>> del L[2]
        >>> L
        [7, 8, 10]

if/elif/else
----------------

    if是Python中的条件判断，判断条件是否为true，为true执行命令行，为false不执行命令行。也可以在if后面添加一个else语句，当
    条件判断是false的时候，执行else后面的语句：

        >>> n=range(100)
        >>> m=110
        >>> if m in n:
        ...   print('m属于n')
        ... else:
        ...   print('m不属于n')

    输出
      m不属于n

    当然上面的判断很粗略，可以用elif来做更加精细的判断：

        >>> score=76
        >>> if score<60:
        ...   print('不及格')
        ... elif score<=80:
        ...   print('合格')
        ... else:
        ...   print('优秀')

    输出

       合格


for...in/else
----------------------------

    for...in是循环语句，依次把list的元素迭代出来进行重复计算：

    例如要计算1-100的和：
        >>> n=range(101)
        >>> b=0
        >>> for x in n:
        ...   b=b+x
        >>> print(b)

    输出
       5050

    for...in语句也可以同else子句同时使用，在for循环正常执行后，else子句里面的内容也会正常执行：

        >>> for x in range(10):
        ...   print(x)
        ... else:
        ...   print('再见 ')

    输出

        0
        1
        2
        3
        4
        5
        6
        7
        8
        9
        再见

    但是当for循环被break中断后，else语句不执行：

        >>> for x in range(10):
        ...   print(x)
        ...   break
        ... else:
        ...   print('再见')

    输出

        0

    可以看出break后面的else语句没有执行

while/else
------------------

    while也是一种循环语句，只要条件满足就不断进行循环，不满足就退出循环：

    例如要计算1-100中的奇数的和：
        >>> sum = 0
        >>> while n > 0:
        ...   sum = sum + n
        ...   n = n - 2
        >>> print(sum)

    输出
       2500

    while循环后面加else语句和for循环加else语句用法一样：在while循环正常执行后，else子句里面的内容也会正常执行
    当while循环被break中断后，else语句不执行

break/continue
---------------------

    break使用在循环语句中可以提前退出循环：

        >>> n=1
        >>> while n<=100:
        ...   if n>10:
        ...     break(当n大于10的时候退出循环）
        ...   print(n)
        ...   n=n+1

    依次输出

        1
        2
        3
        4
        5
        6
        7
        8
        9
        10

    continue使用在循环语句中，起到跳过当前循环的作用：

        >>> n=0
        >>> while n<10:
        ...   n=n+1
        ...   if n%2==0:
        ...     continue(当n是偶数的时候结束当前循环，后面的print不执行)
        ...   print(n)

    输出
        1
        3
        5
        7
        9

pass
--------

    pass是空语句，不做任何事情，常用作占位语句，是为了保持程序结构的完整性。

def/return
---------------

    在Python中，定义一个函数要使用def语句，依次写出函数名、括号、括号中的参数和冒号:然后，在缩进块中编写函数体，函数
    的返回值用return语句返回：

lambda
----------------------------

class
----------

from/import/as
------------------------------

try/except/else/finally/raise
-----------------------------------

assert
----------

yield/yield from
------------------

with/as
--------------------

async/await
-------------

async with/as
---------------

global/nonlocal
----------------------
