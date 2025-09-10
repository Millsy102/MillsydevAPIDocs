---
layout: default
title: "API Documentation"
---

# 🔌 Star Citizen Kill Tracker API

> **Complete RESTful API for the Star Citizen Kill Tracker system**

## Interactive API Explorer

<div class="api-explorer-trigger">
    <button class="playground-trigger-btn" onclick="openCodePlayground()">
        {% include icon.html name="code" size="20" %} Open Interactive API Explorer
    </button>
    <p class="playground-description">Test API endpoints, explore code examples, and experiment with the Kill Tracker API in real-time.</p>
</div>

## <i class="fas fa-rocket"></i> Quick Start

**Base URL:** `https://api.millsy.dev`  
**API Version:** v1.0.0  
**Authentication:** API Key Required (All endpoints secured)  

### 1. Get API Access

1. Register at [dbot.millsy.dev](https://dbot.millsy.dev)
2. Login with Discord OAuth2
3. Generate an API key in the dashboard
4. Use your API key for authentication

### 2. Make Your First Request

**⚠️ SECURITY WARNING: Never hardcode API keys in your code!**

```bash
# Use environment variables for API keys
export API_KEY="your_api_key_here"

curl -H "Authorization: Bearer $API_KEY" \
     -H "Content-Type: application/json" \
     https://api.millsy.dev/api/kills/user/YOUR_USER_ID?limit=10
```

## <i class="fas fa-key"></i> Authentication

### API Key Authentication (Required)

**All API endpoints require a valid API key for authentication.**

```http
Authorization: Bearer $API_KEY
```

**<i class="fas fa-shield-alt"></i> Security Best Practices:**
- **Never hardcode API keys** in your source code
- **Use environment variables** to store API keys
- **Store API keys securely** (use secure vaults or key management services)
- **Rotate API keys regularly** to minimize exposure risk
- **Monitor API key usage** for unauthorized access
- **Restrict API key usage** to specific IP addresses when possible

### Getting API Keys

1. **Dashboard**: Generate API keys via the web dashboard
2. **Primary Key**: Auto-generated for Kill Tracker applications
3. **Bot Key**: For Discord bot integrations

## <i class="fas fa-chart-bar"></i> Core Endpoints

### **Kill Tracking**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/kills` | Record a new kill (requires API key) |
| `GET` | `/api/kills/user/:userId` | Get kills for a specific user |
| `GET` | `/api/kills/server/:serverId` | Get kills for a specific server |
| `GET` | `/api/stats/user/:userId` | Get user statistics |
| `GET` | `/api/leaderboard/:type` | Get leaderboard data |

### **User Management**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/users/:userId` | Get user profile with recent kills/deaths |
| `PUT` | `/api/users/:userId` | Update user profile |
| `GET` | `/auth/me` | Get current authenticated user |

### **Server Management**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/servers/:serverId` | Get server information |
| `GET` | `/api/servers/:serverId/settings` | Get server settings |
| `PUT` | `/api/servers/:serverId/settings` | Update server settings |

### **API Key Management**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/api-keys` | Generate new API key |
| `GET` | `/api/api-keys` | List user's API keys |
| `POST` | `/api/api-keys/primary` | Get/create primary API key |
| `POST` | `/api/api-keys/bot` | Create bot API key |
| `DELETE` | `/api/api-keys/:id` | Revoke API key |

### **Analytics & Insights**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/analytics/dashboard` | Get analytics dashboard |
| `GET` | `/api/analytics/metrics` | Get performance metrics |
| `GET` | `/api/analytics/trends` | Get trend analysis |
| `GET` | `/api/analytics/insights` | Get AI-generated insights |
| `GET` | `/api/analytics/recommendations` | Get performance recommendations |
| `GET` | `/api/analytics/export` | Export analytics data |

### **Webhooks**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/webhooks` | Create webhook |
| `GET` | `/api/webhooks` | List user's webhooks |
| `PUT` | `/api/webhooks/:id` | Update webhook |
| `DELETE` | `/api/webhooks/:id` | Delete webhook |
| `POST` | `/api/webhooks/:id/test` | Test webhook |
| `GET` | `/api/webhooks/events` | Get available webhook events |

### **Star Citizen Integration**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/sc/ships` | Get all Star Citizen ships |
| `GET` | `/api/sc/ships/:name` | Get specific ship data |
| `GET` | `/api/sc/players/:handle` | Get player data by RSI handle |
| `GET` | `/api/sc/locations/:name` | Get location data |
| `GET` | `/api/sc/systems/:name` | Get system data |

### **Log Parser**

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/api/logs/directories` | Get log directory information |
| `GET` | `/api/logs/files` | Get available log files |
| `POST` | `/api/logs/validate` | Validate log file |
| `POST` | `/api/logs/parse` | Parse log file for kills |

## <i class="fas fa-file-alt"></i> Request/Response Format

### Standard Response Format

```json
{
  "success": true,
  "data": {
    // Response data here
  },
  "message": "Operation successful",
  "timestamp": "2025-01-09T12:00:00.000Z"
}
```

### Error Response Format

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request data",
    "details": {
      "field": "weapon",
      "reason": "Weapon name is required"
    }
  },
  "timestamp": "2025-01-09T12:00:00.000Z"
}
```

### HTTP Status Codes

| Code | Description |
|------|-------------|
| `200` | Success |
| `201` | Created |
| `400` | Bad Request |
| `401` | Unauthorized |
| `403` | Forbidden |
| `404` | Not Found |
| `422` | Validation Error |
| `429` | Rate Limited |
| `500` | Internal Server Error |

## <i class="fas fa-tachometer-alt"></i> Rate Limiting

**All endpoints require API key authentication and have the following limits:**

| Endpoint Type | Limit | Window |
|---------------|-------|--------|
| All API endpoints | 1000 requests | 1 hour |
| Kill tracking | 500 requests | 1 hour |
| Admin operations | 10 requests | 1 minute |
| API Key operations | 5 requests | 1 minute |

**Security Note:** No unauthenticated requests are allowed. All endpoints require a valid API key.

## <i class="fas fa-lock"></i> API Security Best Practices

### Secure API Key Management

**❌ NEVER DO THIS:**
```javascript
// DON'T: Hardcode API keys in source code
const apiKey = "sk-1234567890abcdef"; // SECURITY RISK!
```

**✅ DO THIS INSTEAD:**
```javascript
// DO: Use environment variables
const apiKey = process.env.API_KEY; // Secure
```

### Environment Variable Setup

**Node.js/JavaScript:**
```bash
# .env file (add to .gitignore)
API_KEY=your_api_key_here
BASE_URL=https://api.millsy.dev
```

**Python:**
```bash
# .env file (add to .gitignore)
export API_KEY="your_api_key_here"
export BASE_URL="https://api.millsy.dev"
```

**C#/.NET:**
```xml
<!-- appsettings.json -->
{
  "ApiSettings": {
    "ApiKey": "your_api_key_here",
    "BaseUrl": "https://api.millsy.dev"
  }
}
```

### Secure Storage Solutions

For production applications, consider using:
- **AWS Secrets Manager**
- **Azure Key Vault**
- **HashiCorp Vault**
- **Google Secret Manager**

### API Key Rotation

- **Rotate API keys regularly** (every 90 days recommended)
- **Monitor usage patterns** for anomalies
- **Revoke compromised keys immediately**
- **Use different keys for different environments** (dev, staging, prod)

Rate limit headers included in responses:

```http
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1640995200
```

## <i class="fas fa-plug"></i> WebSocket API

### Connection

```javascript
const ws = new WebSocket('wss://api.millsy.dev/ws');

ws.onopen = function() {
  // Send authentication
  ws.send(JSON.stringify({
    type: 'auth',
    token: 'YOUR_JWT_TOKEN'
  }));
};
```

### Real-time Events

- `kill.recorded` - New kill recorded
- `user.stats_updated` - User statistics updated
- `leaderboard.updated` - Leaderboard changed
- `server.event` - Server events
- `analytics.insight` - New AI insight generated

## <i class="fas fa-code"></i> Integration Examples

### JavaScript/TypeScript

```javascript
// Simple fetch-based integration
const API_BASE = 'https://api.millsy.dev';
const API_KEY = 'YOUR_API_KEY';

// Record a kill
async function recordKill(victimId, weapon, location, isPvP = true) {
  const response = await fetch(`${API_BASE}/api/kills`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${API_KEY}`
    },
    body: JSON.stringify({
      victimId,
      weapon,
      location,
      isPvP,
      isSuicide: false,
      isEnvironmental: false
    })
  });
  
  return await response.json();
}

