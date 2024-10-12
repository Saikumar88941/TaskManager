-- script to create school database
-- revised 01/27/2007 for MySQL

DROP DATABASE school;
CREATE DATABASE school;
USE school;

CREATE TABLE tblProgram(
progNum VARCHAR(30),
progName VARCHAR(30),
deptId VARCHAR(10),
PRIMARY KEY (progNum) );

CREATE TABLE tblCourse(
progNum VARCHAR(30),
crsNum VARCHAR(30),
crHrs INT,
title VARCHAR(30),
INDEX (crsNum),
PRIMARY KEY (progNum, crsNum),
FOREIGN KEY (progNum) REFERENCES tblProgram (progNum) );

CREATE TABLE tblDept(
deptId VARCHAR(30),
deptName VARCHAR(30),
chairId VARCHAR(30),
PRIMARY KEY (deptId) );

CREATE TABLE tblFaculty(
facId VARCHAR(30),
lastName VARCHAR(30),
firstName VARCHAR(30),
facRank VARCHAR(30),
deptId VARCHAR(30),
PRIMARY KEY (facId),
FOREIGN KEY (deptId) REFERENCES tblDept (deptId) );

CREATE TABLE tblStudent(
stuID VARCHAR(30),
lastName VARCHAR(30),
firstName VARCHAR(30),
address VARCHAR(30),
city VARCHAR(30),
state VARCHAR(30),
zip VARCHAR(5),
facId VARCHAR(30),
PRIMARY KEY (stuId),
FOREIGN KEY (facId) REFERENCES tblFaculty (facId) );

CREATE TABLE tblTranscript(
stuID VARCHAR(30),
progNum VARCHAR(30),
crsNum VARCHAR(30),
grade CHAR(1),
semester VARCHAR(30),
years INT,
instructorID VARCHAR(30),
PRIMARY KEY (stuID, progNum, crsNum, semester, years),
FOREIGN KEY (stuID) REFERENCES tblStudent (stuId),
FOREIGN KEY (progNum) REFERENCES tblProgram (progNum),
FOREIGN KEY (crsNum) REFERENCES tblCourse (crsNum),
FOREIGN KEY (instructorID) REFERENCES tblFaculty (facId) );

CREATE TABLE tblStudentProgram(
stuId VARCHAR(30),
progNum VARCHAR(30),
PRIMARY KEY (stuID, progNum),
FOREIGN KEY (stuID) REFERENCES tblStudent (stuID),
FOREIGN KEY (progNum) REFERENCES tblProgram(progNUM) );

INSERT INTO tblProgram
VALUES ('03', 'Government', 'Hist/Govt');
INSERT INTO tblProgram
VALUES ('04', 'History', 'Hist/Govt');
INSERT INTO tblProgram
VALUES ('12', 'Biology', 'Biol');
INSERT INTO tblProgram
VALUES ('14', 'Math', 'Math/Stat');
INSERT INTO tblProgram
VALUES ('15', 'Statistics', 'Math/Stat');
INSERT INTO tblProgram
VALUES ('16', 'AppMath', 'Math/Stat');
INSERT INTO tblProgram
VALUES ('18', 'Psychology', 'Psych');
INSERT INTO tblProgram
VALUES ('19', 'English', 'Eng');
INSERT INTO tblProgram
VALUES ('20', 'CompSci', 'CS/IS');
INSERT INTO tblProgram
VALUES ('26', 'Art', 'Art');
INSERT INTO tblProgram
VALUES ('34', 'MIS', 'CS/IS');
INSERT INTO tblProgram
VALUES ('35', 'OIS', 'CS/IS');
INSERT INTO tblProgram
VALUES ('37', 'Chemistry', 'Chem/Phys');
INSERT INTO tblProgram
VALUES ('38', 'Physics', 'Chem/Phys');
INSERT INTO tblProgram
VALUES ('43', 'Theatre', 'Sp/Th');
INSERT INTO tblProgram
VALUES ('51', 'Accounting', 'Acct/Fin');
INSERT INTO tblProgram
VALUES ('52', 'Finance', 'Acct/Fin');
INSERT INTO tblProgram
VALUES ('62', 'Economics', 'Econ');
INSERT INTO tblProgram
VALUES ('70', 'Broadcasting', 'MassComm');

