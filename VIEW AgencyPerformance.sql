USE rentacar_db;
DROP VIEW IF EXISTS AgencyPerformance;
CREATE VIEW AgencyPerformance AS
SELECT 
    a.agency_id,
    a.agency_name,
    a.city,
    COUNT(DISTINCT c.contract_id) as total_contracts,
    SUM(c.total_amount) as total_revenue,
    AVG(c.total_amount) as average_contract_value,
    (
        SELECT AVG(s.rating)
        FROM Contracts c2
        JOIN Surveys s ON c2.contract_id = s.contract_id
        WHERE c2.pickup_agency_id = a.agency_id
    ) as average_rating
FROM 
    Agencies a
LEFT JOIN Contracts c ON a.agency_id = c.pickup_agency_id
GROUP BY 
    a.agency_id, a.agency_name, a.city;