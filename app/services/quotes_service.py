import asyncpg
import logging
from uuid import UUID
from app.db.database import get_db_pool

logger = logging.getLogger(__name__)

import json

async def create_quote(quote_data: dict) -> UUID:
    """Inserts a new quote and its step 1 configuration securely utilizing a database transaction."""
    pool = await get_db_pool()
    
    quote_query = """
        INSERT INTO quotes (
            customer_name, email, country, postal_code, product_region, quantity
        ) VALUES (
            $1, $2, $3, $4, $5, $6
        ) RETURNING id;
    """
    
    config_query = """
        INSERT INTO configurations (
            quote_id, step, config_data, validation_status
        ) VALUES (
            $1, $2, $3, $4
        );
    """
    
    # Restructure Python dict exactly to the Frontend's Redux state format
    config_json = json.dumps({
        "GeneralQuoteInfo": {
            "name": quote_data.get("customer_name", ""),
            "email": quote_data.get("email", ""),
            "country": quote_data.get("country", ""),
            "postalCode": quote_data.get("postal_code", ""),
            "productRegion": quote_data.get("product_region", ""),
            "quantity": str(quote_data.get("quantity", ""))
        }
    })

    async with pool.acquire() as conn:
        # Use an atomic transaction block (Commit on success, Rollback on exception)
        async with conn.transaction():
            quote_id = await conn.fetchval(
                quote_query, 
                quote_data["customer_name"],
                quote_data["email"],
                quote_data["country"],
                quote_data["postal_code"],
                quote_data["product_region"],
                quote_data["quantity"]
            )
            
            await conn.execute(
                config_query,
                quote_id,      # Linked key generated from the line above
                1,             # step = 1
                config_json,   # stringified JSON blob
                "PENDING"      # validation_status
            )
            
            return quote_id

async def update_quote(quote_id: UUID, quote_data: dict) -> UUID:
    """Updates an existing quote in the database."""
    pool = await get_db_pool()
    query = """
        UPDATE quotes 
        SET 
            customer_name = $1, 
            email = $2, 
            country = $3, 
            postal_code = $4, 
            product_region = $5, 
            quantity = $6,
            updated_at = NOW()
        WHERE id = $7
        RETURNING id;
    """
    async with pool.acquire() as conn:
        updated_id = await conn.fetchval(
            query,
            quote_data["customer_name"],
            quote_data["email"],
            quote_data["country"],
            quote_data["postal_code"],
            quote_data["product_region"],
            quote_data["quantity"],
            quote_id
        )
        return updated_id
