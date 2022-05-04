USE coursera;

select custNo,custName,phoneNo from course.customer;

SELECT custNo, custName, phoneNo, city FROM course.Customer WHERE state = "CO";

SELECT * FROM course.EventRequest WHERE estCost > 4000 ORDER BY dateHeld;

SELECT evntNo, dateHeld, estAudience FROM course.EventRequest 
WHERE (status = "Approved" AND estAudience > 9000) 
OR (status = "Pendind" AND estAudience > 7000);

SELECT AVG(numberFLD) AS avgNumberFLD, planNo FROM course.EventPlanLine WHERE locNo='L100' GROUP BY planNo;

SELECT AVG(numberFLD) AS avgNumberFLD, planNo FROM course.EventPlanLine WHERE locNo='L100' GROUP BY planNo HAVING COUNT(*) > 1; 