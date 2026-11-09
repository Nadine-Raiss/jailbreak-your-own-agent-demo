#!/usr/bin/env bash
# macOS / Linux setup: run from the jailbreak-lab folder with  source setup.sh
python3 -m venv .venv
source .venv/bin/activate
.venv/bin/python -m pip install -r requirements.txt
az login
echo ""
echo "Now set your two variables, then run: python build_agent.py"
echo '  export PROJECT_ENDPOINT="https://<resource>.services.ai.azure.com/api/projects/<project>"'
echo '  export MODEL_DEPLOYMENT_NAME="gpt-5.4-mini"'