INSERT INTO tblCourse
VALUES ('03', '102', 3, 'Intro to Amer Govt');
INSERT INTO tblCourse
VALUES ('03', '203', 3, 'State and Local Govt');
INSERT INTO tblCourse
VALUES ('03', '301', 3, 'Parties & Elections');
INSERT INTO tblCourse
VALUES ('03', '302', 3, 'The Amer Presidency');
INSERT INTO tblCourse
VALUES ('03', '310', 3, 'Amer Legal System');
INSERT INTO tblCourse
VALUES ('03', '330', 3, 'Pub Administration');
INSERT INTO tblCourse
VALUES ('04', '155', 3, 'Survey of Am Hist');
INSERT INTO tblCourse
VALUES ('04', '312', 3, 'History of Russia');
INSERT INTO tblCourse
VALUES ('04', '350', 3, 'Amer Military Hist');
INSERT INTO tblCourse
VALUES ('04', '375', 3, 'Hist of Latin Amer');
INSERT INTO tblCourse
VALUES ('04', '385', 3, 'Modern Japan');
INSERT INTO tblCourse
VALUES ('12', '112' ,4, 'General Botany');
INSERT INTO tblCourse
VALUES ('12', '350', 3, 'Genetics');
INSERT INTO tblCourse
VALUES ('14', '114', 3, 'General Statistics');
INSERT INTO tblCourse
VALUES ('14', '530', 3, 'Sampling');
INSERT INTO tblCourse
VALUES ('14', '531', 3, 'Applied Time Series');
INSERT INTO tblCourse
VALUES ('14', '535', 3, 'Probability Theory');
INSERT INTO tblCourse
VALUES ('14', '537', 3, 'Design of Exper');
INSERT INTO tblCourse
VALUES ('15', '120', 4, 'Calculus I');
INSERT INTO tblCourse
VALUES ('15', '121', 4, 'Calculus II');
INSERT INTO tblCourse
VALUES ('15', '215', 3, 'Discrete Math');
INSERT INTO tblCourse
VALUES ('15', '311', 3, 'Linear Algebra');
INSERT INTO tblCourse
VALUES ('15', '351', 3, 'College Geometry');
INSERT INTO tblCourse
VALUES ('15', '361', 3, 'Diff Equations');
INSERT INTO tblCourse
VALUES ('15', '521', 3, 'Complex Analysis');
INSERT INTO tblCourse
VALUES ('16', '432', 3, 'Numerical Analysis');
INSERT INTO tblCourse
VALUES ('16', '561', 3, 'Applied Math');
INSERT INTO tblCourse
VALUES ('18', '103', 3, 'General Psychology');
INSERT INTO tblCourse
VALUES ('18', '223', 3, 'Abnormal Psychology');
INSERT INTO tblCourse
VALUES ('18', '312', 3, 'Child Psychology');
INSERT INTO tblCourse
VALUES ('18', '332', 3, 'Developmental Psych');
INSERT INTO tblCourse
VALUES ('19', '111', 3, 'Composition');
INSERT INTO tblCourse
VALUES ('19', '220', 3, 'Intro to Literature');
INSERT INTO tblCourse
VALUES ('19', '234', 3, 'American Literature');
INSERT INTO tblCourse
VALUES ('19', '314', 3, 'Creative Writing');
INSERT INTO tblCourse
VALUES ('19', '371', 3, 'The American Novel');
INSERT INTO tblCourse
VALUES ('19', '372', 3, 'Intro to Shakespeare');
INSERT INTO tblCourse
VALUES ('19', '505', 3, 'Hist of Eng Language');
INSERT INTO tblCourse
VALUES ('20', '130', 3, 'Using Computers');
INSERT INTO tblCourse
VALUES ('20', '131', 3, 'Prog in Pascal');
INSERT INTO tblCourse
VALUES ('20', '230', 3, 'Modula-2');
INSERT INTO tblCourse
VALUES ('20', '249', 3, 'FORTRAN Programming');
INSERT INTO tblCourse
VALUES ('20', '250', 3, 'COBOL Programming');
INSERT INTO tblCourse
VALUES ('20', '325', 3, 'Programming Lang');
INSERT INTO tblCourse
VALUES ('20', '345', 3, 'Computer Org.');
INSERT INTO tblCourse
VALUES ('20', '347', 3, 'Data Structures');
INSERT INTO tblCourse
VALUES ('20', '349', 3, 'Survey of Algorithms');
INSERT INTO tblCourse
VALUES ('20', '525', 3, 'Computer Graphics');
INSERT INTO tblCourse
VALUES ('20', '548', 3, 'Database Systems');
INSERT INTO tblCourse
VALUES ('20', '567', 3, 'Artif Intelligence');
INSERT INTO tblCourse
VALUES ('26', '102', 3, 'Art Appreciation');
INSERT INTO tblCourse
VALUES ('26', '110', 3, 'Survey of Art');
INSERT INTO tblCourse
VALUES ('26', '120', 3, 'Drawing');
INSERT INTO tblCourse
VALUES ('26', '181', 3, 'Ceramics');
INSERT INTO tblCourse
VALUES ('26', '191', 3, 'Graphic Design');
INSERT INTO tblCourse
VALUES ('26', '313', 3, 'Far Eastern Art');
INSERT INTO tblCourse
VALUES ('34', '317', 3, 'Mgmt Information Sys');
INSERT INTO tblCourse
VALUES ('34', '411', 3, 'Sys Anal and Design');
INSERT INTO tblCourse
VALUES ('34', '412', 3, 'Management Models');
INSERT INTO tblCourse
VALUES ('34', '416', 3, 'Telecommunications');
INSERT INTO tblCourse
VALUES ('35', '341', 3, 'Records Management');
INSERT INTO tblCourse
VALUES ('35', '343', 3, 'Office Sys Proc');
INSERT INTO tblCourse
VALUES ('35', '442', 3, 'Integrated Off Sys');
INSERT INTO tblCourse
VALUES ('37', '114', 4, 'General Chemistry');
INSERT INTO tblCourse
VALUES ('37', '322', 5, 'Quantitative Anal');
INSERT INTO tblCourse
VALUES ('37', '342', 4, 'Organic Chemistry');
INSERT INTO tblCourse
VALUES ('37', '532', 4, 'Physical Chemistry');
INSERT INTO tblCourse
VALUES ('38', '120', 5, 'Classical Physics');
INSERT INTO tblCourse
VALUES ('38', '320', 4, 'Mechanics');
INSERT INTO tblCourse
VALUES ('38', '330', 4, 'Elec and Magnetism');
INSERT INTO tblCourse
VALUES ('38', '332', 4, 'Electronics');
INSERT INTO tblCourse
VALUES ('43', '101', 3, 'Theatre Appreciation');
INSERT INTO tblCourse
VALUES ('43', '225', 3, 'Oral Interpretation');
INSERT INTO tblCourse
VALUES ('43', '230', 3, 'Acting');
INSERT INTO tblCourse
VALUES ('43', '310', 3, 'Theatre History');
INSERT INTO tblCourse
VALUES ('51', '201', 3, 'Accounting I');
INSERT INTO tblCourse
VALUES ('51', '202', 3, 'Accounting II');
INSERT INTO tblCourse
VALUES ('51', '301', 3, 'Cost Accounting');
INSERT INTO tblCourse
VALUES ('51', '303', 3, 'Tax Accounting');
INSERT INTO tblCourse
VALUES ('51', '306', 3, 'Inter Accounting');
INSERT INTO tblCourse
VALUES ('51', '308', 3, 'Acct Information Sys');
INSERT INTO tblCourse
VALUES ('51', '404', 3, 'Auditing');
INSERT INTO tblCourse
VALUES ('51', '406', 3, 'Managerial Acct');
INSERT INTO tblCourse
VALUES ('52', '120', 3, 'Personal Finance');
INSERT INTO tblCourse
VALUES ('52', '311', 3, 'Business Law');
INSERT INTO tblCourse
VALUES ('52', '320', 3, 'Insurance and Risk');
INSERT INTO tblCourse
VALUES ('52', '324', 3, 'Business Finance');
INSERT INTO tblCourse
VALUES ('52', '325', 3, 'Investment Prin');
INSERT INTO tblCourse
VALUES ('52', '326', 3, 'Investment Mgmt');
INSERT INTO tblCourse
VALUES ('52', '420', 3, 'Financial Inst');
INSERT INTO tblCourse
VALUES ('62', '351', 3, 'Macroeconomics');
INSERT INTO tblCourse
VALUES ('62', '352', 3, 'Money Cred & Banking');
INSERT INTO tblCourse
VALUES ('62', '353', 3, 'Microeconomics');
INSERT INTO tblCourse
VALUES ('62', '354', 3, 'Labor Economics');
INSERT INTO tblCourse
VALUES ('62', '451', 3, 'Econometrics');
INSERT INTO tblCourse
VALUES ('70', '120', 3, 'Intro to Mass Media');
INSERT INTO tblCourse
VALUES ('70', '314', 3, 'Communications Law');
INSERT INTO tblCourse
VALUES ('70', '317', 3, 'Media Criticism');


