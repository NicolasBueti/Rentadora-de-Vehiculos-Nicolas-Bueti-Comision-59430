USE rentacar_db;

DROP PROCEDURE IF EXISTS GetRemainingDays;

DELIMITER //
CREATE FUNCTION GetRemainingDays(
	contractId INT
) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE remainingDays INT;
    SELECT DATEDIFF(end_date, CURDATE()) INTO remainingDays
    FROM Contracts
    WHERE contract_id = contractId;
    RETURN remainingDays;
END //
DELIMITER ;


