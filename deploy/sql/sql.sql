SELECT two AS 'country', three AS 'asn', six AS 'year', sum(five) AS 'Total Hosts' 
    FROM `asns` 
        WHERE six > 20160101 AND six < 20161231 AND seven = 'allocated' 
            GROUP BY two 
                ORDER BY two
