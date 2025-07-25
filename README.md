# Chrome MCP Docker Container

A Docker container that provides a web-based desktop environment with Playwright MCP (Model Context Protocol) server for browser automation.

## Overview

This container combines:
- **KasmVNC**: Web-accessible Linux desktop environment
- **Playwright MCP Server**: Browser automation through Model Context Protocol
- **Chrome Browser**: For automation and manual use

## Features

- **Multi-Architecture Support**: Built for amd64 and arm64 platforms
- **Web-based desktop**: Accessible through any browser
- **Playwright MCP server**: Running on port 3002
- **Non-headless Chrome**: For visual automation
- **PDF and vision capabilities**: Built-in support
- **Structured browser automation**: Without screenshots
- **Output directory**: For saving results
- **Auto-built containers**: Available from GitHub Container Registry

## Quick Start

### Pull Pre-built Container (Recommended)

The container is automatically built for multiple architectures (amd64, arm64) and published to GitHub Container Registry:

```bash
docker pull ghcr.io/bradsjm/chrome-mcp:latest
```

### Run the Container

```bash
docker run -d \
  --name chrome-mcp \
  -p 3000:3000 \
  -p 3002:3002 \
  -v $(pwd)/output:/config/output \
  ghcr.io/bradsjm/chrome-mcp:latest
```

### Build Locally (Optional)

```bash
docker build -t chrome-mcp .
```

### Access the Desktop

Open your browser and navigate to `http://localhost:3000` to access the web-based desktop.

### MCP Server

The Playwright MCP server is available at `http://localhost:3002` and automatically starts when the container launches.

## Configuration

The MCP server configuration is located at `/config/config.json`:

- **Port**: 3002
- **Browser**: Chrome (non-headless)
- **Capabilities**: PDF and vision support
- **Output Directory**: `/config/output`

## Usage

1. Access the web desktop at `http://localhost:3000`
2. Use the MCP server API at `http://localhost:3002` for automation
3. Results and outputs are saved to the mounted output directory

## Architecture

- **Base Image**: `ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm`
- **MCP Server**: `@playwright/mcp@latest`
- **Browser**: Chrome with Playwright

## Development

The container includes:
- Xterm terminal access
- Chrome browser in the desktop menu
- Playwright browsers installed with dependencies
- MCP server auto-start configuration

## Container Registry

Pre-built multi-architecture images are available at:
- **Registry**: `ghcr.io/bradsjm/chrome-mcp`
- **Supported Architectures**: linux/amd64, linux/arm64
- **Tags**: `latest`, `main`, version tags

## License

This project is provided as-is for browser automation and testing purposes.