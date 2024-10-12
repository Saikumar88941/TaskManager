-- script to create sales database
-- revised 01/27/2007 for MySQL

DROP DATABASE sales;
CREATE DATABASE sales;
USE sales;

CREATE TABLE SLSREP(
repNum	mediumint(5),
repName	varchar(30),
repAddress	varchar(30),
totComm	real,
commRate real,
PRIMARY KEY( repNum) );

CREATE TABLE CUSTOMER(
custNumber  mediumint(5),
custName varchar(30),
address varchar(30),
currBal real,
credLimit real, 
repNum mediumint(5),
PRIMARY KEY (custNumber),
FOREIGN KEY (repNum) REFERENCES SLSREP(repNUM) );

CREATE TABLE PARTS(
partNum	varchar(20),
partDesc varchar(20),
unitsOnHand mediumint(5),
itemClass varchar(20),
warehouseNum mediumint(5),
unitPrice real,
PRIMARY KEY (partNum) );


CREATE TABLE ORDERS(
orderNum mediumint(7),
orderDate DATE,
custNum	 mediumint(5),
PRIMARY KEY (orderNum),
FOREIGN KEY (custNum) REFERENCES CUSTOMER(custNumber) );

CREATE TABLE ORDERLINE (
orderNum mediumint(7),
partNum	varchar(20),
numOrdered mediumint(7),
quotedPrice	real,
PRIMARY KEY (orderNum, partNum),
FOREIGN KEY (orderNum) REFERENCES ORDERS(orderNum),
FOREIGN KEY (partNum) REFERENCES PARTS(partNum) );

INSERT INTO SLSREP
VALUES (3, 'Mary Jones', '123 Mina, Grant, MI',	2150.00, 0.05);
INSERT INTO SLSREP
VALUES (6, 'William Smith', '102 Raymond, Ada, MI', 4912.50, 0.07);
INSERT INTO SLSREP
VALUES (12,	'Sam Brown', '41 Harper, Ada, MI', 2150.00, 0.05);

INSERT INTO CUSTOMER
VALUES (124, 'Sally Adams', '481 Oak, Lansing, MI', 418.75, 500.00, 3);	
INSERT INTO CUSTOMER
VALUES (256, 'Ann Samuels', '215 Pete, Grant, MI', 10.75, 800.00, 6);	
INSERT INTO CUSTOMER
VALUES (311, 'Don Charles', '48 College, Ira, MI', 200.10, 300.00, 12);	
INSERT INTO CUSTOMER
VALUES (315, 'Tom Daniels', '914 Cherry, Kent, MI', 320.75, 300.00, 6);	
INSERT INTO CUSTOMER
VALUES (405, 'Al Williams', '519 Watts, Grant, MI', 201.75, 800.00, 12);	
INSERT INTO CUSTOMER
VALUES (412, 'Sally Adams', '16 Elm, Lansing, MI', 908.75, 1000.00, 3);	
INSERT INTO CUSTOMER
VALUES (522, 'Mary Nelson', '108 Pine, Ada, MI', 49.50, 800.00, 12);	
INSERT INTO CUSTOMER
VALUES (567, 'Joe Baker', '80 Ridge, Harper, MI', 201.20, 300.00, 6);	
INSERT INTO CUSTOMER
VALUES (587, 'Judy Roberts', '512 Pine, Ada, MI', 57.75, 500.00, 6);	
INSERT INTO CUSTOMER
VALUES (622, 'Dan Martin', '419 Chip, Grant, MI', 575.50, 500.00, 3);

INSERT INTO PARTS
VALUES ('ax12', 'iron', 104, 'hardware', 3, 17.95);
INSERT INTO PARTS
VALUES ('az52', 'skates', 20, 'sporting goods', 2, 24.95);
INSERT INTO PARTS
VALUES ('ba74', 'baseball', 40, 'sporting goods', 1, 4.95);
INSERT INTO PARTS
VALUES ('bh22', 'toaster', 95, 'hardware', 3, 34.95);
INSERT INTO PARTS
VALUES ('bt04', 'stove', 11, 'appliance', 2, 402.99);
INSERT INTO PARTS
VALUES ('bz66', 'washer', 52, 'appliance', 3, 311.95);
INSERT INTO PARTS
VALUES ('ca14', 'skillet', 2, 'hardware', 3, 19.95);
INSERT INTO PARTS
VALUES ('cb03', 'bike', 44, 'sporting goods', 1, 187.50);
INSERT INTO PARTS
VALUES ('cx11', 'mixer', 112, 'hardware', 3, 57.95);
INSERT INTO PARTS
VALUES ('cz81', 'weights', 208, 'sporting goods', 2, 108.99);

INSERT INTO ORDERS
VALUES (12489, '94-9-2', 124);
INSERT INTO ORDERS
VALUES (12491, '94-9-2', 311);
INSERT INTO ORDERS
VALUES (12494, '94-9-4', 315);
INSERT INTO ORDERS
VALUES (12495, '94-9-4', 256);
INSERT INTO ORDERS
VALUES (12498, '94-9-5', 522);
INSERT INTO ORDERS
VALUES (12500, '94-9-5', 124);
INSERT INTO ORDERS
VALUES (12504, '94-9-5', 522);	

INSERT INTO ORDERLINE
VALUES (12489, 'ax12', 11, 14.95);
INSERT INTO ORDERLINE
VALUES (12489, 'bt04', 1, 399.00);
INSERT INTO ORDERLINE
VALUES (12489, 'bz66', 3, 300.00);
INSERT INTO ORDERLINE
VALUES (12489, 'cb03', 5, 170.00);
INSERT INTO ORDERLINE
VALUES (12489, 'cx11', 1, 60.00);
INSERT INTO ORDERLINE
VALUES (12489, 'cz81', 5, 109.00);
INSERT INTO ORDERLINE
VALUES (12491, 'bt04', 1, 402.99);
INSERT INTO ORDERLINE
VALUES (12491, 'bz66', 1, 311.95);
INSERT INTO ORDERLINE
VALUES (12494, 'cb03', 4, 175.00);
INSERT INTO ORDERLINE
VALUES (12495, 'cx11', 2, 57.95);
INSERT INTO ORDERLINE
VALUES (12498, 'az52', 2, 22.95);
INSERT INTO ORDERLINE
VALUES (12498, 'ba74', 4, 4.95);
INSERT INTO ORDERLINE
VALUES (12500, 'bt04', 1, 402.99);
INSERT INTO ORDERLINE
VALUES (12504, 'cz81', 2, 108.99);