DROP VIEW IF EXISTS CustomerFeedbackFollowUp;
CREATE VIEW CustomerFeedbackFollowUp AS
SELECT 
    c.client_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone,
    s.survey_date,
    s.rating,
    s.feedback,
    cont.contract_id,
    cont.start_date,
    cont.end_date
FROM 
    Clients c
    JOIN Contracts cont ON c.client_id = cont.client_id
    JOIN Surveys s ON cont.contract_id = s.contract_id
WHERE 
    s.rating <= 3  
ORDER BY 
    s.survey_date DESC;