INSERT INTO tblDept
VALUES ('Acct/Fin', 'Accounting/Finance', '520');
INSERT INTO tblDept
VALUES ('Art', 'Art', '102');
INSERT INTO tblDept
VALUES ('Biol', 'Biological Sciences', '820');
INSERT INTO tblDept
VALUES ('Chem/Phys', 'Chemistry/Physics', '500');
INSERT INTO tblDept
VALUES ('CS/IS', 'CompSci/InfoSystems', '101');
INSERT INTO tblDept
VALUES ('Econ', 'Economics', '315');
INSERT INTO tblDept
VALUES ('Eng', 'English', '181');
INSERT INTO tblDept
VALUES ('Hist/Govt', 'History/Government', '330');
INSERT INTO tblDept
VALUES ('MassComm', 'Mass Communications', '819');
INSERT INTO tblDept
VALUES ('Math/Stat', 'Mathematics/Statistics', '203');
INSERT INTO tblDept
VALUES ('Psych', 'Psychology', '417');
INSERT INTO tblDept
VALUES ('Sp/Th', 'Speech/Theatre', '532');

INSERT INTO tblFaculty
VALUES ('101', 'Fry', 'Kathleen', 'Professor', 'CS/IS');
INSERT INTO tblFaculty
VALUES ('102', 'Hinshaw', 'Jon', 'Associate Professor', 'Art');
INSERT INTO tblFaculty
VALUES ('131', 'Town', 'Esther', 'Instructor', 'Art');
INSERT INTO tblFaculty
VALUES ('181', 'Benson', 'Amy', 'Professor', 'Eng');
INSERT INTO tblFaculty
VALUES ('182', 'Thomas', 'Andrew', 'Assistant Professor', 'Psych');
INSERT INTO tblFaculty
VALUES ('184', 'Gates', 'Patricia', 'Professor', 'Biol');
INSERT INTO tblFaculty
VALUES ('190', 'Collier', 'Marcia', 'Associate Professor', 'Eng');
INSERT INTO tblFaculty
VALUES ('200', 'Thompson', 'Kenneth', 'Associate Professor', 'Math/Stat');
INSERT INTO tblFaculty
VALUES ('201', 'Browning', 'Frank', 'Professor', 'Eng');
INSERT INTO tblFaculty
VALUES ('203', 'Stanley', 'Elizabeth', 'Professor', 'Math/Stat');
INSERT INTO tblFaculty
VALUES ('206', 'Wu', 'Hong', 'Associate Professor', 'Chem/Phys');
INSERT INTO tblFaculty
VALUES ('217', 'Ross', 'Joel', 'Assistant Professor', 'Acct/Fin');
INSERT INTO tblFaculty
VALUES ('280', 'Edwards', 'Marsha', 'Associate Professor', 'Sp/Th');
INSERT INTO tblFaculty
VALUES ('300', 'Varnes', 'Judy', 'Assistant Professor', 'Psych');
INSERT INTO tblFaculty
VALUES ('315', 'Woods', 'Judy', 'Assistant Professor', 'Econ');
INSERT INTO tblFaculty
VALUES ('330', 'Kimble', 'John', 'Associate Professor', 'Hist/Govt');
INSERT INTO tblFaculty
VALUES ('345', 'Anderson', 'Mary', 'Assistant Professor', 'Math/Stat');
INSERT INTO tblFaculty
VALUES ('417', 'McAdams', 'Beverly', 'Associate Professor', 'Psych');
INSERT INTO tblFaculty
VALUES ('420', 'Gates', 'Michael', 'Professor', 'Econ');
INSERT INTO tblFaculty
VALUES ('425', 'Dosland', 'Patrick', 'Associate Professor', 'Psych');
INSERT INTO tblFaculty
VALUES ('444', 'McCall', 'Alex', 'Professor', 'CS/IS');
INSERT INTO tblFaculty
VALUES ('500', 'Tappen', 'Johanna', 'Professor', 'Chem/Phys');
INSERT INTO tblFaculty
VALUES ('510', 'Winter', 'Stephen', 'Associate Professor', 'Acct/Fin');
INSERT INTO tblFaculty
VALUES ('512', 'Elliott', 'Ben', 'Professor', 'Sp/Th');
INSERT INTO tblFaculty
VALUES ('515', 'Collins', 'Margaret', 'Associate Professor', 'Acct/Fin');
INSERT INTO tblFaculty
VALUES ('520', 'Bailey', 'Harold', 'Professor', 'Acct/Fin');
INSERT INTO tblFaculty
VALUES ('526', 'Udey', 'Wayne', 'Instructor', 'Chem/Phys');
INSERT INTO tblFaculty
VALUES ('532', 'Reston', 'Nancy', 'Professor', 'Sp/Th');
INSERT INTO tblFaculty
VALUES ('555', 'Martin', 'Joyce', 'Associate Professor', 'CS/IS');
INSERT INTO tblFaculty
VALUES ('819', 'Wilson', 'Ernest', 'Professor', 'MassComm');
INSERT INTO tblFaculty
VALUES ('820', 'Boone', 'Robert', 'Professor', 'Biol');
INSERT INTO tblFaculty
VALUES ('932', 'Williams', 'Laura', 'Instructor', 'MassComm');
INSERT INTO tblFaculty
VALUES ('947', 'Wright', 'George', 'Professor', 'Math/Stat');
INSERT INTO tblFaculty
VALUES ('950', 'VanDyke', 'Kenneth', 'Professor', 'Art');
INSERT INTO tblFaculty
VALUES ('960', 'Hawkins', 'David', 'Instructor', 'CS/IS');
INSERT INTO tblFaculty
VALUES ('982', 'Jackson', 'Kim', 'Associate Professor', 'CS/IS');

