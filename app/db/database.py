import os
import asyncpg
from dotenv import load_dotenv

load_dotenv()

async def get_db_pool():
    # DB connection readiness with asyncpg
    # No ORM models used
    return await asyncpg.create_pool(dsn=os.getenv("DB_URL"))
