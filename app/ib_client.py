from app.config import settings

async def get_account_summary():
    return {
        "account_id": settings.ib_user,
        "net_liquidation": 100000,
        "currency": "USD"
    }