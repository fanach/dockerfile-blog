FROM golang:latest
MAINTAINER zyfdegh <zyfdegg@gmail.com>

WORKDIR /root

RUN go get -v github.com/spf13/hugo

RUN git clone https://github.com/zyfdegh/blog.git --depth=1 repo

# setup cron job
RUN apt-get update \
    && apt-get install -y cron \
    && rm -rf /var/lib/apt/lists/* \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY crontab /etc/cron.d/cron-pull

RUN chmod +x /etc/cron.d/cron-pull \
    && touch /var/log/cron-pull.log

COPY entrypoint.sh /root/entrypoint.sh
CMD ["./entrypoint.sh"]
