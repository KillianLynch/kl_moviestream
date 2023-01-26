
CREATE USER 19lab IDENTIFIED BY 19lab;

GRANT DBA TO 19lab;

ALTER SESSION SET CONTAINER=PDB1;

CONNECT 19lab/19lab;

@/home/oracle/kl_moviestream-main/MovieStream_DDL.sql
@/home/oracle/kl_moviestream-main/genre.sql
@/home/oracle/kl_moviestream-main/cust_segment.sql
@/home/oracle/kl_moviestream-main/cust.sql
@/home/oracle/kl_moviestream-main/movie.sql
@/home/oracle/kl_moviestream-main/custsales.sql
