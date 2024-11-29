USE rentacar_db;

DROP TRIGGER IF EXISTS Payments_bd;

DELIMITER //

CREATE TRIGGER Payments_bd
BEFORE DELETE ON Payments
FOR EACH ROW
BEGIN
    INSERT INTO DeletedPayments (payment_id, contract_id, payment_date, payment_amount, payment_method)
    VALUES (OLD.payment_id, OLD.contract_id, OLD.payment_date, OLD.payment_amount, OLD.payment_method);
END //

DELIMITER ; 

