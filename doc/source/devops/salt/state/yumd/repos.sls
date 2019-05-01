yum repos d:
    cmd.run:
     - names:
       - echo '123'
       - mv /etc/yum.repos.d/ /etc/yum.repos.d.bak1
       - mkdir /etc/yum.repos.d
       - wget -O /etc/yum.repos.d/CentOS7-Base-163.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
       - yum clean all
       - yum makecache
       - mv /etc/yum.repos.d.bak1  /etc/yum.repos.d.bak
     - unless: test -d '/etc/yum.repos.d.bak'