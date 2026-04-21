-- Clear existing entries for these categories to maintain idempotency in this repeatable migration

DELETE FROM options WHERE field_name IN (
    'country', 'product_region', 'phase', 'input_voltage', 'input_current'
    'outlet_type', 'outlet_arrangement', 'input_position', 'mounting_type', 'outlet_spacing', 'input_breaker_or_fuse', 'input_breaker_type'
);

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
('current', '20A', '20 Amps'),
('current', '30A', '30 Amps'),

-- Outlet Type
('outlet_type', 'C13', 'C13'),
('outlet_type', 'C19', 'C19'),
('outlet_type', 'Mixed', 'Mixed (C13 + C19)'),

-- Outlet Arrangement
('outlet_arrangement', 'Vertical - Single Column', 'Vertical – Single Column'),
('outlet_arrangement', 'Vertical - Dual Column', 'Vertical – Dual Column'),
('outlet_arrangement', 'Horizontal Row', 'Horizontal Row'),

-- Input Position
('input_position', 'Top', 'Top'),
('input_position', 'Bottom', 'Bottom'),
('input_position', 'Left', 'Left'),
('input_position', 'Right', 'Right'),

-- Mounting Type
('mounting_type', '0U Rack Mount', '0U Rack Mount'),
('mounting_type', '1U Rack Mount', '1U Rack Mount'),
('mounting_type', '2U Rack Mount', '2U Rack Mount'),
('mounting_type', 'Wall Mount', 'Wall Mount'),

-- Outlet Spacing
('outlet_spacing', 'Standard', 'Standard'),
('outlet_spacing', 'Wide spacing', 'Wide spacing (for bulky adapters)'),

('input_current', '20A', '20A'),
('input_current', '30A', '30A'),
('input_current', '50A', '50A'),
('input_current', '60A', '60A'),

-- Input Breaker or Fuse
('input_breaker_or_fuse', 'Circuit Breaker', 'Circuit Breaker'),
('input_breaker_or_fuse', 'Resettable Fuse', 'Resettable Fuse'),

-- Input Breaker Type
('input_breaker_type', 'MCB', 'MCB'),
('input_breaker_type', 'MCCB', 'MCCB'),
('input_breaker_type', 'ACB', 'ACB');
