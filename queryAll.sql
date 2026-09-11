use PlutoRealty;
-- List the names of all (unique) clients.

SELECT DISTINCT p_name from Clients join Person on Clients.id = Person.id; 

-- Find the unique names of owners and total square footage of all the properties they own

SELECT DISTINCT p_name, sum(area) 
from Owns 
	JOIN Person on Owns.owner_id = Person.id
	JOIN RentalProperty on Owns.property_number = RentalProperty.property_number
GROUP BY Person.p_name;

-- Find the properties shown by each associate in a given month.  

SELECT 
    MONTH(view_time) AS view_month,
    property_number,
    COUNT(*) AS num_viewings
FROM ViewProperty 
WHERE view_time >= '2026-05-01' 
	AND view_time < '2026-06-02'
GROUP BY MONTH(view_time), property_number
ORDER BY num_viewings DESC;

-- Find the most popular properties (in terms of number of viewings) in a given  period (range of dates).  

SELECT 
    ViewProperty.property_number,
    address,
    type,
    COUNT(*) AS viewings
FROM ViewProperty
JOIN RentalProperty ON ViewProperty.property_number = RentalProperty.property_number
WHERE view_time >= '2026-01-01' 
    AND view_time <  '2026-07-02'
GROUP BY property_number, address, type
ORDER BY viewings DESC;

-- Find the total rent due to each property owner in a given month year. 

SELECT 
    owner_id,
    p_name,
    SUM(Lease.rent) AS total_rent
FROM Lease
JOIN Owns ON Lease.property_number = Owns.property_number
JOIN Person ON Owns.owner_id = Person.id
WHERE YEAR(Lease.start)  = 2024
    AND MONTH(Lease.start) = 5
GROUP BY Owns.owner_id, Person.p_name;

-- Find the unique names of clients that were ever shown at least three or more  unique residential properties owned by a given owner.  
SELECT 
    client_id,
    p_name
FROM ViewProperty
JOIN Owns  ON ViewProperty.property_number = Owns.property_number
JOIN RentalProperty ON ViewProperty.property_number = RentalProperty.property_number
JOIN Person ON ViewProperty.client_id = Person.id
WHERE Owns.owner_id = 19
  AND RentalProperty.type = 'Residential'
GROUP BY ViewProperty.client_id, Person.p_name
HAVING COUNT(DISTINCT ViewProperty.property_number) >= 3;

-- Find the unique names of owners that have a residential property in every city where Pat Doe owns a commercial property.

SELECT 
    owner_id,
    p_name
FROM Owns
JOIN RentalProperty ON Owns.property_number = RentalProperty.property_number
JOIN Person ON Owns.owner_id = Person.id
WHERE RentalProperty.type = 'residential'
-- get the city from the address and check if it's in the list of cities where Pat Doe has commercial properties
    AND SUBSTRING_INDEX(RentalProperty.address, ',', -1) IN (
    SELECT DISTINCT SUBSTRING_INDEX(RentalProperty.address, ',', -1)
    FROM RentalProperty
    JOIN Owns ON RentalProperty.property_number = Owns.property_number
    JOIN Person ON Owns.owner_id = Person.id
    WHERE Person.p_name = 'Pat Doe'
    AND RentalProperty.type = 'commercial'
)
-- group by owner and name, and only include those who have properties in all the cities where Pat Doe has commercial properties
GROUP BY Owns.owner_id, Person.p_name
HAVING COUNT(DISTINCT SUBSTRING_INDEX(RentalProperty.address, ',', -1)) = (
    SELECT COUNT(DISTINCT SUBSTRING_INDEX(RentalProperty.address, ',', -1))
    FROM RentalProperty
    JOIN Owns ON RentalProperty.property_number = Owns.property_number
    JOIN Person ON Owns.owner_id = Person.id
    WHERE Person.p_name = 'Pat Doe'
    AND RentalProperty.type = 'commercial'
);

-- Find the top-3 partners with respect to number of properties leased in the current year. 
SELECT 
    partner_id,
    p_name,
    COUNT(DISTINCT Lease.property_number) AS properties_leased
FROM Contract
JOIN Lease  ON Contract.lease_number = Lease.lease_number 
			AND Contract.property_number = Lease.property_number
JOIN Person ON Contract.partner_id = Person.id
WHERE YEAR(Lease.start) = 2026
GROUP BY Contract.partner_id, Person.p_name
ORDER BY properties_leased DESC
LIMIT 3;
-- 9. total management fees due to Pluto in the last 3 months.  

SELECT 
    SUM(management_fee) AS total_management_fees
FROM RentalProperty 
JOIN Lease ON RentalProperty.property_number = Lease.property_number
WHERE start >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    AND start <  CURDATE();