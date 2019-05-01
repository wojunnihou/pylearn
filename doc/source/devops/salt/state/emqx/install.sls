#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.2.rpm

elasticsearch_achive:
  file.managed:
    - name: /usr/src/emqx-centos7-v3.1-beta.3.x86_64.rpm
    - source: salt://emqx/emqx-centos7-v3.1-beta.3.x86_64.rpm
  cmd.run:
    - names:
      - rpm -ivh emqx-centos7-v3.1-beta.3.x86_64.rpm

    - cwd: /usr/src/
    - shell: /usr/bin/bash
    - runas: root

