USE coursera;
CREATE TABLE IF NOT EXISTS Employee (
  empNo CHAR(5) NOT NULL,
  empName VARCHAR(30) NOT NULL,
  department VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(15) NOT NULL,
  CONSTRAINT PK_EMPNO PRIMARY KEY (empNo)
);
INSERT INTO Employee (empNo, empName, department, email, phone) VALUES ('E100','Chuck Coordinator','Administration','chuck@colorado.edu','3-1111');
INSERT INTO Employee (empNo, empName, department, email, phone) VALUES ('E101','Mary Manager','Football','mary@colorado.edu','5-1111');
INSERT INTO Employee (empNo, empName, department, email, phone) VALUES ('E102','Sally Supervisor','Planning','sally@colorado.edu','3-2222');
INSERT INTO Employee (empNo, empName, department, email, phone) VALUES ('E103','Alan Administrator','Administration','alan@colorado.edu','3-3333');
CREATE TABLE IF NOT EXISTS ResourceTbl (
  resNo   CHAR(5)       NOT NULL,
  resName VARCHAR(30)   NOT NULL,
  rate    DECIMAL(8, 2) NOT NULL,
  CONSTRAINT PK_RESNO PRIMARY KEY (resNo)
);
INSERT INTO ResourceTbl (resNo, resName, rate) VALUES ('R100', 'attendant', '10.00');
INSERT INTO ResourceTbl (resNo, resName, rate) VALUES ('R101', 'police', '15.00');
INSERT INTO ResourceTbl (resNo, resName, rate) VALUES ('R102', 'usher', '10.00');
INSERT INTO ResourceTbl (resNo, resName, rate) VALUES ('R103', 'nurse', '20.00');
INSERT INTO ResourceTbl (resNo, resName, rate) VALUES ('R104', 'janitor', '15.00');
INSERT INTO ResourceTbl (resNo, resName, rate) VALUES ('R105', 'food service', '10.00');
CREATE TABLE IF NOT EXISTS EventRequest (
  evntNo  CHAR(5) NOT NULL,
  dateHeld  DATE  NOT NULL,
  dateReq  DATE  NOT NULL,
  custNo  CHAR(5) NOT NULL,
  facNo   CHAR(5) NOT NULL,
  dateAuth DATE,
  status  CHAR(20) NOT NULL,
  estCost DECIMAL(8, 2) NOT NULL,
  estAudience INTEGER NOT NULL,
  budNo CHAR(30),
  
  CONSTRAINT EventRequestPK PRIMARY KEY (evntNo),
  CONSTRAINT FK_FACNO_REQUEST FOREIGN KEY (facNo) REFERENCES Facility (facNo),
  CONSTRAINT FK_CUSTNO_REQUEST FOREIGN KEY (custNo) REFERENCES Customer (custNo),
  CHECK (status IN('Pending','Denied','Approved') AND estaudience>0)
);
INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E100', '2013-10-25', '2013-06-06', 'C100', 'F100', '2013-06-08', 'Approved', '5000.00', '80000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E101', '2013-10-26', '2013-07-28', 'C100', 'F100', NULL, 'Pending', '5000.00', '80000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E102', '2013-09-14', '2013-07-28', 'C100', 'F100', '2013-07-31', 'Approved', '5000.00', '80000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E103', '2013-09-21', '2013-07-28', 'C100', 'F100', '2013-08-01', 'Approved', '5000.00', '80000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E104', '2013-12-03', '2013-07-28', 'C101', 'F101', '2013-07-31', 'Approved', '2000.00', '12000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E105', '2013-12-05', '2013-07-28', 'C101', 'F101', '2013-08-01', 'Approved', '2000.00', '10000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E106', '2013-12-12', '2013-07-28', 'C101', 'F101', '2013-07-31', 'Approved', '2000.00', '10000', 'B1000');

