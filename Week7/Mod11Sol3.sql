-- Given
   -- Student (StdNo, StdName, StdEmail, StdAddress, StdCity, StdState, StdZip )
   -- Lender(LenderNo, LenderName)
   -- Institution(InstNo, InstName, InstMascot)
   
   -- StdEmail is unique in Student Table
   -- LenderName is unique in Lender
   -- InstName is unique in Institution

-- In the Student table, StdNo and StdEmail, both are unique which violates BCNF Property
-- So either make StdEmail as primary key or StdNo

-- In Lender table LenderName and LenderNo both are unique

-- In Institution table, InstName, InstNo is unique