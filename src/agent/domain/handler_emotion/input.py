from typing import Any, Dict, List, Optional
from pydantic import BaseModel, Field


class APIGatewayProxyRequestEvent(BaseModel):
    resource: str = ""
    path: str = ""
    httpMethod: str = ""
    headers: Optional[Dict[str, Any]] = Field(default_factory=dict)
    multiValueHeaders: Optional[Dict[str, List[str]]] = Field(default_factory=dict)
    queryStringParameters: Optional[Dict[str, Any]] = Field(default_factory=dict)
    multiValueQueryStringParameters: Optional[Dict[str, List[str]]] = Field(default_factory=dict)
    pathParameters: Optional[Dict[str, Any]] = Field(default_factory=dict)
    stageVariables: Optional[Dict[str, Any]] = Field(default_factory=dict)
    requestContext: Dict[str, Any] = Field(default_factory=dict)
    body: Optional[str] = Field(
        default="",
    )
    isBase64Encoded: bool = False

    