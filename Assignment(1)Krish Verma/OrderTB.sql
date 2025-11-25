CREATE TABLE Orders1 
(OrderId int, 
 CustomerId int,  
 SalesmanId int, 
 Orderdate Date, 
 Amount money)

INSERT INTO Orders1 Values
(5001,2345,101,'2021-07-01',550),
(5003,1234,105,'2022-02-15',1500)

select * from Orders1(nolock)