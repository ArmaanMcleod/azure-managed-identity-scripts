# Azure Managed Identity Scripts

Some scripts I have written which are helpful when interacting with Managed Identities in Azure. 

The documentation at [MSDN](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview) is a good starting point for managed identities, which is the best way to interact securly with Azure resources. 

## Key vault

Authenticating with Azure Key vault from a Linux or Windows VM. Follow the tutorials below to setup your key vault and VM before using scripts. 

* **Windows VM**: Follow this [tutorial](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-windows-vm-access-nonaad) to get setup.
* **Linux VM**: Follow this [tutorial](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/tutorial-linux-vm-access-nonaad) to get setup. 

### System-Assigned

Have a look at [MSDN](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview#how-a-system-assigned-managed-identity-works-with-an-azure-vm) for more information on how **system-assigned** managed identities work. 

Two scripts inside `/key-vault/system-assigned` directory:

* `getKeyVaultSecret.ps1` - Gets secret from keyvault from windows VM(or Linux VM if you have powershell installed on Linux). Need to pass in Key vault URL and secret name: `getKeyVaultSecret.ps1 -KeyVaultUrl https://myvault.vault.azure.net -SecretName mySecret`. 
* `getKeyVaultSecret.sh` - Gets secret from keyvault from windows VM(or Linux VM if you have powershell installed on Linux). Need to pass in Key vault URL and secret name: `getKeyVaultSecret.sh https://myvault.vault.azure.net mySecret`. 

### User-Assigned

Have a look at [MSDN](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview#how-a-user-assigned-managed-identity-works-with-an-azure-vm) for more information on how **user-assigned** managed identities work. 

Two scripts inside `/key-vault/user-assigned` directory:

* `getKeyVaultSecret.ps1` - Gets secret from keyvault from windows VM(or Linux VM if you have powershell installed on Linux). Need to pass in client id, Key vault URL and secret name: `getKeyVaultSecret.ps1 -CLientId myClientId -KeyVaultUrl https://myvault.vault.azure.net -SecretName mySecret`. 

* `getKeyVaultSecret.sh` - Gets secret from keyvault from windows VM(or Linux VM if you have powershell installed on Linux). Need to pass in client id, Key vault URL and secret name: `getKeyVaultSecret.sh myClientId https://myvault.vault.azure.net mySecret`. 