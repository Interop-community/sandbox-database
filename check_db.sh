#!/bin/bash

target_schema_count=13

schema_count=$(mysql -u root -p$MYSQL_ROOT_PASSWORD -e "show databases;" | grep -E -c 'hspc_8_MasterDstu2Empty|hspc_8_MasterDstu2Smart|hspc_8_MasterR4Empty|hspc_8_MasterR5Empty|hspc_8_MasterR4Smart|hspc_8_MasterStu3Empty|hspc_8_MasterStu3Smart|hspc_8_hspc8|hspc_8_hspc9|hspc_8_hspc10|hspc_8_hspc11|oic|sandman')
echo $schema_count

if [ $schema_count -ge $target_schema_count ]; then
  echo 'found schemas, skip loading'
else
  /load_db.sh
fi

