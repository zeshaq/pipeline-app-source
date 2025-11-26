FROM nginx:latest

USER root

# Create writable directories for OpenShift random UID
RUN mkdir -p /var/cache/nginx /var/run /run && \
    chmod -R 777 /var/cache/nginx /var/run /run

# Copy custom config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy app code
COPY . /usr/share/nginx/html/

# Drop privileges (OpenShift will override the UID anyway)
USER 1001

EXPOSE 8080