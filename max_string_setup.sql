
ALTER SYSTEM SET max_string_size = EXTENDED SCOPE = spfile;
SHUTDOWN IMMEDIATE;
STARTUP UPGRADE;
@?/rdbms/admin/utl32k.sql 
SHUTDOWN IMMEDIATE;
STARTUP;
ALTER SESSION SET "_oracle_script" = true;
ALTER PLUGGABLE DATABASE pdb$seed OPEN UPGRADE;
ALTER SESSION SET CONTAINER = PDB$SEED;
@?/rdbms/admin/utl32k 
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE pdb$seed CLOSE;
ALTER PLUGGABLE DATABASE pdb$seed OPEN READ ONLY;
ALTER PLUGGABLE DATABASE pdb1 OPEN UPGRADE;
ALTER SESSION SET CONTAINER = PDB1;
@?/rdbms/admin/utl32k.sql 
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE PDB1 CLOSE;
ALTER PLUGGABLE DATABASE pdb1 OPEN;
SELECT name, open_mode
FROM v$pdbs;