FROM caddy:2-alpine

COPY public/ /usr/share/caddy/
WORKDIR /usr/share/caddy

# Configure Caddy to serve the static site
COPY Caddyfile /etc/caddy/Caddyfile

# Expose the default Caddy port
EXPOSE 80
EXPOSE 443
