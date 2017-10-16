#!/bin/bash
load_function () {
	firstday=$(date -d "$1" "+%Y%m%d")
	lastday=$(date -d "$1 + 1 month - 1 day" "+%Y%m%d")
	
	check_date=$(/usr/sap/hdbclient/hdbsql -i 00 -n psaphanah0101:30015 -u HADOOP_PROD -p Ir0cksap -x -a 'SELECT COUNT("0CALDAY") FROM "_SYS_BIC"."LOVES.FLEET.VIEWS.BW.MULTIPROVIDER/CV_FLEET_SETTLEMENT_MP_TABLEAU" WHERE "0CALDAY" > '${firstday}' AND "0CALDAY" < '${lastday}';')

	if [[ $check_date > 0 ]]; then
		month=$(date -d "${firstday}" "+%Y%m")
		sqoop import -Dorg.apache.sqoop.splitter.allow_text_splitter=true \
		--connect "jdbc:sap://172.23.2.76:30015/?currentschema=_SYS_BIC" \
		--driver com.sap.db.jdbc.Driver \
		--username HADOOP_PROD \
		--password "Ir0cksap" \
		--query 'select * from "_SYS_BIC"."LOVES.FLEET.VIEWS.BW.MULTIPROVIDER/CV_FLEET_SETTLEMENT_MP_TABLEAU" WHERE "0CALDAY" > '${firstday}' AND "0CALDAY" < '${lastday}' AND $CONDITIONS' \
		--target-dir "/dev/landing/SAPBWP/CV_FLEET_SETTLEMENT_MP_TABLEAU/month_part=${month}" \
		--delete-target-dir \
		--fields-terminated-by '\001' --lines-terminated-by '\n' \
		-m 1
	fi
	

}

input_start=2016-07-01
input_end=2017-10-15

startdate=$(date -I -d "$input_start") || exit -1
enddate=$(date -I -d "$input_end")     || exit -1

n=6
d="$startdate"

while [[ "$d" < "$enddate" ]]; do
	((i=i%n)); ((i++==0)) && wait	

	load_function $d &

	d=$(date -I -d "$d + 1 month")
done