// Get user stats
async function getUserStats(userId) {
  const response = await fetch(`${API_BASE}/api/stats/user/${userId}`, {
    headers: {
      'Authorization': `Bearer ${API_KEY}`
    }
  });
  
  return await response.json();
}
```

### Python

```python
import requests
import json

API_BASE = 'https://api.millsy.dev'
API_KEY = 'YOUR_API_KEY'

def record_kill(victim_id, weapon, location, is_pvp=True):
    response = requests.post(
        f'{API_BASE}/api/kills',
        headers={
            'Content-Type': 'application/json',
            'Authorization': f'Bearer {API_KEY}'
        },
        json={
            'victimId': victim_id,
            'weapon': weapon,
            'location': location,
            'isPvP': is_pvp,
            'isSuicide': False,
            'isEnvironmental': False
        }
    )
    return response.json()

def get_user_stats(user_id):
    response = requests.get(
        f'{API_BASE}/api/stats/user/{user_id}',
        headers={'Authorization': f'Bearer {API_KEY}'}
    )
    return response.json()
```

## <i class="fas fa-flask"></i> Testing

### Postman Collection

Download our complete Postman collection:
[Download Collection](./postman-collection.json)

### API Testing Tool

Interactive API testing: [API Tester](https://api.millsy.dev/tester)

### Example cURL Commands

#### Record a Kill
```bash
curl -X POST "https://api.millsy.dev/api/kills" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "victimId": "EnemyPlayer",
    "weapon": "Laser Cannon",
    "location": "Stanton System",
    "isPvP": true
  }'
```

#### Get User Statistics
```bash
curl -X GET "https://api.millsy.dev/api/stats/user/USER_ID" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

#### Get Leaderboard
```bash
curl -X GET "https://api.millsy.dev/api/leaderboard/kills?limit=10" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## <i class="fas fa-life-ring"></i> Support

- **Full API Reference**: [Complete Endpoint Documentation](./endpoints.md)
- **Error Codes**: [Comprehensive Error Reference](./error-codes.md)
- **Rate Limits**: [Rate Limiting & Quotas](./rate-limits.md)
- **API Versioning**: [Versioning & Changelog](./versioning.md)
- **Testing Tool**: [Interactive API Tester](./testing-tool.html)
- **GitHub Issues**: [Report bugs or request features](https://github.com/millsy/dbot2/issues)
- **Discord Support**: [Join our Discord server](https://discord.gg/sa9ENVmJvg) (community help)
- **Email**: api-support@millsy.dev (one-man team, may take time to respond)
- **Status Page**: [API Status & Uptime](../status/)

## <i class="fas fa-chart-line"></i> API Status

- **Uptime**: 99.9%
- **Average Response Time**: < 200ms
- **Rate Limits**: Generous limits for all endpoints
- **WebSocket Support**: Real-time events and updates

