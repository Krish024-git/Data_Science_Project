-- Question 1 - Insert a new record in your Orders table

INSERT INTO Orders1 Values
(5002,2845,102,'2021-07-03',556),
(5928,1854,108,'2024-02-12',1800),
(5820,2322,109,'2022-07-02',580),
(5952,1852,110,'2025-02-10',150);
 

 select * from orders1(nolock)

/* Question 2 - Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table. */ 

ALTER TABLE Salesman
ADD CONSTRAINT PK_SalesmanId PRIMARY KEY (SalesmanID);


ALTER TABLE Salesman
ADD CONSTRAINT DF_City DEFAULT 'VARANSI' FOR City;


ALTER TABLE Customer ADD CONSTRAINT FK_Customer_Salesman
FOREIGN KEY (SalesmanId) REFERENCES Salesman(SalesmanId);


ALTER TABLE Customer
ALTER COLUMN CustomerName VARCHAR(255) NOT NULL;

/* Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase
amount value greater than 500 */

SELECT CustomerName , PurchaseAmount    
FROM Customer WHERE CustomerName Like '%N'AND PurchaseAmount > 500;


/*Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables. */
   
   SELECT SalesmanId FROM Salesman
    UNION
    SELECT SalesmanId FROM Salesman;


    SELECT SalesmanId FROM Salesman
    UNION ALL
    SELECT SalesmanId FROM Salesman;

/* Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.
*/
SELECT
    O.OrderDate,
    S.Name AS "Salesman Name",
    C.CustomerName,
    S.Commission,
    S.City
FROM
    Orders O
INNER JOIN
    Customer C ON O.CustomerID = C.CustomerID
INNER JOIN
    Salesman S ON O.SalesmanId = S.SalesmanId
WHERE
    O.PurchaseAmount BETWEEN 500 AND 1500;


-- Using right join fetch all the results from Salesman and Orders table
SELECT
    S.*,  
    O.*  
FROM
    Salesman S
RIGHT JOIN
    Orders1 O ON S.SalesmanId = O.SalesmanId;
 