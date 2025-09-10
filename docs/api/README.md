# 🔌 Star Citizen Kill Tracker API


> **Complete API documentation for developers**

## Overview


The Star Citizen Kill Tracker API provides comprehensive endpoints for managing Discord bots, tracking kills, and integrating with external applications.

**Base URL:** `https://api.millsy.dev` (Production) / `http://localhost:3001` (Local Development)  
**API Version:** v1  
**Authentication:** JWT Bearer Token  

## Service Endpoints

### **Production Services**
- **API Server**: `https://api.millsy.dev`
- **Web Dashboard**: `https://dbot.millsy.dev`
- **WebSocket**: `wss://api.millsy.dev/ws`

### **Local Development Services**
- **Web Dashboard**: `http://localhost:3000`
- **API Server**: `http://localhost:3001`
- **Desktop Application**: Launches automatically

## Quick Start


### **1. Get API Access**

1. Register on the dashboard: https://dbot.millsy.dev (Production) or http://localhost:3000 (Local)
2. Login with Discord
3. Go to **API Keys** section
4. Generate a new API key
5. Copy your API key and user ID

### **2. Make Your First Request**

**Production:**
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     https://api.millsy.dev/api/v1/health
```

**Local Development:**
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     http://localhost:3001/api/v1/health
```

### **3. Authentication**

All API requests require authentication via JWT token in the Authorization header:

```text

Authorization: Bearer YOUR_JWT_TOKEN

```text

## API Endpoints


### **🔐 Authentication**


#### **Login with Discord**

```http

POST /api/v1/auth/discord
Content-Type: application/json

{
  "code": "discord_oauth_code",
  "state": "random_state_string"
}

```text

## Response:

```json

{
  "success": true,
  "data": {
    "user": {
      "id": "user_id",
      "username": "username",
      "discriminator": "0001",
      "avatar": "avatar_url"
    },
    "token": "jwt_token",
    "expiresIn": 86400
  }
}

```text

#### **Refresh Token**

```http

POST /api/v1/auth/refresh
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Logout**

```http

POST /api/v1/auth/logout
Authorization: Bearer YOUR_JWT_TOKEN

```text

### **👤 User Management**


#### **Get Current User**

```http

GET /api/v1/users/me
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Response:

```json

{
  "success": true,
  "data": {
    "id": "user_id",
    "discordId": "discord_user_id",
    "username": "username",
    "discriminator": "0001",
    "avatar": "avatar_url",
    "rsiHandle": "rsi_handle",
    "privacyLevel": "PUBLIC",
    "createdAt": "2024-01-01T00:00:00.000Z",
    "updatedAt": "2024-01-01T00:00:00.000Z"
  }
}

```text

#### **Update User Profile**

```http

PATCH /api/v1/users/me
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "rsiHandle": "new_rsi_handle",
  "privacyLevel": "PRIVATE"
}

```text

#### **Get User Statistics**

```http

GET /api/v1/users/me/stats
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Response:

```json

{
  "success": true,
  "data": {
    "totalKills": 127,
    "totalDeaths": 89,
    "killDeathRatio": 1.43,
    "favoriteWeapon": "Laser Cannon",
    "totalPlayTime": "45h 30m",
    "rank": 15,
    "recentKills": [
      {
        "id": "kill_id",
        "victim": "EnemyPlayer",
        "weapon": "Laser",
        "location": "Stanton",
        "timestamp": "2024-01-01T12:00:00.000Z"
      }
    ]
  }
}

```text

### **⚔️ Kill Tracking**


#### **Get Kills**

```http

GET /api/v1/kills
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Query Parameters:

- `page` (number): Page number (default: 1)

- `limit` (number): Items per page (default: 20, max: 100)

- `serverId` (string): Filter by server ID

- `weapon` (string): Filter by weapon

- `location` (string): Filter by location

- `startDate` (string): Start date (ISO 8601)

- `endDate` (string): End date (ISO 8601)


## Response:

