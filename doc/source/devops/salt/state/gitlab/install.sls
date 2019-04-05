#https://mirrors.tuna.tsinghua.edu.cn/gitlab-ce/yum/el7/

gitlab_install:
  pkg.installed:
    - names:
      - policycoreutils-python
      - curl
      - openssh-server
      - openssh-clients
      - postfix
      - cronie
  file.managed:
    - name: /usr/src/gitlab-ce-11.9.0-ce.0.el7.x86_64.rpm
    - source: salt://gitlab/gitlab-ce-11.9.0-ce.0.el7.x86_64.rpm
  cmd.run:
    - names:
      - rpm -ivh gitlab-ce-11.9.0-ce.0.el7.x86_64.rpm

    - cwd: /usr/src/
    - shell: /usr/bin/bash
    - runas: root

