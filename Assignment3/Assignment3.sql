/* Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero. */SELECT RestaurantName,RestaurantType,CuisinesTypeFROM Jomato(nolock)WHERE TableBooking > 0;CREATE PROCEDURE GetRestaurantsWithBookings
AS
BEGIN
    SELECT 
        RestaurantName,
        RestaurantType,
        Cuisine
    FROM 
        Restaurants
    WHERE 
        TableBooking > 0;
END;

EXEC GetRestaurantsWithBookings;



/*Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.*/


BEGIN TRANSACTION

UPDATE Jomato
SET CuisinesType = 'Cafeteria'
WHERE CuisinesType = 'Cafe'

SELECT * FROM Jomato WHERE CuisinesType = 'Cafeteria';

ROLLBACK;


/* Generate a row number column and find the top 5 areas with the highest rating of
restaurants. */  1.  SELECT
        Area, 
        AVG(Rating) AS avg_rating,
        ROW_NUMBER() OVER (ORDER BY AVG(Rating) DESC) AS row_num
    FROM 
        Jomato
    GROUP BY 
        Area



2.  SELECT 
      TOP(5) Area ,
        Rating 

    FROM Jomato

	ORDER BY 
	   Rating DESC;

            
/*Use the while loop to display the 1 to 50.*/
DECLARE @i INT = 1;

WHILE @i <= 50
BEGIN
    Print @i;
    SET @i = @i + 1;
END;
 
        --OR--

DECLARE @i INT = 1;

WHILE @i <= 50
BEGIN
    SELECT @i AS Number;
    SET @i = @i + 1;
END;

SELECT TOP 5 
    RestaurantType, 
    RestaurantName, 
    Rating
FROM 
    Jomato
ORDER BY 
    Rating DESC;

/*Create a tigger name that giva an message whenever a new record is inserted.*/

CREATE TRIGGER trg_AfterInsertMessage
ON Jomato  
AFTER INSERT
AS
BEGIN
    PRINT 'A new record has been inserted.';
END;
INSERT INTO Jomato(column1, column2) VALUES (value1, value2);
