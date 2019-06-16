rabbitmq_install:
    cmd.run:
    - names:
      - curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | sudo bash
      - curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
      - yum install -y erlang rabbitmq-server
    - unless: test -f /usr/sbin/rabbitmq-server

rabbitmq_start:
    cmd.run:
    -names:
      - firewall-cmd --zone=public --add-port=5672/tcp --permanent
      - firewall-cmd --zone=public --add-port=15672/tcp --permanent
      - firewall-cmd --reload
      - systemctl start rabbitmq-server
      - systemctl enable rabbitmq-server
