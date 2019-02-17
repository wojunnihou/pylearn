#! /bin/python
# -*- coding: utf-8-*-
"""
    模块说明这样写,可以通过 help(example)查看该模块说明
"""
import keyword


# 代码块-缩进
def thumb_person(name, age=20):
    """
    这是一个函数（方法）,作用是夸一个人
    :param name: 被夸奖对象,人名
    :param age: 年龄
    :return: 执行结果
    """

    # 夸奖
    if age < 18:
        print('%s特别可爱' % (name))
    else:
        print('%s特别漂亮' % (name))

    # 夸奖后得到的结果
    return 'nice'


if __name__ == '__main__':
    # 标识命名（变量、函数名、类名)
    age = 123
    _age = 123
    Name2_ = 'lili'
    gender = 'female'
    Gender = 'male'

    # 打印出python系统关键字
    print(keyword.kwlist)

    # 注释

    '''
    注释
    '''

    """
    注释
    """

    # '通常情况下一行写完一句代码，部分情况下一条语句会比较长，
    # 需要拆分成多行；通过反斜杠(\)实现写多行'
    one_str = '第一句'
    two_str = '第二句'
    three_str = '第三句'
    all_str = one_str + two_str \
              + three_str
    print(all_str)

    # 多行语句写到一行中，通过“;”分隔, 虽然执行代码不会报错，
    # 但是不利于维护，因此在一行中尽量只写一条语句
    result = 1 + 1;print(result)
