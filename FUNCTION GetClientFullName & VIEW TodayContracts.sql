USE rentacar_db;
DROP FUNCTION IF EXISTS GetClientFullName;
DELIMITER //
CREATE FUNCTION GetClientFullName(
clientId INT
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE fullName VARCHAR(255);
    SELECT CONCAT(first_name, ' ', last_name) INTO fullName
    FROM Clients
    WHERE client_id = clientId;
    RETURN fullName;
END //
DELIMITER ;

USE rentacar_db;
DROP VIEW IF EXISTS TodayContracts;
CREATE VIEW TodayContracts AS
SELECT 
    c.contract_id,
    GetClientFullName(c.client_id) AS client_full_name,
    v.license_plate AS vehicle,
    c.start_date,
    c.end_date,
    a_pickup.agency_name AS pickup_agency,
    a_return.agency_name AS return_agency,
    c.total_amount
FROM 
    Contracts c
JOIN Vehicles v ON c.vehicle_id = v.vehicle_id
JOIN Agencies a_pickup ON c.pickup_agency_id = a_pickup.agency_id
JOIN Agencies a_return ON c.return_agency_id = a_return.agency_id
WHERE 
    c.start_date = CURDATE();


