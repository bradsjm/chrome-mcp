# Chrome MCP Docker Container

A Docker container that provides a web-based desktop environment with Playwright MCP (Model Context Protocol) server for browser automation.

## Overview

This container combines:
- **KasmVNC**: Web-accessible Linux desktop environment
- **Playwright MCP Server**: Browser automation through Model Context Protocol
- **Chrome Browser**: For automation and manual use

## Features

- **x86_64 Architecture**: Built for amd64/x86_64 platforms (Chrome requirement)
- **Web-based desktop**: Accessible through any browser
- **Playwright MCP server**: Running on port 3002
- **Non-headless Chrome**: For visual automation
- **PDF and vision capabilities**: Built-in support
- **Structured browser automation**: Without screenshots
- **Output directory**: For saving results
- **Auto-built containers**: Available from GitHub Container Registry

## Quick Start

### Pull Pre-built Container (Recommended)

The container is automatically built for x86_64 architecture and published to GitHub Container Registry:

```bash
docker pull ghcr.io/bradsjm/chrome-mcp:latest
```

### Run the Container

```bash
docker run -d \
  --name chrome-mcp \
  -p 3000:3000 \
  -p 3001:3001 \
  -p 3002:3002 \
  -v $(pwd)/config:/config \
  ghcr.io/bradsjm/chrome-mcp:latest
```

### Build Locally (Optional)

```bash
docker build -t chrome-mcp .
```

### Access the Desktop

Open your browser and navigate to `http://localhost:3000` or `https://localhost:3001` to access the web-based desktop.

### MCP Server

The Playwright MCP server is available at `http://localhost:3002` and automatically starts when the container launches. It supports both SSE and streaming HTTP protocols at:

- SSE: `http://localhost:3002/sse`
- Streaming HTTP: `http://localhost:3002/mcp`

## Configuration

The MCP server configuration is located at `/config/config.json`:

- **Port**: 3002
- **Browser**: Chrome (non-headless)
- **Capabilities**: PDF and vision support
- **Output Directory**: `/config/output`

## Using with MCP Clients

The Playwright MCP server running in this container can be connected to various MCP-compatible clients for browser automation:

For most MCP clients, add this configuration to connect to the containerized server:

- **SSE Endpoint**: `http://localhost:3002/sse`
- **HTTP Endpoint**: `http://localhost:3002/mcp`

## Usage

1. Access the web desktop at `http://localhost:3000`
2. Configure your MCP client to connect to the server (see above)
3. Use browser automation through your preferred MCP client
4. Outputs are saved to the mounted output directory

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

Pre-built container images are available at:
- **Registry**: `ghcr.io/bradsjm/chrome-mcp`
- **Supported Architecture**: linux/amd64 (x86_64 only - Chrome requirement)
- **Tags**: `latest`, `main`, version tags

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
