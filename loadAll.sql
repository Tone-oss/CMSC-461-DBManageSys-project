use PlutoRealty;


-- 6 People for Employees (id 1-6)


INSERT INTO Person (id, p_name , address, phone, email) VALUES
-- 6 Employees: IDs 1-6
(1,  'Anthony Sesay',    '123 Sesame St', '123-456-0101', 'anthons3@umbc.edu'),
(2,  'Son Goku',  '059 Mount P. Rd',   '123-456-0102', 'dragonball@email.com'),
(3,  'Finn Mertins',  '123 Elm st',     '123-456-0103', 'adverturetime@email.com'),
(4,  'Timon Shelenker',    '404 Maple Dr',   '123-456-0104', 't.shelenker@email.com'),
(5,  'Rodney Shelenker',  '505 Cedar Ln',   '123-456-0105', 'r.shelenker@email.com'),
(6,  'Marcus Jones', '606 Birch Blvd', '123-456-0106', 'M.Jones@email.com'),

-- 12 People Clients: IDs 7-18
(7,  'Justice Parrot',      '707 Walnut St',  '123-456-0107', 'tigerTim@email.com'),
(8,  'Terraine Gordon',    '808 Spruce Ave', '123-456-0108', 't.rain@email.com'),
(9,  'Adrian Jovel', '909 Ash Rd',     '123-456-0109', 'big.dog@email.com'),
(10, 'Victor Jovel',  '110 Poplar Dr',  '123-456-0110', 'yn@email.com'),
(11, 'Brian Ramirez', '211 Willow Ln',  '123-456-0111', 'brain.r@email.com'),
(12, 'Gabe Lopez',   '312 Hickory Bl', '123-456-0112', 'jabe@email.com'),
(13, 'Abdoulaye Drame', '413 Magnolia St','123-456-0113', 'dooley@email.com'),
(14, 'Shean Garcia','514 Chestnut Ave','123-456-0114','dominate3344@email.com'),
(15, 'Yuji Itadori',  '615 Sycamore Rd','123-456-0115', 'jjk@email.com'),
(16, 'Satoru Gojo',  '716 Locust Dr',  '123-456-0116', 'jjk236@email.com'),
(17, 'Ichigo Kurosaki','817 Beech Ln',   '123-456-0117', 'bleach@email.com'),
(18, 'Emma Moser','918 Dogwood Bl', '123-456-0118', 'eggH@email.com'),

-- 6 Owners: ID's 19-24
(19, 'Elizabeth Moser',  '119 Redwood St', '123-456-0119', 'thebutcher@email.com'),
(20, 'Ryan Zheng', '220 Cypress Ave','123-456-0120', 'pizzatime@email.com'),
(21, 'Elaine Cheng','321 Fir Rd', '123-456-0121', 'ramen@email.com'),
(22, 'Johnny Joestar',   '422 Juniper Dr', '123-456-0122', 'sbr@email.com'),
(23, 'Gumball Watterson',  '523 Larch Ln',   '123-456-0123', 'tawog@email.com'),
(24, 'Tokio Kurohara',   '624 Sequoia Bl', '123-456-0124', 'choujinx@email.com'),
(25, 'New Owner Test', '999 Test Ave', '123-999-0000', 'owner25@email.com'),
(26, 'Pat Doe', '100 Main St, Springfield', '123-999-0001', 'pat.doe@email.com'),

(35, 'Dana Cheese', '727 Pine St, PizzaTown', '123-456-0127', 'd.c@email.com'),
(36, 'Little Caesar', '667 Pizza Pizaa, TomatoTown', '098-765-4321', 'best.pizza@email.com');




-- 6 Employees
INSERT INTO Employee (employee_id, hired_date) VALUES
(1, '2026-01-15'),
(2, '2025-02-22'),
(3, '2024-03-10'),
(4, '2023-04-18'),
(5, '2022-05-30'),
(6, '2021-06-14'),
(35, '2023-07-01'), 
(36, '2023-08-01'); 

