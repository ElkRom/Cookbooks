#
# Cookbook:: tomcat
# Recipe:: default
# Depends on tomcat::java_pack 

group 'tomcat' 

user 'tomcat' do
	manage_home false
	shell '/bin/nologin'
	group 'tomcat'
	home '/opt/tomcat'
end

directory '/opt/tomcat' do
        action :create
        group 'tomcat'
end

cookbook_file '/opt/apache-tomcat-8.5.29.tar.gz' do
        source 'apache-tomcat-8.5.29.tar.gz'
        mode '0644'
end

execute 'tar xvf /opt/apache-tomcat-8.5.29.tar.gz -C /opt/tomcat --strip-components=1'
execute 'chgrp -R tomcat /opt/tomcat'

directory 'opt/tomcat/conf' do
	mode '0755'
end
execute 'chmod g+r /opt/tomcat/conf/*'

execute 'chown -R tomcat /opt/tomcat/webapps/  /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/'

cookbook_file '/etc/systemd/system/tomcat.service' do
	source 'tomcat.service.erb'
end 

execute  'systemctl daemon-reload'

#execute 'firewall-cmd --zone=public --add-port=8080/tcp --permanent'
#execute 'firewall-cmd --reload'
#execute 'systemctl restart firewalld.service'

service 'tomcat' do
        action [:start, :enable]
end

