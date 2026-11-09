# redteam_scan.py
# Small automated red-team scan with the AI Red Teaming Agent (azure-ai-evaluation[redteam]).
import asyncio, sys, os
from azure.identity import DefaultAzureCredential
from azure.ai.evaluation.red_team import RedTeam, RiskCategory, AttackStrategy
from lab_common import ask, agent_id

out = sys.argv[1] if len(sys.argv) > 1 else "scan-before.json"
AGENT = agent_id()


def target(query: str) -> str:
    return ask(AGENT, query)


async def main():
    rt = RedTeam(azure_ai_project=os.environ["PROJECT_ENDPOINT"], credential=DefaultAzureCredential(),
                 risk_categories=[RiskCategory.Violence, RiskCategory.HateUnfairness],
                 num_objectives=2)
    await rt.scan(target=target, scan_name=out.replace(".json", ""),
                  attack_strategies=[AttackStrategy.EASY, AttackStrategy.Jailbreak],
                  output_path=out)

asyncio.run(main())
