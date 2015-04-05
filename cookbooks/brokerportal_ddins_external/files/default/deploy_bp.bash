##### Each Deployment Script Should Copy this Section #######
# 1. update domain name
# 2. check all ear files  
# 3. Log file would be created in /opt/oracle/chef-deploy/<domain_name>/logs/<scriptName_timestatmp>.log
#####

export JAVA_HOME=/opt/oracle/jrockit
export PATH=$JAVA_HOME/bin:$PATH

DATE=$(date +%m%d%y_%H%M)

#Load property file for domain
. /home/oracle/config/brokerPortal_domain.properties

LOG_FILE=$deployHomeDir/logs/$(basename $0)_$DATE.log

echo " ============================================= " 2>&1 | tee -a $LOG_FILE
echo "SCRIPT NAME : $(basename $0) " 2>&1 | tee -a $LOG_FILE
echo "DOMAIN NAME : $domainName " 2>&1 | tee -a $LOG_FILE
echo "URL	    : $adminURL "  2>&1 | tee -a $LOG_FILE
echo "LOG FILE    : $LOG_FILE "  2>&1 | tee -a $LOG_FILE
echo " ============================================= " 2>&1 | tee -a $LOG_FILE

cd /opt/oracle/chef-deploy/scripts

##### Application Specific Section ########



./deploy.bash $adminServer $adminPort brokerPortal_cluster $deployerUser $deployerPassword BrokerApp $deployHomeDir/Applications/BrokerProspectApp-app-5.0.0.ear
 2>&1 | tee -a $LOG_FILE 2>&1


rm -rf /tmp/wls_upload*

##### Alert Notification Section ########

#check for any Exception-Error in Log File

shopt -s nocaseglob

# send an email 
if [ $alertFlag == "True" ] 
then
	if grep -i "Exception" $LOG_FILE
	then
 	/bin/mail -s "ERROR - Deployment Failed" $emailList < $LOG_FILE
	else
 	/bin/mail -s "SUCCESSFUL - Deployment Completed" $emailList < $LOG_FILE
	fi
fi
