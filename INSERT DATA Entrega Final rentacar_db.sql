USE rentacar_db;

INSERT INTO Clients (first_name, last_name, dni, email, phone) VALUES
('Juan', 'Pérez', 30123456, 'juan.perez@email.com', 1160123456),
('María', 'González', 31234567, 'maria.gonzalez@email.com', 1160234567),
('Carlos', 'Rodríguez', 32345678, 'carlos.rodriguez@email.com', 1160345678),
('Ana', 'Martínez', 33456789, 'ana.martinez@email.com', 1160456789),
('Luis', 'López', 34567890, 'luis.lopez@email.com', 1160567890),
('Patricia', 'Sánchez', 35678901, 'patricia.sanchez@email.com', 1160678901),
('Roberto', 'Fernández', 36789012, 'roberto.fernandez@email.com', 1160789012),
('Laura', 'Díaz', 37890123, 'laura.diaz@email.com', 1160890123),
('Diego', 'García', 38901234, 'diego.garcia@email.com', 1160901234),
('Valentina', 'Torres', 39012345, 'valentina.torres@email.com', 1161012345);

INSERT INTO Agencies (agency_name, city, province, agency_phone) VALUES
('RentaCar Central', 'Buenos Aires', 'Buenos Aires', 1147123456),
('RentaCar Norte', 'San Isidro', 'Buenos Aires', 1147234567),
('RentaCar Sur', 'Quilmes', 'Buenos Aires', 1147345678),
('RentaCar Oeste', 'Morón', 'Buenos Aires', 1147456789),
('RentaCar Este', 'La Plata', 'Buenos Aires', 1147567890),
('RentaCar Pilar', 'Pilar', 'Buenos Aires', 1147678901);

INSERT INTO Categories (category_name, category_desc, daily_value, capacity) VALUES
('Económico', 'Autos compactos ideales para la ciudad', 5000.00, 4),
('Intermedio', 'Sedanes medianos con mayor confort', 7000.00, 5),
('SUV', 'Vehículos espaciosos para familia', 9000.00, 7),
('Premium', 'Vehículos de alta gama', 12000.00, 5),
('Utilitario', 'Vehículos para transporte de carga', 8000.00, 3),
('Lujo', 'Vehículos de súper lujo', 15000.00, 4);

INSERT INTO Models (brand, model_name, transmission) VALUES
('Toyota', 'Corolla', 'Automatic'),
('Volkswagen', 'Gol', 'Manual'),
('Ford', 'EcoSport', 'Manual'),
('Honda', 'Civic', 'Automatic'),
('Chevrolet', 'Cruze', 'Automatic'),
('Mercedes-Benz', 'Clase C', 'Automatic'),
('BMW', 'Serie 3', 'Automatic'),
('Audi', 'A4', 'Automatic'),
('Renault', 'Duster', 'Manual'),
('Fiat', 'Cronos', 'Manual');

INSERT INTO Vehicles (license_plate, vehicle_birth, current_km, model_id, category_id) VALUES
('AB123CD', 2022, 15000, 1, 2),
('BC234DE', 2021, 25000, 2, 1),
('CD345EF', 2023, 5000, 3, 3),
('DE456FG', 2022, 18000, 4, 4),
('EF567GH', 2021, 30000, 5, 2),
('FG678HI', 2023, 8000, 6, 6),
('GH789IJ', 2022, 12000, 7, 4),
('HI890JK', 2023, 3000, 8, 6),
('IJ901KL', 2022, 20000, 9, 3),
('JK012LM', 2023, 7000, 10, 1);

INSERT INTO Contracts (client_id, vehicle_id, start_date, end_date, total_amount, pickup_agency_id, return_agency_id) VALUES
(1, 1, '2024-01-01', '2024-01-05', 25000.00, 1, 1),
(2, 2, '2024-01-15', '2024-01-20', 35000.00, 2, 3),
(3, 3, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), 45000.00, 3, 3),
(4, 4, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), 48000.00, 4, 4),
(5, 5, DATE_ADD(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 6 DAY), 42000.00, 1, 2),
(6, 6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 8 DAY), 55000.00, 2, 2),
(7, 7, DATE_ADD(CURDATE(), INTERVAL 7 DAY), DATE_ADD(CURDATE(), INTERVAL 14 DAY), 68000.00, 3, 1),
(8, 8, DATE_ADD(CURDATE(), INTERVAL 14 DAY), DATE_ADD(CURDATE(), INTERVAL 21 DAY), 75000.00, 4, 4),
(9, 9, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_ADD(CURDATE(), INTERVAL 2 DAY), 38000.00, 5, 5),
(10, 10, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 3 DAY), 42000.00, 6, 6);

