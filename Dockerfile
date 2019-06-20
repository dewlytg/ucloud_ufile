#Image base
FROM ubuntu:16.04

#User info
MAINTAINER dewly_tg@163.com

# install python3-pip and crontab
RUN apt-get update  && \
    apt-get install -y python3-pip && \
    apt-get install -y cron

#pip3 install depended
RUN pip3 install ufile

# 创建 log 文件
RUN touch /var/log/cron.log

ADD entrypoint.sh .
# crontab 的相关命令
RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
