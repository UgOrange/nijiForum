FROM python:3.6.4



ADD . /opt/

WORKDIR /opt/
RUN pip install -r requirements.txt
RUN chmod 777 run.sh
EXPOSE 8000
CMD ["/bin/sh", "run.sh"]

# docker build -t maidong1024/bbs:v1.0.8 .
# docker run -d -p 8008:8000 -v /root/project_docker/media:/opt/media --name bbs108 --restart always maidong1024/bbs:v1.0.8
