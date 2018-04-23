

# Cookbook:: tomcat
# Recipe:: war_deploy
# Depends on tomcat 

cookbook_file '/opt/tomcat/webapps/OMS.war' do
	source 'OMS.war'
	mode '0644'
end

service 'tomcat' do
   action :restart
end
