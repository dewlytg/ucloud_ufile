#Image base
FROM vaeum/alpine-python3-pip3

#User info
MAINTAINER dewly_tg@163.com

#pip install depended
RUN pip install ufile

# 创建 log 文件
RUN touch /var/log/cron.log

ADD entrypoint.sh .
# crontab 的相关命令
RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
