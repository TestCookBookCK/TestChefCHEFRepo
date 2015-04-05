#
# Cookbook Name:: brokerportal_ddins_external
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "#{Chef::Config[:file_cache_path]}/#{node["brokerportal_ddins_external"]["earfile"]["undeploy-script-name"]}" do
	source node["brokerportal_ddins_external"]["earfile"]["undeploy-script-name"]
	mode '0755'
	notifies :run, "execute[#{node["brokerportal_ddins_external"]["earfile"]["undeploy-script-name"]}]"
end

if node["brokerportal_ddins_external"]["version_deployed"] != node["brokerportal_ddins_external"]["version"] 
	node.default["brokerportal_ddins_external"]["readyToDeploy"] = true
end

execute node["brokerportal_ddins_external"]["earfile"]["undeploy-script-name"] do
	cwd Chef::Config[:file_cache_path]
	command "sh #{node["brokerportal_ddins_external"]["earfile"]["undeploy-script-name"]}"
	only_if do
		node["brokerportal_ddins_external"]["readyToDeploy"] 
	end
	action :nothing
end
