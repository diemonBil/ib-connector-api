from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    ib_user: str
    ib_password: str
    ib_port: int = 4002
    ib_mode: str = "paper"

    class Config:
        env_file = ".env"

settings = Settings()