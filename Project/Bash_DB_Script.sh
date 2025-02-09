#!/bin/bash

export PGPASSWORD=1982
loc=$(pwd)/PostgreSQL/Easy_Translate.sql

psql -h localhost -U postgres -d postgres -f "$loc"