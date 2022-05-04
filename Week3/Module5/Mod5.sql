USE course;
SELECT evntNo, dateHeld, EventRequest.custNo, custName, EventRequest.facNo, facName
FROM Facility, EventRequest, Customer
WHERE (EventRequest.custNo = Customer.custNo)
AND (EventRequest.facNo = Facility.facNo)
AND city = 'Boulder'
AND EXTRACT(YEAR FROM dateHeld) = '2013';

SELECT evntNo, dateHeld, EventRequest.custNo, custName, EventRequest.facNo, facName,
(estCost /  estAudience) AS estimatedAudienceCost
FROM 
Facility, EventRequest, Customer
WHERE (EventRequest.custNo = Customer.custNo)
AND (EventRequest.facNo = Facility.facNo)
AND EXTRACT(YEAR FROM dateHeld) = '2013'
HAVING estimatedAudienceCost < 0.2;

SELECT EventRequest.custNo, custName,
SUM(estCost) AS totalEstimatedCost
FROM EventRequest, Customer
WHERE 
(EventRequest.custNo = Customer.custNo)
AND status="Approved"
GROUP BY EventRequest.custNo, custName;

INSERT INTO Customer (custNo, custName, custAddress, internal, contact, phoneNo, city, state, zip) VALUES
 ('C106', 'Tim Gasser', '2345 Chuff Avenue', 'N', 'Bill Baseball', '8476543939', 'Austin', 'TX', '12345');
 
 SET SQL_SAFE_UPDATES = 0;
UPDATE ResourceTbl
SET rate = rate * 1.1
WHERE 
resName = "nurse";

SET SQL_SAFE_UPDATES = 1;

DELETE FROM Customer
WHERE CustNo = 'C106' AND CustName = 'Tim Gasser';

SELECT * FROM Customer;



