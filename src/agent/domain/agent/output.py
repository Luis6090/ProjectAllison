from pydantic import BaseModel, Field
from typing import Optional, List, Dict, Any

class Output(BaseModel):
    """Output class for the agent.

    Args:
        BaseModel (pydantic.BaseModel): Base model for Pydantic.
    """

    emotions: List[str] = Field(
        default="",
        description="List of emotions detected in the text.",
    )
    