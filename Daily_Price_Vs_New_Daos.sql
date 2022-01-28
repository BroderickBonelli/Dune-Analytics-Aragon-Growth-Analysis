--Full dashboard can be found at: https://dune.xyz/broderickbonelli/Aragon-Growth-Dashboard

--First, query the price of Aragon's native token ANT from dune.xyz. Truncate by day.
WITH table1 AS (
SELECT DATE_TRUNC('day', minute) as time,
    price as price
FROM prices."usd"
WHERE symbol = 'ANT'
GROUP BY time, price
ORDER BY time, price),

--Next, query the # of new dao's created on the Aragon network and truncate by day
table2 AS (
SELECT DATE_TRUNC('day', evt_block_time) as time,
    COUNT(dao) as new_daos
FROM aragon."DAOFactory_evt_DeployDAO"
GROUP BY time
ORDER BY time
)

--Finally, join both query results on the common time column, and select the date, price, and new_daos columns to return
SELECT table1.time, table1.price, table2.new_daos FROM table1 JOIN table2 ON (table1."time" = table2."time");
   

