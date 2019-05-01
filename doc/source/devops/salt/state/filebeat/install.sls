
intall_filebeat:
  file.managed:
    - name: /usr/src/filebeat-6.6.2-x86_64.rpm
    - source: salt://filebeat/filebeat-6.6.2-x86_64.rpm
  cmd.run:
    - names:
      - rpm -ivh filebeat-6.6.2-x86_64.rpm

    - cwd: /usr/src/
    - shell: /usr/bin/bash
    - runas: root

