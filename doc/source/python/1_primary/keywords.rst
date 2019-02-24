保留字
========

.. _keywords:


None
------------

    表示空 ，函数么有return的时候返回结果为None，判断是否为none需要用is，例如:

    .. literalinclude:: keywords.py
        :start-after: def no_return()
        :end-before: print(a is None)

    运行结果::

      2
        None
        True
        True

True/False
------------

    布尔值只有两个值：True,False或者1，0表示真或假,在Python中可以直2接用True,False来表示布尔值，也可以通过计算得到；

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

    and 和or是Python中的两个逻辑运算符，可以进行多个条件的判断
    and表示所有条件为真时，该条件才为真：

      >>> True and True
      True
      >>> True and False
      False
      >>> False and False
      False
      >>> 5 > 3 and 3 > 1
      True

    or表示只有一个条件为真，该条件就为真：

      >>> True or True
      True
      >>> True or False
      True
      >>> False or False
      False
      >>> 5 > 3 or 1 > 3
      True

    not是非运算，把True变成False，或把False变成Ture:

      >>> not True
      False
      >>> not False
      True
      >>> not 1 > 2
      True


in/not in
-----------------------------


    in用来判断值是存在列表当中，not in与not相反，用来判断值不存在列表当中：

      >>> name=['bob','lancy','mark','jony']
      >>> if 'bob' in name:
     ...   print('bob' 'is exists')
     ... else:
     ...   print('bob' 'is not exists')

    输出

     bob is exists


is/==
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

del/remove/pop
-----------------

    del,remove,pop都是Python中的删除方法。但是他们三者的用法又有不同。

    del是对列表的下标进行检索删除，不返回删除值：

      >>> L=[7,8,9,10]
      >>> del L[2]
      >>> L
      [7, 8, 10]

    pop也是对列表的下标进行检索删除，返回删除值：

      >>> L=[7,8,9,10]
      >>> L.pop(2)
      9
      >>> L
      [7, 8, 10]

    remove(item)方法是直接对可变序中的元素进行检索删除，返回的是删除后的列表,不返回删除值（返回None）

      >>> L=[7,8,9,10]
      >>> L.remove(7)
      >>> L
      [8, 9, 10]


if/elif/else
----------------

for/in/else
----------------------------

while/else
------------------

pass
------------

break/continue
---------------------

def/return
---------------

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
