FROM ubuntu:trusty

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      automysqlbackup \
  && \
  apt-get clean && \
rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "automysqlbackup" ]
