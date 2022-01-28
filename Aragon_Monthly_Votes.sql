--Full dashboard can be found at: https://dune.xyz/broderickbonelli/Aragon-Growth-Dashboard

--Count the # of votes per month that have occurred on the Aragon network amongst all dao's
SELECT 
date_trunc('month', evt_block_time) AS time,
COUNT(*) AS votes
FROM aragon."Voting_evt_CastVote" 
GROUP BY time
ORDER BY time;