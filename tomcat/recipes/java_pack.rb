
# Cookbook:: tomcat
# Recipe:: java_pack

%w{  java-1.7.0-openjdk-devel   vim }.each do |packages|
	package packages do
	action :install
		end
		end
