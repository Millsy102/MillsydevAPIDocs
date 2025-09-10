---
layout: default
title: "API Endpoints Reference"
---

# 🔌 Complete API Endpoints Reference

> **Detailed reference for all Star Citizen Kill Tracker API endpoints**

## 🔑 Authentication Endpoints

### POST /auth/discord

Authenticate using Discord OAuth2.

**Request Body:**
```json
{
  "code": "discord_oauth_code"
}
```

**Response:**
```json
{
  "user": {
    "id": "user_123",
    "discordId": "123456789",
    "username": "PlayerName",
    "discriminator": "0001",
    "avatar": "https://cdn.discordapp.com/avatars/...",
    "role": "user",
    "permissions": ["view_own_data", "use_features"],
    "isAdmin": false,
    "isServerOwner": false,
    "servers": [],
    "createdAt": "2025-01-01T00:00:00.000Z",
    "lastLoginAt": "2025-01-09T12:00:00.000Z"
  },
  "token": "jwt_token_here",
  "expiresAt": "2025-01-10T12:00:00.000Z"
}
```

### POST /auth/uid-login

Authenticate using UID-based login (for Kill Tracker applications).

**Request Body:**
```json
{
  "uid": "123456789012345678",
  "signature": "hmac_signature",
  "timestamp": 1640995200000
}
```

### POST /auth/refresh

Refresh an expired JWT token (generates new token).

**Request Body:**
```json
{
  "refreshToken": "jwt_token_here"
}
```

**Note:** This endpoint generates a new JWT token. The refreshToken should be the current JWT token.

### POST /auth/logout

Logout and invalidate the current token.

### GET /auth/me

Get current authenticated user information.

**Headers:** `Authorization: Bearer YOUR_JWT_TOKEN`

## 🎯 Kill Tracking Endpoints

### POST /api/kills

Record a new kill (requires API key authentication).

**Headers:** `Authorization: Bearer YOUR_API_KEY`

**Request Body:**
```json
{
  "victimId": "EnemyPlayer",
  "weapon": "Laser Cannon",
  "location": "Stanton System",
  "isPvP": true,
  "isSuicide": false,
  "isEnvironmental": false,
  "rawData": {
    "additional": "metadata"
  }
}
```

**Response:**
```json
{
  "id": "kill_123",
  "killerId": "YourPlayerName",
  "victimId": "EnemyPlayer",
  "serverId": "default-server",
  "weapon": "Laser Cannon",
  "location": "Stanton System",
  "isPvP": true,
  "isSuicide": false,
  "isEnvironmental": false,
  "timestamp": "2025-01-09T12:00:00.000Z",
  "rawData": {
    "additional": "metadata"
  }
}
```

### GET /api/kills/user/:userId

Get kills for a specific user.

**Query Parameters:**
- `limit` (number): Number of records to return (default: 50)

**Response:**
```json
{
  "kills": [
    {
      "id": "kill_123",
      "killerId": "PlayerName",
      "victimId": "VictimName",
      "weapon": "Laser Cannon",
      "location": "Stanton System",
      "isPvP": true,
      "timestamp": "2025-01-09T12:00:00.000Z"
    }
  ]
}
```

### GET /api/kills/server/:serverId

Get kills for a specific server.

**Query Parameters:**
- `limit` (number): Number of records to return (default: 100)

### GET /api/stats/user/:userId

Get user statistics.

**Response:**
```json
{
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
      "timestamp": "2025-01-09T12:00:00.000Z"
    }
  ]
}
```

### GET /api/leaderboard/:type

Get leaderboard data.

**Path Parameters:**
- `type`: `kills`, `deaths`, `kdr`, `pvp_kills`

**Query Parameters:**
- `limit` (number): Number of entries (default: 10)

**Response:**
```json
{
  "type": "kills",
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
```

## 👥 User Management Endpoints

### GET /api/users/:userId

Get user profile with recent kills and deaths.

