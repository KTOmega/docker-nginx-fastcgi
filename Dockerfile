FROM nginx:alpine

RUN apk add --update --no-cache supervisor python3 && \
    mkdir /etc/supervisor.d

COPY python3-fcgi.supervisor.conf /etc/supervisor.d/python3-fcgi.ini
COPY python3-fcgi.nginx.conf /etc/nginx/conf.d/python3-fcgi.conf

RUN rm /etc/nginx/conf.d/default.conf

COPY run-server /usr/local/bin

VOLUME ["/var/www/app"]

EXPOSE 80 443

CMD ["run-server"]
