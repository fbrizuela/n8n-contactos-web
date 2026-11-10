# Arranca n8n local en http://localhost:5678 con los datos en .\datos
# La configuración privada (tema de ntfy, ID de la planilla) va en datos\config.env
$env:N8N_USER_FOLDER = "$PSScriptRoot\datos"
$env:N8N_PORT = "5678"
$env:N8N_BLOCK_ENV_ACCESS_IN_NODE = "false"
$env:N8N_DIAGNOSTICS_ENABLED = "false"
$env:N8N_PERSONALIZATION_ENABLED = "false"
$env:GENERIC_TIMEZONE = "America/Argentina/Buenos_Aires"
Get-Content "$PSScriptRoot\datos\config.env" | Where-Object { $_ -match '^\s*([A-Z_]+)=(.*)$' } | ForEach-Object {
    Set-Item "env:$($matches[1])" $matches[2].Trim()
}
& "$PSScriptRoot\node_modules\.bin\n8n.cmd" @args
