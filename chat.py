# chat.py
# Sends one message to the agent and prints the answer, plus every email it tries to send.
import sys
from lab_common import ask, agent_id

print(ask(agent_id(), " ".join(sys.argv[1:])))
