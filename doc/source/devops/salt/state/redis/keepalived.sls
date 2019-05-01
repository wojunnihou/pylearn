/etc/keepalived/keepalived.conf:
   file.managed:
     - source: salt://redis/keepalived.conf
     - template: jinja

python-env:
   cmd.run:
     - names:
       - mkdir -p /opt/redis/
       - /usr/local/python/bin/python3 -m venv /opt/redis/env
     - unless: test -d /opt/redis/env
     - cwd: /opt
     - shell: /usr/bin/bash

/opt/redis/keepalived:
  file.recurse:
    - source: salt://redis/keepalived
    - include_empty: True
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 755


  cmd.run:
    - names:
      - /opt/redis/env/bin/pip3 install --upgrade pip
      - /opt/redis/env/bin/pip3 install -r requirments.txt
    - cwd: /opt/redis/keepalived
    - shell: /usr/bin/bash


keepalived-service:
   service.running:
     - name: keepalived
     - enable: True
     - watch:
       - file: /etc/keepalived/keepalived.conf


