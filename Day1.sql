--Advent of code 2020
-- Day 1 parts 1 and 2

-- Dustin Franz
-- Dec 5 2020

--Create Numbers Table
DROP TABLE if exists NumbersTest
DECLARE @RunDate datetime
SET @RunDate=GETDATE()
CREATE TABLE NumbersTest (Number  int  not null)  
;WITH Nums(Number) AS
(SELECT 1 AS Number
 UNION ALL
 SELECT Number+1 FROM Nums where Number<10000
)
insert into NumbersTest(Number)
    select Number from Nums option(maxrecursion 10000)
ALTER TABLE NumbersTest ADD CONSTRAINT PK_NumbersTest PRIMARY KEY CLUSTERED (Number)

--Create Set of nums
drop table if exists #set
select ROW_NUMBER() OVER (
	ORDER BY number
   ) row, number
into #set from NumbersTest where Number in (261,1773,1839,1551,1781,1276,1372,1668,1823,1870,1672,1821,1327,1902,1949,1389,1720,1437,1716,1360,1893,1410,1881,1927,1639,1514,1753,1625,1249,1696,1698,1699,2004,
1742,1903,473,1948,1830,1973,2005,1468,1824,1809,1493,2009,1848,1306,1519,1618,1905,1402,1705,1910,1609,1571,1557,1420,608,1471,1383,1442,1447,1985,1486,1629,1450,1767,1407,1626,1623,1467,1224,1269,1325,1674,
1945,1733,1913,1451,1853,1875,405,1500,1634,1570,1868,1510,1069,1296,1852,1287,1274,832,1373,1142,1838,1854,1480,1628,1632,1597,1761,1717,1684,1956,1351,1622,1941,1704,1926,1873,1393,1850,1898,1960,1673,1736,
1901,1806,1768,1670,1989,1214,1851,1715,1461,1277,951,1482,1464,1883,1976,1602,1606,1258,1801,1593,1332,1386,1309,1388,1762,1533,1805,1462,375,1555,1357,1578,1552,1473,1834,1262,1466,1925,1955,1575,1975,1964,
1440,1667,1922,1454,1813,1968,1836,1982,1326,1811,900,1588,1529,1997,1345,1859,1458,1764,1509,1397,1237,1627,1564,1814,1842,1679,1289,1957,1819,801,1350,1841,1803,1718,1966,1272,1636,1352,1496,1455,1488)

declare @x int = 1;

While @x <= (select count(1) from #set) BEGIN

    declare @firstNum INT;

    select @firstNum = Number 
    from #set where [row] = @x;

    declare @y int = @x + 1;

    while @y  <= (select count(1) from #set) BEGIN

        declare @2ndNum INT;

        select @2ndNum = Number
        from #set where [row] = @y;

        declare @z INT = @y + 1;
        if (@firstNum + @2ndNum = 2020) BEGIN
            Select @firstNum , @2ndNum , @firstNum * @2ndNum 
        END
        ELSE IF (@firstNum + @2ndNum > 2020)
            BREAK
        while @z <= (select count(1) from #set) BEGIN

            declare @3rdNum INT;

            select @3rdNum = Number 
            from #set where [row] = @z;

            if (@firstNum + @2ndNum + @3rdNum = 2020) BEGIN
                Select @firstNum , @2ndNum , @3rdNum, @firstNum * @2ndNum * @3rdNum
            END
            ELSE if (@firstNum + @2ndNum + @3rdNum > 2020)
                BREAK 
            set @z = @z + 1;
        END
        set @y = @y + 1;
    END
    set @x = @x + 1;
END;