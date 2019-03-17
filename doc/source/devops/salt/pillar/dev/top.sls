dev:
  '*':
    - user
  'role:redis':
    - match: grain
    - redis/conf
    - redis/keepalived
  'role:redis-master':
    - match: grain
    - redis/keepalived-master
  'role:redis-salve1':
    - match: grain
    - redis/keepalived-salve1
  'role:redis-salve2':
    - match: grain
    - redis/keepalived-salve2
  'role:elasticsearch200':
    - match: grain
    - elasticsearch/node200
  'role:elasticsearch201':
    - match: grain
    - elasticsearch/node201
  'role:elasticsearch202':
    - match: grain
    - elasticsearch/node202