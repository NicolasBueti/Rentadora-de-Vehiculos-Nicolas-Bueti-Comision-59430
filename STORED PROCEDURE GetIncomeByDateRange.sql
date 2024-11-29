USE rentacar_db;

DROP PROCEDURE IF EXISTS GetIncomeByDateRange;

DELIMITER //

CREATE PROCEDURE GetIncomeByDateRange (
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT 
        p.payment_id,
        c.contract_id,
        cl.first_name AS client_first_name,
        cl.last_name AS client_last_name,
        p.payment_date,
        p.payment_amount AS payment_amount,
        p.payment_method,
        a_pickup.agency_name AS pickup_agency,
        a_return.agency_name AS return_agency
    FROM 
        Payments p
    JOIN Contracts c ON p.contract_id = c.contract_id
    JOIN Clients cl ON c.client_id = cl.client_id
    JOIN Agencies a_pickup ON c.pickup_agency_id = a_pickup.agency_id
    JOIN Agencies a_return ON c.return_agency_id = a_return.agency_id
    WHERE 
        p.payment_date >= start_date AND p.payment_date <= end_date;
    SELECT 
        SUM(p.payment_amount) AS total_income
    FROM 
        Payments p
    WHERE 
        p.payment_date >= start_date AND p.payment_date <= end_date;
END //

DELIMITER ;





