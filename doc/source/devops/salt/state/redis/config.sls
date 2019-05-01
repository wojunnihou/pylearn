
/etc/redis/redis.conf:
   file.managed:
     - source: salt://redis/redis.conf
     - template: jinja

reload-service:
   service.running:
     - name: redis
     - enable: True
     - watch:
       - file: /etc/redis/redis.conf