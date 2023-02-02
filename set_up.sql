
shutdown immediate;
startup upgrade;
alter system set max_string_size=EXTENDED scope=spfile;
@?/rdbms/admin/utl32k.sql;
shutdown immediate;
startup;