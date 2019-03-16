make_depend:
  pkg.installed:
    - names:
      - zlib-devel
      - bzip2-devel
      - openssl-devel
      - ncurses-devel
      - sqlite-devel
      - readline-devel
      - libffi-devel
      - tk-devel
      - gcc
      - make

python_install:
  file.managed:
    - name: /usr/src/cpython-3.7.2.tar.gz
    - source: salt://python/cpython-3.7.2.tar.gz
  cmd.run:
    - names:
      - mkdir -p /usr/src/python
      - tar -zxf cpython-3.7.2.tar.gz -C /usr/src/python --strip-components=1
    - cwd: /usr/src
    - unless: test -d /usr/src/python

python_make:
  cmd.run:
    - names:
      - ./configure --prefix=/usr/local/python
      - make
      - make install
      - echo 'PATH=$PATH:$HOME/bin:/usr/local/python/bin' >> ~/.bash_profile
      - rm -rf /usr/src/python
    - cwd: /usr/src/python
    - unless: test -d /usr/src/python

pip_mirror:
  cmd.run:
    - names:
      - mkdir -p ~/.pip
  file.managed:
    - name: ~/.pip/pip.conf
    - source: salt://python/pip.conf