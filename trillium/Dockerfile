ARG TRILIUM_IMAGE=ghcr.io/triliumnext/trilium:v0.100.0
FROM ${TRILIUM_IMAGE}

SHELL ["/bin/sh", "-c"]

RUN apt-get update \
  && apt-get install -y --no-install-recommends nginx ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# nginx runs in foreground, no daemon
RUN rm -f /etc/nginx/sites-enabled/default

COPY rootfs/ /

RUN chmod +x /run.sh

EXPOSE 80 8080

CMD ["/run.sh"]

