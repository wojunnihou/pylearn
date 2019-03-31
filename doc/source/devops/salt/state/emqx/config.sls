
/etc/emqx/emqx.conf:
   file.managed:
     - source: salt://emqx/emqx.conf
     - template: jinja

reload-service:
   service.running:
     - name: emqx
     - enable: True
     - watch:
       - file: /etc/emqx/emqx.conf