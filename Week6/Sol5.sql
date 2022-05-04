CREATE TABLE Accounts(
   AcctID CHAR(5),
   DecomposedAcctID CHAR(5),
   AcctName VARCHAR(25),
   Balance INT,
   
   CONSTRAINT PK_AcctID PRIMARY KEY(AcctID),
   CONSTRAINT FK_AcctID FOREIGN KEY(DecomposedAcctID) REFERENCES Accounts(AcctID)
);