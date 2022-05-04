CREATE TABLE Patient(
    VisitNo CHAR(6),
    VisitDate DATE,
    PatNo CHAR(2) NOT NULL,
    PatAge INT NOT NULL,
    PatCity VARCHAR(20) NOT NULL,
    PatZip CHAR(5) NOT NULL,
    ProvNo CHAR(2),
    ProvSpeciality VARCHAR(20) ,
    Diagnosis VARCHAR(20),
    
    CONSTRAINT PK_PATIENT PRIMARY KEY(VisitNo, ProvNo)
);

INSERT INTO Patient(VisitNo, VisitDate, PatNo, PatAge, PatCity, PatZip, ProvNo, ProvSpeciality, Diagnosis)
VALUES ('V10021', '2015/02/13', 'P1', 36, 'DENVER', '80217', 'D1', 'INTERNIST', 'EAR INFECTION');

INSERT INTO Patient(VisitNo, VisitDate, PatNo, PatAge, PatCity, PatZip, ProvNo, ProvSpeciality, Diagnosis)
VALUES ('V10021', '2015/02/13', 'P1', 36, 'DENVER', '80217', 'D2', 'NURSE PRACTITIONER', 'INFLUENZA');

INSERT INTO Patient(VisitNo, VisitDate, PatNo, PatAge, PatCity, PatZip, ProvNo, ProvSpeciality, Diagnosis)
VALUES ('V93030', '2015/02/20', 'P3', 17, 'ENGLEWOOD', '80113', 'D2', 'NURSE PRACTITIONER', 'PREGNANCY');

INSERT INTO Patient(VisitNo, VisitDate, PatNo, PatAge, PatCity, PatZip, ProvNo, ProvSpeciality, Diagnosis)
VALUES ('V82110', '2015/02/18', 'P2', 60, 'BOULDER', '85932', 'D3', 'CARDIOLOGIST', 'MURMUR');
-- In the above table 
 
-- 1. Insertion Anamoly is to insert any tuple inside the table we need to know the VisitNo and ProvNo as they are the primary key and if they both are same then the record will not be inserted.

-- 2. Deletion Anamoly happens when we try to delete a specific value in the row and the whole row gets deleted. Here if I have to delete a diagnosis of Ear Infection as the now being managed by 
-- some other hospital, then the whole Patient Record will be deleted and we don't want that

DELETE FROM Patient WHERE Diagnosis = 'EAR INFECTION';
  -- Another deletion anamoly happens when we delete the record of ProvNo=D1 and now we are only left with one record of V10021
  
DELETE FROM Patient WHERE ProvNo = 'D1';


-- 3. Update Anamoly happens when we try to update the single tuple/row and we end up updating two rows because we have reductant data in the rows.
UPDATE Patient
SET ProvSpeciality='NURSE/WARD-BOY PRACTITIONER'
WHERE VisitNo = 'V10021';