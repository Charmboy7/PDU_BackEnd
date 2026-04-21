-- Repeatable migration for Transformer Configuration Rules

DELETE FROM rules WHERE screen_name = 'transformer_configuration';

INSERT INTO rules (screen_name, field_name, depends_on, rules)
VALUES 
(
  'transformer_configuration',
  'input_voltage',
  'phase',
  '{
    "conditions": [
      { "if": "1PH", "values": ["120V", "208V"] },
      { "if": "3PH", "values": ["208V"] }
    ]
  }'::jsonb
),
(
  'transformer_configuration',
  'input_current',
  'phase',
  '{
    "conditions": [
      { "if": "1PH", "values": ["20A", "30A"] },
      { "if": "3PH", "values": ["20A", "30A", "50A", "60A"] }
    ]
  }'::jsonb
),
-- Outlet Type → Feature Rules
(
  'subfeed_breaker_configuration',
  'outlet_feature',
  'outlet_type',
  '{
    "conditions": [
      {
        "if": "C13",
        "values": ["STANDARD", "LOCKABLE", "INDIVIDUAL_FUSED"]
      },
      {
        "if": "C19",
        "values": ["STANDARD", "LOCKABLE", "INDIVIDUAL_FUSED"]
      },
      {
        "if": "NEMA_5_20R",
        "values": ["STANDARD"]
      }
    ]
  }'::jsonb
),
-- Outlet Type → Quantity Limits
(
  'subfeed_breaker_configuration',
  'quantity',
  'outlet_type',
  '{
    "conditions": [
      {
        "if": "C13",
        "max": 24
      },
      {
        "if": "C19",
        "max": 16
      },
      {
        "if": "NEMA_5_20R",
        "max": 12
      }
    ]
  }'::jsonb
);