INSERT INTO EventRequest (evntNo, dateHeld, dateReq, custNo, facNo, dateAuth, status, estCost, estAudience, budNo)
VALUES ('E107', '2013-11-23', '2013-07-28', 'C105', 'F100', '2013-07-31', 'Denied', '10000.00', '5000', NULL);
CREATE TABLE IF NOT EXISTS EventPlan (
  planNo  CHAR(5)  NOT NULL,
  evntNo  CHAR(5)  NOT NULL,
  workDate DATE NOT NULL,
  notes TEXT,
  activity VARCHAR(20) NOT NULL,
  empNo CHAR(5),
  
  CONSTRAINT PK_PLANNO PRIMARY KEY (planNo),
  CONSTRAINT FK_EVNTNO FOREIGN KEY (evntNo) REFERENCES EventRequest (evntNo),
  CONSTRAINT FK_EMPNO FOREIGN KEY (empNo) REFERENCES Employee (empNo)
);
INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P100', 'E100', '2013-10-25', 'Standard operation', 'Operation', 'E102');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P101', 'E104', '2013-12-03', 'Watch for gate crashers', 'Operation', 'E100');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P102', 'E105', '2013-12-05', 'Standard operation', 'Operation', 'E102');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P103', 'E106','2013-12-12', 'Watch for seat switching', 'Operation', NULL);

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P104', 'E101', '2013-10-26', 'Standard cleanup', 'Cleanup', 'E101');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P105', 'E100', '2013-10-25', 'Light cleanup', 'Cleanup', 'E101');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P199', 'E102', '2013-12-10', 'Standard operation', 'Operation', 'E101');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P299', 'E101', '2013-10-26', '', 'Operation', 'E101');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P349', 'E106', '2013-12-12', '', 'Cleanup', 'E101');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P85', 'E100', '2013-10-25', 'Standard operation', 'Setup', 'E102');

INSERT INTO EventPlan (planNo, evntNo, workDate, notes, activity, empNo)
VALUES ('P95', 'E101', '2013-10-26', 'Extra security', 'Setup', 'E102');
CREATE TABLE EventPlanLine (
  planNo    CHAR(8)   NOT NULL,
  lineNo    CHAR(8)   NOT NULL,
  locNo     CHAR(8)   NOT NULL,
  resNo     CHAR(8)   NOT NULL,
  timeStart TIMESTAMP NOT NULL,
  timeEnd   TIMESTAMP NOT NULL,
  numberFLD INTEGER   NOT NULL,
  CONSTRAINT PK_EventPlanLine PRIMARY KEY (planNo, lineNo),
  CONSTRAINT FK_EventPlan FOREIGN KEY (planNo) REFERENCES EventPlan (planNo),
  CONSTRAINT FK_Location FOREIGN KEY (locNo) REFERENCES Location (locNo),
  CONSTRAINT FK_ResourceTbl FOREIGN KEY (resNo) REFERENCES ResourceTbl (resNo)
);
INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P100', '1','L100','R100','2013-10-25 8:00','2013-10-25 17:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P100', '2','L101','R101','2013-10-25 12:00','2013-10-25 17:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P100', '3','L102','R102','2013-10-25 7:00','2013-10-25 16:30','1');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P100', '4','L100','R102','2013-10-25 18:00','2013-12-12 22:00','1');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P101', '1','L103','R100','2013-12-03 18:00','2013-12-03 20:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P101', '2','L105','R100','2013-12-03 18:30','2013-12-03 19:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P101', '3','L103','R103','2013-12-03 19:00','2013-12-03 20:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P102', '1','L103','R100','2013-12-05 18:00','2013-12-05 19:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P102', '2','L105','R100','2013-12-05 18:00','2013-12-05 21:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P102', '3','L103','R103','2013-12-05 19:00','2013-12-05 22:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P103', '1','L103','R100','2013-12-12 18:00','2013-12-12 21:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P103', '2','L105','R100','2013-12-12 18:00','2013-12-12 21:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P103', '3','L103','R103','2013-12-12 19:00','2013-12-12 22:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P104', '1','L101','R104','2013-10-26 18:00','2013-10-26 22:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P104', '2','L100','R104','2013-10-26 18:00','2013-10-26 22:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P105', '1','L101','R104','2013-10-25 18:00','2013-10-25 22:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P105', '2','L100','R104','2013-10-25 18:00','2013-10-25 22:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P199', '1','L100','R100','2013-12-10 8:00','2013-12-10 12:00','1');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P349', '1','L103','R100','2013-12-12 12:00','2013-12-12 15:30','1');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P85', '1','L100','R100','2013-10-25 9:00','2013-10-25 17:00','5');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P85', '2','L102','R101','2013-10-25 8:00','2013-10-25 17:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P85', '3','L104','R100','2013-10-25 10:00','2013-10-25 17:00','3');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P95', '1','L100','R100','2013-10-26 8:00','2013-10-26 17:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P95', '2','L102','R101','2013-10-26 9:00','2013-10-26 17:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P95', '3','L106','R100','2013-10-26 10:00','2013-10-26 15:00','4');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P95', '4','L100','R103','2013-10-26 13:00','2013-10-26 17:00','2');

INSERT INTO EventPlanLine(planNo, lineNo, locNo, resNo, timeStart, timeEnd, numberFLD) 
VALUES ('P95', '5','L101','R104','2013-10-26 13:00','2013-10-26 17:00','2');