-- 3 Partners
INSERT INTO Partner (employee_id) VALUES
(1),
(2),
(3);

-- 3 Associates
INSERT INTO Associate (employee_id) VALUES
(4),
(5),
(6),
(35),
(36);

-- 12 Clients 
INSERT INTO Clients (id, property_preferences, max_rent) VALUES
(7,  'Residential, Big', 1500.00),
(8,  'Commercial, Small',  3000.00),
(9,  'Industrial, Medium',  5000.00),
(10, 'Residential, Big', 1200.00),
(11, 'Residential, Small', 2000.00),
(12, 'Commercial, Medium',  4000.00),
(13, 'Industrial, Big',  6000.00),
(14, 'Residential, Small', 1800.00),
(15, 'Commercial, Medium',  3500.00),
(16, 'Residential, Big', 1100.00),
(17, 'Industrial, Small',  4500.00),
(18, 'Residential, Medium', 1600.00);

-- 6 Property Owners (persons 19-24)
INSERT INTO PropertyOwner (id) VALUES
(19),
(20),
(21),
(22),
(23),
(24),
(26),
(25);

-- 18 Rental Properties (6 residential, 6 commercial, 6 industrial)

INSERT INTO RentalProperty (property_number, type, address, rent, management_fee, bed_baths, adv, associate_id, area) VALUES
-- Residential
(1, 'Residential', '10 Sunset Blvd', 1200.00, 120.00, '2bed/1bath', FALSE, 4, 805),
(2, 'Residential', '20 Sunrise Ave', 1400.00, 140.00, '3bed/2bath', FALSE, 35, 1200),
(3, 'Residential', '30 Moonlight Dr', 1600.00, 160.00, '2bed/2bath', TRUE, 4, 950),
(4, 'Residential', '40 Starview Ln', 1800.00, 180.00, '4bed/2bath', TRUE, 35, 1800),
(5, 'Residential', '50 Hilltop Rd', 1000.00, 100.00, '1bed/1bath', TRUE, 5, 600),
(6, 'Residential', '60 Valley St', 2000.00, 200.00, '3bed/3bath', TRUE, 5, 1600),
-- Commercial
(7, 'Commercial', '100 Business Pk', 3000.00, 300.00, NULL, FALSE, 5, 2500),
(8, 'Commercial', '200 Commerce Rd', 3500.00, 350.00, NULL, FALSE, 35, 3000),
(9, 'Commercial', '300 Market St', 4000.00, 400.00, NULL, TRUE,  5, 3500),
(10, 'Commercial', '400 Trade Ave', 2500.00, 250.00, NULL, TRUE,  36, 2000),
(11, 'Commercial', '500 Enterprise Blvd',4500.00,450.00, NULL, TRUE,  36, 4000),
(12, 'Commercial', '600 Corporate Dr',  5000.00, 500.00, NULL, TRUE,  35, 4500),
-- Industrial
(13, 'Industrial', '1000 Factory Rd', 5000.00, 500.00, NULL, FALSE, 6, 10000),
(14, 'Industrial', '2000 Warehouse Ln', 5500.00, 550.00, NULL, FALSE, 35, 12000),
(15, 'Industrial', '3000 Industrial Pk', 6000.00, 600.00, NULL, TRUE,  4, 15000),
(16, 'Industrial', '4000 Logistics Dr', 4500.00, 450.00, NULL, TRUE,  36, 9000),
(17, 'Industrial', '5000 Freight Ave', 7000.00, 700.00, NULL, TRUE,  6, 18000),
(18, 'Industrial', '6000 Cargo Blvd', 6500.00, 650.00, NULL, TRUE,  4, 14000),

