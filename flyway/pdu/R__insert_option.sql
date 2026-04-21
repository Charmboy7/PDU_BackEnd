-- Clear all existing entries to maintain idempotency in this repeatable migration
TRUNCATE TABLE options;

INSERT INTO options (field_name, value, label, metadata) VALUES

-- Country
('country', 'United States', 'United States', NULL),
('country', 'Canada', 'Canada', NULL),
('country', 'United Kingdom', 'United Kingdom', NULL),
('country', 'Germany', 'Germany', NULL),
('country', 'France', 'France', NULL),
('country', 'Japan', 'Japan', NULL),
('country', 'Other', 'Other', NULL),  

-- Product Region
('product_region', 'North America', 'North America', NULL),
('product_region', 'Europe', 'Europe', NULL),
('product_region', 'Asia Pacific', 'Asia Pacific', NULL),

-- Phase
('phase', '1PH', '1PH', NULL),
('phase', '3PH', '3PH', NULL),

-- Voltage
('input_voltage', '120V', '120V', NULL),
('input_voltage', '208V', '208V', NULL),

-- Outlet Type
('outlet_type', 'C13', 'C13 (IEC 60320)', NULL),
('outlet_type', 'C19', 'C19 (IEC 60320)', NULL),
('outlet_type', 'Mixed', 'Mixed (C13 + C19)', NULL),
('outlet_type', 'NEMA_5_20R', 'NEMA 5-20R', NULL),

-- C13 Quantity Options
('outlet_quantity', '0', '0', '{"outlet_type": "C13"}'),
('outlet_quantity', '4', '4', '{"outlet_type": "C13"}'),
('outlet_quantity', '6', '6', '{"outlet_type": "C13"}'),
('outlet_quantity', '8', '8', '{"outlet_type": "C13"}'),
('outlet_quantity', '10', '10', '{"outlet_type": "C13"}'),
('outlet_quantity', '12', '12', '{"outlet_type": "C13"}'),
('outlet_quantity', '14', '14', '{"outlet_type": "C13"}'),
('outlet_quantity', '16', '16', '{"outlet_type": "C13"}'),
('outlet_quantity', '20', '20', '{"outlet_type": "C13"}'),
('outlet_quantity', '24', '24', '{"outlet_type": "C13"}'),
('outlet_quantity', '28', '28', '{"outlet_type": "C13"}'),
('outlet_quantity', '32', '32', '{"outlet_type": "C13"}'),
('outlet_quantity', '36', '36', '{"outlet_type": "C13"}'),

-- C19 Quantity Options
('outlet_quantity', '0', '0', '{"outlet_type": "C19"}'),
('outlet_quantity', '4', '4', '{"outlet_type": "C19"}'),
('outlet_quantity', '6', '6', '{"outlet_type": "C19"}'),
('outlet_quantity', '8', '8', '{"outlet_type": "C19"}'),
('outlet_quantity', '10', '10', '{"outlet_type": "C19"}'),
('outlet_quantity', '12', '12', '{"outlet_type": "C19"}'),

-- NEMA Quantity Options
('outlet_quantity', '0', '0', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '4', '4', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '6', '6', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '8', '8', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '10', '10', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '12', '12', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '16', '16', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '20', '20', '{"outlet_type": "NEMA_5_20R"}'),
('outlet_quantity', '24', '24', '{"outlet_type": "NEMA_5_20R"}'),

-- Outlet Arrangement
('outlet_arrangement', 'Vertical - Single Column', 'Vertical – Single Column', NULL),
('outlet_arrangement', 'Vertical - Dual Column', 'Vertical – Dual Column', NULL),
('outlet_arrangement', 'Horizontal Row', 'Horizontal Row', NULL),

-- Input Position
('input_position', 'Top', 'Top', NULL),
('input_position', 'Bottom', 'Bottom', NULL),
('input_position', 'Left', 'Left', NULL),
('input_position', 'Right', 'Right', NULL),

-- Mounting Type
('mounting_type', '0U Rack Mount', '0U Rack Mount', NULL),
('mounting_type', '1U Rack Mount', '1U Rack Mount', NULL),
('mounting_type', '2U Rack Mount', '2U Rack Mount', NULL),
('mounting_type', 'Wall Mount', 'Wall Mount', NULL),

-- Outlet Spacing
('outlet_spacing', 'Standard', 'Standard', NULL),
('outlet_spacing', 'Wide spacing', 'Wide spacing (for bulky adapters)', NULL),

('input_current', '20A', '20A', NULL),
('input_current', '30A', '30A', NULL),
('input_current', '50A', '50A', NULL),
('input_current', '60A', '60A', NULL),

-- Input Breaker or Fuse
('input_breaker_or_fuse', 'Circuit Breaker', 'Circuit Breaker', NULL),
('input_breaker_or_fuse', 'Resettable Fuse', 'Resettable Fuse', NULL),

-- Input Breaker Type
('input_breaker_type', 'MCB', 'MCB', NULL),
('input_breaker_type', 'MCCB', 'MCCB', NULL),
('input_breaker_type', 'ACB', 'ACB', NULL),

-- Outlet Features (Toggles)
('outlet_feature', 'STANDARD', 'Standard', NULL),
('outlet_feature', 'LOCKABLE', 'Lockable', NULL),
('outlet_feature', 'INDIVIDUAL_FUSED', 'Individual Fused', NULL),

-- PDU Series
('pdu_series', 'RP3000', 'RP3000', NULL),
('pdu_series', 'RP2000', 'RP2000', NULL),
('pdu_series', 'RP1500', 'RP1500', NULL),
('pdu_series', 'RP1000', 'RP1000', NULL),
('pdu_series', 'RP100', 'RP100', NULL),

-- Monitoring Features
('monitoring_feature', 'SWITCH', 'Outlet Switch ON / OFF', NULL),
('monitoring_feature', 'SNMP', 'SNMP Hardware', NULL),
('monitoring_feature', 'OUTLET_MEAS', 'Outlet Measurement', NULL),
('monitoring_feature', 'CIRCUIT_MEAS', 'Circuit Measurement', NULL);