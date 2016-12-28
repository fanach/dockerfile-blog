FROM golang:latest
MAINTAINER zyfdegh <zyfdegg@gmail.com>

WORKDIR /root

RUN go get -v github.com/spf13/hugo

RUN git clone https://github.com/zyfdegh/blog.git --depth=1 repo

RUN apt-get update
RUN apt-get install -y cron
COPY crontab /etc/cron.d/cron-pull
RUN chmod +x /etc/cron.d/cron-pull && \
    touch /var/log/cron-pull.log

COPY entrypoint.sh /root/entrypoint.sh
CMD ["./entrypoint.sh"]
