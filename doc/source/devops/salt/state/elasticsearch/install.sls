#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.2.rpm

elasticsearch_achive:
  file.managed:
    - name: /usr/src/elasticsearch-6.6.2.rpm
    - source: salt://elasticsearch/elasticsearch-6.6.2.rpm
  cmd.run:
    - names:
      - source /etc/profile
      - rpm -ivh elasticsearch-6.6.2.rpm

    - cwd: /usr/src/
    - shell: /usr/bin/bash
    - runas: root

