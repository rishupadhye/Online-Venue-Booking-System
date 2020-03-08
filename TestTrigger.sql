
SELECT * FROM Customer;
SELECT * FROM OrderDetails;
SELECT * FROM Vendor;
SELECT * FROM VendorOrder;
SELECT * FROM Venue;
GO
CREATE TRIGGER UpdateOrderDetails
ON OrderDetails
FOR INSERT,UPDATE 
AS
IF @@ROWCOUNT >= 1

BEGIN
UPDATE OrderDetails
SET OrderTotal = OrderCount.rate
FROM
	(	
select c.CustomerID,
--v.venueID,ve.VendorID
(max(cast(v.Rate as numeric))  + sum(cast(ve.rate as numeric))) as rate
from OrderDetails a,Customer c,Venue v, VendorOrder vo, Vendor ve
where a.CustomerID = c.CustomerID
and a.VenueID = v.VenueID
and a.OrderID	 = vo.OrderID
and vo.VendorID = ve.VendorID
group by c.customerID) as OrderCount
		WHERE OrderDetails.CustomerID=OrderCount.CustomerID

END;

select * from Vendor

select a.*,v.*,ve.* 
select c.CustomerID,
--v.venueID,ve.VendorID
max(cast(v.Rate as numeric))+sum(cast(ve.rate as numeric))
from OrderDetails a,Customer c,Venue v, VendorOrder vo, Vendor ve
where a.CustomerID = c.CustomerID
and a.VenueID = v.VenueID
and a.OrderID	 = vo.OrderID
and vo.VendorID = ve.VendorID
group by c.customerID
