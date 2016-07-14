FROM pataquets/ubuntu:xenial

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      automysqlbackup \
      mariadb-client \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  sed -i 's/DBHOST=localhost/DBHOST=mysql/' /etc/default/automysqlbackup

ENTRYPOINT [ "automysqlbackup" ]
