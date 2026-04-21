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
);
