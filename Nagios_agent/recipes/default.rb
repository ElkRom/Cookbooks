#
# Cookbook:: ngnx
# Recipe:: default

package "wget" do
 action :install
end


cookbook_file '/opt/linux-nrpe-agent.tar.gz' do
        source 'linux-nrpe-agent.tar.gz'
        mode '0644'
end

directory '/opt/linux-nrpe-agent' do
        action :create
        
end
execute 'tar xvf /opt/linux-nrpe-agent.tar.gz -C /opt/linux-nrpe-agent --strip-components=1'
#execute 'cd linux-nrpe-agent'

execute "My execute" do
	user 'root'
	command './fullinstall -y'
end
 

#ipvar = '192.168.103.0'