```json

{
  "success": true,
  "data": {
    "kills": [
      {
        "id": "kill_id",
        "killer": {
          "id": "killer_id",
          "username": "KillerName",
          "avatar": "avatar_url"
        },
        "victim": {
          "id": "victim_id",
          "username": "VictimName",
          "avatar": "avatar_url"
        },
        "server": {
          "id": "server_id",
          "name": "Server Name"
        },
        "weapon": "Laser Cannon",
        "location": "Stanton System",
        "timestamp": "2024-01-01T12:00:00.000Z",
        "isPvP": true,
        "isSuicide": false,
        "isEnvironmental": false
      }
    ],
    "pagination": {
      "page": 1,
      "limit": 20,
      "total": 150,
      "pages": 8
    }
  }
}

```text

#### **Create Kill**

```http

POST /api/v1/kills
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "victimId": "victim_user_id",
  "serverId": "server_id",
  "weapon": "Laser Cannon",
  "location": "Stanton System",
  "isPvP": true,
  "isSuicide": false,
  "isEnvironmental": false
}

```text

#### **Get Kill by ID**

```http

GET /api/v1/kills/{killId}
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Update Kill**

```http

PATCH /api/v1/kills/{killId}
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "weapon": "Updated Weapon",
  "location": "Updated Location"
}

```text

#### **Delete Kill**

```http

DELETE /api/v1/kills/{killId}
Authorization: Bearer YOUR_JWT_TOKEN

```text

### **🏆 Leaderboards**


#### **Get Leaderboard**

```http

GET /api/v1/leaderboards
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Query Parameters:

- `type` (string): `kills`, `deaths`, `kdr`, `pvp_kills`, `pve_kills`

- `period` (string): `daily`, `weekly`, `monthly`, `all_time`

- `serverId` (string): Filter by server ID

- `limit` (number): Number of entries (default: 10, max: 100)


## Response:

```json

{
  "success": true,
  "data": {
    "type": "kills",
    "period": "all_time",
    "entries": [
      {
        "rank": 1,
        "user": {
          "id": "user_id",
          "username": "TopPlayer",
          "avatar": "avatar_url"
        },
        "value": 1250,
        "change": "+5"
      }
    ],
    "userRank": {
      "rank": 15,
      "value": 127,
      "change": "+2"
    }
  }
}

```text

### **🖥️ Server Management**


#### **Get Servers**

```http

GET /api/v1/servers
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Response:

```json

{
  "success": true,
  "data": [
    {
      "id": "server_id",
      "discordId": "discord_server_id",
      "name": "Server Name",
      "icon": "server_icon_url",
      "ownerId": "owner_id",
      "isActive": true,
      "memberCount": 150,
      "settings": {
        "prefix": "!",
        "language": "en",
        "features": {
          "killTracker": true,
          "leaderboard": true,
          "notifications": true
        }
      },
      "createdAt": "2024-01-01T00:00:00.000Z"
    }
  ]
}

```text

#### **Get Server by ID**

```http

GET /api/v1/servers/{serverId}
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Update Server Settings**

```http

PATCH /api/v1/servers/{serverId}/settings
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "prefix": "!",
  "language": "en",
  "features": {
    "killTracker": true,
    "leaderboard": true,
    "notifications": false
  }
}

```text

### **🤖 Bot Management**


#### **Get Bot Status**

```http

GET /api/v1/bot/status
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Response:

```json

{
  "success": true,
  "data": {
    "isOnline": true,
    "uptime": "5d 12h 30m",
    "serverCount": 15,
    "userCount": 1247,
    "totalKills": 12500,
    "version": "1.0.0",
    "lastRestart": "2024-01-01T00:00:00.000Z"
  }
}

```text

#### **Get Bot Statistics**

```http

GET /api/v1/bot/statistics
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Restart Bot** (Admin Only)

```http

POST /api/v1/bot/restart
Authorization: Bearer YOUR_JWT_TOKEN

```text

### **🔑 API Key Management**


#### **Get API Keys**

```http

GET /api/v1/api-keys
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Create API Key**

```http

POST /api/v1/api-keys
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "name": "My Application",
  "playerName": "MyPlayerName",
  "permissions": ["read:kills", "read:stats"],
  "expiresAt": "2024-12-31T23:59:59.000Z"
}

```text

#### **Update API Key**

```http

