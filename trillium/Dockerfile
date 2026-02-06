ARG TRILIUM_IMAGE=ghcr.io/triliumnext/trilium:v0.101.3
FROM ${TRILIUM_IMAGE}

SHELL ["/bin/sh", "-c"]

# Install nginx
RUN apk --no-cache add nginx && mkdir -p /run/nginx /var/log/nginx

# Remove any existing nginx configs from base image
RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/http.d/*

# Copy our nginx configs
COPY rootfs/ /
COPY ingress.conf /etc/nginx/http.d/

# Make run script executable
RUN chmod +x /run.sh

# Expose ports (8099 for ingress, 8080 for Trilium)
EXPOSE 8099 8080

# Use run.sh to start both services
CMD ["/run.sh"]
