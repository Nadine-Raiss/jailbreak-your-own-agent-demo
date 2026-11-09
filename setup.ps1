# Windows PowerShell setup: run from the jailbreak-lab folder with  . .\setup.ps1   (note the leading dot + space so the venv stays active)
# If scripts are blocked first run:  Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
python -m venv .venv
.\.venv\Scripts\Activate.ps1
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
az login
Write-Host ""
.\.venv\Scripts\python.exe -c "import azure.ai.evaluation, azure.ai.agents; print('Lab packages OK')"
Write-Host "If your prompt does not start with (.venv), run scripts with .\.venv\Scripts\python.exe instead of python"
Write-Host "Now set your two variables, then run: python build_agent.py"
Write-Host '  $env:PROJECT_ENDPOINT="https://<resource>.services.ai.azure.com/api/projects/<project>"'
Write-Host '  $env:MODEL_DEPLOYMENT_NAME="gpt-5.4-mini"'
