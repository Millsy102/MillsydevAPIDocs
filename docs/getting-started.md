---
layout: default
title: "Getting Started with MILLSY.dev API"
description: "Quick start guide for integrating with the MILLSY.dev Star Citizen Kill Tracker API"
---

# 🚀 Getting Started with MILLSY.dev API

> **Start integrating with our Star Citizen Kill Tracker API in minutes**

## What You'll Need

- **Discord Account** - For authentication and bot integration
- **API Access** - Get your API key from our dashboard
- **HTTP Client** - Use curl, Postman, or your preferred tool
- **Programming Language** - Any language that can make HTTP requests

## Quick Start (5 Minutes)

### 1. Get API Access

1. **Visit the Dashboard**: Go to [https://dbot.millsy.dev](https://dbot.millsy.dev) (Production) or [http://localhost:3000](http://localhost:3000) (Local Development)
2. **Login with Discord**: Click "Login with Discord" and authorize the application
3. **Generate API Key**: Go to the "API Keys" section and create a new API key
4. **Copy Your Credentials**: Save your API key and user ID

### 2. Make Your First API Call

**Test the API is working:**

```bash
# Production
curl -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     https://api.millsy.dev/api/v1/health

# Local Development
curl -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     http://localhost:3001/api/v1/health
```

**Expected Response:**
```json
{
  "success": true,
  "data": {
    "status": "healthy",
    "timestamp": "2024-01-01T12:00:00.000Z",
    "version": "1.0.0"
  }
}
```

### 3. Get Your User Information

```bash
# Production
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.millsy.dev/api/v1/users/me

# Local Development
curl -H "Authorization: Bearer YOUR_API_KEY" \
     http://localhost:3001/api/v1/users/me
```

## Service Endpoints

### Production Services
- **API Server**: `https://api.millsy.dev`
- **Web Dashboard**: `https://dbot.millsy.dev`
- **WebSocket**: `wss://api.millsy.dev/ws`

### Local Development Services
- **Web Dashboard**: `http://localhost:3000`
- **API Server**: `http://localhost:3001`
- **Desktop Application**: Launches automatically

## Common Use Cases

### 1. Track Kills
```bash
curl -X POST \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "victimId": "victim_user_id",
    "serverId": "server_id",
    "weapon": "Laser Cannon",
    "location": "Stanton System",
    "isPvP": true
  }' \
  https://api.millsy.dev/api/v1/kills
```

### 2. Get Kill Statistics
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.millsy.dev/api/v1/users/me/stats
```

### 3. View Leaderboard
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     "https://api.millsy.dev/api/v1/leaderboards?type=kills&period=all_time"
```

## Authentication

All API requests require authentication using your API key in the Authorization header:

```bash
Authorization: Bearer YOUR_API_KEY
```

## Rate Limits

- **Authentication endpoints**: 5 requests per minute
- **Read endpoints**: 100 requests per minute
- **Write endpoints**: 20 requests per minute
- **Admin endpoints**: 10 requests per minute

## Next Steps

1. **[API Reference](./api/)** - Complete API documentation
2. **[Integration Guides](./developers/README.md)** - SDKs and integration examples
3. **[WebSocket API](./api/)** - Real-time data streaming
4. **[Error Handling](./api/error-codes.md)** - Understanding API responses

## Need Help?

- **API Documentation**: [Complete API Reference](./api/)
- **Integration Examples**: [Developer Guides](./developers/README.md)
- **Troubleshooting**: [Common Issues](./help/troubleshooting.md)
- **FAQ**: [Frequently Asked Questions](./help/faq.md)

---

*Ready to start building? Check out our [API Reference](./api/) for complete documentation!*
