'''
关键字解释
'''
# None
def no_return():
    """
    这个函数没有使用return语句返回值
    :return:
    """
    print(1 + 1)


a = no_return()
print(a)
print(a == a)
print(a is None)
