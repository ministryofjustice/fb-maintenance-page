 FROM bitnami/nginx:latest

COPY . /opt/bitnami/nginx/html
COPY conf/maintenance_page.conf /opt/bitnami/nginx/conf/server_blocks/
