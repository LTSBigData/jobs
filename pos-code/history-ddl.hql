set hivevar:POS_ENV=qa;


CREATE DATABASE IF NOT EXISTS ${hivevar:POS_ENV};
use ${hivevar:POS_ENV};

drop table ${hivevar:POS_ENV}.fct_sale_raw_line;
CREATE EXTERNAL TABLE ${hivevar:POS_ENV}.fct_sale_raw_line(
DATE_KEY    int,
STORE_KEY    int,
TILL_KEY    int,
INVOICE_NO    string,
SALE_INVC_TYPE    string,
LINE_NO    int,
STORE_CODE    string,
PRODUCT_KEY    int,
PRICE_OVR_REASON_KEY    int,
SALE_LINE_TYPE    string,
FLG_FRANCHISE    smallint,
PRODUCT_CODE    string,
TILL_CODE    string,
PROMOTION_CODE    string,
DISCOUNT_TYPE_CODE    string,
RETURN_REASON_CODE    int,
BARCODE    string,
SALE_TOT_QTY    double,
SALE_NET_VAL    double,
SALE_TOT_TAX_VAL    double,
SALE_TOT_VAL_AT_PP    double,
SALE_TOT_DISC_QTY    double,
SALE_TOT_DISC_VAL    double,
SALE_TOT_GLOBAL_DISC_VAL    double,
SALE_TOT_GLOBAL_DISC_TAX_VAL    double,
PRODUCT_FULL_PRICE    double,
PRODUCT_HO_PRICE    double,
ACTUAL_SELLING_PRICE    double,
SALE_TOT_PACK_COUNT    int,
MARKDOWN_FLG    smallint,
CODE_KEYED_IN_FLG    string,
PRICE_OVERRIDE_FLG    string,
PRICE_OVERRIDE_AUTHORIZER    string,
ARC_DATE    date,
INVOICE_DATE    date,
SUB_STORE_CODE    string,
ITEM_ACTUAL_PRICE    double,
ITEM_ADJUSTED_AMOUNT    double,
TOTAL_AMOUNT_WITHOUT_LOYALTY    double,
ITEM_STD_PRICE    double,
PUMP_SERVER_REF    string,
SERIAL_PROMPT    string,
CUSTOMER_LOYALTY_CARD    string,
PUMP_MODE    string,
SUB_STATUS_CODE    int,
SUB_STATUS_DESC    string,
TAX_GROUP_1    int,
SALE_INVC_START string,
SALE_INVC_END string,
DISCOUNT_NAME    string,
SALE_TOT_VAL_AT_PP_TCR    double,
TCR_COST    double,
PAYMENT_TYPE_ID    string,
PUMP_ID    int
)
COMMENT 'Raw POS line item'
PARTITIONED BY (
date_part string)
row format DELIMITED
fields terminated by ','
lines terminated by '\n'
null DEFINED as ''
  STORED as TEXTFILE
  location '/${hivevar:POS_ENV}/landing/history/raw/lineitem';
  
drop table ${hivevar:POS_ENV}.fct_sale_raw_header;
CREATE EXTERNAL TABLE ${hivevar:POS_ENV}.fct_sale_raw_header(
DATE_KEY    int,
STORE_KEY    int,
TILL_KEY    int,
INVOICE_NO    string,
SALE_INVC_TYPE    string,
CUSTOMER_KEY    int,
CASHIER_KEY    int,
TIME_KEY    int,
STORE_CODE    string,
FLG_FRANCHISE    smallint,
TILL_CODE    string,
CUSTOMER_CODE    string,
EMPLOYEE_CODE    string,
CASHIER_CODE    string,
SALE_TOT_QTY    double,
SALE_NET_VAL    double,
SALE_RCVD_VAL    double,
SALE_TOT_TAX_VAL    double,
SALE_TOT_DISC_VAL    double,
SALE_TOT_ITEM_COUNT    int,
SALE_TOT_PACK_COUNT    int,
LOYALTY_TRANS_FLG    smallint,
LOYALTY_BONUS_POINTS    int,
LOYALTY_STD_POINTS    int,
SHIPPING_FEE    double,
INVOICE_FEE    double,
GENDER    double,
AGE    double,
ARC_DATE    date,
INVOICE_DATE    date,
SUB_STORE_CODE    string,
CUSTOMER_LOYALTY_CARD    string,
CUSTOMER_GROUP_ID    string,
CUSTOMER_ACCOUNT_NUMBER    string,
SALE_INVC_START string,
SALE_INVC_END string,
SUPERVISOR_ID    string,
SALE_ORDER_ID    string,
ORDER_DATE    date,
SESSION_ID    string,
SOURCE_KEY    int,
ORDER_GEO_LOCATION_KEY    int
)
COMMENT 'POS header'
PARTITIONED BY (
  date_part string)
