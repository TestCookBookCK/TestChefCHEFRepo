#
# Cookbook Name:: brokerportal_ddins_external
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
remote_file node["brokerportal_ddins_external"]["cache"]["path"]+"/"+node["brokerportal_ddins_external"]["earfile"]["name"] do
  source node["brokerportal_ddins_external"]["earfile"]["sourcelink"]+"/"+node["brokerportal_ddins_external"]["earfile"]["name"]
  checksum node["brokerportal_ddins_external"]["checksum"]
  force_unlink true
end
remote_file node["brokerportal_ddins_external"]["cache"]["path"]+"/"+node["brokerportal_ddins_external"]["wlfullclient"]["jarfilename"] do
  source node["brokerportal_ddins_external"]["earfile"]["sourcelink"]+"/"+ode["brokerportal_ddins_external"]["wlfullclient"]["jarfilename"]
  force_unlink true
end


cookbook_file node["brokerportal_ddins_external"]["cache"]["path"]+"/"+node["brokerportal_ddins_external"]["earfile"]["deploy-script-name"] do
  source node["brokerportal_ddins_external"]["earfile"]["deploy-script-name"]
  mode "0777"
  end

 execute 'bash in' do
   command './"#{node["brokerportal_ddins_external"]["earfile"]["deploy-script-name"]}"'
    action :run
 end
 
 
	 
