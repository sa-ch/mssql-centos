#!/usr/bin/env bash

docker stop mssql
docker rm mssql

docker run --name mssql \
        -e ACCEPT_EULA=Y \
        -e SA_PASSWORD=adesso@OpenShift \
        -p 1433:1433 \
        -d adesso/mssql-centos:1.0.0