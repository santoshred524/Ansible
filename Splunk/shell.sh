#!/bin/sh
export SPLUNKHOME=/opt/splunkforwarder
NEWPASS=$1
OLDPASS=$2
DEPLOYSERV=$3
$SPLUNKHOME/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt -auth admin:$OLDPASS
$SPLUNKHOME/bin/splunk splunk edit user admin -password $NEWPASS -auth admin:$OLDPASS
$SPLUNKHOME/bin/splunk set deploy-poll $DEPLOYSERV:8089
$SPLUNKHOME/bin/splunk enable boot-start
sleep 2
$SPLUNKHOME/bin/splunk stop
