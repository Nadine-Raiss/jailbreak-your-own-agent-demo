# build_agent.py
# Uploads the poisoned policy, builds a knowledge store and creates the hr-assistant agent.
import os
from azure.ai.agents.models import FilePurpose, FileSearchTool
from lab_common import client, toolset, INSTRUCTIONS

f = client.files.upload_and_poll(file_path="travel-policy.md", purpose=FilePurpose.AGENTS)
vs = client.vector_stores.create_and_poll(file_ids=[f.id], name="hr-policies")
toolset.add(FileSearchTool(vector_store_ids=[vs.id]))
agent = client.create_agent(model=os.environ["MODEL_DEPLOYMENT_NAME"], name="hr-assistant",
                            instructions=INSTRUCTIONS, toolset=toolset)
open(".agent_id", "w").write(agent.id)
print("AGENT_ID =", agent.id, "(saved to .agent_id, the other scripts pick it up)")