PATCH /api/v1/api-keys/{keyId}
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "name": "Updated Name",
  "isActive": true
}

```text

#### **Delete API Key**

```http

DELETE /api/v1/api-keys/{keyId}
Authorization: Bearer YOUR_JWT_TOKEN

```text

### **🔔 Webhooks**


#### **Get Webhooks**

```http

GET /api/v1/webhooks
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Create Webhook**

```http

POST /api/v1/webhooks
Authorization: Bearer YOUR_JWT_TOKEN
Content-Type: application/json

{
  "name": "My Webhook",
  "url": "https://myapp.com/webhook",
  "events": ["kill.created", "kill.updated"],
  "secret": "webhook_secret"
}

```text

#### **Test Webhook**

```http

POST /api/v1/webhooks/{webhookId}/test
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Delete Webhook**

```http

DELETE /api/v1/webhooks/{webhookId}
Authorization: Bearer YOUR_JWT_TOKEN

```text

### **<i class="fas fa-chart-bar"></i> Analytics**


#### **Get Kill Analytics**

```http

GET /api/v1/analytics/kills
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Query Parameters:

- `period` (string): `day`, `week`, `month`, `year`

- `serverId` (string): Filter by server ID

- `startDate` (string): Start date (ISO 8601)

- `endDate` (string): End date (ISO 8601)


## Response:

```json

{
  "success": true,
  "data": {
    "period": "month",
    "totalKills": 1250,
    "dailyKills": [
      {
        "date": "2024-01-01",
        "kills": 45,
        "deaths": 32
      }
    ],
    "weaponStats": [
      {
        "weapon": "Laser Cannon",
        "kills": 450,
        "percentage": 36.0
      }
    ],
    "locationStats": [
      {
        "location": "Stanton System",
        "kills": 800,
        "percentage": 64.0
      }
    ]
  }
}

```text

#### **Get User Analytics**

```http

GET /api/v1/analytics/users
Authorization: Bearer YOUR_JWT_TOKEN

```text

#### **Get Server Analytics**

```http

GET /api/v1/analytics/servers
Authorization: Bearer YOUR_JWT_TOKEN

```text

## Error Handling


### **Error Response Format**

```json

{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": {
      "field": "username",
      "reason": "Username must be at least 3 characters"
    }
  }
}

```text

### **HTTP Status Codes**

- `200` - Success

- `201` - Created

- `400` - Bad Request

- `401` - Unauthorized

- `403` - Forbidden

- `404` - Not Found

- `422` - Validation Error

- `429` - Rate Limited

- `500` - Internal Server Error


### **Error Codes**

- `VALIDATION_ERROR` - Input validation failed

- `AUTHENTICATION_REQUIRED` - Authentication required

- `INVALID_TOKEN` - Invalid or expired token

- `INSUFFICIENT_PERMISSIONS` - User lacks required permissions

- `RESOURCE_NOT_FOUND` - Requested resource not found

- `RATE_LIMIT_EXCEEDED` - Rate limit exceeded

- `SERVER_ERROR` - Internal server error


## Rate Limiting


### **Rate Limits**

- **Authentication endpoints**: 5 requests per minute

- **Read endpoints**: 100 requests per minute

- **Write endpoints**: 20 requests per minute

- **Admin endpoints**: 10 requests per minute


### **Rate Limit Headers**

```text

X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1640995200

```text

## WebSocket API


### **Connection**

**Production:**
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

**Local Development:**
```javascript
const ws = new WebSocket('ws://localhost:3001/ws');

ws.onopen = function() {
  // Send authentication
  ws.send(JSON.stringify({
    type: 'auth',
    token: 'YOUR_JWT_TOKEN'
  }));
};
```

### **Events**

- `kill.created` - New kill recorded

- `kill.updated` - Kill updated

- `kill.deleted` - Kill deleted

- `user.joined` - User joined server

- `user.left` - User left server

- `server.updated` - Server settings updated

- `bot.status_changed` - Bot status changed


### **Event Format**