(19, 'Commercial', '101 Biz Rd, Springfield', 3000.00, 300.00, NULL, TRUE, 4, 2000),
(20, 'Commercial', '202 Commerce Ave, Shelbyville', 4000.00, 400.00, NULL, TRUE, 5, 3000),
(21, 'Residential', '303 Home St, Springfield',  1200.00, 120.00, '2bed/1bath', TRUE, 6, 900),
(22, 'Residential', '404 Living Ln, Shelbyville', 1400.00, 140.00, '3bed/2bath', TRUE, 6, 1100);

-- 6 Owners own the 18 properties (3 each)
INSERT INTO Owns (owner_id, property_number) VALUES
(19, 1), (19, 2), (19, 3),
(20, 4), (20, 5), (20, 6),
(21, 7), (21, 8), (21, 9),
(22, 10),(22, 11),(22, 12),
(23, 13),(23, 14),(23, 15),
(24, 16),(24, 17),(24, 18),
(25, 1), (25, 2), (25, 3),
(25, 4), (26, 19), (26, 20),
(19,21), (19,22);

-- 6 Leases
INSERT INTO Lease (lease_number, property_number, rent, deposit, duration, start, finish) VALUES
(1, 1,  1200.00, 2400.00, 12, '2024-01-01', '2024-12-31'),
(2, 2,  1400.00, 2800.00, 12, '2024-02-01', '2025-01-31'),
(3, 7,  3000.00, 6000.00, 24, '2024-03-01', '2026-02-28'),
(4, 8,  3500.00, 7000.00, 12, '2024-04-01', '2025-03-31'),
(5, 13, 5000.00,10000.00, 36, '2024-05-01', '2027-04-30'),
(6, 14, 5500.00,11000.00, 24, '2024-06-01', '2026-05-31'),
(7,  3,  1600.00, 3200.00, 12, '2026-01-01', '2026-12-31'),
(8,  4,  1800.00, 3600.00, 12, '2026-02-01', '2027-01-31'),
(9,  5,  1000.00, 2000.00, 12, '2026-03-01', '2027-02-28'),
(10, 6,  2000.00, 4000.00, 12, '2026-01-15', '2027-01-14'),
(11, 9,  4000.00, 8000.00, 12, '2026-02-15', '2027-02-14'),
(12, 10, 2500.00, 5000.00, 12, '2026-03-15', '2027-03-14'),
(13, 11, 4500.00, 9000.00, 12, '2026-04-01', '2027-03-31'),
(14, 12, 5000.00, 10000.00, 12, '2026-04-15', '2027-04-14');

-- 6 Contracts (partner signs lease with client)
INSERT INTO Contract (partner_id, lease_number, client_id, property_number) VALUES
(1, 1, 7,  1),
(1, 2, 8,  2),
(2, 3, 9,  7),
(2, 4, 10, 8),
(3, 5, 11, 13),
(3, 6, 12, 14),
(1, 7,  13, 3),
(1, 8,  14, 4),
(1, 9,  15, 5),
(2, 10, 16, 6),
(2, 11, 17, 9),
(3, 12, 18, 10);

-- 12 Property Viewings
INSERT INTO ViewProperty (client_id, associate_id, property_number, view_time) VALUES
(7,  4, 3,  '2026-05-01 10:00:00'),
(8,  4, 4,  '2026-05-01 11:30:00'),
(9,  4, 8,  '2026-05-01 14:00:00'),
(10, 5, 5,  '2026-05-02 09:15:00'),
(11, 5, 6,  '2026-05-02 10:45:00'),
(12, 5, 9,  '2026-05-02 13:00:00'),
(13, 5, 10, '2026-05-02 15:30:00'),
(14, 6, 11, '2026-05-03 09:00:00'),
(15, 6, 12, '2026-05-03 10:30:00'),
(16, 6, 15, '2026-05-03 12:00:00'),
(17, 6, 16, '2026-05-03 14:30:00'),
(18, 6, 17, '2026-05-03 16:00:00'),
(7, 4, 1, '2026-05-04 10:00:00'),
(7, 4, 2, '2026-05-04 11:00:00');


