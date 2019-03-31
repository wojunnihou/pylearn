
/etc/emqx/emqx.conf:
   file.managed:
     - source: salt://emqx/emqx.conf
     - template: jinja



/etc/emqx/plugins:
  file.recurse:
    - source: salt://emqx/plugins
    - include_empty: True
    - user: emqx
    - group: emqx
    - dir_mode: 755
    - file_mode: 755

reload-service:
   service.running:
     - name: emqx
     - enable: True
     - watch:
       - file: /etc/emqx/emqx.conf