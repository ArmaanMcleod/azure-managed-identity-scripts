#!/bin/bash

if [ "$#" -ne 2 ]
then
    echo "Usage: getKeyVaultSecret.sh https://myKeyVault.vault.azure.net mySecret"
    exit 1
fi

access_token=$(curl -s -H Metadata:true "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://vault.azure.net" | jq -j .access_token)

curl -s "$1/secrets/$2?api-version=2016-10-01" -H "Authorization: Bearer $access_token"