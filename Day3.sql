--Advent of code 2020
-- Day 2 parts 1 and 2

-- Dustin Franz
-- Dec 6 2020

drop table if exists #set
select ROW_NUMBER() OVER (
	ORDER BY (select NULL)
   ) row, slope
into #set from day3

select count(1) from #set
where substring(slope, CASE (3*(row-1) + 1) % 31 WHEN 0 THEN 31 ELSE (3*(row-1) + 1) % 31 END , 1) = '#'
and row > 1

declare @treeSum BIGINT = 1;

select @treeSum = @treeSum * count(1) from #set
where substring(slope, CASE ((row-1) + 1) % 31 WHEN 0 THEN 31 ELSE ((row-1) + 1) % 31 END , 1) = '#'
and row > 1

select @treeSum = @treeSum * count(1) from #set
where substring(slope, CASE (3*(row-1) + 1) % 31 WHEN 0 THEN 31 ELSE (3*(row-1) + 1) % 31 END , 1) = '#'
and row > 1

select @treeSum = @treeSum * count(1) from #set
where substring(slope, CASE (5*(row-1) + 1) % 31 WHEN 0 THEN 31 ELSE (5*(row-1) + 1) % 31 END , 1) = '#'
and row > 1

select  @treeSum = @treeSum * count(1) from #set
where substring(slope, CASE (7*(row-1) + 1) % 31 WHEN 0 THEN 31 ELSE (7*(row-1) + 1) % 31 END , 1) = '#'
and row > 1

--Don't look at me
select @treeSum = @treeSum * count(1) from #set
where substring(slope, CASE ((CEILING((row*1.0-1)/2 ))+1) % 31 WHEN 0 THEN 31 ELSE ((CEILING((row*1.0-1)/2 ))+1) % 31 END , 1) = '#'
AND row % 2 = 1
AND row > 1

select @treeSum