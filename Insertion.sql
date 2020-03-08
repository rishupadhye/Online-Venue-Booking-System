
SELECT * FROM Customer;

INSERT INTO Customer VALUES ('2','Jhon','Doe','3143199140','JHON@gmail.com','Rochester','New York','1/1/2020','15000'),
('3','Max','Will','9147188100','MAXW@gmail.com','Buffalo','New York','13/1/2020','32000'),
('4','Janet','Aldro','4147335900','JANET@gmail.com','Syracuse','New York','12/12/2019','19000'),
('5','Chandler','Bing','3571598523','CB@gmail.com','Syracuse','New York','25/12/2019','124000');

SELECT * FROM VenueOwner;
INSERT INTO VenueOwner VALUES ('VO1','Jagdish Verma','5','1597896354','jv@jvenues.com'),
('VO2','Saurbh Negi','3','1147896542','sn@snvenues.com'),
('VO3','Kabir Raghvan','2','8745632147','kr@krvenues.com'),
('VO4','Eric Xi','10','7418529632','ex@exvenues.com'),
('VO5','Teresa May','7','7417414568','tm@tmvenues.com');

SELECT * FROM Vendor;
INSERT INTO Vendor VALUES ('VD1','Jack Ville','Photographer','Syracuse','New York','8527419632','Ja@vendors.com','500'),
('VD2','Lin Josef','Decorater','Syracuse','New York','8517419992','Li@vendors.com','2000'),
('VD3','Ben Turberry','Event Manager','Buffalo','New York','6527418811','Be@vendors.com','2500'),
('VD4','Marilyn Monroe','DJ','Buffalo','New York','7417413322','Ma@vendors.com','800'),
('VD5','Nolan Noble','MakeUp Artist','Rochester','New York','8974144739','No@vendors.com','1500');

SELECT * FROM Venue;
DELETE FROM Vendor WHERE VendorID= ('VD5')

INSERT INTO Venue VALUES
('Vid1','VO2','Negi Banquets','Banquet','12/10/2019-12/31/2019','Hoboken','9000','1321, Samuel Avenue, Hoboken','Syracuse','New York','147258369','100'),
('Vid2','VO3','Raghvan Lawns','Lawns','12/1/2019-1/31/2020','Dewitt','40000','1320, Boost Street,Dewitt','Syracuse','New York','748858369','200'),
('Vid3','VO1','Verma Party Hall','Party Hall','12/12/2019-12/25/2019','Burlington','80000','1322, Barnes Avenue, Burlington','Syracuse','New York','287255477','650'),
('Vid4','VO4','Xi Rooftop','Rooftop','12/5/2019-1/31/2020','Uptown','46000','1329, Wall Avenue, Uptown','Rochester','New York','147258369','550'),
('Vid5','VO5','May Conference Halls','Conference Hall','12/1/2019-1/31/2020','Cireco','175000','1385, Lingston Street, Cireco','Buffalo','New York','147252479','3000');


SELECT * FROM OrderDetails;
SELECT * FROM Customer;
SELECT * FROM Venue;

INSERT INTO OrderDetails VALUES
('O001','1','Vid1','12/25/2019','21:35:00','12/3/2019','14000','NA'),
('O002','2','Vid2','1/3/2020','11:04:00','12/6/2019','42800','NA'),
('O003','3','Vid2','12/31/2019','20:47:00','12/19/2019','43300','NA'),
('O004','4','Vid4','12/14/2019','13:14:00','12/1/2019','46500','Photgrapher Should Arrive at 6 in the Morning'),
('O005','5','Vid5','1/5/2020','17:50:00','12/17/2019','175500','Lights should be Yellow');

INSERT INTO Vendor VALUES ('VD1','Jack Ville','Photographer','Syracuse','New York','8527419632','Ja@vendors.com','500'),
('VD2','Lin Josef','Decorater','Syracuse','New York','8517419992','Li@vendors.com','2000'),
('VD3','Ben Turberry','Event Manager','Buffalo','New York','6527418811','Be@vendors.com','2500'),
('VD4','Marilyn Monroe','DJ','Buffalo','New York','7417413322','Ma@vendors.com','800'),
('VD5','Nolan Noble','MakeUp Artist','Rochester','New York','8974144739','No@vendors.com','1500');

SELECT * FROM VendorOrder;
SELECT * FROM OrderDetails;
INSERT INTO VendorOrder VALUES ('007','VD2','O003'),
('008','VD4','O003'),('009','VD1','O004'),('100','VD1','O005');

SELECT * FROM Rating;
SELECT * FROM OrderDetails;
alter table rating add Rate INT ;

INSERT INTO Rating VALUES 
('R01','Vid1','Great Venue for Marriages','4'),
('R02','Vid2','Best Lawn for getogethers','5'),
('R03','Vid2','No Generator at the venue','2'),
('R04','Vid4',' ','5'),
('R05','Vid5',' ','5');

SELECT * FROM CustomerRate;
SELECT * FROM OrderDetails;
INSERT INTO CustomerRate values 
('CR1','R01','1'),
('CR2','R02','2'),
('CR3','R03','3'),
('CR4','R04','4'),
('CR5','R05','5');