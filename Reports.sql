
SELECT * FROM VENUE;
SELECT VenueName,VenueType,DateAvailable,Capacity,Area,City,Rate
FROM Venue ;

SELECT * FROM Customer;
SELECT * FROM OrderDetails;
SELECT * FROM VENUE;
SELECT * FROM Vendor;
SELECT * FROM VendorOrder;
SELECT * FROM Rating;

SELECT O.CustomerID, C.FirstName,C.LastName,V.VOwnerID,V.VenueName,O.BookingDate,O.Requirements 
FROM OrderDetails O  
LEFT JOIN Venue V   
ON V.VenueID=O.VenueID
LEFT JOIN Customer C 
ON O.CustomerID=C.CustomerID;

SELECT V.VenueName, AVG(cast(R.Rate as FLOAT)) as AvgOfRate
FROM Rating R
LEFT JOIN Venue V 
ON R.VenueID=V.VenueID
GROUP BY V.VenueName; 

SELECT V.VenueID,V.VenueName,COUNT(O.OrderID) as CountOfOrderID
FROM OrderDetails O
LEFT JOIN Venue V
ON V.VenueID=O.VenueID
GROUP BY v.VenueID,V.VenueName;

SELECT  *
FROM (SELECT V FROM Vendor V LEFT JOIN VendorOrder VO on V.VendorID=VO.VendorID) A
LEFT JOIN OrderDetails O on O.OrderID=A.orderID;