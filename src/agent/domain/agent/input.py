from pydantic import BaseModel, Field
from typing import Optional, List, Dict, Any

class Input(BaseModel):
    """
    Input class for the agent.
    """

    message: str = Field(
        default="",
        description="The input string to be processed.",
    )
