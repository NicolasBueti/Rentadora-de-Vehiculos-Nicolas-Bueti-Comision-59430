DROP DATABASE IF EXISTS rentacar_db;
CREATE DATABASE rentacar_db;
USE rentacar_db;

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    dni BIGINT NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone BIGINT NOT NULL
);

CREATE TABLE Agencies (
    agency_id INT AUTO_INCREMENT PRIMARY KEY,
    agency_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    agency_phone BIGINT NOT NULL
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    category_desc VARCHAR(200),
    daily_value DECIMAL(10, 2) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE Models (
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    transmission ENUM('Manual', 'Automatic') NOT NULL DEFAULT 'Manual'
);

CREATE TABLE Vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    license_plate VARCHAR(20) NOT NULL UNIQUE,
    vehicle_birth YEAR NOT NULL,
    current_km INT NOT NULL DEFAULT 0,
    model_id INT NOT NULL,
    category_id INT NOT NULL
);

CREATE TABLE Contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    pickup_agency_id INT NOT NULL,
    return_agency_id INT NOT NULL
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('mercado_pago', 'bank_transfer', 'credit_card', 'debit_card') NOT NULL
);

CREATE TABLE DeletedContracts (
    contract_id INT,
    client_id INT,
    vehicle_id INT,
    start_date DATE,
    end_date DATE,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE DeletedPayments (
    payment_id INT PRIMARY KEY,
    contract_id INT,
    payment_date DATE,
    Payment_amount DECIMAL(10, 2),
    payment_method ENUM('mercado_pago', 'bank_transfer', 'credit_card', 'debit_card'),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Insurance (
    insurance_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    insurance_provider VARCHAR(100) NOT NULL,
    coverage_type VARCHAR(100) NOT NULL,
    insurance_amount DECIMAL(10, 2) NOT NULL,
    insurance_start_date DATE NOT NULL,
    insurance_end_date DATE NOT NULL
);

CREATE TABLE Surveys (
    survey_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    survey_date DATE NOT NULL,
    rating INT NOT NULL,
    feedback TEXT
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    maintenance_date DATE NOT NULL,
    maintenance_type VARCHAR(100) NOT NULL,
    maintenance_cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone BIGINT NOT NULL,
    hire_date DATE NOT NULL,
    role VARCHAR(100) NOT NULL,
    agency_id INT NOT NULL 
);

CREATE TABLE DamageReports (
    damage_report_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT NOT NULL,
    damage_description TEXT NOT NULL,
    damage_report_date DATE NOT NULL,
    damage_cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Extras (
    extra_id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT NOT NULL,
    extra_name VARCHAR(100) NOT NULL,
    extra_cost DECIMAL(10, 2) NOT NULL
);

-- Relación de claves foráneas (Foreign Keys)
ALTER TABLE Contracts
    ADD CONSTRAINT fk_contracts_clients FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    ADD CONSTRAINT fk_contracts_vehicles FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    ADD CONSTRAINT fk_contracts_pickup_agency FOREIGN KEY (pickup_agency_id) REFERENCES Agencies(agency_id),
    ADD CONSTRAINT fk_contracts_return_agency FOREIGN KEY (return_agency_id) REFERENCES Agencies(agency_id);

ALTER TABLE Vehicles
    ADD CONSTRAINT fk_vehicles_models FOREIGN KEY (model_id) REFERENCES Models(model_id),
    ADD CONSTRAINT fk_vehicles_categories FOREIGN KEY (category_id) REFERENCES Categories(category_id);

ALTER TABLE Payments
    ADD CONSTRAINT fk_payments_contracts FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id);

ALTER TABLE Insurance
    ADD CONSTRAINT fk_insurance_contract FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id);

ALTER TABLE Surveys
    ADD CONSTRAINT fk_surveys_contract FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id);

ALTER TABLE Maintenance
    ADD CONSTRAINT fk_maintenance_vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id);

ALTER TABLE DamageReports
    ADD CONSTRAINT fk_damage_reports_vehicle FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id);

ALTER TABLE Extras
    ADD CONSTRAINT fk_extras_contract FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id);

ALTER TABLE Employees
    ADD CONSTRAINT fk_employees_agency FOREIGN KEY (agency_id) REFERENCES Agencies(agency_id);
