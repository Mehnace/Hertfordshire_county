-- CREATING A DATABASE --

CREATE DATABASE HertfordshireCounty
;


-- USING A DATABASE --

USE HertfordshireCounty
;


CREATE TABLE Residents (
    ResidentID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Age INT,
    AddressID INT
);

CREATE TABLE Properties (
    PropertyID INT PRIMARY KEY,
    AddressID INT,
    Street NVARCHAR(100),
    City NVARCHAR(50),
    PostalCode NVARCHAR(10),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    ResidentID INT,
    JobTitle NVARCHAR(50),
    Company NVARCHAR(50),
    Salary DECIMAL(18, 2)
);

CREATE TABLE Schools (
    SchoolID INT PRIMARY KEY,
    SchoolName NVARCHAR(100),
    AddressID INT,
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);


-- INSERTING DATA --


INSERT INTO Residents VALUES
(1, 'Adeola', 'Oluwaseun', 35, 101), 
(2, 'Li', 'Wei', 28, 102),           
(3, 'Priya', 'Singh', 45, 103),      
(4, 'Aisha', 'Khan', 32, 104),       
(5, 'John', 'Smith', 40, 105),       
(6, 'Chinedu', 'Nwosu', 29, 106),    
(7, 'Wang', 'Jie', 38, 107),         
(8, 'Anil', 'Patel', 50, 108),       
(9, 'Fatima', 'Ahmed', 33, 109),     
(10, 'James', 'Brown', 25, 110);     

INSERT INTO Properties VALUES
(101, 101, '123 Elm St', 'Watford', 'WD17 1AA', 51.655395, -0.396682),
(102, 102, '456 Oak St', 'St Albans', 'AL1 2AB', 51.75159, -0.33604),
(103, 103, '789 Pine St', 'Hertford', 'SG14 1HZ', 51.79679, -0.07847),
(104, 104, '101 Maple St', 'Hemel Hempstead', 'HP1 1HW', 51.75232, -0.47204),
(105, 105, '202 Birch St', 'Hatfield', 'AL10 9AB', 51.76266, -0.22463),
(106, 106, '303 Cedar St', 'Stevenage', 'SG1 1XZ', 51.90345, -0.20189),
(107, 107, '404 Spruce St', 'Welwyn Garden City', 'AL8 6YX', 51.80352, -0.20685),
(108, 108, '505 Fir St', 'Cheshunt', 'EN8 9XY', 51.70109, -0.03452),
(109, 109, '606 Palm St', 'Bishop’s Stortford', 'CM23 3XY', 51.87151, 0.16519),
(110, 110, '707 Willow St', 'Hoddesdon', 'EN11 8JY', 51.75912, -0.01133);

INSERT INTO Jobs VALUES
(1, 1, 'Software Engineer', 'TechCorp', 55000),
(2, 2, 'Data Analyst', 'DataCorp', 48000),
(3, 3, 'Project Manager', 'BuildCorp', 75000),
(4, 4, 'HR Manager', 'PeopleCorp', 62000),
(5, 5, 'Marketing Specialist', 'MarketCorp', 50000),
(6, 6, 'Sales Associate', 'SellCorp', 40000),
(7, 7, 'Product Manager', 'ProdCorp', 68000),
(8, 8, 'Consultant', 'ConsultCorp', 72000),
(9, 9, 'Research Scientist', 'ResearchCorp', 77000),
(10, 10, 'Financial Analyst', 'FinanceCorp', 54000);

INSERT INTO Schools VALUES
(1, 'Watford Grammar School', 101, 51.65452, -0.39553),
(2, 'St Albans High School', 102, 51.75194, -0.33615),
(3, 'Hertford East School', 103, 51.79653, -0.07782),
(4, 'Hemel Hempstead School', 104, 51.75196, -0.47115),
(5, 'Hatfield Academy', 105, 51.76234, -0.22401),
(6, 'Stevenage Primary', 106, 51.90329, -0.20095),
(7, 'Welwyn Garden School', 107, 51.80344, -0.20621),
(8, 'Cheshunt Learning Centre', 108, 51.70058, -0.03391),
(9, 'Bishop’s Stortford College', 109, 51.87126, 0.16597),
(10, 'Hoddesdon School', 110, 51.75877, -0.01077);


