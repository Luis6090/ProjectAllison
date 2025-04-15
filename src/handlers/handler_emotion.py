import json
from agent.base_agent.base import agent
from agent.domain.handler_emotion.input import APIGatewayProxyRequestEvent
from agent.domain.handler_emotion.output import APIGatewayProxyResponseEvent

def get_emotion_chain(event, context):
    """
    Function to get the emotion chain.
    """
    # Initialize the agent with the event and context
    print(event)
    event = APIGatewayProxyRequestEvent(**event)
    message = json.loads(event.body)
    response = agent.run(message)
    return response.model_dump()
