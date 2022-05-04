CREATE TABLE Owners(
   OwnID CHAR(5),
   OwnName VARCHAR(30),
   OwnPhone CHAR(15),
   
   CONSTRAINT PK_OwnID PRIMARY KEY(OwnID)
);

-- Property(PropID, BldgName, UnitNo, Bdms)
CREATE TABLE Property(
   PropID CHAR(5),
   BldgName VARCHAR(20),
   UnitNo VARCHAR(25),
   Bdms VARCHAR(20),
   
   CONSTRAINT PK_PropID PRIMARY KEY(PropID)
);


-- Shares(OwnID, PropID, StartWeek, EndWeek)
CREATE TABLE Shares(
   OwnID CHAR(5),
   PropID CHAR(5),
   StartWeek INT,
   EndWeek INT,
   
   CONSTRAINT FK_OwnID FOREIGN KEY(OwnID) REFERENCES Owners(OwnID),
   CONSTRAINT FK_PropID FOREIGN KEY(PropID) REFERENCES Property(PropID)
);