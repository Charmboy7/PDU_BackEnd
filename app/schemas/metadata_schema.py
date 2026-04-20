from pydantic import BaseModel
from typing import List, Dict, Any, Optional

class OptionSchema(BaseModel):
    value: str
    label: str
    metadata: Optional[Dict[str, Any]] = None

class RuleSchema(BaseModel):
    rule_type: str
    condition: Dict[str, Any]
    action: Dict[str, Any]
    message: str

class MetadataResponse(BaseModel):
    options: Dict[str, List[OptionSchema]]
    rules: List[RuleSchema]
