
SELECT * FROM Customer;
SELECT * FROM OrderDetails;
SELECT * FROM Vendor;
SELECT * FROM VendorOrder;
SELECT * FROM Venue;
GO
CREATE TRIGGER UpdateOrderDetail
ON OrderDetails
FOR INSERT,UPDATE 
AS
IF @@ROWCOUNT >= 1

BEGIN
UPDATE OrderDetails
SET OrderTotal = OrderCount.OrderTotal
FROM
	(	SELECT --SUM(ISNUMERIC(v.Rate)+ISNUMERIC(ven.Rate)) as OrderTotal,
	v.Rate,ven.Rate
		FROM OrderDetails o
		INNER JOIN Customer c
		ON o.CustomerID=c.CustomerID
		INNER JOIN  Venue v
		ON v.VenueID=o.VenueID
		INNER JOIN Vendor ven
		ON ven.VendorID=o.OrderID
		--GROUP BY ven.VendorID,c.CustomerID
		) as OrderCount
		WHERE OrderDetails.CustomerID=OrderCount.CustomerID

END;
DROP TRIGGER UpdateOrderDetails;
SELECT c.CustomerID,C.FirstName,o.OrderTotal
from Customer c 
LEFT JOIN OrderDetails o
ON c.CustomerID=o.CustomerID;

SELECT * from OrderDetails;
SELECT * from Customer;
SELECT * FROM VendorOrder;
INSERT INTO Customer VALUES ('7','Miguel','Cara','7143199140','MIGUEL@gmail.com','Rochester','New York','1/2/2020','95000');

DELETE FROM Customer WHERE CustomerID='6';
DELETE FROM OrderDetails Where OrderID='O006';
DELETE FROM VendorOrder Where OrderID='O006';

INSERT INTO OrderDetails VALUES
('O007','7','Vid4','1/2/2019','21:07:00','12/3/2019',' ','Hall  12')
INSERT INTO VendorOrder VALUES ('011','VD3','O007');
UPDATE OrderDetails SET BookingTime='21:07:00' WHERE OrderID='O007';