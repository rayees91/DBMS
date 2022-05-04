CREATE TABLE Student(
   StdNo CHAR(5),
   StdName VARCHAR(30),
   StdAddress VARCHAR(20),
   StdCity VARCHAR(15),
   StdState VARCHAR(15),
   StdZip CHAR(6),
   StdEmail VARCHAR(35),
   
   CONSTRAINT PK_StdNo PRIMARY KEY(StdNo)
);


CREATE TABLE Institution(
   InstID CHAR(5),
   InstName VARCHAR(50),
   InstMascot VARCHAR(10),
   
   CONSTRAINT PK_InstID PRIMARY KEY(InstID)
);


-- Lender(LenderNo, LendName)]
CREATE TABLE Lender(
   LenderNo CHAR(5),
   LendName VARCHAR(30),
   
   CONSTRAINT PK_LenderNo PRIMARY KEY(LenderNo)
);


-- Loan(LoanNo, StdNo, InstID, LenderNo, ProcDate, DisbMethod, DisbBank, DateAuth, NoteValue, Subsidized, Rate)
CREATE TABLE Loan(
   LoanNo CHAR(5) NOT NULL,
   StdNo CHAR(5) NOT NULL,
   InstID CHAR(5) NOT NULL,
   LenderNo CHAR(5),
   ProcDate DATE,
   DisbMethod VARCHAR(20),
   DisbBank VARCHAR(20),
   DateAuth DATE,
   NoteValue INT,
   Subsidized CHAR(3),
   Rate DECIMAL(5, 2),
   
   CONSTRAINT PK_LoanNo PRIMARY KEY(LoanNo),
   CONSTRAINT FK_StdNo FOREIGN KEY(StdNo) REFERENCES Student(StdNo),
   CONSTRAINT FK_InstID FOREIGN KEY(InstID) REFERENCES Institution(InstID)
);

-- Disburse Line(LoanNo, DateSent, Amount, OrigFee, GuarFee)
CREATE TABLE DisburseLine(
    DateSent DATE,
    LoanNo CHAR(5),
    Amount INT,
    OrigFee INT,
    GuarFee INT,
    
    CONSTRAINT PK_DateSent PRIMARY KEY(DateSent),
    CONSTRAINT FK_LoanNo FOREIGN KEY(LoanNo) REFERENCES Loan(LoanNo)
);