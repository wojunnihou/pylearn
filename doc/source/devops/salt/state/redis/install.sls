redis src package:
  file.managed:
    - name: /usr/src/redis-4.0.12.tar.gz
    - source: salt://redis/redis-4.0.12.tar.gz

depend install:
  pkg.installed:
    - names:
      - gcc-c++
      - gcc
      - tcl
      - kernel-devel
      - make
      - libtool
      - autoconf

install_redis:
  file.managed:
  - name: /lib/systemd/system/redis.service
  - source: salt://redis/redis.service
  cmd.run:
  - names:
     - rm -rf redis-4.0.12 /usr/src/redis
     - cd /usr/src
     - mkdir /usr/src/redis
     - tar -zxf redis-4.0.12.tar.gz -C /usr/src/redis --strip-components=1
     - make -C /usr/src/redis
     - make -C /usr/src/redis install
     - mkdir -p /etc/redis
     - cp /usr/src/redis/redis.conf /etc/redis/redis.conf
     - rm -rf /usr/src/redis /usr/src/redis-4.0.12.tar.gz
     - systemctl daemon-reload
     - systemctl enable redis.service
  - cwd: /usr/src
  - shell: /bin/bash
  - require:
    - file: redis src package