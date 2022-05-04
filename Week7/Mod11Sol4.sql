CREATE TABLE Orders(
    OrdNo CHAR(2),
    ItemNo CHAR(2) NOT NULL,
    QtvOrd INT NOT NULL,
    CustNo CHAR(2) NOT NULL,
    CustBal DECIMAL(10, 2) NOT NULL,
    CustDisc DECIMAL(2, 2),
    ItemPrice INT NOT NULL,
    OrdDate DATE NOT NULL,
    
    CONSTRAINT PK_OrdNo PRIMARY KEY(OrdNo)
);

-- For any Functional Depedency(F.D) 
  -- X -> Y  if and only if X1.row = X2.row and Y1.row = Y2.row where X1,Y1 and X2,Y2 are two columns which X and Y as attribute names

-- Functional Dependency for OrdNo          Rows which does'nt satisfy FD

-- OrdNo -> ItemNo                             (1, 2), (3, 4)
-- OrdNo -> QtyOrd                             (3, 4)
-- OrdNo -> CustNo                             None
-- OrdNo -> CustBal                            None
-- OrdNo -> CustDisc                           None
-- OrdNo -> ItemPrice                          (1, 2), (3, 4)
-- OrdNo -> OrdDate                            None