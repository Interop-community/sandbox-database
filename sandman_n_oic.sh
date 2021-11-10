#!/bin/bash

mysql -e "set @BILIRUBIN_HOST='$BILIRUBIN_RISK_CHART_HOST';set @CONTENT_HOST='$CONTENT_HOST';/\. sandman.sql" -u root -p$MYSQL_ROOT_PASSWORD

mysql -e "set @BILIRUBIN_HOST='$BILIRUBIN_RISK_CHART_HOST';set @PATIENT_DATA_MANAGER_HOST='$PATIENT_DATA_MANAGER_HOST';/\. oic.sql" -u root -p$MYSQL_ROOT_PASSWORD

cat /schema-scripts/*.sql | mysql -u root -p$MYSQL_ROOT_PASSWORD

