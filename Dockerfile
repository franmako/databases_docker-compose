FROM nginx:latest

RUN apt-get update && apt-get install -y nano

#Copy custom nginx config & symfony app virtualhost
ADD nginx.conf /etc/nginx/nginx.conf

ADD sentry.conf /etc/nginx/conf.d/

RUN echo "upstream adminer { server adminer:8080; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]