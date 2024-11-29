USE rentacar_db;

DROP TRIGGER IF EXISTS Contract_bd

DELIMITER //

CREATE TRIGGER Contract_bd
BEFORE DELETE ON Contracts
FOR EACH ROW
BEGIN
    INSERT INTO DeletedContracts (contract_id, client_id, vehicle_id, start_date, end_date)
    VALUES (OLD.contract_id, OLD.client_id, OLD.vehicle_id, OLD.start_date, OLD.end_date);
END //

DELIMITER ;
