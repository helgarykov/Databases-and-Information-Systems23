@echo off

set PGPASSWORD=1234
set loc=%cd%\PostgreSQL\Easy_Translate.sql

psql -U postgres -f %loc%
