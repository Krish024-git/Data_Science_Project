/* Create a user-defined functions to stuff the Chicken into ‘Quick Bites’. */

CREATE FUNCTION
             dbo.AddChickenToQuickBites (@cuisine_type NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    RETURN REPLACE(@cuisine_type, 'Quick Bites', 'Quick Chicken Bites');
END;


/* Use the function to display the restaurant name and cuisine type which has the
maximum number of rating. */

Select
    RestaurantName,CuisinesType AS ModifiedCuisineType, Rating
From
    Jomato(nolock)
WHERE
    Rating = (SELECT MAX(Rating) FROM Jomato);

/* Create a Rating Status column to display the rating as ‘Excellent’ if it has more the 4
start rating, ‘Good’ if it has above 3.5 and below 5 star rating, ‘Average’ if it is above 3
and below 3.5 and ‘Bad’ if it is below 3 star rating. */

Select RestaurantName  , RestaurantType, CuisinesType , Rating,
CASE
    WHEN Rating >= 4 THEN 'EXCELLENT'
    WHEN Rating >=3.5 THEN 'AVERAGE'
    WHEN Rating >= 3 THEN 'GOOD'
ELSE 'BAD' 
END AS New_Rating
From Jomato(NOLOCK);

/* Find the Ceil, floor and absolute values of the rating column and display the current date
and separately display the year , month_name and day. */

Select Rating,
       CEILING(Rating) as CeilValue,
       FLOOR(Rating) as FlorValue,
       ABS(Rating) as AbsValue,
       GETDATE() as CurrentDate,
       YEAR(GETDATE()) as CurrentYear,
       DATENAME(month, GETDATE()) as CurrentMonthName,
       DAY(GETDATE()) as CurrentDay
From Jomato (nolock);

/* Display the restaurant type and total average cost using rollup */

Select RestaurantType , AVG(AverageCost) as Total_Average_Cost     
From Jomato(nolock) 
Group By RollUP (RestaurantType);




