#! /opt/redis/env/bin/python
import os
import sys

import redis
import logging
import psutil

logging.basicConfig(level=logging.INFO,
                    filename='/opt/redis/keepalived/keepalived.log',
                    filemode='a',
                    format='%(asctime)s - %(pathname)s[line:%(lineno)d] - %(levelname)s: %(message)s'
                    )
_logger = logging.getLogger(__name__)
client = redis.Redis()

try:
    if not client.ping():
        _logger.info('ping error')
        sys.exit(1)
except:
    _logger.info("status failed")
    sys.exit(1)

net = psutil.net_if_addrs()
ip_list = set()
for interface in net.values():
    for add in interface:
        ip_list.add(add.address)

master = '192.168.5.180' in ip_list
state = client.info('replication')['role']
if master and state != 'master':
    _logger.info('to be master')
    client.slaveof()
if not master and state == 'master':
    _logger.info('to be salve')
    client.slaveof('192.168.5.180', 6379)
