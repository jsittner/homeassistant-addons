FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY run.sh /run.sh

RUN chmod +x /run.sh

CMD ["/run.sh"]
