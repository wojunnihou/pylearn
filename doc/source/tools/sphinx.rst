sphinx
=============

手册
--------------

    * `官网 <http://www.sphinx-doc.org/en/master/contents.html>`_
    * `中文 <https://zh-sphinx-doc.readthedocs.io/en/latest/contents.html>`_
    * `golden-note <https://golden-note.readthedocs.io/zh/latest/sphinx/index.html>`_


利用pycharm编写文档配置
-----------------------

    * 采用pypi到方式安装sphinx

    .. code-block:: bash

        pip install -U sphinx

    * 快速建立源目录

    .. code-block:: bash

        cd /Users/wayen/Project/pylearn/doc
        sphinx-quickstart
        sphinx-build -b html source build



    * pycharm运行配置（构建html）

    .. image:: pycharm-sphinx-run.png
