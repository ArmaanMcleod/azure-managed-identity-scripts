# Azure Managed Identity Scripts

Some scripts I have written which are helpful when interacting with Managed Identities in Azure. This is a work in progress, and I'm using it for future reference. 

The documentation at [MSDN](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview) is a good starting point for managed identities, which is the best way to interact securly with Azure resources. 

## Key vault

Authenticating with Azure Key vault from a Linux or Windows VM. Follow the tutorials below to setup your key vault and VM before using scripts. 

* **Windows VM**: Follow this [tutorial](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-nonaad) to get setup.
* **Linux VM**: Follow this [tutorial](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-linux-vm-access-nonaad) to get setup. 

### System-Assigned

Have a look at [MSDN](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview#how-a-system-assigned-managed-identity-works-with-an-azure-vm) for more information on how **system-assigned** managed identities work. 

Two scripts(PowerShell and Bash) inside `/key-vault/system-assigned` directory:

* `getKeyVaultSecret.ps1` - Gets secret from key vault from **Windows VM**(or Linux VM if you have powershell installed on Linux). Need to pass in **key vault URL** and **secret name**: `getKeyVaultSecret.ps1 -KeyVaultUrl https://myvault.vault.azure.net -SecretName mySecret`. 
* `getKeyVaultSecret.sh` - Gets secret from key vault from **Linux VM**(or Linux VM if you have powershell installed on Linux). Need to pass in **key vault URL** and **secret name**: `getKeyVaultSecret.sh https://myvault.vault.azure.net mySecret`. 

### User-Assigned

Have a look at [MSDN](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview#how-a-user-assigned-managed-identity-works-with-an-azure-vm) for more information on how **user-assigned** managed identities work. 

Two scripts(PowerShell and Bash) inside `/key-vault/user-assigned` directory:

* `getKeyVaultSecret.ps1` - Gets secret from key vault from **Windows VM**(or Linux VM if you have powershell installed on Linux). Need to pass in **client id**, **key vault URL** and **secret name**: `getKeyVaultSecret.ps1 -CLientId myClientId -KeyVaultUrl https://myvault.vault.azure.net -SecretName mySecret`. 

* `getKeyVaultSecret.sh` - Gets secret from key vault from **Linux VM**(or Linux VM if you have powershell installed on Linux). Need to pass in **client id**, **key vault URL** and **secret name**: `getKeyVaultSecret.sh myClientId https://myvault.vault.azure.net mySecret`. 