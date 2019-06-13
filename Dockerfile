#FROM docker-registry.x5.ru/wordpress:5.2.1-fpm-alpine

FROM wordpress:5.2.1-fpm-alpine


#RUN rm -f /etc/apk/repositories &&\
#    touch /etc/apk/repositories &&\
#    echo "http://apk.x5.ru/v3.9/community/" > /etc/apk/repositories &&\
#    echo "http://apk.x5.ru/v3.9/main/" > /etc/apk/repositories

RUN apk add nginx

WORKDIR /var/www/html/

COPY nginx/nginx.conf /etc/nginx/nginx.conf
RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 777 /var

EXPOSE 8080 8443

#USER 1001
CMD ["nginx", "-g", "daemon off;"]