INSERT INTO tblStudent
VALUES ('002', 'Udey', 'Wendi', '559 Antioch', 'Beaver City', 'NE', '68926', '532');
INSERT INTO tblStudent
VALUES ('003', 'Wimberly', 'Peter', '610 Sunset Dr.', 'Wahoo', 'NE', '68066', '330');
INSERT INTO tblStudent
VALUES ('020', 'Artz', 'Jacob', '229 W. 5th', 'Ionia', 'IA', '50645', '217');
INSERT INTO tblStudent
VALUES ('022', 'Long', 'Jason', '777 Elm', 'Clarinda', 'IA', '51632', '555');
INSERT INTO tblStudent
VALUES ('025', 'Caputo', 'Heather', '111 E. Vine', 'Corning', 'IA', '50841', '315');
INSERT INTO tblStudent
VALUES ('030', 'Otte', 'Elizabeth', '347 Pine Drive', 'Emporia', 'KS', '66801', '330');
INSERT INTO tblStudent
VALUES ('037', 'Meinters', 'Kenneth', '220 Garfield', 'Kansas City', 'MO', '64111', '932');
INSERT INTO tblStudent
VALUES ('040', 'Anderson', 'Belinda', '5,The Penthouse', 'Kansas City', 'MO', '64108', '520');
INSERT INTO tblStudent
VALUES ('045', 'Wilmes', 'Travis', '923 Redbud', 'Maryville', 'MO', '64468', '280');
INSERT INTO tblStudent
VALUES ('051', 'Herod', 'Scott', '557 Maple Ave.', 'Olin', 'IA', '52320', '345');
INSERT INTO tblStudent
VALUES ('056', 'Lewis', 'Sean', '324 Yorkshire', 'Pella', 'IA', '50219', '330');
INSERT INTO tblStudent
VALUES ('062', 'Anderson', 'Cherie', '111 Ravine Ave.', 'Hutchinson', 'KS', '67501', '444');
INSERT INTO tblStudent
VALUES ('067', 'Rodriguez', 'Roberto', '322 Ridgedale', 'Maryville', 'MO', '64468', '184');
INSERT INTO tblStudent
VALUES ('073', 'Gray', 'Clarissa', '433 Grant', 'Stockton', 'IA', '52769', '184');
INSERT INTO tblStudent
VALUES ('078', 'Fong', 'Jesse', '819 Perry Hill', 'Manhattan', 'KS', '66502', '950');
INSERT INTO tblStudent
VALUES ('082', 'Dosland', 'Megan', '99 Friendly Ln.', 'Kansas City', 'MO', '64111', '500');
INSERT INTO tblStudent
VALUES ('089', 'Stephens', 'Laurie', '23 Hancock', 'Kansas City', 'MO', '64113', '182');
INSERT INTO tblStudent
VALUES ('094', 'Smith', 'Lucille', '222 Mason Ave.', 'New Hampton', 'IA', '50659', '101');
INSERT INTO tblStudent
VALUES ('356', 'Anderson', 'Rebecca', '316 E. 6th', 'Brockton', 'MA', '02401', '131');
INSERT INTO tblStudent
VALUES ('357', 'Bauman', 'Michael', '617 Prather', 'Kansas City', 'MO', '64138', '300');
INSERT INTO tblStudent
VALUES ('358', 'Buckingham', 'Michael', '400 Stanley Ct.', 'Glade', 'KS', '67639', '444');
INSERT INTO tblStudent
VALUES ('362', 'Esler', 'Darrin', '101 Ken Pl.', 'Tracy', 'IA', '50256', '819');
INSERT INTO tblStudent
VALUES ('377', 'Benson', 'Mary', '2001 Wilson', 'Maryville', 'MO', '64468', '510');
INSERT INTO tblStudent
VALUES ('380', 'Davis', 'Amanda', '444 Azalea Dr.', 'Maryville', 'MO', '64468', '315');
INSERT INTO tblStudent
VALUES ('390', 'Vicker', 'Cher', '324 Kennedy', 'Kansas City', 'MO', '64113', '417');
INSERT INTO tblStudent
VALUES ('400', 'Soda', 'Russell', '555 Maple', 'Topeka', 'KS', '66601', '206');
INSERT INTO tblStudent
VALUES ('401', 'Dew', 'Jennifer', '201 N. Main', 'Maryville', 'MO', '64468', '982');
INSERT INTO tblStudent
VALUES ('402', 'Milks', 'Crystal', '110 Dewey', 'Lamoni', 'IA', '50140', '982');
INSERT INTO tblStudent
VALUES ('403', 'Smith', 'Gergory', '3220 Exeter', 'Stewartsville', 'MO', '64490', '960');
INSERT INTO tblStudent
VALUES ('406', 'Younger', 'Jennifer', '326 N. Grand', 'Kansas City', 'MO', '64111', '181');
INSERT INTO tblStudent
VALUES ('407', 'Wagers', 'William', '777 W. Torrance', 'Cedar Rapids', 'IA', '52406', '510');
INSERT INTO tblStudent
VALUES ('408', 'Klotz', 'Curtis', '324 Empire', 'Maryville', 'MO', '64468', '960');
INSERT INTO tblStudent
VALUES ('412', 'Donaldson', 'Sue', '312 N. 5th', 'Maryville', 'MO', '64468', '206');
INSERT INTO tblStudent
VALUES ('420', 'Anderson', 'Nicole', '59 Freed Ct.', 'Maryville', 'MO', '64468', '200');
INSERT INTO tblStudent
VALUES ('421', 'Supinger', 'Stephanie', 'Route 1', 'Kansas City', 'MO', '64111', '420');
INSERT INTO tblStudent
VALUES ('426', 'Benson', 'David', '322 Hwy 71 N.', 'Maryville', 'MO', '64468', '330');
INSERT INTO tblStudent
VALUES ('427', 'Scheiber', 'Jennifer', '1442 Quivira', 'Maryville', 'MO', '64468', '203');
INSERT INTO tblStudent
VALUES ('428', 'Jones', 'Nicole', '325 N. 7th Ave.', 'Wichita', 'KS', '67208', '200');
INSERT INTO tblStudent
VALUES ('429', 'Chan', 'Bill', '325 Hillport', 'Kansas City', 'MO', '64105', '425');
INSERT INTO tblStudent
VALUES ('433', 'Lopez', 'Joe', '555 Wyatt', 'Kansas City', 'MO', '64112', '420');
INSERT INTO tblStudent
VALUES ('437', 'Doane', 'Rebecca', '515 E. 7th Blvd', 'Elkhorn', 'NE', '68022', '500');
INSERT INTO tblStudent
VALUES ('438', 'Willey', 'Jenny', '9339 Jefferson', 'Waterloo', 'IA', '50706', '820');
INSERT INTO tblStudent
VALUES ('439', 'Cave', 'Odessa', '21 Rex Ave. NE', 'Kansas City', 'MO', '64111', '345');
INSERT INTO tblStudent
VALUES ('450', 'Hellebuyck', 'Jeremy', '505 Grand Ave.', 'Maryville', 'MO', '64468', '330');
INSERT INTO tblStudent
VALUES ('460', 'Brejnik', 'Steven', '1229 Buchanan', 'Kansas City', 'MO', '64126', '515');
INSERT INTO tblStudent
VALUES ('461', 'Gaffney', 'Michelle', '34 Daisy Circle', 'Barnard', 'MO', '64423', '500');
INSERT INTO tblStudent
VALUES ('462', 'Garcia', 'Ryan', '111 Frey Ave.', 'Kansas City', 'MO', '64168', '510');
INSERT INTO tblStudent
VALUES ('463', 'Reed', 'Lisa', '23 Ironwood', 'Kansas City', 'KS', '66105', '330');
INSERT INTO tblStudent
VALUES ('464', 'Chavez', 'Robert', '943 Adams', 'Brockton', 'MA', '02403', '102');
INSERT INTO tblStudent
VALUES ('465', 'White', 'Rose', '444 Dogwood', 'Kansas City', 'MO', '64114', '203');
INSERT INTO tblStudent
VALUES ('466', 'Stiens', 'John', '145 Hillcrest', 'Junction City', 'KS', '66441', '444');
INSERT INTO tblStudent
VALUES ('469', 'Egbert', 'Josph', '3 Ponderosa Dr.', 'Bedford', 'IA', '50833', '420');
INSERT INTO tblStudent
VALUES ('500', 'Wood', 'William', '35 E. Mulberry', 'Salina', 'KS', '67401', '280');
INSERT INTO tblStudent
VALUES ('501', 'Bass', 'Chad', 'Route 1 Box 302', 'Maryville', 'MO', '64468', '101');
INSERT INTO tblStudent
VALUES ('502', 'Slater', 'Brenda', '666 Oak', 'Maryville', 'MO', '64468', '184');
INSERT INTO tblStudent
VALUES ('503', 'Combs', 'Jeff', '1 Schoen Ave.', 'PLANO', 'IA', '52581', '444');
INSERT INTO tblStudent
VALUES ('510', 'Boone', 'Michael', '407 Fisher Dr.', 'Kansas City', 'MO', '64138', '947');
INSERT INTO tblStudent
VALUES ('511', 'Houseworth', 'Ryan', '122 S. Linn', 'Maryville', 'MO', '64468', '932');
INSERT INTO tblStudent
VALUES ('512', 'Marinakas', 'Frank', '789 Hillridge', 'Craig', 'MO', '64437', '182');
INSERT INTO tblStudent
VALUES ('520', 'Wesack', 'Mitch', '523 W. 5th', 'Maryville', 'MO', '64468', '526');
INSERT INTO tblStudent
VALUES ('521', 'Brune', 'Lisa', '1234 Birch St.', 'Kansas City', 'MO', '64113', '420');
INSERT INTO tblStudent
VALUES ('522', 'Kopriva', 'Larry', '1234 Johns St.', 'Platte City', 'MO', '64079', '101');
INSERT INTO tblStudent
VALUES ('615', 'Copp', 'Joshua', '402 W. Third', 'Sioux City', 'IA', '51102', '932');
INSERT INTO tblStudent
VALUES ('616', 'Lam', 'Kenneth', '4444 Prospect', 'Kansas City', 'MO', '64118', '190');
INSERT INTO tblStudent
VALUES ('720', 'O''Rourke', 'Craig', 'Rte. 2, Box 63D', 'Des Moines', 'IA', '50316', '217');
INSERT INTO tblStudent
VALUES ('731', 'Freeman', 'Timothe', '3478 Truman', 'Brockton', 'MA', '02402', '982');
INSERT INTO tblStudent
VALUES ('746', 'Reistroffer', 'Joseph', '724 Metcalf', 'Kansas City', 'MO', '64126', '345');
INSERT INTO tblStudent
VALUES ('752', 'Kent', 'Jason', '3449 Barry Rd.', 'Davenport', 'IA', '52805', '960');
INSERT INTO tblStudent
VALUES ('766', 'Blain', 'Cynthia', '515 Clover', 'Kansas City', 'KS', '66101', '512');
INSERT INTO tblStudent
VALUES ('801', 'Smith', 'Amy', '214 Hughes', 'Maryville', 'MO', '64468', '345');
INSERT INTO tblStudent
VALUES ('830', 'Adwell', 'William', '8833 E. 5th', 'Lawrence', 'KS', '66044', '203');
INSERT INTO tblStudent
VALUES ('834', 'McClain', 'Matthew', '45 Parkdale', 'Gower', 'MO', '64454', '131');
INSERT INTO tblStudent
VALUES ('870', 'Cox', 'Joe', '312 Mulberry', 'Maryville', 'MO', '64468', '101');
INSERT INTO tblStudent
VALUES ('875', 'Anderson', 'Heather', '704 S. Roe', 'Maryville', 'MO', '64468', '181');
INSERT INTO tblStudent
VALUES ('876', 'Teague', 'Tracy', '73 Macomber', 'Kansas City', 'MO', '64126', '201');
INSERT INTO tblStudent
VALUES ('901', 'Combs', 'Stephanie', '99 Holland St.', 'Columbia', 'MO', '65201', '330');
INSERT INTO tblStudent
VALUES ('910', 'Lough', 'Ryan', '222 Zehman Ct', 'Maryville', 'MO', '64468', '444');
INSERT INTO tblStudent
VALUES ('911', 'White', 'Robert', '3 Indiana Ave.', 'Kansas City', 'MO', '64133', '184');
INSERT INTO tblStudent
VALUES ('943', 'White', 'Theresa', '32 Wymore Ave.', 'Conception', 'MO', '64433', '526');
INSERT INTO tblStudent
VALUES ('944', 'Cathcart', 'Amy', '14 Jewell Ave.', 'Kansas City', 'MO', '64111', '526');


