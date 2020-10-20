FROM nginx:lastest
ENV fqdn www.example.com
ENV port 8080
EXPOSE 8080

RUN  apt-get install -y git &&\
         git clone https://github.com/jvodan/helloworldhtml /var/www/hello_world &&\
         chown www-data /run /var/lib/nginx /var/log/nginx

COPY injections/ /
USER www-data
WORKDIR /var/www
CMD ["nginx", "-g","daemon off;"]
