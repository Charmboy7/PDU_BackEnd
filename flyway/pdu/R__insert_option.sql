-- Clear existing entries for these categories to maintain idempotency in this repeatable migration
DELETE FROM options WHERE field_name IN ('country', 'product_region', 'phase', 'input_voltage', 'input_current');

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
('phase', '1PH', '1PH'),
('phase', '3PH', '3PH'),

-- Voltage
('input_voltage', '120V', '120V'),
('input_voltage', '208V', '208V'),

-- Current
('input_current', '20A', '20A'),
('input_current', '30A', '30A'),
('input_current', '50A', '50A'),
('input_current', '60A', '60A');
