#!/usr/bin/env bash

docker build -t adesso/mssql-centos:1.0.0 .
docker push adesso/mssql-centos:1.0.0