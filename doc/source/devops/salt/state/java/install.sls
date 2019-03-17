# https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz?AuthParam=1552799605_0d8c2a0cf6c17b5c092939ed0a7e5937

elasticsearch_achive:
  file.managed:
    - name: /usr/src/jdk-8u201-linux-x64.tar.gz
    - source: salt://java/jdk-8u201-linux-x64.tar.gz
  cmd.run:
    - names:
      - mkdir -p /usr/local/java
      - echo -e 'export JAVA_HOME=/usr/local/java\nexport JRE_HOME=${JAVA_HOME}/jre\nexport CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib\nexport PATH=${JAVA_HOME}/bin:$PATH' >> /etc/profile
      - tar -zxf jdk-8u201-linux-x64.tar.gz -C /usr/local/java --strip-components=1
    - cwd: /usr/src
    - unless: test -d /usr/local/java/bin

