from typing import Any, Dict, List, Optional
from pydantic import BaseModel, Field


class APIGatewayProxyResponseEvent(BaseModel):
    """
    {
        "isBase64Encoded": true|false,
        "statusCode": httpStatusCode,
        "headers": { "headerName": "headerValue", ... },
        "multiValueHeaders": { "headerName": ["headerValue", "headerValue2", ...], ... },
        "body": "..."
    }
    """
    isBase64Encoded: bool = False
    statusCode: int = Field(default=200)
    headers: Dict[str, Any] = Field(default_factory=dict)
    multiValueHeaders: Dict[str, List[str]] = Field(default_factory=dict)
    body: str = ""