-- SELECT STATEMENT --

SELECT * FROM Residents
;


-- SELECT DISTINCT --

SELECT DISTINCT City FROM Properties
;

-- WHERE CLAUSE --

SELECT * FROM Residents WHERE Age > 30
;


-- Comparison operators --

SELECT * FROM Jobs WHERE Salary >= 50000
;


-- LOGICAL OPERATORS AND, OR, NOT --


SELECT * FROM Residents 
WHERE Age > 25 AND AddressID = 101
;

SELECT * FROM Jobs
WHERE JobTitle = 'Software Engineer' OR Salary > 50000
;

SELECT * FROM Properties
WHERE NOT City = 'Watford'
;


-- LIKE Statement --

SELECT * FROM Residents
WHERE LastName LIKE 'S%'
;

-- GROUP BY and ORDER BY --

SELECT City, COUNT(*) AS NumProperties 
FROM Properties GROUP BY City
;

SELECT * FROM Jobs 
ORDER BY Salary DESC
;


-- HAVING CLAUSE --

SELECT City, COUNT(*) AS NumProperties 
FROM Properties 
GROUP BY City 
HAVING COUNT(*) > 1
;


-- LIMIT and AS --

SELECT TOP 2 * FROM Residents
;

SELECT FirstName AS GivenName, LastName AS Surname
FROM Residents
;


-- JOINS --

SELECT R.FirstName, R.LastName, P.City FROM Residents R
JOIN Properties P ON R.AddressID = P.AddressID
;


SELECT R.FirstName, R.LastName, P.Street, J.JobTitle, S.SchoolName
FROM Residents R
JOIN Properties P ON R.AddressID = P.AddressID
JOIN Jobs J ON R.ResidentID = J.ResidentID
JOIN Schools S ON P.AddressID = S.AddressID
;

-- UNIONS --

SELECT FirstName, LastName
FROM Residents
UNION
SELECT JobTitle, Company
FROM Jobs
;


-- String Functions --

SELECT LEN(FirstName) AS NameLength 
FROM Residents
;

SELECT UPPER(LastName) 
FROM Residents
;

SELECT LOWER(LastName) 
FROM Residents
;

SELECT LTRIM(RTRIM(FirstName)) 
FROM Residents
;

SELECT LEFT(FirstName, 3) 
FROM Residents
;

SELECT RIGHT(LastName, 3) 
FROM Residents;

SELECT SUBSTRING(FirstName, 1, 3) 
FROM Residents
;

SELECT REPLACE(FirstName, 'o', 'a')
FROM Residents
;

SELECT CHARINDEX('S', LastName) 
FROM Residents
;

SELECT CONCAT(FirstName, ' ', LastName) AS FullName 
FROM Residents
;


-- CASE Statements --

SELECT FirstName, 
CASE 
    WHEN Age < 18 THEN 'Minor'
    WHEN Age BETWEEN 18 AND 64 THEN 'Adult'
    ELSE 'Senior'
END AS AgeGroup
FROM Residents
;


-- SUBQUERY --

SELECT FirstName, LastName 
FROM Residents
WHERE ResidentID IN 
(SELECT ResidentID FROM Jobs WHERE Salary > 50000)
;

-- WINDOW FUNCTIONS --

SELECT FirstName, LastName, Salary, 
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Jobs J
JOIN Residents R ON J.ResidentID = R.ResidentID
;


-- CREATE VIEW --

CREATE VIEW ResidentJobPropertyView AS
SELECT R.FirstName, R.LastName, R.Age, P.City, P.Street, P.Latitude, P.Longitude, J.JobTitle, J.Company, J.Salary, S.SchoolName
FROM Residents R
JOIN Properties P ON R.AddressID = P.AddressID
JOIN Jobs J ON R.ResidentID = J.ResidentID
JOIN Schools S ON P.AddressID = S.AddressID
;

SELECT *
FROM ResidentJobPropertyView
;














