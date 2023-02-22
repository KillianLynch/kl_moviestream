#!/bin/sh

$ORACLE_HOME/bin/sql " / as sysdba" @/home/oracle/kl_moviestream-main/max_string_setup.sql
$ORACLE_HOME/bin/sql " / as sysdba" @/home/oracle/kl_moviestream-main/data_script.sql