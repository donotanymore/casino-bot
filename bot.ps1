# Start the VS Code tunnel in the background
Start-Process "c:\Users\Admin\AppData\Local\Programs\Microsoft VS Code\bin\code-tunnel.exe" `
    -ArgumentList 'tunnel --name pigletaccess' -NoNewWindow
Start-Sleep -Seconds 5
# Activate the virtual environment
venv\Scripts\Activate.ps1
# Install the required packages
pip install -r requirements.txt
# Run the bot script
python discord/bot.py