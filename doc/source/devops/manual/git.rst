git
==============

    代码版本管理工具 `源码 <https://github.com/git/git>`_ `下载 <https://git-scm.com/downloads>`_
    `文档 <https://git-scm.com/docs>`_ `中文文档 <https://git-scm.com/book/zh/v2>`_


.. _centos7-update-git:

centos7 升级git
-------------------

    升级epel::

        curl -o enable-ius.sh -L https://raw.githubusercontent.com/iuscommunity/automation-examples/bash/enable-ius.sh
        sudo sh enable-ius.sh
        rm -rf enable-ius.sh

    git编译环境::

        yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel  gcc perl-ExtUtils-MakeMaker wget

    git源码下载安装::

        yum autoremove -y git
        cd /usr/local/src
        wget https://www.kernel.org/pub/software/scm/git/git-2.20.1.tar.gz
        tar xzf git-2.20.1.tar.gz
        cd git-2.20.1
        ./configure
        make all
        make install
        git --version


git命令补齐
----------------

    下载::

        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
        curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh

    修改配置，添加在文件最后 vi ~/.bashrc::

        if [ -f ~/.git-completion.bash ]; then
            source ~/.git-completion.bash
        fi
        GIT_PS1_SHOWDIRTYSTATE=true
        GIT_PS1_SHOWCOLORHINTS=true
        if [ -f ~/.git-prompt.sh ]; then
          source ~/.git-prompt.sh
          PROMPT_COMMAND='__git_ps1 "[\t][\u@\h:\w]" "\\\$ "'
        fi

    激活::

        source ~/.bashrc
