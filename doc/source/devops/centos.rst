centos
=========

    * 允许root远程ssh::

        sed -i 's/^#*PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
        systemctl restart sshd
