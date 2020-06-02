param(
    [Parameter(Mandatory=$true)]
    [string]$KeyVaultUrl,
    [Parameter(Mandatory=$true)]
    [string]$SecretName
)

$response = Invoke-WebRequest `
    -Uri "http://169.254.169.254/metadata/identity/oauth2/token" `
    -Method Get `
    -Headers @{Metadata="true"} `
    -Body @{"api-version"="2018-02-01";"resource"="https://vault.azure.net"}

$content = $response.Content | ConvertFrom-Json
$access_token = $content.access_token

(Invoke-WebRequest `
    -Uri "$KeyVaultUrl/secrets/$SecretName" `
    -Method Get `
    -ContentType "application/json" `
    -Headers @{Authorization="Bearer $access_token"} `
    -Body @{"api-version"="2016-10-01"}).Content