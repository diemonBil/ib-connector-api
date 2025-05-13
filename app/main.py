from fastapi import FastAPI
from app.ib_client import get_account_summary

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}

@app.get("/account")
async def account_summary():
    return await get_account_summary()
