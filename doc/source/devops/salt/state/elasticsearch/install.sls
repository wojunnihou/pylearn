# https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.2.tar.gz

elasticsearch_user:
  group.present:
    - name: elasticsearch
    - gid: {{ pillar.get('elasticsearch_gid')}}

  user.present:
    - name: elasticsearch
    - fullname: elasticsearch
    - shell: /usr/bin/bash
    - uid: {{ pillar.get('elasticsearch_uid')}}
    - groups:
      - elasticsearch

elasticsearch_achive:
  file.managed:
    - name: /usr/src/elasticsearch-6.6.2.tar.gz
    - source: salt://elasticsearch/elasticsearch-6.6.2.tar.gz
  cmd.run:
    - names:
      - mkdir -p /var/elasticsearch/data /var/elasticsearch/logs
      - chown -R elasticsearch:elasticsearch /var/elasticsearch
      - mkdir -p /usr/local/elasticsearch
      - tar -zxf elasticsearch-6.6.2.tar.gz -C /usr/local/elasticsearch --strip-components=1
      - chown -R elasticsearch:elasticsearch /usr/local/elasticsearch
      - echo -e '\nelasticsearch soft nofile 300000\nelasticsearch hard nofile 300000\nelasticsearch soft nproc 102400\nelasticsearch hard nproc 102400' >>/etc/security/limits.conf
      - echo -e '\nvm.max_map_count=262144\n' >> /etc/sysctl.conf
      - sysctl -p
    - cwd: /usr/src


/usr/local/elasticsearch/config/elasticsearch.yml:
  file.managed:
    - source: salt://elasticsearch/elasticsearch.yaml
    - template: jinja
    - makedirs: true