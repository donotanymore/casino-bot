# Start the VS Code tunnel in the background
Start-Process "c:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\bin\code-tunnel.exe" `
    -ArgumentList 'tunnel --accept-server-license-terms --log info --name pigletaccess --parent-process-id $PID --no-sleep' -NoNewWindow
# Wait for the tunnel to start
# Ensure the tunnel is running before proceeding
do {
    Start-Sleep -Seconds 1
    $tunnelRunning = Get-Process -Name "code-tunnel" -ErrorAction SilentlyContinue
} until ($tunnelRunning)
write-host "VS Code tunnel is running"
# Activate the virtual environment
Documents\GitHub\casino-bot\venv\Scripts\Activate.ps1
# Install the required packages
pip install -r Documents\GitHub\casino-bot\requirements.txt
# Run the bot script
python Documents\GitHub\casino-bot\discord\bot.py