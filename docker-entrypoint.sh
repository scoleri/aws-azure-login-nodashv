#!/bin/bash
set -e

mkdir -p $HOME/.aws
echo "[default]" > $HOME/.aws/config
echo "azure_tenant_id=$azure_tenant_id" >> $HOME/.aws/config
echo "azure_app_id_uri=$azure_app_id_uri" >> $HOME/.aws/config
echo "azure_default_username=$azure_default_username" >> $HOME/.aws/config
echo "azure_default_duration_hours=8" >> $HOME/.aws/config
echo "azure_default_remember_me=true" >> $HOME/.aws/config

aws-azure-login --no-sandbox -m cli
cat $HOME/.aws/credentials
