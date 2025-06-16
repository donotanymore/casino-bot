# Start a VS Code tunnel with specified options
$codeTunnelPath = "c:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\bin\code-tunnel.exe"
$tunnelName = "pigletaccess"
$parentProcessId = $PID

Start-Process -FilePath $codeTunnelPath `
    -ArgumentList @(
        "tunnel",
        "--name", $tunnelName,
        "--parent-process-id", $parentProcessId,
        "--no-sleep"
    ) `
    -NoNewWindow
# Wait for the tunnel to be established
Start-Sleep -Seconds 5
# Create python venv
$venvPath = "C:\Users\Admin\Documents\GitHub\casino-bot\venv"
if (-not (Test-Path $venvPath)) {
    python -m venv $venvPath
}
# Activate the virtual environment
$activateScript = Join-Path $venvPath "Scripts\Activate.ps1"
if (Test-Path $activateScript) {
    . $activateScript
} else {
    Write-Error "Activation script not found: $activateScript"
}
# Install required packages
$requirementsFile = "C:\Users\Admin\Documents\GitHub\casino-bot\requirements.txt"
if (Test-Path $requirementsFile) {
    pip install -r $requirementsFile
} else {
    Write-Error "Requirements file not found: $requirementsFile"
}
# Run the bot script
$botScript = "C:\Users\Admin\Documents\GitHub\casino-bot\discord\bot.py"
if (Test-Path $botScript) {
    python $botScript
} else {
    Write-Error "Bot script not found: $botScript"
}