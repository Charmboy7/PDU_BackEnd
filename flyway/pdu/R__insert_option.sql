-- Clear existing entries for these categories to maintain idempotency in this repeatable migration
DELETE FROM options WHERE field_name IN ('country', 'product_region', 'phase', 'voltage', 'current');

INSERT INTO options (field_name, value, label) VALUES

-- Country
('country', 'United States', 'United States'),
('country', 'Canada', 'Canada'),
('country', 'United Kingdom', 'United Kingdom'),
('country', 'Germany', 'Germany'),
('country', 'France', 'France'),
('country', 'Japan', 'Japan'),
('country', 'Other', 'Other'),  

-- Product Region
('product_region', 'North America', 'North America'),
('product_region', 'Europe', 'Europe'),
('product_region', 'Asia Pacific', 'Asia Pacific'),

-- Phase
('phase', '1PH', 'Single Phase'),
('phase', '3PH', 'Three Phase'),

-- Voltage
('voltage', '120V', '120 Volts'),
('voltage', '208V', '208 Volts'),

-- Current
('current', '20A', '20 Amps'),
('current', '30A', '30 Amps');
