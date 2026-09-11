Create database if not exists PlutoRealty;
use PlutoRealty; 


Create table Person (
    id          int          ,
    p_name        varchar(100) ,
    address     varchar(255),
    phone       varchar(40),
    email       varchar(100),
    PRIMARY KEY (id)
);

-- Specializations of Person

Create table Employee (
    employee_id int ,
    hired_date  date ,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES Person(id)
);

Create table PropertyOwner (
    id int ,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Person(id)
);

Create table Clients (
    id                   int          ,
    property_preferences varchar(255),
    max_rent             decimal(10,2),
	PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES Person(id)
);

-- Specializations of Employee
Create table Partner (
    employee_id int ,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

Create table Associate (
    employee_id int ,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


Create table RentalProperty (
    property_number int          ,
    type            varchar(50),
    address         varchar(255),
    rent            decimal(10,2),
    management_fee  decimal(10,2),
    bed_baths       varchar(20),
    associate_id	int,
    adv 			boolean default true,
    area			int,
    PRIMARY KEY (property_number),
    Foreign key (associate_id) references associate(employee_id)
);

-- Lease is tied to a property
Create table Lease (
    lease_number    int          ,
    property_number int          ,
    rent            decimal(10,2),
    deposit         decimal(10,2),
    duration        int,
    start           date,
    finish          date,
    PRIMARY KEY (lease_number, property_number),
    FOREIGN KEY (property_number) REFERENCES RentalProperty(property_number),
    Check (duration between 3 and 36)
);

-- Relation tables
Create table Contract (
    partner_id      int ,
    lease_number    int ,
    client_id       int ,
    property_number int ,
    PRIMARY KEY (partner_id, lease_number, client_id),
    FOREIGN KEY (partner_id)      REFERENCES Partner(employee_id),
    FOREIGN KEY (client_id)       REFERENCES Clients(id),
    FOREIGN KEY (lease_number, property_number) REFERENCES Lease(lease_number, property_number)
);

Create table ViewProperty (
    client_id       int ,
    associate_id    int ,
    property_number int ,
    view_time 	datetime,
    PRIMARY KEY (client_id, associate_id, property_number),
    FOREIGN KEY (client_id)       REFERENCES Clients(id),
    FOREIGN KEY (associate_id)    REFERENCES Associate(employee_id),
    FOREIGN KEY (property_number) REFERENCES RentalProperty(property_number)
);

Create table Owns (
    owner_id        int ,
    property_number int ,
    PRIMARY KEY (owner_id, property_number),
    FOREIGN KEY (owner_id)        REFERENCES PropertyOwner(id),
    FOREIGN KEY (property_number) REFERENCES RentalProperty(property_number)
);


--  trigger that automatically sets, to FALSE the ADV flag of a property when it is leased. 

Delimiter ~

CREATE TRIGGER toggle_adv
    AFTER INSERT ON Contract
    FOR EACH ROW
BEGIN
    UPDATE RentalProperty
    SET adv = FALSE 
    WHERE property_number = NEW.property_number;
END~

-- Check Maximum Properties Owned Trigger --

CREATE TRIGGER check_associate_max_properties
    BEFORE INSERT ON RentalProperty
    FOR EACH ROW
BEGIN
    DECLARE prop_num INT;

    Select Count(distinct property_number)
    into   prop_num
    from   RentalProperty
    where  associate_id = NEW.associate_id;
    
    If prop_num >= 5 then 
		signal sqlstate '45000'
			set message_text = 'Maximum limit of 5 properties managed by an associate reached';
	end if;

    
END~



    