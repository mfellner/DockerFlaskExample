# DOCKER-VERSION 0.11.1

FROM ubuntu:trusty
MAINTAINER Maximilian Fellner <max.fellner@gmail.com>

RUN apt-get install -y python3 python3-pip
RUN apt-get install -y nginx supervisor
RUN pip3 install uwsgi Flask

ADD ./app /docker/app
ADD ./conf /docker/conf
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /docker/conf/app_nginx.conf /etc/nginx/sites-enabled/
RUN ln -s /docker/conf/app_supervisor.conf /etc/supervisor/conf.d/

EXPOSE 80
CMD ["supervisord", "-n"]
