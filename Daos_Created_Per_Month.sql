--Full dashboard can be found at: https://dune.xyz/broderickbonelli/Aragon-Growth-Dashboard

--Dao's Created Per Month
SELECT DATE_TRUNC('month', evt_block_time) AS time,
    COUNT(dao) AS daos
FROM aragon."DAOFactory_evt_DeployDAO"
GROUP BY time
ORDER BY time;