**Response:**
```json
{
  "id": "user_123",
  "discordId": "123456789",
  "username": "PlayerName",
  "discriminator": "0001",
  "avatar": "https://cdn.discordapp.com/avatars/...",
  "rsiHandle": "RSI_Handle",
  "privacyLevel": "PUBLIC",
  "kills": [
    {
      "id": "kill_123",
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
      "timestamp": "2025-01-09T12:00:00.000Z",
      "isPvP": true
    }
  ],
  "deaths": [
    {
      "id": "death_123",
      "killer": {
        "id": "killer_id",
        "username": "KillerName",
        "avatar": "avatar_url"
      },
      "server": {
        "id": "server_id",
        "name": "Server Name"
      },
      "weapon": "Missile",
      "location": "Stanton System",
      "timestamp": "2025-01-09T11:00:00.000Z",
      "isPvP": true
    }
  ],
  "createdAt": "2025-01-01T00:00:00.000Z",
  "updatedAt": "2025-01-09T12:00:00.000Z"
}
```

### PUT /api/users/:userId

Update user profile.

**Request Body:**
```json
{
  "username": "NewUsername",
  "rsiHandle": "NewRSIHandle",
  "privacyLevel": "PRIVATE"
}
```

## 🏠 Server Management Endpoints

### GET /api/servers/:serverId

Get server information with members and channels.

**Response:**
```json
{
  "id": "server_123",
  "discordId": "123456789",
  "name": "Star Citizen Guild",
  "icon": "https://cdn.discordapp.com/icons/...",
  "isActive": true,
  "memberCount": 150,
  "members": [
    {
      "user": {
        "id": "user_123",
        "username": "PlayerName",
        "avatar": "avatar_url"
      },
      "isOwner": true,
      "permissions": ["read", "write"]
    }
  ],
  "channels": [
    {
      "id": "channel_123",
      "name": "general",
      "type": "text"
    }
  ],
  "createdAt": "2025-01-01T00:00:00.000Z"
}
```

### GET /api/servers/:serverId/settings

Get server settings.

**Response:**
```json
{
  "prefix": "!",
  "language": "en",
  "features": {
    "killTracker": true,
    "leaderboard": true,
    "notifications": true
  },
  "privacyLevel": "public",
  "killNotifications": true,
  "leaderboardChannel": "general"
}
```

### PUT /api/servers/:serverId/settings

Update server settings.

**Request Body:**
```json
{
  "prefix": "!",
  "language": "en",
  "features": {
    "killTracker": true,
    "leaderboard": true,
    "notifications": false
  }
}
```

## 🔑 API Key Management Endpoints

### POST /api/api-keys

Generate new API key.

**Request Body:**
```json
{
  "userId": "user_123",
  "playerName": "PlayerName",
  "name": "My Application",
  "expiresAt": "2025-12-31T23:59:59.000Z"
}
```

**Response:**
```json
{
  "id": "key_123",
  "key": "api_key_here",
  "name": "My Application",
  "playerName": "PlayerName",
  "expiresAt": "2025-12-31T23:59:59.000Z",
  "createdAt": "2025-01-09T12:00:00.000Z"
}
```

### GET /api/api-keys

List user's API keys.

**Query Parameters:**
- `userId` (string): User ID (required)

**Response:**
```json
[
  {
    "id": "key_123",
    "name": "My Application",
    "playerName": "PlayerName",
    "isActive": true,
    "lastUsedAt": "2025-01-09T12:00:00.000Z",
    "expiresAt": "2025-12-31T23:59:59.000Z",
    "createdAt": "2025-01-09T12:00:00.000Z"
  }
]
```

### POST /api/api-keys/primary

Get or create primary API key for Kill Tracker.

**Request Body:**
```json
{
  "userId": "user_123",
  "playerName": "PlayerName"
}
```

### POST /api/api-keys/bot

Create API key for Discord bot.

**Request Body:**
```json
{
  "userId": "user_123",
  "playerName": "PlayerName",
  "botName": "MyBot"
}
```