row format DELIMITED
fields terminated by ','
lines terminated by '\n'
null DEFINED as ''
  STORED as TEXTFILE
  location "/${hivevar:POS_ENV}/landing/history/raw/header";
  
  
drop table ${hivevar:POS_ENV}.fct_sale_staging_trans;
CREATE EXTERNAL TABLE ${hivevar:POS_ENV}.fct_sale_staging_trans(
H_DATE_KEY    int,
H_STORE_KEY    int,
H_TILL_KEY    int,
H_INVOICE_NO    string,
H_SALE_INVC_TYPE    string,
H_CUSTOMER_KEY    int,
H_CASHIER_KEY    int,
H_TIME_KEY    int,
H_STORE_CODE    string,
H_FLG_FRANCHISE    smallint,
H_TILL_CODE    string,
H_CUSTOMER_CODE    string,
H_EMPLOYEE_CODE    string,
H_CASHIER_CODE    string,
H_SALE_TOT_QTY    double,
H_SALE_NET_VAL    double,
H_SALE_RCVD_VAL    double,
H_SALE_TOT_TAX_VAL    double,
H_SALE_TOT_DISC_VAL    double,
H_SALE_TOT_ITEM_COUNT    int,
H_SALE_TOT_PACK_COUNT    int,
H_LOYALTY_TRANS_FLG    smallint,
H_LOYALTY_BONUS_POINTS    int,
H_LOYALTY_STD_POINTS    int,
H_SHIPPING_FEE    double,
H_INVOICE_FEE    double,
H_GENDER    double,
H_AGE    double,
H_ARC_DATE    date,
H_INVOICE_DATE    date,
H_SUB_STORE_CODE    string,
H_CUSTOMER_LOYALTY_CARD    string,
H_CUSTOMER_GROUP_ID    string,
H_CUSTOMER_ACCOUNT_NUMBER    string,
H_SALE_INVC_START string,
H_SALE_INVC_END string,
H_SUPERVISOR_ID    string,
H_SALE_ORDER_ID    string,
H_ORDER_DATE    date,
H_SESSION_ID    string,
H_SOURCE_KEY    int,
H_ORDER_GEO_LOCATION_KEY    int,
L_SALE_INVC_TYPE    string,
L_LINE_NO    int,
L_STORE_CODE    string,
L_PRODUCT_KEY    int,
L_PRICE_OVR_REASON_KEY    int,
L_SALE_LINE_TYPE    string,
L_FLG_FRANCHISE    smallint,
L_PRODUCT_CODE    string,
L_TILL_CODE    string,
L_PROMOTION_CODE    string,
L_DISCOUNT_TYPE_CODE    string,
L_RETURN_REASON_CODE    int,
L_BARCODE    string,
L_SALE_TOT_QTY    double,
L_SALE_NET_VAL    double,
L_SALE_TOT_TAX_VAL    double,
L_SALE_TOT_VAL_AT_PP    double,
L_SALE_TOT_DISC_QTY    double,
L_SALE_TOT_DISC_VAL    double,
L_SALE_TOT_GLOBAL_DISC_VAL    double,
L_SALE_TOT_GLOBAL_DISC_TAX_VAL    double,
L_PRODUCT_FULL_PRICE    double,
L_PRODUCT_HO_PRICE    double,
L_ACTUAL_SELLING_PRICE    double,
L_SALE_TOT_PACK_COUNT    int,
L_MARKDOWN_FLG    smallint,
L_CODE_KEYED_IN_FLG    string,
L_PRICE_OVERRIDE_FLG    string,
L_PRICE_OVERRIDE_AUTHORIZER    string,
L_ARC_DATE    date,
L_INVOICE_DATE    date,
L_SUB_STORE_CODE    string,
L_ITEM_ACTUAL_PRICE    double,
L_ITEM_ADJUSTED_AMOUNT    double,
L_TOTAL_AMOUNT_WITHOUT_LOYALTY    double,
L_ITEM_STD_PRICE    double,
L_PUMP_SERVER_REF    string,
L_SERIAL_PROMPT    string,
L_CUSTOMER_LOYALTY_CARD    string,
L_PUMP_MODE    string,
L_SUB_STATUS_CODE    int,
L_SUB_STATUS_DESC    string,
L_TAX_GROUP_1    int,
L_SALE_INVC_START string,
L_SALE_INVC_END string,
L_DISCOUNT_NAME    string,
L_SALE_TOT_VAL_AT_PP_TCR    double,
L_TCR_COST    double,
L_PAYMENT_TYPE_ID    string,
L_PUMP_ID    int
)
COMMENT 'POS transaction in staging'
PARTITIONED BY (
  date_part string)
