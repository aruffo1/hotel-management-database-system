-- Script name: inserts.sql
-- Author: Alexandre Ruffo
-- Purpose: insert sample data for testing the integrity of the database 

-- the database that will be tested and have data inserted into
USE sql3458142;

INSERT INTO Address (addressId, street, zip, city, state) VALUES 
(1, '5673 Holloway Dr', 95512, 'San Francisco', 'CA'),
 (2, '4312 Broadway Ave', 91563 ,'New York City', 'NY'), 
 (3, '7856 Alma St', 93784 ,'San Jose', 'CA');

INSERT INTO Payment (paymentId, amount, date, type) VALUES 
(1, 4875.88, '2021-2-13', 'credit'),
 (2, 3590.99, '2017-6-19', 'debit'),
 (3, 4788.05, '2015-12-13', 'credit'),
 (4, 1029.32, "2017-12-05", "debit"),
 (5, 423.21, "2018-01-05", "credit");

INSERT INTO Register (registerId, cost, date, paymentId) VALUES 
(1, 4875.88, '2021-2-13', 1), 
(2, 3590.99, '2017-6-19', 2),
 (3, 4788.05, '2015-12-13', 3);

INSERT INTO Supplier (supplierId, restockDate, cost) VALUES
 (1, '2021-10-16', 78.58),
 (2, '2019-11-11', 3158.06), 
 (3, '2017-05-26', 2530.06),
 (4, '2018-03-22', 530.06),
 (5, '2012-02-6', 230.06),
 (6, '2017-04-25', 250.16),
 (7, '2019-12-22', 4530.98),
 (8, '2017-03-21', 3430.06), 
 (9, '2018-11-1', 1530.54);

INSERT INTO Item (itemId, type, dateAcquired, supplierId, registerId) VALUES 
(1, 'beverage', '2021-10-16', 1, 1), 
(2, 'beverage', '2017-05-26', 3, null ),
 (3, 'beverage', '2019-11-11', 2, null),
 (4, 'food', '2017-04-25', 6, 2),
 (5, 'food', '2018-03-22', 4, null), 
 (6, 'food', '2012-02-6', 5, null), 
 (7, 'misc item', '2017-03-21', 8, 3), 
 (8, 'misc item', '2018-11-1', 9, null),
 (9, 'misc item', '2019-12-22', 7, null);
 
 INSERT INTO Beverage (itemId, name, price, instock) VALUES 
 (1, 'sprite', 4.98, 1), 
 (2, 'bottled water', 4.05, 1),
 (3, 'milk', 5.00, 0);
 
 INSERT INTO Food (itemId, name, price, instock) VALUES
(4, 'rib-eye', 17.58, 1), 
(5, 'cheeseburger', 12.26, 1),
(6, 'chicken', 15.60, 0);

INSERT INTO `Misc Item` (itemId, name, price, inStock) VALUES
(7, 'shirt', 26.55, 1),
(8, 'pin', 9.48, 1),
(9, 'post card', 10.92, 0);
 
INSERT INTO Department (departmentId, type, numEmployee) VALUES
(1, 'house keeping', 141),
(2,'front desk', 32),
(3, 'restaurant', 54);

INSERT INTO `Security Alarm` (securityId, activated, type) VALUES
(1, 0, 'Electric Current'),
(2, 0, 'Wired Alarm'),
(3, 1, 'Wireless Home');

INSERT INTO `Police Station` (policeId, email, phone, securtiyId) VALUES
(1, 'qwe@gmail.com', '230-643-9863', 1),
(2, 'asds@gmail.com', '233-222-0082', null),
(3, 'asdwe@yahoo.com', '231-549-4345', 2);

INSERT INTO `fire alarm` (fAlarmId, activated, type) VALUES
(1, 0, 'ionization'),
(2, 0, 'photoelectric'),
(3, 1, 'combination');

INSERT INTO `Fire Department` (fireDepartmentId, email, phone, fAlarmId) VALUES
(1, 'sesd@gmail.com', '452-657-8210', 1),
(2, 'qweq@yahoo.com', '232-764-0982', 2),
(3, 'dfd@gmail.com', '234-239-9232', 3);

INSERT INTO Booking (bookingId, dateMade, bookingDate) VALUES 
(1, '2016-10-20', '2016-10-23'), 
(2, '2019-05-02', '2019-08-10'), 
(3, '2021-01-11', '2021-02-10');

