#! /opt/redis/env/bin/python
import os
import sys

import redis
import logging

logging.basicConfig(level=logging.INFO,
                    filename='/opt/redis/keepalived/keepalived.log',
                    filemode='a',
                    format='%(asctime)s - %(pathname)s[line:%(lineno)d] - %(levelname)s: %(message)s'
                    )
_logger = logging.getLogger(__name__)
_logger.info('to be master')
client = redis.Redis()
client.slaveof()
