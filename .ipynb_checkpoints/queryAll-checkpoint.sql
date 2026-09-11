-- List the names of all (unique) clients.

select distinct p_name from Clients join Person on Clients.id = Person.id; 

-- Find the unique names of owners and total square footage of all the properties they own

select distinct p_name, sum(area) 
from Owns 
	join Person on Owns.owner_id = Person.id
	join RentalProperty on Owns.property_number = RentalProperty.property_number
group by Person.p_name;

-- Find the properties shown by each associate in a given month.  

SELECT 
    vp.property_number,
    COUNT(*) AS num_viewings
FROM ViewProperty vp
WHERE vp.view_date BETWEEN '2026-05-01' AND '2026-06-01'
GROUP BY vp.property_number
ORDER BY num_viewings DESC;

-- Find the most popular properties (in terms of number of viewings) in a given  period (range of dates).  
SELECT 
    o.owner_id,
    p.name,
    SUM(l.rent_amount) AS total_rent
FROM Lease l
JOIN Property pr ON l.property_number = pr.property_number
JOIN Owns o ON pr.property_number = o.property_number
JOIN Person p ON o.owner_id = p.id
WHERE l.lease_date >= '2026-05-01'
  AND l.lease_date <  '2026-06-01'
GROUP BY o.owner_id, p.name;

-- Find the total rent due to each property owner in a given month year. 
SELECT 
    o.owner_id,
    p.name,
    SUM(l.rent_amount) AS total_rent
FROM Lease l
JOIN Property pr ON l.property_number = pr.property_number
JOIN Owns o ON pr.property_number = o.property_number
JOIN Person p ON o.owner_id = p.id
WHERE l.lease_date >= '2026-05-01'
  AND l.lease_date <  '2026-06-01'
GROUP BY o.owner_id, p.name;
-- Find the unique names of clients that were ever shown at least three or more  unique residential properties owned by a given owner.  
SELECT 
    vp.client_id,
    p.name
FROM ViewProperty vp
JOIN Owns o ON vp.property_number = o.property_number
JOIN Person p ON vp.client_id = p.id
WHERE o.owner_id = 4   -- given owner
GROUP BY vp.client_id, p.name
HAVING COUNT(DISTINCT vp.property_number) >= 3;
-- Find the unique names of owners that have a residential property in every city where Pat Doe owns a commercial property.

SELECT o.owner_id
FROM Owns o
JOIN Property p ON o.property_number = p.property_number
WHERE p.city IN (
    SELECT DISTINCT p2.city
    FROM Property p2
    JOIN Owns o2 ON p2.property_number = o2.property_number
    JOIN Person pe ON o2.owner_id = pe.id
    WHERE pe.name = 'Pat Doe'
      AND p2.type = 'commercial'
)
GROUP BY o.owner_id
HAVING COUNT(DISTINCT p.city) = (
    SELECT COUNT(DISTINCT p2.city)
    FROM Property p2
    JOIN Owns o2 ON p2.property_number = o2.property_number
    JOIN Person pe ON o2.owner_id = pe.id
    WHERE pe.name = 'Pat Doe'
      AND p2.type = 'commercial'
); 

-- Find the top-3 partners with respect to number of properties leased in the current year. 

SELECT 
    l.partner_id,
    COUNT(*) AS num_leases
FROM Lease l
WHERE YEAR(l.lease_date) = YEAR(CURDATE())
GROUP BY l.partner_id
ORDER BY num_leases DESC
LIMIT 3;
