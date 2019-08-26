snowsql -a disneyanalytics -u SVC_DEV_SNOW_ETL_DIGITAL 
-r DVDM_DB_DEV_RESTRICTED_READ_ONLY -d DVDM_DB_DEV -w DVDM_WH_DEV_XL -s TMP


drop table if exists tmp.looker_data_dictionary;

CREATE TABLE if not exists tmp.looker_data_dictionary(
connection_name VARCHAR(16777216),
field_type VARCHAR(16777216),
project VARCHAR(16777216),
model VARCHAR(16777216),
explore VARCHAR(16777216),
explore_label VARCHAR(16777216),
view VARCHAR(16777216),
view_label VARCHAR(16777216),
name VARCHAR(16777216),
hidden VARCHAR(16777216),
label VARCHAR(16777216),
label_short VARCHAR(16777216),
description VARCHAR(16777216),
sql VARCHAR(16777216),
ftype VARCHAR(16777216),
value_format VARCHAR(16777216),
source VARCHAR(16777216)
);

put file://~/Documents/{YOUR_FILE_PATH_HERE}/dictionary.csv @%looker_data_dictionary;

COPY INTO tmp.looker_data_dictionary
        FROM @%looker_data_dictionary
        FILE_FORMAT = (TYPE = CSV skip_header = 1 EMPTY_FIELD_AS_NULL = TRUE, field_delimiter = ',' field_optionally_enclosed_by='"');

-- snowsql -a disneyanalytics -u SVC_PROD_SNOW_ETL_DIGITAL -r DIGITAL_PROD_RESTRICTED_ETL -d DVDM_DB_PROD -w DVDM_WH_PROD_XL -s TMP;



