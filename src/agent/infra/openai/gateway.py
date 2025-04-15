from langchain_openai import ChatOpenAI

from configs.settings import settings


class GatewayOpenAi:
    """
    Gateway for OpenAI API.
    """

    def __init__(self):
        self.settings = settings

    def get_llm_client(self):
        """
        Get the LLM client.
        """
        return self._get_llm_client()

    def _get_llm_client(self):
        """
        Create and return the LLM client.
        """
        # Initialize the LLM client with the settings

        llm = ChatOpenAI(
            api_key=settings.openai_api_key,
            model_name=settings.openai_model,
            temperature=0.5,
        )

        return llm
