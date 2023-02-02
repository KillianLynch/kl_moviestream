
ALTER SESSION SET CONTAINER=PDB1;

CREATE USER nf19c IDENTIFIED BY WElcome123##;

GRANT CONNECT TO nf19c;
GRANT DBA TO nf19c;

connect nf19c/WElcome123##@//ll19c.pub.db19cnf.oraclevcn.com:1521/pdb1.pub.db19cnf.oraclevcn.com

@/home/oracle/kl_moviestream-main/MovieStream_DDL.sql
@/home/oracle/kl_moviestream-main/genre.sql
@/home/oracle/kl_moviestream-main/cust_segment.sql
@/home/oracle/kl_moviestream-main/cust.sql
@/home/oracle/kl_moviestream-main/movie.sql
@/home/oracle/kl_moviestream-main/custsales.sql