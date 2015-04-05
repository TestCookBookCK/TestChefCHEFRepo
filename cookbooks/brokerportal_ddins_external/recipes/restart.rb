#
# Cookbook Name:: brokerportal_ddins_external
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "#{Chef::Config[:file_cache_path]}/chef_brokerPortal_domain_shutdownManageServers.sh" do
	source 'chef_brokerPortal_domain_shutdownManageServers.sh'
	mode '0755'
end

cookbook_file "#{Chef::Config[:file_cache_path]}/chef_brokerPortal_domain_startManageServers.sh" do
	source 'chef_brokerPortal_domain_startManageServers.sh'
	mode '0755'
end

execute "sh #{Chef::Config[:file_cache_path]}/chef_brokerPortal_domain_shutdownManageServers.sh" do
  action :run
end

execute "sh #{Chef::Config[:file_cache_path]}/chef_brokerPortal_domain_startManageServers.sh" do
  only_if do
      node["brokerportal_ddins_external"]["RUNNING"]
   end
end

ruby_block "update_run_status" do
  block do
    node.default["brokerportal_ddins_external"]["RUNNING"] = true 
  end
end
