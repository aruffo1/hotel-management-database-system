-- Script name: tests.sql
-- Author: Alexandre Ruffo
-- Purpose: test the integrity of this database system through update and deletions
 
 -- database that is being tested
 SET SQL_SAFE_UPDATES = 0;

USE hotelManagementDB;

DELETE FROM address WHERE city = 'San Jose';
UPDATE address SET addressId = 4 WHERE zip = 95512;

DELETE FROM beverage WHERE instock = 0;
UPDATE beverage SET name = 'coke' WHERE itemId = 1; 

DELETE FROM booking WHERE bookingid = 1;
UPDATE booking SET dateMade = '2020-05-02' WHERE bookingId = 2;

DELETE FROM customer WHERE bookingid = 3;
UPDATE customer SET name = 'Diego' WHERE paymentId = 1;

DELETE FROM department WHERE numEmployee = 141;
UPDATE department SET departmentId = 4 WHERE departmentId = 2;

DELETE FROM employeesmanaged WHERE managerId = 8;
UPDATE employeesmanaged SET restaurantId = 9 WHERE deskId = 4; 

DELETE FROM `front desk employee` WHERE employeeId = 5; 
UPDATE `front desk employee` SET employeeId = 5 WHERE employeeId = 4; 

DELETE FROM `house keeping employee` WHERE employeeId = 2;
UPDATE `house keeping employee` SET employeeId = 2 WHERE employeeId = 1;

DELETE FROM `restaurant employee` WHERE employeeId = 9;
UPDATE `restaurant employee` SET employeeId = 9 WHERE employeeId = 7; 

DELETE FROM employee WHERE hotelId = 1;
UPDATE employee SET isManager = 1 WHERE name = 'patricia phelps';

DELETE FROM expenditures WHERE hotelId = 1;
UPDATE expenditures SET total = 1343.12 WHERE hotelId = 2;

-- DELETE FROM fire alarm WHERE fAlarmId = 3;
-- Error Code: 1146. Table 'hotelmanagementdb.fire' doesn't exist
DELETE FROM `fire alarm` WHERE fAlarmId = 3;
UPDATE `fire alarm` SET activated = 1 WHERE fAlarmId = 1;

-- DELETE FROM `fire department` WHERE fAlarm = null; 
-- Error Code: 1054. Unknown column 'fAlarm' in 'where clause'
DELETE FROM `fire department` WHERE fAlarmId IS null;
-- UPDATE `fire department` SET fireDepartmentId = 3 WHERE fireDepartemntId = 1;
-- Error Code: 1054. Unknown column 'fireDepartemntId' in 'where clause'
-- UPDATE `fire department` SET fireDepartmentId = 3 WHERE fireDepartmentId = 1;
-- Error Code: 1062. Duplicate entry '3' for key 'fire department.PRIMARY'
UPDATE `fire department` SET fireDepartmentId = 3 WHERE fireDepartmentId = 1;
 
DELETE FROM food WHERE instock = 0;
UPDATE food SET instock = 0 WHERE name = 'cheeseburger';

DELETE FROM foodmade WHERE restaurantId = 1;
UPDATE foodmade SET foodId = 4 WHERE restaurantId = 2; 

DELETE FROM hotel WHERE generatorId = 2;
UPDATE hotel SET rating = 3.4 WHERE hotelId = 1; 

DELETE FROM invoice WHERE total = 824.7;
UPDATE invoice SET total = 824.70 WHERE invoiceId = 2;

DELETE FROM item WHERE supplierId = 1; 
UPDATE item SET type = 'beverage' WHERE itemId = 5; 

DELETE FROM `misc item` WHERE inStock = 0;
UPDATE `misc item` SET price = 10.22 WHERE itemId = 8; 

DELETE FROM owner WHERE age = 24;
UPDATE owner SET age = 23 WHERE ownerId = 2;

DELETE FROM payment WHERE type = 'debit';
UPDATE payment SET type = 'debit' WHERE paymentId = 3;

DELETE FROM `security alarm` WHERE securityId = 2;
UPDATE `security alarm` SET activated = 1 WHERE securityId = 1; 

DELETE FROM `police station` WHERE securtiyId IS null;
UPDATE `police station` SET policeId = 4 WHERE policeId = 3; 

DELETE FROM pool WHERE isIndoor = 1;
UPDATE pool SET isIndoor = 1 WHERE depth =7;

DELETE FROM `power generator` WHERE type = 'inverter';
UPDATE `power generator` SET type = 'inverter' WHERE generatorId = 3; 


DELETE FROM register WHERE paymentId = 1; 
UPDATE register SET paymentId = 1 WHERE registerId = 2; 

DELETE FROM `revenue` WHERE  revenueId = 2;
UPDATE revenue SET date ='2015-11-13' WHERE revenueId = 3;

DELETE FROM room WHERE roomNumber = 24;
UPDATE room SET availability = 0 WHERE roomNumber = 51;

DELETE FROM `room class` WHERE suite = 1;
UPDATE `room class` SET penthouse = 1, oneBed = 0 WHERE oneBED = 1;

DELETE FROM supplier WHERE cost = 78.58;
UPDATE supplier SET restockDate = '2019-11-13', cost = 120.23 WHERE restockDate = '2019-11-11';  


