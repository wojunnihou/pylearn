/etc/kibana/kibana.yml:
  file.managed:
    - source: salt://kibana/kibana.yml

reload-service:
   service.running:
     - name: kibana
     - enable: True
     - watch:
       - file: /etc/kibana/kibana.yml