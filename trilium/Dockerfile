ARG TRILIUM_IMAGE=ghcr.io/triliumnext/trilium:v0.104.1
FROM ${TRILIUM_IMAGE}

SHELL ["/bin/sh", "-c"]

# Install nginx and netcat for port checking
RUN apk --no-cache add nginx netcat-openbsd && mkdir -p /run/nginx /var/log/nginx

# Remove existing nginx config from base image
RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/http.d/*

# Copy our configs
COPY rootfs/ /

# Make run script executable
RUN chmod +x /run.sh

# Expose ports
EXPOSE 8099 8080

CMD ["/run.sh"]