INSERT INTO tblTranscript
VALUES ('002', '19', '111', 'A', 'Fall', 1991, '190');
INSERT INTO tblTranscript
VALUES ('002', '20', '130', 'B', 'Spring', 1992, '101');
INSERT INTO tblTranscript
VALUES ('002', '43', '101', 'A', 'Spring', 1992, '280');
INSERT INTO tblTranscript
VALUES ('002', '43', '310', 'B', 'Fall', 1992, '280');
INSERT INTO tblTranscript
VALUES ('003', '19', '111', 'C', 'Fall', 1992, '181');
INSERT INTO tblTranscript
VALUES ('020', '19', '111', 'C', 'Fall', 1992, '201');
INSERT INTO tblTranscript
VALUES ('020', '20', '130', 'C', 'Fall', 1992, '444');
INSERT INTO tblTranscript
VALUES ('020', '51', '201', 'B', 'Fall', 1992, '217');
INSERT INTO tblTranscript
VALUES ('045', '43', '101', 'A', 'Fall', 1991, '512');
INSERT INTO tblTranscript
VALUES ('045', '43', '310', 'B', 'Spring', 1992, '532');
INSERT INTO tblTranscript
VALUES ('051', '03', '102', 'B', 'Fall', 1991, '330');
INSERT INTO tblTranscript
VALUES ('051', '15', '120', 'B', 'Fall', 1991, '345');
INSERT INTO tblTranscript
VALUES ('051', '15', '121', 'B', 'Spring', 1992, '947');
INSERT INTO tblTranscript
VALUES ('051', '15', '215', 'A', 'Spring', 1992, '203');
INSERT INTO tblTranscript
VALUES ('051', '15', '311', 'B', 'Fall', 1992, '200');
INSERT INTO tblTranscript
VALUES ('051', '16', '432', 'C', 'Fall', 1992, '345');
INSERT INTO tblTranscript
VALUES ('051', '16', '561', 'A', 'Fall', 1992, '345');
INSERT INTO tblTranscript
VALUES ('051', '19', '111', 'C', 'Fall', 1991, '201');
INSERT INTO tblTranscript
VALUES ('051', '20', '130', 'A', 'Fall', 1991, '555');
INSERT INTO tblTranscript
VALUES ('051', '43', '101', 'C', 'Fall', 1991, '532');
INSERT INTO tblTranscript
VALUES ('062', '19', '111', 'D', 'Spring', 1992, '181');
INSERT INTO tblTranscript
VALUES ('073', '03', '102', 'A', 'Fall', 1992, '330');
INSERT INTO tblTranscript
VALUES ('073', '04', '155', 'B', 'Fall', 1992, '330');
INSERT INTO tblTranscript
VALUES ('073', '19', '111', 'C', 'Fall', 1992, '201');
INSERT INTO tblTranscript
VALUES ('073', '20', '130', 'B', 'Fall', 1992, '101');
INSERT INTO tblTranscript
VALUES ('078', '19', '111', 'C', 'Spring', 1991, '190');
INSERT INTO tblTranscript
VALUES ('078', '20', '130', 'F', 'Spring', 1992, '101');
INSERT INTO tblTranscript
VALUES ('078', '43', '101', 'D', 'Spring', 1992, '280');
INSERT INTO tblTranscript
VALUES ('082', '19', '111', 'B', 'Summer', 1991, '201');
INSERT INTO tblTranscript
VALUES ('082', '20', '130', 'A', 'Fall', 1991, '982');
INSERT INTO tblTranscript
VALUES ('082', '26', '102', 'A', 'Spring', 1992, '950');
INSERT INTO tblTranscript
VALUES ('082', '38', '120', 'A', 'Fall', 1991, '500');
INSERT INTO tblTranscript
VALUES ('082', '38', '320', 'B', 'Spring', 1992, '206');
INSERT INTO tblTranscript
VALUES ('082', '38', '330', 'A', 'Fall', 1992, '203');
INSERT INTO tblTranscript
VALUES ('094', '15', '120', 'A', 'Spring', 1991, '947');
INSERT INTO tblTranscript
VALUES ('094', '19', '111', 'A', 'Fall', 1990, '201');
INSERT INTO tblTranscript
VALUES ('094', '20', '130', 'A', 'Summer', 1990, '982');
INSERT INTO tblTranscript
VALUES ('094', '20', '131', 'A', 'Summer', 1990, '444');
INSERT INTO tblTranscript
VALUES ('094', '20', '230', 'A', 'Fall', 1990, '555');
INSERT INTO tblTranscript
VALUES ('094', '20', '249', 'A', 'Spring', 1991, '555');
INSERT INTO tblTranscript
VALUES ('094', '20', '250', 'A', 'Spring', 1991, '101');
INSERT INTO tblTranscript
VALUES ('094', '20', '325', 'A', 'Spring', 1992, '444');
INSERT INTO tblTranscript
VALUES ('094', '20', '345', 'A', 'Fall', 1991, '960');
INSERT INTO tblTranscript
VALUES ('094', '20', '347', 'A', 'Fall', 1991, '444');
INSERT INTO tblTranscript
VALUES ('094', '20', '349', 'A', 'Spring', 1992, '982');
INSERT INTO tblTranscript
VALUES ('094', '20', '525', 'A', 'Fall', 1992, '444');
INSERT INTO tblTranscript
VALUES ('094', '20', '548', 'A', 'Fall', 1992, '101');
INSERT INTO tblTranscript
VALUES ('094', '20', '567', 'A', 'Fall', 1992, '555');
INSERT INTO tblTranscript
VALUES ('094', '26', '102', 'A', 'Fall', 1990, '131');
INSERT INTO tblTranscript
VALUES ('357', '18', '103', 'B', 'Fall', 1991, '417');
INSERT INTO tblTranscript
VALUES ('357', '18', '223', 'B', 'Spring', 1992, '300');
INSERT INTO tblTranscript
VALUES ('357', '18', '312', 'B', 'Spring', 1992, '182');
INSERT INTO tblTranscript
VALUES ('357', '18', '332', 'B', 'Fall', 1992, '300');
INSERT INTO tblTranscript
VALUES ('357', '19', '111', 'B', 'Summer', 1991, '190');
INSERT INTO tblTranscript
VALUES ('357', '20', '130', 'C', 'Summer', 1991, '960');
INSERT INTO tblTranscript
VALUES ('357', '20', '131', 'C', 'Fall', 1991, '101');
INSERT INTO tblTranscript
VALUES ('357', '20', '230', 'A', 'Spring', 1992, '444');
INSERT INTO tblTranscript
VALUES ('357', '20', '347', 'B', 'Fall', 1992, '101');
INSERT INTO tblTranscript
VALUES ('357', '26', '102', 'C', 'Fall', 1991, '950');
INSERT INTO tblTranscript
VALUES ('357', '37', '114', 'B', 'Spring', 1994, '555');
INSERT INTO tblTranscript
VALUES ('357', '43', '101', 'A', 'Fall', 1991, '512');
INSERT INTO tblTranscript
VALUES ('362', '19', '111', 'A', 'Fall', 1992, '201');
INSERT INTO tblTranscript
VALUES ('362', '20', '130', 'B', 'Fall', 1992, '444');
INSERT INTO tblTranscript
VALUES ('362', '70', '120', 'C', 'Fall', 1992, '819');
INSERT INTO tblTranscript
VALUES ('401', '19', '111', 'C', 'Fall', 1991, '181');
INSERT INTO tblTranscript
VALUES ('401', '20', '130', 'C', 'Fall', 1991, '555');
INSERT INTO tblTranscript
VALUES ('401', '51', '201', 'D', 'Fall', 1991, '510');
INSERT INTO tblTranscript
VALUES ('401', '51', '202', 'D', 'Spring', 1992, '520');
INSERT INTO tblTranscript
VALUES ('401', '51', '301', 'F', 'Fall', 1992, '520');
INSERT INTO tblTranscript
VALUES ('406', '19', '111', 'A', 'Fall', 1991, '201');
INSERT INTO tblTranscript
VALUES ('406', '19', '220', 'A', 'Spring', 1992, '190');
INSERT INTO tblTranscript
VALUES ('406', '19', '234', 'C', 'Spring', 1992, '181');
INSERT INTO tblTranscript
VALUES ('406', '19', '314', 'B', 'Fall', 1992, '190');
INSERT INTO tblTranscript
VALUES ('406', '20', '130', 'B', 'Fall', 1991, '555');
INSERT INTO tblTranscript
VALUES ('407', '19', '111', 'A', 'Fall', 1991, '181');
INSERT INTO tblTranscript
VALUES ('407', '20', '130', 'C', 'Summer', 1991, '960');
INSERT INTO tblTranscript
VALUES ('407', '43', '101', 'B', 'Fall', 1991, '280');
INSERT INTO tblTranscript
VALUES ('407', '51', '201', 'C', 'Fall', 1991, '515');
INSERT INTO tblTranscript
VALUES ('407', '52', '120', 'B', 'Fall', 1991, '515');
INSERT INTO tblTranscript
VALUES ('407', '52', '324', 'B', 'Spring', 1992, '217');
INSERT INTO tblTranscript
VALUES ('407', '52', '326', 'A', 'Fall', 1992, '510');
INSERT INTO tblTranscript
VALUES ('420', '03', '102', 'A', 'Fall', 1992, '330');
INSERT INTO tblTranscript
VALUES ('420', '14', '114', 'A', 'Fall', 1992, '203');
INSERT INTO tblTranscript
VALUES ('421', '19', '111', 'B', 'Summer', 1991, '201');
INSERT INTO tblTranscript
VALUES ('421', '20', '130', 'B', 'Spring', 1991, '982');
INSERT INTO tblTranscript
VALUES ('421', '62', '351', 'B', 'Fall', 1991, '315');
INSERT INTO tblTranscript
VALUES ('421', '62', '353', 'C', 'Spring', 1992, '420');
INSERT INTO tblTranscript
VALUES ('421', '62', '451', 'B', 'Fall', 1992, '420');
INSERT INTO tblTranscript
VALUES ('460', '19', '111', 'C', 'Fall', 1991, '201');
INSERT INTO tblTranscript
VALUES ('460', '20', '130', 'D', 'Fall', 1991, '960');
INSERT INTO tblTranscript
VALUES ('461', '03', '102', 'A', 'Fall', 1988, '330');
INSERT INTO tblTranscript
VALUES ('461', '19', '111', 'A', 'Fall', 1988, '181');
INSERT INTO tblTranscript
VALUES ('461', '38', '120', 'B', 'Fall', 1988, '526');
INSERT INTO tblTranscript
VALUES ('463', '03', '102', 'A', 'Fall', 1991, '330');
INSERT INTO tblTranscript
VALUES ('463', '03', '310', 'A', 'Fall', 1992, '330');
INSERT INTO tblTranscript
VALUES ('463', '04', '155', 'B', 'Fall', 1991, '330');
INSERT INTO tblTranscript
VALUES ('464', '37', '532', 'D', 'fall', 1993, '101');
INSERT INTO tblTranscript
VALUES ('466', '03', '102', 'B', 'Spring', 1992, '330');
INSERT INTO tblTranscript
VALUES ('466', '19', '111', 'B', 'Spring', 1992, '201');
INSERT INTO tblTranscript
VALUES ('466', '20', '130', 'B', 'Spring', 1992, '960');
INSERT INTO tblTranscript
VALUES ('466', '20', '131', 'B', 'Fall', 1992, '982');
INSERT INTO tblTranscript
VALUES ('500', '14', '114', 'B', 'Fall', 1991, '200');
INSERT INTO tblTranscript
VALUES ('500', '19', '111', 'C', 'Fall', 1991, '181');
INSERT INTO tblTranscript
VALUES ('500', '26', '110', 'C', 'Fall', 1991, '131');
INSERT INTO tblTranscript
VALUES ('500', '43', '225', 'C', 'Spring', 1992, '532');
INSERT INTO tblTranscript
VALUES ('500', '43', '230', 'A', 'Spring', 1992, '512');
INSERT INTO tblTranscript
VALUES ('500', '43', '310', 'B', 'Fall', 1992, '532');
INSERT INTO tblTranscript
VALUES ('501', '03', '102', 'C', 'Spring', 1991, '330');
INSERT INTO tblTranscript
VALUES ('501', '18', '103', 'C', 'Fall', 1991, '182');
INSERT INTO tblTranscript
VALUES ('501', '19', '111', 'C', 'Spring', 1991, '190');
INSERT INTO tblTranscript
VALUES ('501', '19', '314', 'B', 'Fall', 1991, '181');
INSERT INTO tblTranscript
VALUES ('501', '20', '130', 'C', 'Spring', 1991, '982');
INSERT INTO tblTranscript
VALUES ('501', '20', '131', 'C', 'Spring', 1991, '444');
INSERT INTO tblTranscript
VALUES ('501', '26', '181', 'C', 'Fall', 1991, '102');
INSERT INTO tblTranscript
VALUES ('510', '15', '120', 'B', 'Spring', 1990, '200');
INSERT INTO tblTranscript
VALUES ('510', '15', '121', 'A', 'Fall', 1990, '200');
INSERT INTO tblTranscript
VALUES ('510', '15', '215', 'A', 'Fall', 1991, '947');
INSERT INTO tblTranscript
VALUES ('510', '19', '111', 'B', 'Fall', 1990, '181');
INSERT INTO tblTranscript
VALUES ('510', '20', '130', 'B', 'Fall', 1990, '101');
INSERT INTO tblTranscript
VALUES ('830', '14', '114', 'A', 'Fall', 1991, '200');
INSERT INTO tblTranscript
VALUES ('830', '14', '530', 'B', 'Spring', 1992, '345');
INSERT INTO tblTranscript
VALUES ('830', '14', '535', 'B', 'Fall', 1992, '947');
INSERT INTO tblTranscript
VALUES ('830', '19', '111', 'C', 'Fall', 1991, '201');
INSERT INTO tblTranscript
VALUES ('830', '20', '130', 'A', 'Fall', 1991, '101');
INSERT INTO tblTranscript
VALUES ('830', '20', '131', 'B', 'Fall', 1991, '960');
INSERT INTO tblTranscript
VALUES ('910', '19', '111', 'A', 'Spring', 1991, '181');
INSERT INTO tblTranscript
VALUES ('910', '20', '130', 'A', 'Spring', 1991, '101');
INSERT INTO tblTranscript
VALUES ('910', '20', '131', 'B', 'Summer', 1992, '960');
INSERT INTO tblTranscript
VALUES ('910', '20', '230', 'B', 'Fall', 1992, '444');
INSERT INTO tblTranscript
VALUES ('911', '03', '102', 'B', 'Fall', 1992, '330');
INSERT INTO tblTranscript
VALUES ('911', '14', '114', 'C', 'Fall', 1992, '203');
INSERT INTO tblTranscript
VALUES ('911', '18', '103', 'C', 'Spring', 1992, '425');
INSERT INTO tblTranscript
VALUES ('911', '20', '130', 'B', 'Fall', 1992, '555');
INSERT INTO tblTranscript
VALUES ('911', '20', '131', 'B', 'Fall', 1992, '444');
INSERT INTO tblTranscript
VALUES ('911', '26', '102', 'A', 'Spring', 1992, '131');
INSERT INTO tblTranscript
VALUES ('943', '19', '111', 'A', 'Fall', 1991, '201');
INSERT INTO tblTranscript
VALUES ('943', '20', '130', 'B', 'Fall', 1991, '982');
INSERT INTO tblTranscript
VALUES ('943', '37', '114', 'C', 'Fall', 1991, '101');
INSERT INTO tblTranscript
VALUES ('943', '37', '322', 'D', 'Spring', 1992, '555');
INSERT INTO tblTranscript
VALUES ('943', '37', '342', 'C', 'Fall', 1992, '444');