### DELETE /api/api-keys/:id

Revoke API key.

**Request Body:**
```json
{
  "userId": "user_123"
}
```

## 📊 Analytics Endpoints

### GET /api/analytics/dashboard

Get analytics dashboard data.

**Query Parameters:**
- `game` (string): Game filter
- `serverId` (string): Server filter

**Response:**
```json
{
  "success": true,
  "data": {
    "overview": {
      "totalKills": 1250,
      "totalDeaths": 800,
      "killDeathRatio": 1.56,
      "activeUsers": 45
    },
    "trends": {
      "killsTrend": "+15%",
      "performanceTrend": "+8%"
    },
    "insights": [
      {
        "type": "trend",
        "title": "Kill Activity Increasing",
        "description": "Your kill activity has increased by 15% this week",
        "confidence": 0.85
      }
    ]
  }
}
```

### GET /api/analytics/metrics

Get performance metrics.

**Query Parameters:**
- `game` (string): Game filter
- `serverId` (string): Server filter
- `period` (string): Time period (default: 7d)

**Response:**
```json
{
  "success": true,
  "data": {
    "totalKills": 127,
    "totalDeaths": 89,
    "killDeathRatio": 1.43,
    "pvpKills": 95,
    "pveKills": 32,
    "pvpRatio": 74.8,
    "period": "7d",
    "game": "star_citizen",
    "serverId": "server_123"
  }
}
```

### GET /api/analytics/trends

Get trend analysis.

**Query Parameters:**
- `metric` (string): Metric to analyze (required)
- `period` (string): Time period (required)
- `game` (string): Game filter
- `serverId` (string): Server filter

### GET /api/analytics/insights

Get AI-generated insights.

**Query Parameters:**
- `game` (string): Game filter
- `serverId` (string): Server filter
- `type` (string): Insight type
- `limit` (number): Number of insights (default: 50)
- `offset` (number): Offset for pagination (default: 0)

### GET /api/analytics/recommendations

Get performance recommendations.

**Query Parameters:**
- `game` (string): Game filter
- `serverId` (string): Server filter
- `type` (string): Recommendation type
- `limit` (number): Number of recommendations (default: 50)
- `offset` (number): Offset for pagination (default: 0)

### GET /api/analytics/export

Export analytics data.

**Query Parameters:**
- `game` (string): Game filter
- `serverId` (string): Server filter
- `format` (string): Export format (json, csv) (default: json)
- `period` (string): Time period (default: 30d)

## 🔗 Webhook Endpoints

### POST /api/webhooks

Create webhook.

**Request Body:**
```json
{
  "name": "My Webhook",
  "url": "https://myapp.com/webhook",
  "events": ["kill.recorded", "user.stats_updated"],
  "secret": "webhook_secret",
  "maxRetries": 3,
  "retryDelay": 1000,
  "backoffMultiplier": 2,
  "headers": {
    "X-Custom-Header": "value"
  }
}
```

**Response:**
```json
{
  "id": "webhook_123",
  "message": "Webhook created successfully"
}
```

### GET /api/webhooks

List user's webhooks.

**Response:**
```json
[
  {
    "id": "webhook_123",
    "name": "My Webhook",
    "url": "https://myapp.com/webhook",
    "events": ["kill.recorded", "user.stats_updated"],
    "isActive": true,
    "maxRetries": 3,
    "retryDelay": 1000,
    "backoffMultiplier": 2,
    "headers": {
      "X-Custom-Header": "value"
    },
    "createdAt": "2025-01-09T12:00:00.000Z",
    "updatedAt": "2025-01-09T12:00:00.000Z"
  }
]
```

### PUT /api/webhooks/:id

Update webhook.

**Request Body:**
```json
{
  "name": "Updated Webhook Name",
  "isActive": false,
  "events": ["kill.recorded"]
}
```

### DELETE /api/webhooks/:id

