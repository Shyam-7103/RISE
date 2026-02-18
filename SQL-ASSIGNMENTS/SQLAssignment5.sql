Use HumanResources

--1. Find all products that have a Quantity greater than the average quantity of all products.

Create table Product (
Productid Int Primary Key,
Productname varchar(255),
Quantity Int,
SalesUnit Int,
City varchar(255),
Price Money
)

Select * from Product

INSERT INTO Product (Productid, Productname, Quantity, SalesUnit, City, Price) VALUES
(1, 'Laptop',     140, 70, 'Mumbai',   60000),
(2, 'Smartphone', 130, 30, 'Delhi',    25000),
(3, 'Tablet',     120, 25, 'Mumbai',   30000),
(4, 'Printer',    115, 20, 'Vadodara', 12000),
(5, 'Monitor',    110, 15, 'Delhi',    18000),
(6, 'Keyboard',   125, 35, 'Vadodara',  2000),
(7, 'Mouse',      135, 40, 'Mumbai',   1500),
(8, 'Speaker',    145, 60, 'Pune',      8000);

Select * from Product Where Quantity > (Select AVG(Quantity) from Product)

--2. Display the ProductName of products sold in the same city as 'Laptop'.

Select ProductName, City from Product WHERE City = (Select City from Product Where ProductName = 'Laptop')

--3. Find the details of the products with the maximum Quantity.

Select * from Product Where Quantity = (Select Max(Quantity) from Product)

--4. List products whose salesUnit is higher than the salesUnit of ProductID 5.

Select * from Product Where SalesUnit > (Select SalesUnit from Product Where Productid = 5)

--5. Find products that have a lower Quantity than the minimum Quantity found in 'Vadodara'.

Select * from Product Where Quantity < (Select MIN(Quantity) from Product Where City = 'Vadodara')

--6. Display products whose salesUnit is greater than the average salesUnit of products in 'Mumbai'.

Select * from Product where SalesUnit > (Select AVG(SalesUnit) from Product Where City='Mumbai')

--7. Find the product name with the lowest salesUnit.

Select * from Product Where SalesUnit = (Select MIN(SalesUnit) from Product)

--8. List all products sold in cities that have more than 50 total Quantity across all their products.

Select * from Product Where City > (Select City from Product Where Quantity = 50)

--9. Show products whose Quantity is exactly equal to the salesUnit of 'Smartphone'.

Select * from Product Where Quantity = (Select SalesUnit from Product where Productname = 'Smartphone')

--10. Find the city which has the product with the highest salesUnit.

Select * from Product Where SalesUnit = (Select MAX(SalesUnit) from Product)

--11. Find all products sold in cities where at least one product has a Quantity of zero.
Select * from Product

Select * from Product WHERE City IN (Select City from Product Where Quantity = 0)

--12. List products whose salesUnit is greater than the salesUnit of all products in 'Surat'.

Select * from Product where SalesUnit > All (Select SalesUnit from Product where City= 'Surat')

--13. Find products that belong to cities where the average salesUnit is greater than 10.

Select * from Product where City IN (Select City from Product Group By City Having AVG(SalesUnit)>0)

--14.Display products that have a Quantity greater than any product's Quantity in 'Pune'.

Select * from Product where Quantity > ANY (select Quantity from Product where City = 'Pune')

--15. Find all products whose ProductName is the same as any product sold in 'Ahmedabad'.

Select * from Product Where Productname IN (Select Productname from Product Where City = 'Ahmedabad')

--16. Select products where the Quantity is greater than the average Quantity of their own city.

Select * from Product p1 Where Quantity > (Select AVG(Quantity) from Product p2 Where p2.city = p1.city)

--17. Find cities where the total salesUnit is higher than the total salesUnit of 'Vadodara'.

Select City from Product Group by City Having Sum(SalesUnit) > (Select sum(SalesUnit) from Product where city = 'Vadodara')

--18. List products that are sold in the city that has the maximum variety (count) of products.

Select * from Product Where City = (Select Top 1 City from Product Group by City Order by Count(*) desc)

--19. Find the second highest Quantity from the Product table using a subquery.

 Select MAX(Quantity) from Product where Quantity < (Select MAX(Quantity) from Product)

--20.Display the ProductName and a calculated column showing the difference between its Quantity and the global average Quantity.

SELECT Productname, Quantity - (SELECT AVG(Quantity) FROM Product) AS QuantityDifference FROM Product;
