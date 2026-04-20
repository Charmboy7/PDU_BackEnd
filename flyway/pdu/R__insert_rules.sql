-- Repeatable migration for compatibility rules
-- Clear existing compatibility rules for Phase -> Voltage mapping
DELETE FROM rules WHERE rule_type = 'compatibility' AND message LIKE '%Phase supports only%';

INSERT INTO rules (rule_type, condition, action, message) VALUES

-- Phase -> Voltage mapping
('compatibility',
'{"phase": "1PH"}',
'{"allow": {"voltage": ["120V"]}}',
'1PH supports only 120V'),

('compatibility',
'{"phase": "3PH"}',
'{"allow": {"voltage": ["208V"]}}',
'3PH supports only 208V');
