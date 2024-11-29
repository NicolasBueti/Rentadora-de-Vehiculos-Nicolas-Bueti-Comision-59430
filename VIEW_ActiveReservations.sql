USE rentacar_db;
DROP VIEW IF EXISTS ActiveReservations;
CREATE VIEW ActiveReservations AS
SELECT 
    c.contract_id,
    cl.first_name AS client_first_name,
    cl.last_name AS client_last_name,
    v.license_plate AS vehicle,
    c.start_date,
    c.end_date,
    a_pickup.agency_name AS pickup_agency,
    a_return.agency_name AS return_agency
FROM 
    Contracts c
JOIN Clients cl ON c.client_id = cl.client_id
JOIN Vehicles v ON c.vehicle_id = v.vehicle_id
JOIN Agencies a_pickup ON c.pickup_agency_id = a_pickup.agency_id
JOIN Agencies a_return ON c.return_agency_id = a_return.agency_id
WHERE 
    c.start_date > CURDATE(); 

    
