select * FROM (
SELECT
`0ch_on`, `0createdon`, 
CASE WHEN `0ch_on` > `0createdon` THEN `0ch_on` ELSE `0createdon` END AS actual_update,
`month_part` 
FROM dev.cv_fleet_settlement_mp_tableau 
WHERE 
`month_part` = "201611" 
) a
WHERE
actual_update RLIKE "^201611"