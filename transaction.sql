use PlutoRealty;

START TRANSACTION;

-- Scripting variables
SET @owner_id = 19;
SET @old_partner_id = 1;
SET @new_partner_id = 2;

-- Insert new contract rows with new partner for all active leases
INSERT INTO Contract (partner_id, lease_number, client_id, property_number)
SELECT 
    @new_partner_id,
    Lease.lease_number,
    Contract.client_id,
    Contract.property_number
FROM Contract
JOIN Owns ON Contract.property_number = Owns.property_number
JOIN Lease ON Contract.lease_number = Lease.lease_number
           AND Contract.property_number = Lease.property_number
WHERE Owns.owner_id      = @owner_id
	AND Contract.partner_id    = @old_partner_id
	AND Lease.finish        >= CURDATE();

-- Delete old contract rows
DELETE Contract FROM Contract
JOIN Owns ON Contract.property_number = Owns.property_number
JOIN Lease ON Contract.lease_number = Lease.lease_number
           AND Contract.property_number = Lease.property_number
WHERE Owns.owner_id      = @owner_id
  AND Contract.partner_id    = @old_partner_id
  AND Lease.finish        >= CURDATE();

COMMIT;

/*
The most appropriate isolation level for this transaction is serializable because 
the transaction involves reads records and then performing insert and delete statements. 
Without full isolation, concurrent transactions could introduce phantom rows or 
modify contract data between the SELECT and DELETE steps. 

*/