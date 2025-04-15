from langchain.output_parsers import PydanticOutputParser
from langchain_core.prompts import PromptTemplate

from agent.domain.agent.output import Output
from agent.domain.entity.chain import EntityChain
from agent.infra.openai.gateway import GatewayOpenAi


class BaseAgentDetectEmotion(EntityChain):
    def llm(self):
        """
        Initialize the LLM (Language Model) with the API key and model name.
        """
        llm_instance = GatewayOpenAi()
        return llm_instance.get_llm_client()

    def prompt(self):
        """
        Initialize the prompt template with the specified template.
        """

        parser = self.parser()
        instructions = parser.get_format_instructions()

        prompt = PromptTemplate(
            template=self.template,
            input_variables=self.input_variables,
            partial_variables={
                "format_instructions": instructions,
            },
        )

        return prompt

    def parser(self):
        """
        Initialize the parser class.
        """
        parser = PydanticOutputParser(pydantic_object=Output)

        return parser

    def chain(self):
        """
        Initialize the chain with the LLM and prompt.
        """
        prompt = self.prompt()
        llm = self.llm()
        parser = self.parser()

        chain = prompt | llm | parser
        return chain

    def run(self, input):
        """
        Run the chain with the given input.
        """
        chain = self.chain()
        return chain.invoke(input)


agent = BaseAgentDetectEmotion()
