FROM centos:7

MAINTAINER Robert Brem <robert.brem@adesso.ch>

RUN curl https://packages.microsoft.com/config/rhel/7/mssql-server.repo > /etc/yum.repos.d/mssql-server.repo && \
    curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/msprod.repo && \
    ACCEPT_EULA=Y yum install -y mssql-server mssql-tools && \
    yum clean all

RUN useradd -m -s /bin/bash -U developer && \
    echo "developer:developer" | chpasswd && \
    usermod -aG wheel developer

RUN chown -R developer /opt/mssql && \
    chown -R developer /opt/mssql-tools && \
    mkdir /var/opt/mssql && \
    chown -R developer /var/opt/mssql

ENV PATH=${PATH}:/opt/mssql/bin:/opt/mssql-tools/bin

EXPOSE 1433

VOLUME /var/opt/mssql

USER developer

CMD /opt/mssql/bin/sqlservr --accept-eula
#CMD /usr/bin/sleep 1000
