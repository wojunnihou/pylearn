# 修改配置/etc/gitlab/gitlab.rb

    external_url 'http://192.168.5.200'
    
# 重新加载配置

    gitlab-ctl reconfigure 
# 停止服务
    gitlab-ctl stop  
# 启动服务
    gitlab-ctl start
    