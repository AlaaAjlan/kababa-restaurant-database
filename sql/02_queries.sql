USE Kababa1;

-- Select all records from all tables
select*from Category;
describe Category;

select*from Customer;
describe Customer;

select*from Orders;
describe orders;

select*from Dish;
describe dish;

select*from Employee;
describe employee;

select*from Orders_Status;
describe orders_status;

select*from Dish_Details;
describe dish_details;


-- ====HAJER====
SELECT DName, Price FROM Dish WHERE Price > 10;
SELECT DName, Calories FROM Dish WHERE Calories < 100;

SELECT COUNT(*) FROM Orders;
 
SELECT Category_ID, AVG(Price) 
FROM Dish GROUP BY Category_ID;


SELECT Customer.Customer_Name, Orders.OID
FROM Customer
JOIN Orders ON Customer.CID = Orders.CID;

SELECT Orders.OID, Dish.DName, dish_details.Quantity
FROM Orders
JOIN dish_details ON Orders.OID = dish_details.OID
JOIN Dish ON Dish.DID = dish_details.DID;

SELECT DName 
FROM Dish 
WHERE Price > (SELECT AVG(Price) FROM Dish);

SELECT Customer_Name 
FROM Customer 
WHERE CID IN (SELECT CID FROM Orders WHERE Total_Amount > 50);

CREATE VIEW Order_Report AS
SELECT Orders.OID, Customer.Customer_Name AS Customer_Name, Orders.Total_Amount
FROM Orders
JOIN Customer ON Orders.CID = Customer.CID;

select * from Order_Report;



-- ====DANA====
-- selects customer names and phone numbers where the phone number starts with '055’
SELECT Customer_Name, Customer_Phone
FROM Customer
WHERE Customer_Phone LIKE '0553%';

-- displays all employee names who work as Chefs.
SELECT EName AS Chef_Employee
FROM Employee
WHERE ERole = 'Chef';

-- calculates the total revenue from all orders.
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orders;

-- finds the highest dish price on the menu.
SELECT MAX(Price) AS Highest_Price
FROM Dish;

-- lists all orders along with their status.
SELECT Orders.OID, Orders_Status.Ostatus
FROM Orders
JOIN Orders_Status ON Orders.OID = Orders_Status.OID;

-- retrieves customers and the total amount they spent in every order.
SELECT Customer.Customer_Name, Orders.Total_Amount
FROM Customer
JOIN Orders ON Customer.CID = Orders.CID;


-- Find dishes that have more calories than the average calories in their category.
SELECT DName, Calories
FROM Dish d
WHERE Calories > (
    SELECT AVG(Calories)
    FROM Dish
    WHERE Category_ID = d.Category_ID
);

-- Find dishes that were never ordered.
SELECT DName
FROM Dish
WHERE DID NOT IN (
    SELECT DISTINCT DID
    FROM Dish_Details
);
 
 -- View to show average price and calories for each category.
 CREATE VIEW Category_Stats AS
SELECT Category.Category_name, AVG(Dish.Price) AS Avg_Price, AVG(Dish.Calories) AS Avg_Calories
FROM Category
JOIN Dish ON Category.Category_ID = Dish.Category_ID
GROUP BY Category.Category_name;

select * from Category_Stats;


-- ====ALAA==== 
-- Shows dishes priced above 20 SAR
SELECT DName, Price
FROM Dish
WHERE Price > 20;

-- Shows customers whose phone number ends with the digit 9.
SELECT Customer_Name, Customer_Phone
FROM Customer
WHERE Customer_Phone LIKE '%9';

-- Counts the total number of dishes in the menu.
SELECT COUNT(*) AS Total_Dishes
FROM Dish;

-- Finds the highest total amount among all orders.
SELECT MAX(Total_Amount) AS Highest_Order_Amount
FROM Orders;


-- Shows customers along with their order IDs
SELECT Customer.Customer_Name, Orders.OID
FROM Customer
JOIN Orders ON Customer.CID = Orders.CID;

-- Shows dish names along with the category each dish belongs to.
SELECT Dish.DName, Category.Category_name
FROM Dish
JOIN Category ON Dish.Category_ID = Category.Category_ID;

-- Shows dishes priced above the average dish price
SELECT DName
FROM Dish
WHERE Price > (SELECT AVG(Price) FROM Dish);

-- Shows the dishes that belong to the "Drinks" category.
SELECT DName, Price
FROM Dish
WHERE Category_ID = (
    SELECT Category_ID
    FROM Category
    WHERE Category_name = 'Drinks'
);

-- Shows orders where the total amount is higher than the average of all orders.
SELECT OID, Total_Amount
FROM Orders
WHERE Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM Orders
);


-- Lists customers who have at least one order in the system.
SELECT Customer_Name
FROM Customer
WHERE CID IN (
    SELECT CID
    FROM Orders
);

-- View showing dish names and their prices
CREATE VIEW Dish_Prices_View AS
SELECT DName, Price
FROM Dish;

SELECT * FROM Dish_Prices_View;