INSERT INTO tblStudentProgram
VALUES ('002', '43');

INSERT INTO tblStudentProgram
VALUES ('003', '04');

INSERT INTO tblStudentProgram
VALUES ('020', '51');

INSERT INTO tblStudentProgram
VALUES ('022', '34');

INSERT INTO tblStudentProgram
VALUES ('025', '37');

INSERT INTO tblStudentProgram
VALUES ('030', '03');

INSERT INTO tblStudentProgram
VALUES ('037', '70');

INSERT INTO tblStudentProgram
VALUES ('040', '51');

INSERT INTO tblStudentProgram
VALUES ('045', '43');

INSERT INTO tblStudentProgram
VALUES ('051', '16');

INSERT INTO tblStudentProgram
VALUES ('056', '03');

INSERT INTO tblStudentProgram
VALUES ('062', '20');

INSERT INTO tblStudentProgram
VALUES ('067', '12');

INSERT INTO tblStudentProgram
VALUES ('073', '12');

INSERT INTO tblStudentProgram
VALUES ('078', '26');

INSERT INTO tblStudentProgram
VALUES ('082', '38');

INSERT INTO tblStudentProgram
VALUES ('089', '18');

INSERT INTO tblStudentProgram
VALUES ('094', '20');

INSERT INTO tblStudentProgram
VALUES ('356', '26');

