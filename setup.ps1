# Windows PowerShell setup: run from the jailbreak-lab folder with  . .\setup.ps1   (note the leading dot + space so the venv stays active)
# If scripts are blocked first run:  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
az login
Write-Host ""
Write-Host "Now set your two variables, then run: python build_agent.py"
Write-Host '  $env:PROJECT_ENDPOINT="https://<resource>.services.ai.azure.com/api/projects/<project>"'
Write-Host '  $env:MODEL_DEPLOYMENT_NAME="gpt-5.4-mini"'
