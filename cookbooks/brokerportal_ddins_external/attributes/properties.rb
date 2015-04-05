default["brokerportal_ddins_external"]["rso_wsdl_location"] =  "http://rc-lx???:port//rso_wsdl_location"
default["brokerportal_ddins_external"]["agent_rso_registration"] = "http://dit2.dentegra.com/RSO/shared/agentregistration.jsp"
default["brokerportal_ddins_external"]["download_w9_form"] =  "http://www.irs.gov/pub/irs-pdf/fw9.pdf"
default["brokerportal_ddins_external"]["checksum"] =  "42dcb942d41169ad88c0525ba3145cec561271d0114510688cbbb02c92282396"

default["brokerportal_ddins_external"]["domainName"]= "brokerportal_domain"
default["brokerportal_ddins_external"]["earfilename"]="BrokerPortal-5.0.0.ear"
default["brokerportal_ddins_external"]["earfile"]["name"]="BrokerProspectApp-app-5.0.0.ear"
default["brokerportal_ddins_external"]["earfile"]["sourcelink"]="http://rc-lx528.ut.dentegra.lab:8081/artifactory/soft-arch/chef-training/BrokerProspectApp-app/5.0.0/"
default["brokerportal_ddins_external"]["earfile"]["deploy-script-name"]="deploy_bp.bash"
default["brokerportal_ddins_external"]["earfile"]["undeploy-script-name"]="chef_undeploy_brokerPortal_domain.bash"

default["brokerportal_ddins_external"]["properties"]["path"] = "/opt/oracle/domains/brokerPortal_domain/a3prop/"
default["brokerportal_ddins_external"]["properties"]["filename"] = "brokerportal.properties"
default["brokerportal_ddins_external"]["properties"]["templatename"] = "brokerportal_properties.erb"
default["brokerportal_ddins_external"]["adminurl"]="t3://rc-lx366.ut.dentegra.lab:29000"

default["brokerportal_ddins_external"]["wlfullclient"]["jarfilename"] = "wlfullclient-11i.jar",
default["brokerportal_ddins_external"]["wlfullclient"]["sourcelink"] = "http://rc-lx528.ut.dentegra.lab:8081/artifactory/soft-arch/chef-training/wlfullclient/11i/"
default["brokerportal_ddins_external"]["wlfullclient"]["checksum"] = "7959397f0bbe8000857e2899f4463c96548eb1d9bc30fe72da3acd7876763c1b"


default["brokerportal_ddins_external"]["readyToDeploy"] = false 
default["brokerportal_ddins_external"]["cache"]["path"] = Chef::Config[:file_cache_path]