INSERT INTO tblStudentProgram
VALUES ('357', '18');

INSERT INTO tblStudentProgram
VALUES ('357', '37');

INSERT INTO tblStudentProgram
VALUES ('358', '20');

INSERT INTO tblStudentProgram
VALUES ('362', '70');

INSERT INTO tblStudentProgram
VALUES ('377', '52');

INSERT INTO tblStudentProgram
VALUES ('380', '62');

INSERT INTO tblStudentProgram
VALUES ('390', '18');

INSERT INTO tblStudentProgram
VALUES ('400', '38');

INSERT INTO tblStudentProgram
VALUES ('401', '34');

INSERT INTO tblStudentProgram
VALUES ('402', '34');

INSERT INTO tblStudentProgram
VALUES ('403', '35');

INSERT INTO tblStudentProgram
VALUES ('406', '19');

INSERT INTO tblStudentProgram
VALUES ('407', '52');

INSERT INTO tblStudentProgram
VALUES ('408', '35');

INSERT INTO tblStudentProgram
VALUES ('412', '38');

INSERT INTO tblStudentProgram
VALUES ('420', '15');

INSERT INTO tblStudentProgram
VALUES ('421', '62');

INSERT INTO tblStudentProgram
VALUES ('426', '04');

INSERT INTO tblStudentProgram
VALUES ('427', '15');

