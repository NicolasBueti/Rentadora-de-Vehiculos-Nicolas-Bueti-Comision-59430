USE rentacar_db;

DROP TRIGGER IF EXISTS InvalidContDates_au;

DELIMITER //

CREATE TRIGGER InvalidContDates_au
BEFORE INSERT ON Contracts
FOR EACH ROW
BEGIN
    IF NEW.start_date > NEW.end_date THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Start date cannot be later than end date!';
    END IF;
END //

DELIMITER ;


