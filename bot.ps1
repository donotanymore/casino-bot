# Start VS Code tunnel for remote access, no sleep mode
$ErrorActionPreference = "Stop"
Start-Process -NoNewWindow -FilePath "c:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\bin\code-tunnel.exe" `
    -ArgumentList "tunnel --accept-server-license-terms --log info --name pigletaccess --parent-process-id $PID --no-sleep"
# Wait for the tunnel to start
Start-Sleep -Seconds 5
write-Host "VS Code tunnel started successfully"
# PowerShell script to activate Python virtual environment and install requirements
$venvPath = "C:\Users\Admin\Documents\GitHub\casino-bot\venv\Scripts"
$requirements = "C:\Users\Admin\Documents\GitHub\casino-bot\requirements.txt"

# Activate virtual environment
. "$venvPath\Activate.ps1"

# Install Python requirements
& "$venvPath\python.exe" -m pip install -r $requirements

# Run the bot
& "$venvPath\python.exe" "C:\Users\Admin\Documents\GitHub\casino-bot\discord\bot.py"