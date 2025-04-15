from typing import List, Type

from langchain.output_parsers import PydanticOutputParser
from pydantic import BaseModel, ConfigDict, Field

from agent.domain.agent.input import Input
from agent.domain.agent.output import Output
from configs.settings import settings


class EntityChain(BaseModel):
    """
    EntityChain is a class that represents a chain of entities.
    It contains a list of entities and their corresponding values.
    """

    input_variables: List[str] = Field(
        default=[Input.model_json_schema()],
        description="Input variables for the prompt template.",
    )

    template: str = Field(
        default=settings.prompt_template,
    )

    parse_class: Type[PydanticOutputParser] = Field(
        default=PydanticOutputParser(
            pydantic_object=Output
        ),
        description="Class to parse the output.",
    )

    model_config = ConfigDict(arbitrary_types_allowed=True)
