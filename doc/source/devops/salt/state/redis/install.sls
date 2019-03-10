depend_install:
  pkg.installed:
    - names:
      - gcc-c++
      - gcc
      - tcl
      - kernel-devel
      - make
      - libtool
      - autoconf

redis_src_package:
  file.managed:
    - name: /usr/src/redis-4.0.12.tar.gz
    - source: salt://redis/redis-4.0.12.tar.gz

redis_install:
  file.managed:
     - name: /etc/init.d/redis
     - source: salt://redis/redis
     - template: jinja
  cmd.run:
    - names:
      - chmod a+x /etc/init.d/redis
      - mkdir -p /usr/src/redis /var/lib/redis/
      - tar -zxf redis-4.0.12.tar.gz -C /usr/src/redis --strip-components=1
      - make -C /usr/src/redis
      - make -C /usr/src/redis install
      - rm -rf /usr/src/redis /usr/src/redis/redis-4.0.12.tar.gz
    - cwd: /usr/src
    - require:
       - file: redis_src_package

/etc/redis/redis.conf:
   file.managed:
     - source: salt://redis/redis.conf
     - template: jinja
     - makedirs: true


/lib/systemd/system/redis.service:
    file.managed:
      - source: salt://redis/redis.service
    cmd.run:
      - names:
        - systemctl daemon-reload
        - systemctl enable redis.service
    service.running:
      - name: redis
      - enable: True
      - watch:
        - file: /etc/redis/redis.conf