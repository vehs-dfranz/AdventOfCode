--Advent of code 2020
-- Day 2

-- Dustin Franz
-- Dec 5 2020

--Import wizard imported data into dbo.[2]
--containsCount	containsLetter	value
--15-16	        p:	            ppppppppppplppppp
--4-9	        m:	            xvrwfmkmmmc
--14-15	        w:	            wwwwdwwwwwwwwnwww

-- parsing lower bound
--SUBSTRING(ContainsCount, 1, CHARINDEX('-', ContainsCount)-1) 

-- parsing upper bound
--SUBSTRING(ContainsCount, CHARINDEX('-', ContainsCount) + 1, 100) 

-- parsing letter
--LEFT(ContainsLetter, 1) letter

-- counting # of letters
--LEN(value) - LEN(REPLACE(value, LEFT(ContainsLetter, 1), ''))

-- Part 1

Select  count(1)
        from [2]
        WHERE 
        -- where # of letters in value >= lower bound
        LEN(value) - LEN(REPLACE(value, LEFT(ContainsLetter, 1), '')) >= SUBSTRING(ContainsCount, 1, CHARINDEX('-', ContainsCount)-1)
        -- where # of letters in value <= upper bound
        AND LEN(value) - LEN(REPLACE(value, LEFT(ContainsLetter, 1), '')) <= SUBSTRING(ContainsCount, CHARINDEX('-', ContainsCount) + 1, 100)

-- Part 2

-- Get lower bound letter
-- ( SUBSTRING(value,  CONVERT(INT, SUBSTRING(ContainsCount, 1, CHARINDEX('-', ContainsCount)-1)), 1)

-- Get upper bound letter
-- SUBSTRING(value,  CONVERT(INT, SUBSTRING(ContainsCount, CHARINDEX('-', ContainsCount) + 1, 100)), 1)

select count(1)
    
from [2]
where 
   -- first or 2nd position matches letter
   ( SUBSTRING(value,  CONVERT(INT, SUBSTRING(ContainsCount, 1, CHARINDEX('-', ContainsCount)-1)), 1) = LEFT(ContainsLetter, 1)
    OR
    SUBSTRING(value,  CONVERT(INT, SUBSTRING(ContainsCount, CHARINDEX('-', ContainsCount) + 1, 100)), 1) = LEFT(ContainsLetter, 1) )
   AND NOT
   -- and both don't
      ( SUBSTRING(value,  CONVERT(INT, SUBSTRING(ContainsCount, 1, CHARINDEX('-', ContainsCount)-1)), 1) = LEFT(ContainsLetter, 1)
    AND
    SUBSTRING(value,  CONVERT(INT, SUBSTRING(ContainsCount, CHARINDEX('-', ContainsCount) + 1, 100)), 1) = LEFT(ContainsLetter, 1) )