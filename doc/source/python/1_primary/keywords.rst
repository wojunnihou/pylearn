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

    pass是空语句，不做任何事情，常用作占位语句，是为了保持程序结构的完整性。当要定义一个函数，但是暂时不知道怎么写，可以
    pass来占位使程序可以不报错，可以正常运行:

        >>> def n():
        ...     pass



def/return
---------------

    在Python中，定义一个函数要使用def语句，依次写出函数名、括号、括号中的参数和冒号:然后，在缩进块中编写函数体，函数
    的返回值用return语句返回：

        >>> nums=range(10)
        >>> def sum(n):
        ...   sum=0
        ...   for x in n:
        ...     sum=sum+x*x
        ...   return sum
        >>> sum(nums)

    输出
        285


lambda
----------------------------

    lambda表达式通常是用来命名匿名函数。当函数很简单，重新定义一个函数很繁琐的时候可以使用lambda来定义，比如：

    求x的平方，用lambda可以表达为：

        >>> n=lambda x:x*x
        >>> n(10)
        100

    用def函数来表达为：
        >>> def n(x):
        ...   return x*x
        ...
        >>> n(10)
         100

    在这里lambda简化了函数定义的书写形式，两者都可以用来定义函数，但是def更加正式，函数必须要有一个名字

class
----------

    class是Python中定义类的关键字，类是抽象的模板，实例是根据类创建的具体的对象，每个对象拥有相同的方法，但是数据可能不同
    让我们先来定义一个类：

        >>> class Classmates():
        ...   pass

    再来创建一个实例，实例是通过 类名+（）实现的：

        >>> part=Classmates()
        >>> part
        <__main__.Classmates object at 0x0000018433CEDB38>

    可以看出实例BOB创建成功，内存地址是0x0000018433CEDB38

    给实例变量绑定属性，例如给part绑定一个name属性：

        >>> part.name='Bob'
        >>> part.name
        'Bob'

    但是当实例变量有很多属性时，可以同时绑定多个属性：

        >>> class Classmates():
        ...   def __init__(self,name,age,score):
        ...     self.name=name
        ...     self.age=age
        ...     self.score=score

        >>> part=Classmates('Bob',24,85)
        >>> part.name
        'Bob'
        >>> part.age
        24
        >>> part.score
        85

    和普通的函数相比，在类中定义的函数只有一点不同，就是第一个参数永远是实例变量self，并且，调用时，不用传递该参数。
    除此之外，类的方法和普通函数没有什么区别，所以，你仍然可以用默认参数、可变参数、关键字参数和命名关键字参数

from/import/as
-------------------------------

    form import和import都是数据导入的方法，但是他们的使用方法和作用都有所差别：

    form import用来导入模块中指定的模块属性，语法是：
    form module import name1[name2[,......nameN]]


    而import是用来导入整个模块，语法为：
    import module1[module2[,.....moduleN]]

    form import 和import 都可以加as,有时候你导入的模块或是模块属性名称已经在你的程序中使用了, 或者你不想使用导入的名字。
    可能是它太长不便输入什么的, 总之你不喜欢它。使用自己想要的名字替换模块的原始名称。一个普遍的解决方案是把模块赋值给
    一个变量:

try/except/else/finally/raise
-----------------------------------

    在代码运行中经常会有错误提示，在运行代码之前不知道代码是否会出错，一旦出错一级一级找错误也很麻烦，这样就可以在语句中
    嵌入一个try语句

    try必须和except同时使用：

        >>> try:
        ...     x=9/0
        ...     print(x)
        ... except ZeroDivisionError as e:
        ...     print('false')
        ... else:
        ...     print('correct')
        ... finally:
        ...     print('end')

    执行结果 ：

        false
        end

    当我们认为某些代码可能会出错时，就可以用try来运行这段代码，如果执行出错，则后续代码不会继续执行，而是直接跳转至错误处理
    代码，即except语句块，可以在except语句块后面加一个else，当没有错误发生时，会自动执行else语句，最后执行finally语句，不管
    代码是否有误，finally都会被执行。

    可以用raise手工出发一个异常，这样做程序不会因为异常终止，而是运行报错：

        >>> def num(x,y):
        ...     if y==0:
        ...       raise ZeroDivisionError('除数为零')
        ...     else:
        ...       return x/y
        ...
        >>> num(6,0)

    执行结果：
        Traceback (most recent call last):
          File "<stdin>", line 1, in <module>
          File "<stdin>", line 3, in num

        ZeroDivisionError: 除数为零


assert
----------

    assert断言是声明其布尔值必须为真的判定，如果发生异常就说明表达示为假，用来测试表达式，其返回值为假，就会触发异常。

        >>> assert 4==4(布尔值为ture)
        >>> assert 4==5(布尔值为false，触发异常反应)
        Traceback (most recent call last):
          File "<stdin>", line 1, in <module>
        AssertionError

    可以在assert后面添加异常参数，就是在断言表达式后添加字符串信息，用来解释断言并更好的知道是哪里出了问题，格式为：

    assert 表达式 [, 参数]，例如：

        >>> assert 4==5,'4不等于5'
        Traceback (most recent call last):
          File "<stdin>", line 1, in <module>
        AssertionError: 4不等于5

yield/yield from
------------------

    带有yield的语句是一个生成器：

        >>> def h():
        ...    yield'hello'
        ...    yield'python'
        ...
        >>> h()
        <generator object h at 0x000002BA64D3C570>
        >>> b=h()
        >>> next(b)
        'hello'
        >>> next(b)
        'python'


    为了让生成器（带yield函数），能简易的在其他函数中直接调用，就产生了yield from：

        >>> def h2():
        ...     yield from h()
        ...
        >>> h2()
        <generator object h2 at 0x000002BA64D3C570>
        >>> c=h2()
        >>> next(c)
        'hello'
        >>> next(c)
        'python'

        yield from也可以这样用：

        >>> def h3():
        ...     yield from 'hello'
        ...     yield from 'python'
        ...
        >>> d=h3()
        >>> next(d)
        'h'
        >>> next(d)
        'e'


with/as
--------------------



async/await
-------------

async with/as
---------------

global/nonlocal
----------------------
