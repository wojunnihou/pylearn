redis src package:
  file.managed:
    - name: /usr/src/redis-5.0.3.tar.gz
    - source: salt://redis/redis-5.0.3.tar.gz

make redis:
  cmd.run:
  - name: echo $PATH && rm -rf redis-5.0.3 && cd /usr/src && \
          tar -zxvf redis-5.0.3.tar.gz && \
          cd redis-5.0.3 &&\
          make &&\
          make install
  - cwd: /usr/src
  - shell: /bin/bash
  - require:
    - file: redis src package