INSERT INTO Payments (contract_id, payment_date, payment_amount, payment_method) VALUES
(1, '2024-01-01', 25000.00, 'credit_card'),
(2, '2024-01-15', 35000.00, 'mercado_pago'),
(3, CURDATE(), 45000.00, 'bank_transfer'),
(4, CURDATE(), 48000.00, 'debit_card'),
(5, CURDATE(), 42000.00, 'credit_card'),
(6, CURDATE(), 55000.00, 'mercado_pago'),
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 68000.00, 'bank_transfer'),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), 75000.00, 'credit_card'),
(9, DATE_SUB(CURDATE(), INTERVAL 3 DAY), 38000.00, 'debit_card'),
(10, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 42000.00, 'mercado_pago');

INSERT INTO Insurance (contract_id, insurance_provider, coverage_type, insurance_amount, insurance_start_date, insurance_end_date) VALUES
(1, 'Seguros SA', 'Todo Riesgo', 5000.00, '2024-01-01', '2024-01-05'),
(2, 'Protección Total', 'Básico', 3000.00, '2024-01-15', '2024-01-20'),
(3, CURDATE(), 'Premium', 7000.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY)),
(4, CURDATE(), 'Todo Riesgo', 6000.00, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY)),
(5, 'Seguros Unidos', 'Premium', 8000.00, DATE_ADD(CURDATE(), INTERVAL 1 DAY), DATE_ADD(CURDATE(), INTERVAL 6 DAY)),
(6, 'Aseguradora Plus', 'Todo Riesgo', 9000.00, DATE_ADD(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 8 DAY)),
(7, 'Seguros SA', 'Básico', 4000.00, DATE_ADD(CURDATE(), INTERVAL 7 DAY), DATE_ADD(CURDATE(), INTERVAL 14 DAY)),
(8, 'Protección Total', 'Premium', 10000.00, DATE_ADD(CURDATE(), INTERVAL 14 DAY), DATE_ADD(CURDATE(), INTERVAL 21 DAY)),
(9, 'Seguros Unidos', 'Todo Riesgo', 5500.00, DATE_SUB(CURDATE(), INTERVAL 3 DAY), DATE_ADD(CURDATE(), INTERVAL 2 DAY)),
(10, 'Aseguradora Plus', 'Premium', 6500.00, DATE_SUB(CURDATE(), INTERVAL 2 DAY), DATE_ADD(CURDATE(), INTERVAL 3 DAY));

INSERT INTO Surveys (contract_id, survey_date, rating, feedback) VALUES
(1, '2024-01-05', 5, 'Excelente servicio, muy satisfecho'),
(2, '2024-01-20', 4, 'Buen servicio en general'),
(3, CURDATE(), 2, 'Mal servicio'),
(4, CURDATE(), 1, 'Me cobraron de mas'),
(5, CURDATE(), 5, 'Unos genios'),
(6, CURDATE(), 4, 'Todo bien, un poco caros'),
(7, CURDATE(), 1, 'Pesima atencion y servicio');

INSERT INTO Maintenance (vehicle_id, maintenance_date, maintenance_type, maintenance_cost) VALUES
(1, DATE_SUB(CURDATE(), INTERVAL 15 DAY), 'Cambio de aceite', 15000.00),
(2, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 'Rotación de neumáticos', 8000.00),
(3, DATE_SUB(CURDATE(), INTERVAL 5 DAY), 'Revisión general', 25000.00),
(4, CURDATE(), 'Cambio de filtros', 12000.00),
(5, DATE_ADD(CURDATE(), INTERVAL 5 DAY), 'Alineación y balanceo', 10000.00);

INSERT INTO DamageReports (vehicle_id, damage_description, damage_report_date, damage_cost) VALUES
(1, 'Rayón en puerta derecha', DATE_SUB(CURDATE(), INTERVAL 20 DAY), 20000.00),
(2, 'Golpe en paragolpes trasero', DATE_SUB(CURDATE(), INTERVAL 15 DAY), 35000.00),
(3, 'Espejo lateral roto', DATE_SUB(CURDATE(), INTERVAL 10 DAY), 15000.00),
(4, 'Abolladuras menores en capó', CURDATE(), 25000.00);

INSERT INTO Extras (contract_id, extra_name, extra_cost) VALUES
(1, 'GPS', 2000.00),
(2, 'Silla para bebé', 1500.00),
(3, 'Cadenas para nieve', 3000.00),
(4, 'WiFi portátil', 2500.00),
(5, 'Porta equipaje', 2200.00),
(6, 'Asiento elevador', 1800.00),
(7, 'GPS + WiFi combo', 4000.00),
(8, 'Kit de emergencia', 1500.00),
(9, 'Porta bicicletas', 2800.00),
(10, 'Nevera portátil', 2000.00);