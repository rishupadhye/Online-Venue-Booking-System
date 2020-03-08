
DROP TABLE Customer;
CREATE TABLE Customer 
(
	CustomerID CHAR(10) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	ContactNumber INT,
	Email_ID VARCHAR(30) NOT NULL,
	City VARCHAR(30) NOT NULL,
	StateName VARCHAR(30) NOT NULL,
	DateRequired DATE NOT NULL,
	Budget INT,
	
	CONSTRAINT Customer_PK PRIMARY KEY(CustomerID)
);

ALTER TABLE Customer ALTER COLUMN ContactNumber VARCHAR(10);

CREATE TABLE VenueOwner 
(
	VOwnerID CHAR(10) NOT NULL,
	VOwnerName VARCHAR(30) NOT NULL,
	NumberOfVenues INT NOT NULL,
	ContactNumber INT,
	Email_ID VARCHAR(30) NOT NULL,
	
	CONSTRAINT VenueOwner_PK PRIMARY KEY(VOwnerID)
);
ALTER TABLE VenueOwner ALTER COLUMN ContactNumber VARCHAR(10);

CREATE TABLE Vendor 
(
	VendorID CHAR(10) NOT NULL,
	VendorName VARCHAR(30) NOT NULL,
	VendorType VARCHAR(30) NOT NULL,
	City VARCHAR(30) NOT NULL,
	StateName VARCHAR(30) NOT NULL,
	ContactNumber INT NOT NULL,
	Email_ID VARCHAR(30) ,
	
	CONSTRAINT Vendor_PK PRIMARY KEY(VendorID)
);
ALTER TABLE Vendor ALTER COLUMN ContactNumber VARCHAR(10);
ALTER TABLE Vendor ALTER COLUMN VendorType VARCHAR(10) NOT NULL CHECK VendorType IN ('Photographer','Decorater','Event Manager','Makeup Artist','DJ','Caterer');
ALTER TABLE Vendor ADD Rate VARCHAR(10);
CREATE TABLE Venue
(
	VenueID CHAR(10) NOT NULL,
	VOwnerID CHAR(10) NOT NULL,
	VenueName VARCHAR(30) NOT NULL,
	VenueType VARCHAR(30) NOT NULL,
	DateAvailable DATE NOT NULL,
	Area VARCHAR(30) NOT NULL,
	Rate VARCHAR(30) NOT NULL,
	AddressVenue VARCHAR(40) NOT NULL,
	City VARCHAR(30) NOT NULL,
	StateName VARCHAR(30) NOT NULL,
	ContactNumber INT NOT NULL,
	
	CONSTRAINT Venue_PK PRIMARY KEY(VenueID),
	CONSTRAINT Venue_FK FOREIGN KEY(VOwnerID) REFERENCES VenueOwner(VOwnerID)
);

ALTER TABLE Venue ALTER COLUMN DateAvailable VARCHAR(30);
ALTER TABLE Venue ADD  Capacity INT;

CREATE TABLE Rating  
(
	RateID CHAR(10) NOT NULL,
	VenueID CHAR(10) NOT NULL,
	Comment VARCHAR(30), 
	
	CONSTRAINT Rating_PK PRIMARY KEY(RateID),
	CONSTRAINT Rating_FK FOREIGN KEY(VenueID) references Venue(VenueID)
);	

CREATE TABLE OrderDetails
(
	OrderID CHAR(10) NOT NULL,
	CustomerID CHAR(10) NOT NULL,
	VenueID CHAR(10) NOT NULL,
	BookingDate DATE NOT NULL,
	BookingTime TIME NOT NULL,
	VenueBookingDate DATE NOT NULL,
	OrderTotal BIGINT NOT NULL,
	Requirements VARCHAR(120),

	CONSTRAINT OrderDetails_PK PRIMARY KEY(OrderID),
	CONSTRAINT OrderDetails_FK1 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT OrderDetails_FK2 FOREIGN KEY(VenueID) REFERENCES Venue(VenueID)
);
ALTER TABLE OrderDetails ALTER COLUMN OrderTotal BIGINT;

CREATE TABLE VendorOrder  
(
	VendorOrderID CHAR(10) NOT NULL,
	VendorID CHAR(10) NOT NULL,
	OrderID CHAR(10) NOT NULL,
	
	CONSTRAINT VendorOrder_PK PRIMARY KEY(VendorOrderID),
	CONSTRAINT VendorOrder_FK1 FOREIGN KEY(VendorID) references Vendor(VendorID),
	CONSTRAINT VendorOrder_FK2 FOREIGN KEY(OrderID) references OrderDetails(OrderID)
);	

CREATE TABLE CustomerRate  
(
	CustomerRateID CHAR(10) NOT NULL,
	RateID CHAR(10) NOT NULL,
	CustomerID CHAR(10) NOT NULL,
	
	CONSTRAINT CustomerRate_PK PRIMARY KEY(CustomerRateID),
	CONSTRAINT CustomerRate_FK1 FOREIGN KEY(RateID) references Rating(RateID),
	CONSTRAINT CustomerRate_FK2 FOREIGN KEY(CustomerID) references Customer(CustomerID)
);	

