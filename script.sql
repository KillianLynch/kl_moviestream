
ALTER SESSION SET CONTAINER=PDB1;

CREATE USER nf19c IDENTIFIED BY WElcome123##;

GRANT DBA TO nf19c;

CONNECT nf19c/WElcome123##;

--@/home/oracle/kl_moviestream-main/MovieStream_DDL.sql
--@/home/oracle/kl_moviestream-main/genre.sql
--@/home/oracle/kl_moviestream-main/cust_segment.sql
--@/home/oracle/kl_moviestream-main/cust.sql
--@/home/oracle/kl_moviestream-main/movie.sql
--@/home/oracle/kl_moviestream-main/custsales.sql
