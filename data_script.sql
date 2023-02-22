
ALTER SESSION SET CONTAINER=PDB1;

CREATE USER nf19c IDENTIFIED BY WElcome123##;

GRANT CONNECT TO nf19c;
GRANT DBA TO nf19c;

connect nf19c/WElcome123##@//nf19c.pub.db19cnf.oraclevcn.com:1521/pdb1.pub.db19cnf.oraclevcn.com

ALTER SESSION SET nls_date_format='mm/dd/yyyy';

ALTER SESSION SET nls_timestamp_format='yyyy-mm-dd';

@/home/oracle/kl_moviestream-main/moviestream_ddl.sql
COMMIT;
@/home/oracle/kl_moviestream-main/genre.sql
COMMIT;
@/home/oracle/kl_moviestream-main/cust_segment.sql
COMMIT;
@/home/oracle/kl_moviestream-main/cust.sql
COMMIT;
@/home/oracle/kl_moviestream-main/movie.sql
COMMIT;
@/home/oracle/kl_moviestream-main/custsales.sql
COMMIT;