INSERT INTO Invoice (invoiceId, total, date) VALUES
(1, 824.70, '2015-11-26'),
(2, 963.74, '2016-10-27'), 
(3, 358.96, '2017-12-16'),
(4, 1029.32, "2017-12-05"),
(5, 423.21, "2018-01-05");

INSERT INTO Owner (ownerId, name, age) VALUES
(1, 'Felipe Terry', 24),
(2, 'Saul Marshall', 46),
(3, 'Deanna Brooks',46);

INSERT INTO Pool (poolId, depth, isIndoor) VALUES
(1, 8, 0),
(2, 5, 1),
(3, 7, 0);

INSERT INTO `Power Generator` (generatorId, model, type) VALUES
(1, 'Westinghouse', 'standby'),
(2, 'DuroStar', 'inverter'), 
(3, 'Generac', 'standby');

INSERT INTO Revenue (revenueId, total, date) VALUES
(1, 541.35, '2015-11-13'),
(2, 223.21, '2018-01-25'),
(3, 182.33, '2020-12-31');

INSERT INTO `Room Class` (classId, oneBed, twoBed, suite, penthouse) VALUES
(1, 0, 1, 0, 0),
(2, 0, 0, 1, 0),
(3, 1, 0, 0, 0);

INSERT INTO Hotel (hotelId, name, rating, addressId, ownerId, revenueId, generatorId, fAlarmId, securityId, poolId) VALUES
(1, 'hilton', null, 1, 1, 3, 1,1, 1, 1),
(2, 'best western', 3.5, 2, 2, 1, 2, 2,2,2), 
(3, 'shareton', null, 3, 3, 2, 3,3, 3, 3);

INSERT INTO Expenditures (expendituresId, total, date, hotelId) VALUES
(1, 1265.13, '2016-12-18', 1),
(2, 242.28, '2018-04-23', 2),
(3, 1186.77, '2019-12-24', 3);


INSERT INTO Employee (employeeId, isManager, name, wage, age, hotelId, departmentId) VALUES
(1, 0, 'Milton Hoffman',22.22, 31,1, 1),
(2, 1, 'Tyler Yates', 18.72, 33, 2,1), 
(3, 0,'Marshall Sims', 20.45, 18, 3, 1),
(4, 0, 'Patricia Phelps', 24.07, 20, 2, 2),
(5, 0, 'Heidi Cross', 20.88, 29, 1, 2),
(6, 1, 'Corey Hodges', 22.50, 24, 3, 2),
(7, 0, 'Grady Ball', 23.23, 30, 3, 3),
(8, 1, 'Kirk Glover',21.95, 24, 1, 3),
(9, 0, 'Mable King', 16.06, 33, 2, 3);
 
INSERT INTO Customer (customerId, name, email, phone, bookingId, invoiceId, paymentId, hotelId) VALUES
(1, 'Elsa Allison', 'sad@gmail.com', '231-403-4960', 1, null, 2, 3),
(2, 'Oscar Fitzgerald', 'weq@gmail.com', '245-209-3890', 2, 1, 1, 2),
(3, 'Debbie Crawford', 'asd@yahoo.com', '324-892-6841',3,null,4, 1),
(4, 'Elsa Allison', 'sad@gmail.com', '231-403-4960', 4, 4, 3, 3);

INSERT INTO Room (roomId, roomNumber, availability, costPerNight, hotelId, bookingId, classId) VALUES
(1, 51, 1, 286.30, 1, 1, 1),
(2, 52, 1, 481.24, 2, 2, 2),
(3, 24, 0, 744.07, 3, 3, 3);

INSERT INTO `Restaurant Employee` (restaurantId, isChef, isServer, employeeId) VALUES 
(1, 0, 1, 7),
(2, 1, 0, 8),
(3, 0, 1, 9);

INSERT INTO `House Keeping Employee` (employeeId, roomId, isCleaner, isRestocker) VALUES
(1, 1, 0, 1),
(2, 2, 1, 0),
(3, 3, 1, 1);

INSERT INTO `Front Desk Employee` (employeeId, roomId, isGraveyard) VALUES
(4, 1, 0),
(5, 2, 0), 
(6, 3, 1);

INSERT INTO FoodMade (restaurantId, foodId) VALUES
(1, 4),
(2, 5),
(3, 6);

INSERT INTO EmployeesManaged (managerId, houseKeepingId, restaurantId, deskId) VALUES
(2, 1, null, 4),
(6, null, 7, null),
(8, 2, 9, 5);