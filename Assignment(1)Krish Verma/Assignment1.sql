CREATE TABLE Salesman (
SalesmanId INT,
Name VARCHAR(255),
Commission DECIMAL(10, 2),
City VARCHAR(255),
Age INT
);

INSERT INTO Salesman (SalesmanId, Name, Commission, City, Age)
VALUES
(101, 'Joe', 50, 'California', 17),
(102, 'Simon', 75, 'Texas', 25),
(103, 'Jessie', 105, 'Florida', 35),
(104, 'Danny', 100, 'Texas', 22),
(105, 'Lia', 65, 'New Jersey', 30);

select * from Salesman(nolock);