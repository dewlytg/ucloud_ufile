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

ADD crontab /etc/cron.d/root
RUN chmod 0644 /etc/cron.d/root
RUN touch /var/log/cron.log

ENTRYPOINT [ "/usr/sbin/crond", "-f", "-c", "/etc/cron.d" ]
