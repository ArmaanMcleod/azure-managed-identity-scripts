#!/bin/bash

if [ "$#" -ne 3 ]
then
    echo "Usage: getKeyVaultSecret.sh myClientId https://myKeyVault.vault.azure.net mySecret"
    exit 1
fi

access_token=$(curl -s -H Metadata:true "http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://vault.azure.net&client_id=$1" | jq -j .access_token)

curl -s "$2/secrets/$3?api-version=2016-10-01" -H "Authorization: Bearer $access_token"