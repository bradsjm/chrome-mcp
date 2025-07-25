# MCP Server Configuration

This directory contains configuration files for the Playwright MCP (Model Context Protocol) server.

## Files

### `config.json`
Main configuration file for the Playwright MCP server.

**Current settings:**
```json
{
    "browser": {
        "isolated": true,
        "launchOptions": {
            "headless": false
        },
        "contextOptions": {}
    },
    "server": {
        "port": 3002,
        "host": "0.0.0.0"
    },
    "capabilities": ["pdf", "vision"],
    "outputDir": "/config/output",
    "imageResponses": "allow",
    "network": {
        "allowedOrigins": [],
        "blockedOrigins": []
    }
}
```

### `output/`
Directory where automation results, screenshots, PDFs, and other outputs are saved.

## Configuration Options

### Browser Settings
- **`isolated: true`**: Each browser session runs in isolation
- **`headless: false`**: Browser runs with UI visible (important for desktop viewing)
- **`contextOptions`**: Additional Playwright browser context options

### Server Settings
- **`port: 3002`**: MCP server listens on this port
- **`host: "0.0.0.0"`**: Accepts connections from any IP (required for container networking)

### Capabilities
- **`pdf`**: Enables PDF generation from web pages
- **`vision`**: Enables visual/screenshot capabilities

### Output Configuration
- **`outputDir`**: Directory for saving automation artifacts
- **`imageResponses: "allow"`**: Permits image-based responses

### Network Security
- **`allowedOrigins`**: Whitelist of allowed domains (empty = all allowed)
- **`blockedOrigins`**: Blacklist of blocked domains

## Customization

### Changing Browser Behavior
```json
{
    "browser": {
        "isolated": true,
        "launchOptions": {
            "headless": false,
            "args": ["--no-sandbox", "--disable-dev-shm-usage"]
        }
    }
}
```

### Network Restrictions
```json
{
    "network": {
        "allowedOrigins": ["https://example.com", "https://api.service.com"],
        "blockedOrigins": ["https://blocked-site.com"]
    }
}
```

### Additional Capabilities
```json
{
    "capabilities": ["pdf", "vision", "recording"]
}
```

## Volume Mounting

When running the container, mount this directory to persist configurations and outputs:
```bash
-v $(pwd)/config:/config
```

This allows you to:
- Modify `config.json` from the host
- Access outputs in the `output/` directory
- Persist configuration changes across container restarts