
intall_logstash:
  file.managed:
    - name: /usr/src/logstash-6.6.2.rpm
    - source: salt://logstash/logstash-6.6.2.rpm
  cmd.run:
    - names:
      - rpm -ivh logstash-6.6.2.rpm

    - cwd: /usr/src/
    - shell: /usr/bin/bash
    - runas: root

