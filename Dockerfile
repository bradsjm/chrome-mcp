FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

WORKDIR /app

# Configure KASM VNC
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TITLE=Playwright
ENV START_DOCKER=false
ENV NO_DECOR=true

# Use ARGs for versions to make updates easy and explicit
ARG UV_VERSION=0.8.3
ARG NODE_VERSION=20.x
ARG DEBIAN_FRONTEND=noninteractive
ENV PLAYWRIGHT_BROWSERS_PATH=/app/playwright-browsers

# Disable NPM update check
RUN npm config set update-notifier false > /dev/null

# Install playright and browser dependencies in one layer
RUN npx playwright install --with-deps chrome && \
    npm cache clean --force && \
    chown -R 911:911 /config/.npm

# Install MCP support
RUN npm install -g @playwright/mcp@latest && \
    npm cache clean --force && \
    chown -R 911:911 /config/.npm

# Copy files
COPY /root /

EXPOSE 3002
VOLUME /config
