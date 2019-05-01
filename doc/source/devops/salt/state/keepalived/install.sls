keepalived_depend:
  pkg.installed:
    - names:
      - libnl-devel
      - libnfnetlink-devel
      - libnftnl-devel
      - libmnl-devel

keepalived_install:
  file.managed:
    - name: /usr/src/keepalived-2.0.13.tar.gz
    - source: salt://keepalived/keepalived-2.0.13.tar.gz
  cmd.run:
    - names:
      - mkdir -p /usr/src/keepalived
      - tar -zxf keepalived-2.0.13.tar.gz -C /usr/src/keepalived --strip-components=1
    - cwd: /usr/src

keepalive_make:
  cmd.run:
    - names:
      - ./configure --prefix=/usr/local/keepalived
      - make
      - make install
      - cp keepalived/etc/init.d/keepalived /etc/init.d/
      - cp keepalived/etc/sysconfig/keepalived /etc/sysconfig/keepalived
      - mkdir -p /etc/keepalived/
      - cp  /usr/local/keepalived/etc/keepalived/keepalived.conf /etc/keepalived/
      - rm -rf /usr/src/keepalived

    - cwd: /usr/src/keepalived