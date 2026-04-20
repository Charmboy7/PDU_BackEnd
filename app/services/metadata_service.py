import json
from app.db.database import get_db_pool

async def get_all_metadata():
    pool = await get_db_pool()
    
    async with pool.acquire() as conn:
        # Fetch options
        options_query = """
            SELECT field_name, value, label, metadata 
            FROM options 
            WHERE is_active = TRUE
        """
        options_rows = await conn.fetch(options_query)
        
        # Fetch rules
        rules_query = """
            SELECT rule_type, condition, action, message 
            FROM rules 
            WHERE is_active = TRUE 
            ORDER BY priority DESC
        """
        rules_rows = await conn.fetch(rules_query)
        
        # Structure options
        structured_options = {}
        for row in options_rows:
            field_name = row['field_name']
            if field_name not in structured_options:
                structured_options[field_name] = []
            
            option_data = {
                "value": row['value'],
                "label": row['label']
            }
            
            # Conditionally include metadata
            meta = row['metadata']
            if meta:
                # Ensure it's treated as a dict if it's a string, though asyncpg usually handles jsonb
                if isinstance(meta, str):
                    try:
                        meta = json.loads(meta)
                    except:
                        pass
                
                if meta: # check again if it's not empty dict
                    option_data["metadata"] = meta
                    
            structured_options[field_name].append(option_data)
            
        # Structure rules
        structured_rules = []
        for row in rules_rows:
            rule_data = {
                "rule_type": row['rule_type'],
                "condition": row['condition'],
                "action": row['action'],
                "message": row['message']
            }
            
            # asyncpg converts jsonb to dict/list automatically
            if isinstance(rule_data['condition'], str):
                rule_data['condition'] = json.loads(rule_data['condition'])
            if isinstance(rule_data['action'], str):
                rule_data['action'] = json.loads(rule_data['action'])
                
            structured_rules.append(rule_data)
            
        return {
            "options": structured_options,
            "rules": structured_rules
        }
