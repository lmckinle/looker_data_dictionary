snowsql -a {specify_account_name} -u {specify_username} -r {specify_role_name} -d {specify_database_name} -w {specify_warehouse} -s {specify_schema}


drop table if exists {specify table name as schema.table like tmp.looker_data_dictionary};

CREATE TABLE if not exists {schema.table}(
# Add or remove fields as needed
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

put file://~/{YOUR_FILE_PATH_HERE}/dictionary.csv @%looker_data_dictionary;

COPY INTO schema.table
        FROM @%looker_data_dictionary
        # You file_format may be different, read the snowsql documentation
        FILE_FORMAT = (TYPE = CSV skip_header = 1 EMPTY_FIELD_AS_NULL = TRUE, field_delimiter = ',' field_optionally_enclosed_by='"');