```json

{
  "type": "kill.created",
  "data": {
    "kill": {
      "id": "kill_id",
      "killer": "killer_name",
      "victim": "victim_name",
      "weapon": "Laser Cannon",
      "timestamp": "2024-01-01T12:00:00.000Z"
    }
  }
}

```text

## SDKs and Libraries


### **JavaScript/TypeScript**

```bash

npm install @sckilltracker/api-client

```text


**Production:**
```javascript
import { SCKillTrackerAPI } from '@sckilltracker/api-client';

const api = new SCKillTrackerAPI({
  baseURL: 'https://api.millsy.dev',
  token: 'YOUR_JWT_TOKEN'
});

// Get user stats
const stats = await api.users.getStats();

// Create a kill
const kill = await api.kills.create({
  victimId: 'victim_id',
  serverId: 'server_id',
  weapon: 'Laser Cannon'
});
```

**Local Development:**
```javascript
import { SCKillTrackerAPI } from '@sckilltracker/api-client';

const api = new SCKillTrackerAPI({
  baseURL: 'http://localhost:3001',
  token: 'YOUR_JWT_TOKEN'
});

// Get user stats
const stats = await api.users.getStats();

// Create a kill
const kill = await api.kills.create({
  victimId: 'victim_id',
  serverId: 'server_id',
  weapon: 'Laser Cannon'
});
```

### **Python**

```bash

pip install sckilltracker-api

```text


**Production:**
```python
from sckilltracker import SCKillTrackerAPI

api = SCKillTrackerAPI(
    base_url='https://api.millsy.dev',
    token='YOUR_JWT_TOKEN'
)

# Get user stats
stats = api.users.get_stats()

# Create a kill
kill = api.kills.create(
    victim_id='victim_id',
    server_id='server_id',
    weapon='Laser Cannon'
)
```

**Local Development:**
```python
from sckilltracker import SCKillTrackerAPI

api = SCKillTrackerAPI(
    base_url='http://localhost:3001',
    token='YOUR_JWT_TOKEN'
)

# Get user stats
stats = api.users.get_stats()

# Create a kill
kill = api.kills.create(
    victim_id='victim_id',
    server_id='server_id',
    weapon='Laser Cannon'
)
```

## Examples


### **Complete Integration Example**

```javascript
class StarCitizenKillTracker {
  constructor(apiKey, isProduction = true) {
    this.api = new SCKillTrackerAPI({
      baseURL: isProduction ? 'https://api.millsy.dev' : 'http://localhost:3001',
      token: apiKey
    });
  }

  async trackKill(victimName, weapon, location) {
    try {
      const kill = await this.api.kills.create({
        victimName,
        weapon,
        location,
        isPvP: true
      });
      
      console.log('Kill tracked:', kill);
      return kill;
    } catch (error) {
      console.error('Failed to track kill:', error);
      throw error;
    }
  }

  async getUserStats() {
    try {
      const stats = await this.api.users.getStats();
      return stats;
    } catch (error) {
      console.error('Failed to get stats:', error);
      throw error;
    }
  }

  async getLeaderboard(type = 'kills', period = 'all_time') {
    try {
      const leaderboard = await this.api.leaderboards.get({
        type,
        period
      });
      return leaderboard;
    } catch (error) {
      console.error('Failed to get leaderboard:', error);
      throw error;
    }
  }
}

// Usage - Production
const tracker = new StarCitizenKillTracker('YOUR_API_KEY', true);

// Usage - Local Development
const localTracker = new StarCitizenKillTracker('YOUR_API_KEY', false);

// Track a kill
tracker.trackKill('EnemyPlayer', 'Laser Cannon', 'Stanton System');

// Get user stats
tracker.getUserStats().then(stats => {
  console.log('Your stats:', stats);
});
```

## Support


### **Getting Help**

- **Documentation**: https://docs.millsy.dev

- **GitHub Issues**: https://github.com/yourusername/dbot2/issues

- **Discord Support**: Join our Discord server

- **Email**: support@millsy.dev


### **API Status**

- **Status Page**: https://status.millsy.dev

- **Uptime**: 99.9%

- **Response Time**: < 200ms average


---

## Ready to integrate with the Star Citizen Kill Tracker API? Start building amazing applications! <i class="fas fa-rocket"></i>