STORED AS ORC
LOCATION '/${hivevar:POS_ENV}/landing/history/staging/trans'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"='67108864', "orc.row.index.stride"='5000');



drop table ${hivevar:POS_ENV}.fct_sale_trans;
CREATE EXTERNAL TABLE ${hivevar:POS_ENV}.fct_sale_trans(
H_DATE_KEY    int,
H_STORE_KEY    int,
H_TILL_KEY    int,
H_INVOICE_NO    string,
H_SALE_INVC_TYPE    string,
H_CUSTOMER_KEY    int,
H_CASHIER_KEY    int,
H_TIME_KEY    int,
H_STORE_CODE    string,
H_FLG_FRANCHISE    smallint,
H_TILL_CODE    string,
H_CUSTOMER_CODE    string,
H_EMPLOYEE_CODE    string,
H_CASHIER_CODE    string,
H_SALE_TOT_QTY    double,
H_SALE_NET_VAL    double,
H_SALE_RCVD_VAL    double,
H_SALE_TOT_TAX_VAL    double,
H_SALE_TOT_DISC_VAL    double,
H_SALE_TOT_ITEM_COUNT    int,
H_SALE_TOT_PACK_COUNT    int,
H_LOYALTY_TRANS_FLG    smallint,
H_LOYALTY_BONUS_POINTS    int,
H_LOYALTY_STD_POINTS    int,
H_SHIPPING_FEE    double,
H_INVOICE_FEE    double,
H_GENDER    double,
H_AGE    double,
H_ARC_DATE    date,
H_INVOICE_DATE    date,
H_SUB_STORE_CODE    string,
H_CUSTOMER_LOYALTY_CARD    string,
H_CUSTOMER_GROUP_ID    string,
H_CUSTOMER_ACCOUNT_NUMBER    string,
H_SALE_INVC_START string,
H_SALE_INVC_END string,
H_SUPERVISOR_ID    string,
H_SALE_ORDER_ID    string,
H_ORDER_DATE    date,
H_SESSION_ID    string,
H_SOURCE_KEY    int,
H_ORDER_GEO_LOCATION_KEY    int,
L_SALE_INVC_TYPE    string,
L_LINE_NO    int,
L_STORE_CODE    string,
L_PRODUCT_KEY    int,
L_PRICE_OVR_REASON_KEY    int,
L_SALE_LINE_TYPE    string,
L_FLG_FRANCHISE    smallint,
L_PRODUCT_CODE    string,
L_TILL_CODE    string,
L_PROMOTION_CODE    string,
L_DISCOUNT_TYPE_CODE    string,
L_RETURN_REASON_CODE    int,
L_BARCODE    string,
L_SALE_TOT_QTY    double,
L_SALE_NET_VAL    double,
L_SALE_TOT_TAX_VAL    double,
L_SALE_TOT_VAL_AT_PP    double,
L_SALE_TOT_DISC_QTY    double,
L_SALE_TOT_DISC_VAL    double,
L_SALE_TOT_GLOBAL_DISC_VAL    double,
L_SALE_TOT_GLOBAL_DISC_TAX_VAL    double,
L_PRODUCT_FULL_PRICE    double,
L_PRODUCT_HO_PRICE    double,
L_ACTUAL_SELLING_PRICE    double,
L_SALE_TOT_PACK_COUNT    int,
L_MARKDOWN_FLG    smallint,
L_CODE_KEYED_IN_FLG    string,
L_PRICE_OVERRIDE_FLG    string,
L_PRICE_OVERRIDE_AUTHORIZER    string,
L_ARC_DATE    date,
L_INVOICE_DATE    date,
L_SUB_STORE_CODE    string,
L_ITEM_ACTUAL_PRICE    double,
L_ITEM_ADJUSTED_AMOUNT    double,
L_TOTAL_AMOUNT_WITHOUT_LOYALTY    double,
L_ITEM_STD_PRICE    double,
L_PUMP_SERVER_REF    string,
L_SERIAL_PROMPT    string,
L_CUSTOMER_LOYALTY_CARD    string,
L_PUMP_MODE    string,
L_SUB_STATUS_CODE    int,
L_SUB_STATUS_DESC    string,
L_TAX_GROUP_1    int,
L_SALE_INVC_START string,
L_SALE_INVC_END string,
L_DISCOUNT_NAME    string,
L_SALE_TOT_VAL_AT_PP_TCR    double,
L_TCR_COST    double,
L_PAYMENT_TYPE_ID    string,
L_PUMP_ID    int
)
COMMENT 'History POS transaction in Reporting'
PARTITIONED BY (
  date_part string)
STORED AS ORC
LOCATION '/${hivevar:POS_ENV}/reporting/history/trans'
TBLPROPERTIES ("orc.compress"="SNAPPY", "orc.stripe.size"='67108864', "orc.row.index.stride"='5000');

