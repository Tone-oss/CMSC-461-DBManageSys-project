
use PlutoRealty;

Drop table if exists Contract;
Drop table if exists ViewProperty;
Drop table if exists Owns;
Drop table if exists Lease;
Drop table if exists RentalProperty;
Drop table if exists Partner;
Drop table if exists Associate;
Drop table if exists Clients;
Drop table if exists PropertyOwner;
Drop table if exists Employee;
Drop table if exists Person;
DROP TRIGGER IF EXISTS toggle_adv;
Drop trigger if exists check_associate_max_properties;
