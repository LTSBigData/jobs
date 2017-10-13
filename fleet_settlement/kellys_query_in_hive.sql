SELECT 
`zsetledoc`
,`0cust_sales`
,`ZSETLEITM`
,`ZSETCCODE`
,case when `ZSETCCODE___T` = "null" or `ZSETCCODE___T` = '' then null ELSE `ZSETCCODE___T` END AS ZSETCCODE___T 
,`ZSETRANFE`
,`ZOTHERFEE`
,case when `ZREONCODE` is null or `ZREONCODE` = '' then CAST(0 AS BIGINT) ELSE CAST(`ZREONCODE` AS BIGINT) end AS ZREONCODE
,case when `ZREONCODE___T` is null or `ZREONCODE___T` = '' or `ZREONCODE___T` = "null" then null ELSE `ZREONCODE___T` end AS ZREONCODE___T
,case when `ZRESONCDE` is null or `ZRESONCDE` = '' then CAST(0 AS BIGINT) ELSE CAST(`ZRESONCDE` AS BIGINT) end AS ZRESONCDE
,`0FISCYEAR` AS `YEAR`
,cast(date_format(from_unixtime(unix_timestamp(`ZTRANDATE`,'yyyyMMdd')),'yyyy-MM-dd') AS DATE) AS TRANS_DATE
,`ZTRANTYPE`
,`ZTRANTYPE___T`
,cast(`0PLANT__ZSTORENUM` AS int) AS `0PLANT__ZSTORENUM`
,`0PLANT__ZSTORENUM___T`
,`0PLANT__ZNETWORK`
,case when `0PLANT__ZNETWORK___T` IN ("null", '') THEN null ELSE `0PLANT__ZNETWORK___T` END AS 0PLANT__ZNETWORK___T
,`0PLANT__0DISTR_CHAN`
,`0PLANT__0DISTR_CHAN___T`
,`0PLANT__0REGION`
,`0PLANT__0REGION___T`
,`0PLANT__0SALESORG`
,`0PLANT__0SALESORG___T`
,`0DIVISION`
,`0DIVISION___T`
,case when `0CUST_SALES___T` IN ("null", '') THEN null ELSE `0CUST_SALES___T` END AS 0CUST_SALES___T
,case when `0CUST_SALES__ZINAFLAG` IN ("null", '') THEN null ELSE `0CUST_SALES__ZINAFLAG` END AS 0CUST_SALES__ZINAFLAG
,case when `0CUST_SALES__0ACCNT_GRP` IN ("null", '') THEN null ELSE `0CUST_SALES__0ACCNT_GRP` END AS 0CUST_SALES__0ACCNT_GRP
,case when `0CUST_SALES__0ACCNT_GRP___T` IN ("null", '') THEN null ELSE `0CUST_SALES__0ACCNT_GRP___T` END AS 0CUST_SALES__0ACCNT_GRP___T
,CASE WHEN `0CUST_SALES__ZSALREGIN` = "null" or `0CUST_SALES__ZSALREGIN` = '' THEN null ELSE `0CUST_SALES__ZSALREGIN` END AS 0CUST_SALES__ZSALREGIN
,CASE WHEN `0CUST_SALES__ZSALREGIN___T` = "null" or `0CUST_SALES__ZSALREGIN___T` = '' THEN null ELSE `0CUST_SALES__ZSALREGIN___T` END AS 0CUST_SALES__ZSALREGIN___T
,CASE WHEN `0CUST_SALES__0CUST_GROUP` = "null" or `0CUST_SALES__0CUST_GROUP` = '' THEN null ELSE `0CUST_SALES__0CUST_GROUP` end AS 0CUST_SALES__0CUST_GROUP
,CASE WHEN `0CUST_SALES__0CUST_GROUP___T` = "null" or `0CUST_SALES__0CUST_GROUP___T` = '' THEN null ELSE `0CUST_SALES__0CUST_GROUP___T` end AS 0CUST_SALES__0CUST_GROUP___T
,`0DISTR_CHAN`
,`0DISTR_CHAN___T`
,CAST(`0MATERIAL` AS INT) AS 0MATERIAL
,`0MATERIAL___T`
,CASE WHEN `ZCNGCSTEX` is NULL OR `ZCNGCSTEX` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZCNGCSTEX` AS DOUBLE)*-1 END AS CNG_Cost_Amt
,CASE WHEN `ZEFCTDISC` is NULL OR `ZEFCTDISC` = 0 THEN CAST(`ZEFCTDISC` AS DOUBLE) ELSE CAST(`ZEFCTDISC` AS DOUBLE)*-1 END AS Effective_Discount
,CASE WHEN `ZPLPRCRBT` IS NULL OR `ZPLPRCRBT` = 0 THEN CAST(`ZPLPRCRBT` AS DOUBLE) ELSE CAST(`ZPLPRCRBT` AS DOUBLE)*-1 END AS Planned_Price_Rebate
,`ZSTORENUM__ZLATITUDE` AS Store_Latitude
,`ZSTORENUM__ZLONGITUD` AS Store_Longitude
,`ZSTORENUM__ZNETWORK`
,CASE WHEN `ZREBTEAMT` IS NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`ZREBTEAMT` AS DOUBLE) END AS GROWTH_REBATE
,CASE WHEN `ZALTRUKFE` is null OR `ZALTRUKFE` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZALTRUKFE` AS DOUBLE)*-1 END AS Truckstop_Fee
,CASE WHEN `ZALCUSTFE` is null OR `ZALCUSTFE` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZALCUSTFE` AS DOUBLE)*-1 END AS Customer_fee
,CASE WHEN `ZPLMGTFEE` is null OR `ZPLMGTFEE` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZPLMGTFEE` AS DOUBLE) END AS Platform_Management_Fee
,CASE WHEN `ZLOYALADJ` is null OR `ZLOYALADJ` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZLOYALADJ` AS DOUBLE) END AS Loyalty_Adjustment
,CASE WHEN `ZREBTEAMT` is null OR `ZREBTEAMT` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZREBTEAMT` AS DOUBLE)*-1 END AS Volume_Rebate
,CASE WHEN `ZTIREREVE` is null OR `ZTIREREVE` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZTIREREVE` AS DOUBLE) END AS Tire_Revenue
,CASE WHEN `ZLMS` is null OR `ZLMS` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZLMS` AS DOUBLE) END AS Light_Mechanical
,CASE WHEN `ZTIRESOLD` is null or `ZTIRESOLD` = 0 THEN CAST(0 AS INT) ELSE CAST(`ZTIRESOLD` AS INT) END AS Tire_Sold
,CASE WHEN `ZRETREADS` is NULL or `ZRETREADS` = 0 THEN CAST(0 AS INT) ELSE CAST(`ZRETREADS` AS INT) END AS Retreads
,CASE WHEN `ZTCESPEND` is NULL or `ZTCESPEND` = 0 THEN CAST(0 AS INT) ELSE CAST(`ZTCESPEND` AS INT) END AS TIRE_SPEND
,CAST(`ZSTORENUM__ZLANESNUM` AS INT) AS ZSTORENUM__ZLANESNUM
,CAST(`ZSTORENUM__ZLANETIRE` AS INT) AS ZSTORENUM__ZLANETIRE
,CASE WHEN `ZBIOADJEX` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`ZBIOADJEX` AS DOUBLE) END AS Bio_Adjustment
,CASE WHEN `ZREBTEADJ` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`ZREBTEADJ` AS DOUBLE)*-1 END AS REBATE_ADJUSTMENT
,CASE WHEN `ZFIXCNADJ` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`ZFIXCNADJ` AS DOUBLE) END AS FIXED_CONTRACT_ADJUSTMENT
,CASE WHEN `0AMOUNT` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`0AMOUNT` AS DOUBLE) END AS AMOUNT
,CASE WHEN `0QUANTITY` is NULL THEN 0 ELSE `0QUANTITY` END AS QUANTITY
,CASE WHEN `ZTOTALCST` is NULL OR `ZTOTALCST` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZTOTALCST` AS DOUBLE)*-1 END AS TOTAL_COST
,CASE WHEN `ZLOTYCOST` is NULL OR `ZLOTYCOST` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZLOTYCOST` AS DOUBLE)*-1 END AS LOYALTY_COST
,CASE WHEN `ZREBTEAMT` is NULL THEN 0 ELSE `ZREBTEAMT` END AS LUMP_SUM
,CASE WHEN `ZRFIDID` = "Y" THEN CASE WHEN `0AMOUNT` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`0AMOUNT` AS DOUBLE) END ELSE 0 END AS RFID
,CASE WHEN `0MATERIAL` = "000000000000001011" THEN CASE WHEN `0QUANTITY` is NULL THEN 0 ELSE `0QUANTITY` END ELSE 0 END AS CNG_QTY
,CASE WHEN `0MATERIAL` = "000000000000001026" THEN CASE WHEN `0QUANTITY` is NULL THEN 0 ELSE `0QUANTITY` END ELSE 0 END AS DEF_QTY
,CASE WHEN `0MATERIAL` = "000000000000001026" THEN CASE WHEN `0AMOUNT` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`0AMOUNT` AS DOUBLE) END ELSE 0 END AS DEF_REVENUE
,CASE WHEN `0MATERIAL` IN ("000000000000001015","000000000000001017") THEN CASE WHEN `ZTOTALCST` is NULL OR `ZTOTALCST` = 0 THEN CAST(0 AS DOUBLE) ELSE CAST(`ZTOTALCST` AS DOUBLE)*-1 END ELSE 0 END AS Total_DSL_Cost
,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN CASE WHEN `0AMOUNT` is NULL THEN CAST(0 AS DOUBLE) ELSE CAST(`0AMOUNT` AS DOUBLE) END ELSE 0 END AS REVENUE_FUEL             
,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN CASE WHEN `ZEFCTDISC` is NULL OR `ZEFCTDISC` = 0 THEN CAST(`ZEFCTDISC` AS DOUBLE) ELSE CAST(`ZEFCTDISC` AS DOUBLE)*-1 END ELSE 0 END AS EFFECTIVE_DISCOUNT_FUEL
,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN CASE WHEN `ZPLPRCRBT` IS NULL OR `ZPLPRCRBT` = 0 THEN CAST(`ZPLPRCRBT` AS DOUBLE) ELSE CAST(`ZPLPRCRBT` AS DOUBLE)*-1 END ELSE 0 END AS PLANNED_PRICE_REBATE_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZTOTALCST`,0)*-1  ELSE 0 END AS LOVES_TOTAL_COST_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") AND `ZAGREETYP` IN (`SIMPLE VOLUME`, `VOLUME`)THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS VOLUME_REBATES_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") AND `ZAGREETYP` = `GROWTH` THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS GROWTH_REBATES_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS LUMP_SUM_FLEET_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZALTRUKFE`,0)*-1 ELSE 0 END AS TRUCK_STOP_FEE_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZALCUSTFE`,0)*-1 ELSE 0 END AS CUSTOMER_FEE_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZPLMGTFEE`,0)*-1 ELSE 0 END AS PLATFORM_MGMT_FEE_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`0QUANTITY`,0) ELSE 0 END AS FUEL_GALLONS
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS FUEL_REVENUE
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZLOTYCOST`,0) ELSE 0 END AS LOYALTY_COST_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("CNG","REEFER","DIESEL") THEN IFNULL(`ZLOYALADJ`,0) ELSE 0 END AS LOYALTY_ADJUSTMENT_FUEL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS REVENUE_DSL             
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZEFCTDISC`,0)*-1 ELSE 0 END AS EFFECTIVE_DISCOUNT_DSL 
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZPLPRCRBT`,0)*-1 ELSE 0 END AS PLANNED_PRICE_REBATE_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZTOTALCST`,0)*-1  ELSE 0 END AS LOVES_TOTAL_COST_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") AND `ZAGREETYP` IN (`SIMPLE VOLUME`, `VOLUME`)THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS VOLUME_REBATES_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") AND `ZAGREETYP` = `GROWTH` THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS GROWTH_REBATES_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS LUMP_SUM_FLEET_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZALTRUKFE`,0)*-1 ELSE 0 END AS TRUCK_STOP_FEE_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZALCUSTFE`,0)*-1 ELSE 0 END AS CUSTOMER_FEE_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZPLMGTFEE`,0)*-1 ELSE 0 END AS PLATFORM_MGMT_FEE_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`0QUANTITY`,0) ELSE 0 END AS DSL_GALLONS
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS DSL_REVENUE
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZLOTYCOST`,0) ELSE 0 END AS LOYALTY_COST_DSL
--,CASE WHEN `0MATERIAL___T` IN ("REEFER","DIESEL") THEN IFNULL(`ZLOYALADJ`,0) ELSE 0 END AS LOYALTY_ADJUSTMENT_DSL
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS REVENUE_DEF             
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZEFCTDISC`,0)*-1 ELSE 0 END AS EFFECTIVE_DISCOUNT_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZPLPRCRBT`,0)*-1 ELSE 0 END AS PLANNED_PRICE_REBATE_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZTOTALCST`,0)*-1  ELSE 0 END AS LOVES_TOTAL_COST_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") AND `ZAGREETYP` IN (`SIMPLE VOLUME`, `VOLUME`)THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS VOLUME_REBATES_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") AND `ZAGREETYP` = `GROWTH` THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS GROWTH_REBATES_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS LUMP_SUM_FLEET_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZALTRUKFE`,0)*-1 ELSE 0 END AS TRUCK_STOP_FEE_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZALCUSTFE`,0)*-1 ELSE 0 END AS CUSTOMER_FEE_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZPLMGTFEE`,0)*-1 ELSE 0 END AS PLATFORM_MGMT_FEE_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`0QUANTITY`,0) ELSE 0 END AS DEF_GALLONS
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS DEF_REVENUE
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZLOTYCOST`,0) ELSE 0 END AS LOYALTY_COST_DEF
--,CASE WHEN `0MATERIAL___T` IN ("DEF") THEN IFNULL(`ZLOYALADJ`,0) ELSE 0 END AS LOYALTY_ADJUSTMENT_DEF
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS REVENUE_CNG             
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZEFCTDISC`,0)*-1 ELSE 0 END AS EFFECTIVE_DISCOUNT_CNG 
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZPLPRCRBT`,0)*-1 ELSE 0 END AS PLANNED_PRICE_REBATE_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZTOTALCST`,0)*-1  ELSE 0 END AS LOVES_TOTAL_COST_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") AND `ZAGREETYP` IN (`SIMPLE VOLUME`, `VOLUME`)THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS VOLUME_REBATES_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") AND `ZAGREETYP` = `GROWTH` THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS GROWTH_REBATES_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZREBTEAMT`,0)*-1  ELSE 0 END AS LUMP_SUM_FLEET_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZALTRUKFE`,0)*-1 ELSE 0 END AS TRUCK_STOP_FEE_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZALCUSTFE`,0)*-1 ELSE 0 END AS CUSTOMER_FEE_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZPLMGTFEE`,0)*-1 ELSE 0 END AS PLATFORM_MGMT_FEE_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`0QUANTITY`,0) ELSE 0 END AS CNG_GALLONS
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`0AMOUNT`,0) ELSE 0 END AS CNG_REVENUE
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZLOTYCOST`,0)*-1 ELSE 0 END AS LOYALTY_COST_CNG
--,CASE WHEN `0MATERIAL___T` IN ("CNG") THEN IFNULL(`ZLOYALADJ`,0)*-1 ELSE 0 END AS LOYALTY_ADJUSTMENT_CNG
,`ZDELINPFT` AS DELIVERED_IN
,`ZFACPROFT` AS FACTORING_PROFIT
,`ZPMCUSTCA` AS PM
,`ZTCINSPCT` AS TIRE_INSPECTION
--,IFNULL(`ZINDEXAMT`,0) AS Indx_Amt
--,IFNULL(`ZFEDTAXAM`,0) AS Fed_Tax_Amt
--,IFNULL(`ZOTTAXAMT`,0) AS Ot_Tax_Amt
--,IFNULL(`ZSETDISCO`,0) AS Disct_Amt
--,IFNULL(`ZCMSATTAX`,0) AS St_Tax_Amt
--,IFNULL(`ZCOMTXAMT`,0) AS Sl_Tax_Amt
--,IFNULL(`ZFRTAMT`,0) AS Freight_Amt
--,IFNULL(`ZFUELCPG`,0) AS Fuel_Cost_PG 
--,IFNULL(`ZFTAXCGAL`,0) AS Flat_Tax_Cost_PG
--,IFNULL(`ZTXCOSTPG`,0) AS Tax_Cost_PG
--,IFNULL(`ZFRIGTGAL`,0) AS Freight_Cost_PG
--,IFNULL(`0QUANTITY`,0) * IFNULL(`ZFUELCPG`,0) AS Fuel_Cost_calc
--,IFNULL(`0QUANTITY`,0) * IFNULL(`ZFTAXCGAL`,0) AS Flat_Tax_Cost_calc
--,IFNULL(`0QUANTITY`,0) * IFNULL(`ZTXCOSTPG`,0) AS Tax_Cost_calc
--,IFNULL(`0QUANTITY`,0) * IFNULL(`ZFRIGTGAL`,0) AS Freight_Cost_calc
--,IFNULL(`ZINDEXAMT`,0) - (IFNULL(`0QUANTITY`,0)*IFNULL(`ZFUELCPG`,0)) AS OPIS_vs_Actual_calc
--,IFNULL(`ZFEDTAXAM`,0)+IFNULL(`ZOTTAXAMT`,0)+IFNULL(`ZCMSATTAX`,0)+IFNULL(`ZCOMTXAMT`,0)- (IFNULL(`0QUANTITY`,0) * IFNULL(`ZFTAXCGAL`,0))- (IFNULL(`0QUANTITY`,0) * IFNULL(`ZTXCOSTPG`,0)) AS Fleet_Taxes_vs_Actual_calc
--,IFNULL(`ZFRTAMT`,0)-(IFNULL(`0QUANTITY`,0) * IFNULL(`ZFRIGTGAL`,0)) AS Fleet_Freight_vs_Actual_calc
,`month_part`
FROM dev.cv_fleet_settlement_mp_tableau 
WHERE `month_part` = "201701"
--ORDER BY `zsetledoc` DESC
LIMIT 200
;