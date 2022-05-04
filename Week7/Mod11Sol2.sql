-- Given table same as Problem 1

-- Given Functional Dependency
  -- PatNo -> PatAge
  -- PatZip -> PatCity
  -- VisitNo -> VisitDate
  -- PatNo -> PatZip
  -- ProvNo -> ProvSpeciality
  -- VisitNo -> PatNo
  -- VisitNo, ProvNo -> Diagnosis
  -- ProvNo -> ProvEmail
  -- ProvEmail -> ProvNo
  
  
-- Applying Functional dependency to above relationship

  -- PatNo -> PatAge, PatZip
  -- VisitNo -> VisitDate, PatNo
  -- ProvNo, VisitNo -> Diagnosis
  -- ProvNo -> ProvSpeciality, ProvEmail
  -- PatZip -> PatCity
  
  
-- Creating table with these dependency

CREATE TABLE IF NOT EXISTS City(
  PatZip CHAR(8),
  PatCity VARCHAR(25) NOT NULL,
  
  CONSTRAINT PK_PatZip PRIMARY KEY(PatZip)
);

CREATE TABLE IF NOT EXISTS Provisions(
  ProvNo CHAR(5),
  ProvEmail VARCHAR(30),
  ProvSpeciality VARCHAR(25),
  
  CONSTRAINT PK_ProvNo PRIMARY KEY(ProvNo)
);

CREATE TABLE IF NOT EXISTS Patients(
   PatNo CHAR(5),
   PatAge INT NOT NULL,
   PatZip CHAR(8),
   
   CONSTRAINT PK_PatNo PRIMARY KEY(PatNo),
   CONSTRAINT FK_PatZip FOREIGN KEY(PatZip) REFERENCES City(PatZip)
);


CREATE TABLE IF NOT EXISTS VisitDetails(
   VisitNo CHAR(5),
   PatNo CHAR(5),
   VisitDate DATE NOT NULL,
   
   CONSTRAINT PK_VisitNo PRIMARY KEY(VisitNo),
   CONSTRAINT FK_PatNo FOREIGN KEY(PatNo) REFERENCES Patients(PatNo)
);


CREATE TABLE IF NOT EXISTS ProvVisit(
   ProvNo CHAR(5),
   VisitNo CHAR(4),
   
   CONSTRAINT FK_ProvNo_2 FOREIGN KEY(ProvNo) REFERENCES Provisions(ProvNo),
   CONSTRAINT FK_VisitNo_2 FOREIGN KEY(VisitNo) REFERENCES VisitDetails(VisitNo)
);