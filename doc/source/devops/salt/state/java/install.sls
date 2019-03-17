# https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz?AuthParam=1552799605_0d8c2a0cf6c17b5c092939ed0a7e5937

elasticsearch_achive:
  file.managed:
    - name: /usr/src/jdk-8u201-linux-x64.rpm
    - source: salt://java/jdk-8u201-linux-x64.rpm
  cmd.run:
    - names:
      -  rpm -ivh  jdk-8u201-linux-x64.rpm
    - cwd: /usr/src

