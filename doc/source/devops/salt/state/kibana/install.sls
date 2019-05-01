#https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.2.rpm

intall_kibana:
  file.managed:
    - name: /usr/src/kibana-6.6.2-x86_64.rpm
    - source: salt://kibana/kibana-6.6.2-x86_64.rpm
  cmd.run:
    - names:
      - rpm -ivh kibana-6.6.2-x86_64.rpm

    - cwd: /usr/src/
    - shell: /usr/bin/bash
    - runas: root

