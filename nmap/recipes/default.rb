#
# Cookbook:: nmap
# Recipe:: default
#
# opyright:: 2018, The Authors, All Rights Reserved.

#node.override['nmap']['hostname']='roman'

#package 'nano' do
#	action :install
#end
#package 'vim' do
#	action :install
#end

node.normal['main']['package']  = "vim"

node.override['main']['package'] = "git"

node.default['main']['package'] = "curl"


apt_package node['main']['package'] do

 action :install

end