INSERT INTO tblStudentProgram
VALUES ('428', '14');

INSERT INTO tblStudentProgram
VALUES ('429', '18');

INSERT INTO tblStudentProgram
VALUES ('433', '62');

INSERT INTO tblStudentProgram
VALUES ('437', '38');

INSERT INTO tblStudentProgram
VALUES ('438', '12');

INSERT INTO tblStudentProgram
VALUES ('439', '14');

INSERT INTO tblStudentProgram
VALUES ('450', '04');

INSERT INTO tblStudentProgram
VALUES ('460', '52');

INSERT INTO tblStudentProgram
VALUES ('461', '38');

INSERT INTO tblStudentProgram
VALUES ('462', '52');

INSERT INTO tblStudentProgram
VALUES ('463', '03');

INSERT INTO tblStudentProgram
VALUES ('464', '26');

INSERT INTO tblStudentProgram
VALUES ('465', '15');

INSERT INTO tblStudentProgram
VALUES ('466', '20');

INSERT INTO tblStudentProgram
VALUES ('469', '62');

INSERT INTO tblStudentProgram
VALUES ('500', '43');

INSERT INTO tblStudentProgram
VALUES ('501', '20');

INSERT INTO tblStudentProgram
VALUES ('502', '12');

INSERT INTO tblStudentProgram
VALUES ('503', '20');

INSERT INTO tblStudentProgram
VALUES ('510', '14');

INSERT INTO tblStudentProgram
VALUES ('511', '70');

INSERT INTO tblStudentProgram
VALUES ('512', '18');

INSERT INTO tblStudentProgram
VALUES ('520', '37');

INSERT INTO tblStudentProgram
VALUES ('521', '62');

INSERT INTO tblStudentProgram
VALUES ('522', '20');

INSERT INTO tblStudentProgram
VALUES ('615', '70');

INSERT INTO tblStudentProgram
VALUES ('616', '19');

INSERT INTO tblStudentProgram
VALUES ('720', '51');

INSERT INTO tblStudentProgram
VALUES ('731', '34');

INSERT INTO tblStudentProgram
VALUES ('746', '16');

INSERT INTO tblStudentProgram
VALUES ('752', '35');

INSERT INTO tblStudentProgram
VALUES ('766', '43');

INSERT INTO tblStudentProgram
VALUES ('801', '14');

INSERT INTO tblStudentProgram
VALUES ('830', '15');

INSERT INTO tblStudentProgram
VALUES ('834', '26');

INSERT INTO tblStudentProgram
VALUES ('870', '20');

INSERT INTO tblStudentProgram
VALUES ('875', '19');

INSERT INTO tblStudentProgram
VALUES ('876', '19');

INSERT INTO tblStudentProgram
VALUES ('901', '04');

INSERT INTO tblStudentProgram
VALUES ('910', '20');

INSERT INTO tblStudentProgram
VALUES ('911', '12');

INSERT INTO tblStudentProgram
VALUES ('943', '37');

INSERT INTO tblStudentProgram
VALUES ('944', '37');