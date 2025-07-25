# Root Directory

This directory contains files that are copied to the Docker container's filesystem root (`/`) during the build process.

## Structure

```
root/
├── config/           # MCP server configuration
│   ├── config.json   # Main MCP server settings
│   └── output/       # Directory for saving automation results
└── defaults/         # KasmVNC default configuration
    ├── autostart     # Applications to start when desktop loads
    └── menu.xml      # Desktop right-click menu configuration
```

## Purpose

These files customize the containerized environment:

- **`config/`**: Configures the Playwright MCP server behavior and settings
- **`defaults/`**: Provides KasmVNC desktop environment customizations

## Docker Build Process

During `docker build`, the Dockerfile executes:
```dockerfile
COPY /root /
```

This copies all contents of this `root/` directory to the container's filesystem root, placing configuration files in their proper locations within the container.

## Customization

To modify the container behavior:
1. Edit files in the appropriate subdirectory
2. Rebuild the container image
3. The new configuration will be applied when the container starts

See individual folder README files for specific configuration details.