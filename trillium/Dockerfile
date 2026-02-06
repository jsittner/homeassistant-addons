ARG TRILIUM_IMAGE=ghcr.io/triliumnext/trilium:v0.101.3
FROM ${TRILIUM_IMAGE}

SHELL ["/bin/sh", "-c"]

# Install nginx
RUN apk --no-cache add nginx && mkdir -p /run/nginx

# Copy nginx config
COPY ingress.conf /etc/nginx/http.d/

# Remove default site if present (Alpine path)
RUN rm -f /etc/nginx/http.d/default.conf || true

# Copy rootfs
COPY rootfs/ /

# Make run script executable
RUN chmod +x /run.sh

# Expose ports (8099 for ingress, 8080 for Trilium)
EXPOSE 8099 8080

# Use run.sh to start both services
CMD ["/run.sh"]
