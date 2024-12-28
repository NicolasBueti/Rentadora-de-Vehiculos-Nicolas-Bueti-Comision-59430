USE rentacar_db;
DROP VIEW IF EXISTS VehicleMaintenanceStatus;
CREATE VIEW VehicleMaintenanceStatus AS
SELECT 
    v.vehicle_id,
    v.license_plate,
    CONCAT(m.brand, ' ', m.model_name) as vehicle_model,
    v.current_km,
    cat.category_name,
    MAX(mant.maintenance_date) as last_maintenance_date,
    CASE 
        WHEN v.current_km >= 10000 THEN 'Mantenimiento Urgente'
        WHEN v.current_km >= 8000 THEN 'Mantenimiento Próximo'
        ELSE 'OK'
    END as status
FROM 
    Vehicles v
JOIN Models m ON v.model_id = m.model_id
JOIN Categories cat ON v.category_id = cat.category_id
LEFT JOIN Maintenance mant ON v.vehicle_id = mant.vehicle_id
GROUP BY 
    v.vehicle_id, v.license_plate, vehicle_model, v.current_km, cat.category_name;