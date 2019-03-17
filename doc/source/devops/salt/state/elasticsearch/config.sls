/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source: salt://elasticsearch/elasticsearch.yaml
    - template: jinja
    - makedirs: true

reload-service:
   service.running:
     - name: elasticsearch
     - enable: True
     - watch:
       - file: /etc/elasticsearch/elasticsearch.yml