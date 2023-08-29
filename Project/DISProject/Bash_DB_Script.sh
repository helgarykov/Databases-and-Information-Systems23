#!/bin/bash

export PGPASSWORD=1234
loc=$(pwd)/PostgreSQL/Easy_Translate.sql

psql -h localhost -U postgres -d postgres -f "$loc"