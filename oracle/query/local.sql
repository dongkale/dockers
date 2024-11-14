
-- quesy 



select name from v$database

DROP USER JOBQRATE CASCADE

DROP TABLESPACE JOBQRATE_DATA INCLUDING CONTENTS;

CREATE TABLESPACE JOBQRATE_DATA DATAFILE '/opt/oracle/oradata/JOBQRATE_DATA.dbf' SIZE 500M REUSE AUTOEXTEND ON NEXT 50M maxsize unlimited;

alter TABLESPACE JOBQRATE_DATA online
alter system checkpoint

-- https://db-master.tistory.com/21
-- docker oracle 로 했을때 셋팅해야할 명령
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER JOBQRATE IDENTIFIED BY JOBQRATE DEFAULT TABLESPACE JOBQRATE_DATA TEMPORARY TABLESPACE temp;

GRANT CONNECT TO JOBQRATE
GRANT RESOURCE TO JOBQRATE
GRANT DBA TO JOBQRATE

select * from dba_tablespaces;

