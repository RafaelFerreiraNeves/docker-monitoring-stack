#!/bin/bash

set -e

if [ -f /backup/zabbix.dump ]; then
  echo "Restoring Zabbix database..."

  pg_restore \
    -U zabbix \
    -d zabbix \
    --clean \
    --if-exists \
    /backup/zabbix.dump

  echo "Restore completed."
fi