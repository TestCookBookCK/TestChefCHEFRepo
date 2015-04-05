#
# Cookbook Name:: brokerportal_ddins_external
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "#{node["brokerportal_ddins_external"]["properties"]["path"]}#{node["brokerportal_ddins_external"]["properties"]["filename"]}" do
      source "#{node["brokerportal_ddins_external"]["properties"]["templatename"]}"
      owner "oracle"
      group "dba"
      mode "0644"
      variables({
         :agent_rso_registration => node["brokerportal_ddins_external"]["agent_rso_registration"],
         :rso_wsdl_location => node["brokerportal_ddins_external"]["rso_wsdl_location"],
         :download_w9_form => node["brokerportal_ddins_external"]["download_w9_form"]
      })
      notifies :run, "ruby_block[update_prop_version]"
end

ruby_block "update_prop_version" do
  block do
    current_ver = {
    #  "id" => ,
    #  "id" => Chef::Node["name"],
      "id" => node.name,
      "checksum" => node["brokerportal_ddins_external"]["checksum"]
    }
    databag_item = Chef::DataBagItem.new
    databag_item.data_bag("brokerportal_#{node.chef_environment}")
    databag_item.raw_data = current_ver
    databag_item.save
  end
  action :nothing
end
