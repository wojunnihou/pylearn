/etc/keepalived/keepalived.conf:
   file.managed:
     - source: salt://redis/keepalived.conf
     - template: jinja

keepalived-service:
   service.running:
     - name: keepalived
     - enable: True
     - watch:
       - file: /etc/keepalived/keepalived.conf