Delete webhook.

### POST /api/webhooks/:id/test

Test webhook.

**Response:**
```json
{
  "message": "Test webhook triggered successfully"
}
```

### GET /api/webhooks/events

Get available webhook events.

**Response:**
```json
[
  {
    "name": "kill.recorded",
    "description": "Triggered when a new kill is recorded",
    "payload": {
      "killId": "string",
      "killerId": "string",
      "victimId": "string",
      "weapon": "string",
      "location": "string",
      "isPvP": "boolean",
      "timestamp": "string"
    }
  },
  {
    "name": "user.stats_updated",
    "description": "Triggered when user statistics are updated",
    "payload": {
      "userId": "string",
      "playerName": "string",
      "stats": {
        "totalKills": "number",
        "totalDeaths": "number",
        "kdr": "number"
      },
      "timestamp": "string"
    }
  }
]
```

## 🚀 Star Citizen Integration Endpoints

### GET /api/sc/ships

Get all Star Citizen ships.

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "name": "Aurora MR",
      "manufacturer": "Roberts Space Industries",
      "type": "Light Fighter",
      "size": "Small",
      "crew": 1,
      "cargo": 0.5,
      "price": 25000
    }
  ],
  "count": 150
}
```

### GET /api/sc/ships/:name

Get specific ship data.

**Path Parameters:**
- `name`: Ship name (e.g., "Aurora MR")

### GET /api/sc/players/:handle

Get player data by RSI handle.

**Path Parameters:**
- `handle`: RSI handle

### GET /api/sc/locations/:name

Get location data.

**Path Parameters:**
- `name`: Location name

### GET /api/sc/systems/:name

Get system data.

**Path Parameters:**
- `name`: System name

## 📋 Log Parser Endpoints

### GET /api/logs/directories

Get log directory information.

**Headers:** `Authorization: Bearer YOUR_JWT_TOKEN`

### GET /api/logs/files

Get available log files.

**Headers:** `Authorization: Bearer YOUR_JWT_TOKEN`

### POST /api/logs/validate

Validate log file.

**Headers:** `Authorization: Bearer YOUR_JWT_TOKEN`

**Request Body:**
```json
{
  "filePath": "/path/to/logfile.log"
}
```

### POST /api/logs/parse

Parse log file for kills.

**Headers:** `Authorization: Bearer YOUR_JWT_TOKEN`

**Request Body:**
```json
{
  "filePath": "/path/to/logfile.log",
  "parseOptions": {
    "includePvE": true,
    "includePvP": true
  }
}
```

## 🚨 Error Codes

| Code | Description |
|------|-------------|
| `UNAUTHORIZED` | Invalid or missing authentication |
| `INVALID_TOKEN` | Invalid or expired token |
| `INSUFFICIENT_PERMISSIONS` | User lacks required permissions |
| `FORBIDDEN` | Access denied |
| `NOT_FOUND` | Resource not found |
| `VALIDATION_ERROR` | Invalid request data |
| `RATE_LIMITED` | Too many requests |
| `SERVER_ERROR` | Internal server error |
| `INVALID_SIGNATURE` | Invalid signature for UID login |
| `TIMESTAMP_TOO_OLD` | Request timestamp too old |
| `REFRESH_TOKEN_REQUIRED` | Refresh token required |
| `USER_NOT_FOUND` | User not found |
| `REFRESH_FAILED` | Token refresh failed |
| `LOGOUT_ERROR` | Logout failed |
| `TOKEN_REQUIRED` | Token required |

## 📝 HTTP Status Codes

| Code | Description |
|------|-------------|
| `200` | Success |
| `201` | Created |
| `400` | Bad Request |
| `401` | Unauthorized |
| `403` | Forbidden |
| `404` | Not Found |
| `422` | Validation Error |
| `429` | Too Many Requests |
| `500` | Internal Server Error |

---

*© 2025 MILLSY.dev | Star Citizen Kill Tracker API v1.0*
