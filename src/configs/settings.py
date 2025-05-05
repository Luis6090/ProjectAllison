from pydantic_settings import BaseSettings
from pydantic import Field 


class Settings(BaseSettings):
    openai_api_key: str = Field(
        default="",
    )
    
    openai_model: str = Field(
        default="gpt-4o-mini",
    )
    
    api_base_url: str = Field(
        default="https://openrouter.ai/api/v1"
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
    
    class Config:
        env_file = ".env"  # <- diz pra procurar o arquivo .env
        # print(f"\nENV: {env_file}\n")
    
    




settings = Settings()