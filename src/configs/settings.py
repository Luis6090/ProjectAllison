from pydantic_settings import BaseSettings
from pydantic import Field 


class Settings(BaseSettings):
    openai_api_key: str = Field(
        default="",
    )
    openai_model: str = Field(
        default="gpt-4o-mini",
    )
    
    prompt_template: str = Field(
        default="você deve detectar as emoçoes contidas na {message} de"
        " acordo com as {format_instructions} e deve ser em portugues brasileiro",
    )
    
    @classmethod
    def from_yaml(cls, file_path: str):
        """
        Load settings from a YAML file.
        """
        import yaml
        with open(file_path, 'r') as file:
            data = yaml.safe_load(file)
        return cls(**data)


settings = Settings()