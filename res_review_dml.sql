INSERT INTO Login_Credentials VALUES
    ('dthreadgill0','L7JRrIUzZ8', 'customer'),
    ('jgiral1','Svhesb4jeTV', 'customer'),
    ('hphant2','GuUxASI', 'customer'),
    ('ldenney3','AJCvxOmDVz', 'customer'),
    ('thiorn4','xf8FGT70TeO', 'customer'),
    ('rkroin5','C51yQ2i3u4b', 'customer'),
    ('dgilliam6','NosYWc','manager'),
    ('kmalden7','IvWa6n20R', 'manager'),
    ('kmoxteda','EqIJw91VB', 'personnel'),
    ('bblackdenb','2fC6aW', 'personnel'),
    ('Kayley01', 'OzwfSv', 'customer'),
    ('Dru007', 'uwT5eKlu5', 'customer'),
    ('Leontine100', '9Uq2pkIW9qEh', 'customer'),
    ('Neille101', 'mRiZZAyL9uB', 'customer'),
    ('Trstram2000', 'FvIISjm7g3SZ', 'customer'),
    ('Aldous_Tillett', 'Bwjcnx1c3LZ', 'personnel'),
    ('Gunther_Longmead', 'zfs7cyU', 'personnel'),
    ('Olvan01', 'ZxolyxhWxR', 'personnel'),
    ('Chelsy007', 'c7V9OmaGi7', 'personnel'),
    ('Valerie100', 'jXC4B3jB', 'personnel'),
    ('Marrilee101', 'JWCAs75puSdX', 'manager'),
    ('Chane2000', 'tkTvkJQC73k', 'manager'),
    ('Ker_Berresford', 'FtxQn1f', 'manager'),
    ('Gally','safaf','customer'),
    ('Fred','asdfsdf','customer'),
    ('belt','asdfasdf','customer');

INSERT INTO Customer (name, emailID, phoneNo, username) VALUES 
    ('Vina Betteriss','hbenkin0@seattletimes.com',4018145470,'dthreadgill0'),
    ('Opalina Roadnight','tmcettigen1@cdc.gov',1918488252,'jgiral1'),
    ('Dante Haire','mlindemann2@icio.us',1569903957, 'hphant2'),
    ('Ingelbert Attack','gingarfield3@dropbox.com',8235622549,'ldenney3'),
    ('Hedwiga Starkie','wvanbrug4@ed.gov',7195428373,'thiorn4'),
    ('Kayley Bedder', 'kbedder@clickbank.net', 8918830262, 'Kayley01'),
    ('Dru Wreakes', 'Dru007@slashdot.org', 7452226122, 'Dru007'),
    ('Leontine Bourke', 'fgreber2@reuters.com', 7455493430, 'Leontine100'),
    ('Neille Margach', 'rmeriel3@hatena.ne.jp', 6922066842, 'Neille101'),
    ('Trstram De Vere', 'dlongstaff4@liveinternet.ru', 4686811252, 'Trstram2000'),
    ('Galven',	'gbeckson0@newyorker.com',	3205202184,'Gally'),
    ('Ferdy',	'ftingey1@hp.com',	6841029280,'Fred'),
    ('Beltran',	'bcadagan2@ibm.com',	9511430994,'belt');

INSERT INTO Customer_Addresses VALUES
    (1,'79040 Fulton Alley'),
    (2,'408 Harper Crossing'),
    (3,'0 Nelson Terrace'),
    (4,'1511 Prairie Rose Terrace'),
    (5,'38 Manufacturers Avenue'),
    (6, '7477 Lyons Junction'),
    (7, '52 Northview Trail'),
    (7, '49 Mitchell Parkway'),
    (8, '1378 Victoria Plaza'),
    (9, '1985 Northland Avenue'),
    (9, '0204 Beilfuss Lane'),
    (10, '91 Maple Road'),
    (10, '51392 Northland Lane'),
    (11, 'Weschester'),
    (12, 'Gotham '),
    (12, 'Mordor');

INSERT INTO Coupons (discount) VALUES
    (20),
    (30), 
    (40), 
    (25), 
    (10),
    (5),
    (8),
    (12),
    (24),
    (30);

INSERT INTO Delivery_Personnel (name, emailID, vehicleNo, phoneNo, commission, location, username) VALUES 
    ('Kevina Gilhespy','kgilhespy0@kickstarter.com','JTDKTU',1508527260, 10, 'Bangalore', 'kmoxteda'), 
    ('Ede Nisen','enisen1@sciencedirect.com','KNDP',8633062811, 5, 'Bangalore', 'bblackdenb'),
    ('Aldous Tillett', 'ncrookes5@e-recht24.de', '12903S1', 2803173783, 6, '7477 Lyons Junction', 'Aldous_Tillett'),
    ('Gunther Longmead', 'rayars6@mtv.com', 'S860984', 3493191029, 8, '52 Northview Trail', 'Gunther_Longmead'),
    ('Olvan Eckly', 'mkynforth7@usatoday.com', 'T33-69E', 1834994141, 7, '1378 Victoria Plaza', 'Olvan01'),
    ('Chelsy MacEveley', 'bberrane8@360.cn', '7ZMS199', 5106764907, 7, '1985 Northland Avenue', 'Chelsy007'),
    ('Valerie Lawrenceson', 'zedbrooke9@privacy.gov.au', '6YCS465', 2781747898, 5, '91 Maple Road', 'Valerie100');

