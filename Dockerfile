FROM ubuntu
RUN apt update
RUN apt git install docker apache2 tree -y
CMD git pull https://github.com/DeepakGund/resume.git
ENTRYPOINT git init
COPY * /var/www/html
