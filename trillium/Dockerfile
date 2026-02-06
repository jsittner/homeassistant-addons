ARG TRILIUM_IMAGE=ghcr.io/triliumnext/trilium:v0.100.0
FROM ${TRILIUM_IMAGE}

SHELL ["/bin/sh", "-c"]

# Alpine-based image: use apk
RUN apk add --no-cache nginx ca-certificates

# Install nginx
RUN apk --no-cache add nginx && mkdir -p /run/nginx

# Copy nginx config
COPY ingress.conf /etc/nginx/http.d/

# Remove default site if present (Alpine path)
RUN rm -f /etc/nginx/http.d/default.conf || true

COPY rootfs/ /

RUN chmod +x /run.sh

EXPOSE 80 8080

# Start both nginx and Trilium
CMD nginx && node /path/to/trilium/src/app.js
CMD ["/run.sh"]