INSERT INTO Orders (cost, address, status, customerID, couponID, personnelID) VALUES
    (100, '#129 Bangalore Palace', 'delivered', 1, NULL, 1), 
    (600, '#132 MG Road', 'Order Placed', 3, 2, 2),
    (275, '7477 Lyons Junction', 'Taken Out', 6, NULL, NULL),
    (550, '49 Mitchell Parkway', 'Order Placed', 7, 8, NULL),
    (150, '1378 Victoria Plaza', 'Delivered', 8, NULL, 6);

INSERT INTO Payments (method, cardNo, time_stamp, finalPrice, orderID) VALUES
    ('Cash', NULL, current_timestamp, 100, 1),
    ('Card', 30050474259263, current_timestamp, 600, 2),
    ('Card',23131131313133, current_timestamp, 1000, 4),
    ('Cash', NULL, current_timestamp, 262, 3),
    ('MasterCard', 5320980365100382, current_timestamp, 132, 5);

INSERT INTO Restaurant_Managers VALUES 
    ('dmaron0@yale.edu','Darci Maron', 'dgilliam6'),
    ('mredwin3@cisco.com','Myca Redwin', 'kmalden7'),
    ('dbuttwella@sfgate.com', 'Marrilee Witnall', 'Marrilee101'),
    ('hmatteab@t-online.de', 'Chane Disdel', 'Chane2000'),
    ('ecolinc@auda.org.au', 'Ker Berresford', 'Ker_Berresford');

INSERT INTO Restaurants (name, rating, address, manager_email) VALUES 
    ('McDonalds', 5, '3rd block HSR Layout', 'mredwin3@cisco.com'),
    ('Dominos', 5, '#123 SarjapurRd','dmaron0@yale.edu'),
    ('Vishnu Bhavan', 5, '09783 Carioca Alley', 'dbuttwella@sfgate.com'),
    ('Scoops n Treats', 5, '94 Manley Parkway', 'hmatteab@t-online.de'),
    ('Cafe Garage', 4.5, '8 Weeping Birch Center', 'ecolinc@auda.org.au'),
    ('Cafe coffe', 2 , 'Banashankri', 'ecolinc@auda.org.au');


INSERT INTO Food (name, category, cuisine, price) VALUES
    ('Margharita', 'Pizza', 'Italian', 300),
    ('McMaharaja', 'Burger', 'American', 100),
    ('Chicken Biriyani', 'Non Veg', 'South Indian', 150),
    ('Fried Onions', 'Veg', 'South Indian', 25),
    ('Naan', 'Veg', 'North Indian', 20),
    ('Paneer Butter Masala', 'Veg', 'North Indian', 50),
    ('Butter Chicken', 'Non Veg', 'North Indian', 75),
    ('Vanilla Ice Cream', 'Veg', NULL, 50),
    ('Chocolate Ice Cream', 'Veg', NULL, 50),
    ('Choco Lava Cake', 'Egg', NULL, 30),
    ('Pineapple Juice', 'Veg', NULL, 40),
    ('Orange Juice', 'Veg', NULL, 30),
    ('Chicken Sandwich', 'Non Veg', NULL, 100),
    ('Paneer Sandwich', 'Veg', NULL, 75),
    ('Veg Burger', 'Veg', NULL, 50),
    ('Chicken Wings', 'Non Veg', NULL, 50);

INSERT INTO Food_Orders VALUES
    (1,2,1),
    (2,1,2),
    (16, 3, 2),
    (14, 3, 1),
    (13, 3, 1),
    (3, 4, 2),
    (5, 4, 5),
    (7, 4, 2),
    (8, 5, 1),
    (10, 5, 1),
    (11, 5, 1),
    (12, 5, 1);

INSERT INTO Restaurant_Food VALUES
    (2,1),
    (1,2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 6),
    (3, 7),
    (4, 8),
    (4, 9),
    (4, 10),
    (4, 11),
    (4, 12),
    (5, 13),
    (5, 14),
    (5, 15),
    (5, 16);

INSERT INTO Restaurant_PhoneNo VALUES
    (1, 9823982897), 
    (2, 1087249827),
    (3, 5125455275),
    (3, 7276043870),
    (3, 4235363854),
    (4, 8336094589),
    (5, 8903857319),
    (5, 9124836877);

INSERT INTO Restaurant_EmailID VALUES
    (1, 'support@mcdonalds.in'),
    (2,'sales@dominos.in'),
    (3, 'support1@VishnuBhavan.com'),
    (3, 'support2@VishnuBhavan.com'),
    (4, 'costumercare@ScnTr.com'),
    (5, 'sales@CafeGarage.com'),
    (2,'care@dominos.com');

INSERT INTO Reviews (comment, rating, customerID, time_stamp, restaurantID, personnelID) VALUES 
    ('Good food', 5, 1, current_timestamp, 2, NULL),
    ('Slow Delivery, polite', 4, 2, current_timestamp, NULL, 1),
    (NULL, 4, 6, current_timestamp, 5, NULL),
    ('Fastest delivery I ever got in my life', 5, 8, current_timestamp, 4, 6),
    ('Usless service', 1, 2 , current_timestamp, 2, NULL),
    ('No salt in food',2, 3 ,current_timestamp, 6, NULL);
