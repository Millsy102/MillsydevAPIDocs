# 👨‍💻 Developer Guide

> **Complete guide for developers using the Star Citizen Kill Tracker API**

## 🚀 Getting Started

### **Quick Start**

1. **Register** at https://millsy.dev
2. **Login** with Discord
3. **Generate API key** in the dashboard
4. **Start building** with our comprehensive API

### **API Base URL**

```
Production: https://api.millsy.dev/api/v1
```

## 🔑 Authentication

### **API Key Authentication**

```javascript
const headers = {
  'Authorization': 'Bearer YOUR_API_KEY',
  'Content-Type': 'application/json'
};
```

### **Making Requests**

```javascript
// Example API call
const response = await fetch('https://api.millsy.dev/api/v1/users/me/stats', {
  headers: {
    'Authorization': 'Bearer YOUR_API_KEY',
    'Content-Type': 'application/json'
  }
});

const stats = await response.json();
console.log('Your stats:', stats);
```

## 📚 SDKs & Libraries

### **JavaScript/TypeScript SDK**

```bash
npm install @sckilltracker/api-client
```

```typescript
import { SCKillTrackerAPI } from '@sckilltracker/api-client';

const api = new SCKillTrackerAPI({
  baseURL: 'https://api.millsy.dev',
  token: 'YOUR_API_KEY'
});

// Get user stats
const stats = await api.users.getStats();
console.log('Your stats:', stats);

// Create a kill
const kill = await api.kills.create({
  victimId: 'victim_user_id',
  serverId: 'server_id',
  weapon: 'Laser Cannon',
  location: 'Stanton System'
});
```

### **Python SDK**

```bash
pip install sckilltracker-api
```

```python
from sckilltracker import SCKillTrackerAPI

api = SCKillTrackerAPI(
    base_url='https://api.millsy.dev',
    token='YOUR_API_KEY'
)

# Get user stats
stats = api.users.get_stats()
print(f'Your stats: {stats}')

# Create a kill
kill = api.kills.create(
    victim_id='victim_user_id',
    server_id='server_id',
    weapon='Laser Cannon',
    location='Stanton System'
)
```

### **REST API Examples**

#### **Get User Statistics**

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.millsy.dev/api/v1/users/me/stats
```

#### **Create a Kill**

```bash
curl -X POST \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "victimId": "victim_user_id",
       "serverId": "server_id",
       "weapon": "Laser Cannon",
       "location": "Stanton System"
     }' \
     https://api.millsy.dev/api/v1/kills
```

#### **Get Leaderboard**

```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
     "https://api.millsy.dev/api/v1/leaderboards?type=kills&period=all_time"
```

## 🔌 WebSocket Integration

### **Real-time Events**

```javascript
const ws = new WebSocket('wss://api.millsy.dev/ws');

ws.onopen = function() {
  // Authenticate
  ws.send(JSON.stringify({
    type: 'auth',
    token: 'YOUR_JWT_TOKEN'
  }));
};

ws.onmessage = function(event) {
  const data = JSON.parse(event.data);
  
  switch(data.type) {
    case 'kill.created':
      console.log('New kill:', data.data.kill);
      break;
    case 'kill.updated':
      console.log('Kill updated:', data.data.kill);
      break;
    case 'user.joined':
      console.log('User joined:', data.data.user);
      break;
  }
};
```

### **Event Types**

- `kill.created` - New kill recorded
- `kill.updated` - Kill updated
- `kill.deleted` - Kill deleted
- `user.joined` - User joined server
- `user.left` - User left server
- `server.updated` - Server settings updated
- `bot.status_changed` - Bot status changed

## 🎯 Common Use Cases

### **1. Kill Tracking Application**

```typescript
class KillTracker {
  constructor(apiKey: string) {
    this.api = new SCKillTrackerAPI({
      baseURL: 'https://api.millsy.dev',
      token: apiKey
    });
  }

  async trackKill(victimName: string, weapon: string, location: string) {
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

  async getPersonalStats() {
    const stats = await this.api.users.getStats();
    return {
      totalKills: stats.totalKills,
      totalDeaths: stats.totalDeaths,
      kdRatio: stats.killDeathRatio,
      rank: stats.rank
    };
  }
}
```

### **2. Discord Bot Integration**

```typescript
import { Client, GatewayIntentBits } from 'discord.js';
import { SCKillTrackerAPI } from '@sckilltracker/api-client';

const client = new Client({ intents: [GatewayIntentBits.Guilds] });
const api = new SCKillTrackerAPI({
  baseURL: 'https://api.millsy.dev',
  token: 'YOUR_API_KEY'
});

client.on('interactionCreate', async interaction => {
  if (interaction.commandName === 'mystats') {
    const stats = await api.users.getStats();
    
    await interaction.reply({
      content: `Your Stats:
      Kills: ${stats.totalKills}
      Deaths: ${stats.totalDeaths}
      K/D Ratio: ${stats.killDeathRatio}
      Rank: #${stats.rank}`
    });
  }
});
```

### **3. Web Dashboard Integration**

```typescript
import React, { useState, useEffect } from 'react';
import { SCKillTrackerAPI } from '@sckilltracker/api-client';

const Dashboard: React.FC = () => {
  const [stats, setStats] = useState(null);
  const [kills, setKills] = useState([]);
  
  const api = new SCKillTrackerAPI({
    baseURL: 'https://api.millsy.dev',
    token: localStorage.getItem('api_key')
  });

  useEffect(() => {
    const fetchData = async () => {
      const [statsData, killsData] = await Promise.all([
        api.users.getStats(),
        api.kills.getList({ limit: 10 })
      ]);
      
      setStats(statsData);
      setKills(killsData.kills);
    };

    fetchData();
  }, []);

  return (
    <div>
      <h1>Your Statistics</h1>
      <p>Kills: {stats?.totalKills}</p>
      <p>Deaths: {stats?.totalDeaths}</p>
      <p>K/D Ratio: {stats?.killDeathRatio}</p>
      
      <h2>Recent Kills</h2>
      {kills.map(kill => (
        <div key={kill.id}>
          Killed {kill.victim.username} with {kill.weapon}
        </div>
      ))}
    </div>
  );
};
```

## 🔧 Advanced Features

### **Webhook Integration**

```typescript
// Create webhook
const webhook = await api.webhooks.create({
  name: 'My Webhook',
  url: 'https://myapp.com/webhook',
  events: ['kill.created', 'kill.updated'],
  secret: 'webhook_secret'
});

// Your webhook endpoint
app.post('/webhook', (req, res) => {
  const signature = req.headers['x-webhook-signature'];
  const payload = req.body;
  
  // Verify webhook signature
  if (verifyWebhookSignature(payload, signature, 'webhook_secret')) {
    // Process webhook
    console.log('Webhook received:', payload);
    res.status(200).send('OK');
  } else {
    res.status(401).send('Unauthorized');
  }
});
```

### **Batch Operations**

```typescript
// Create multiple kills
const kills = await api.kills.createBatch([
  {
    victimId: 'victim1',
    weapon: 'Laser Cannon',
    location: 'Stanton'
  },
  {
    victimId: 'victim2',
    weapon: 'Missile',
    location: 'Crusader'
  }
]);
```

### **Analytics Integration**

```typescript
// Get detailed analytics
const analytics = await api.analytics.getKills({
  period: 'month',
  startDate: '2024-01-01',
  endDate: '2024-01-31'
});

console.log('Monthly kills:', analytics.totalKills);
console.log('Daily breakdown:', analytics.dailyKills);
console.log('Weapon stats:', analytics.weaponStats);
```

## 🛡️ Security Best Practices

### **API Key Management**

```typescript
// Store API keys securely
const apiKey = process.env.SCKILLTRACKER_API_KEY;

// Rotate keys regularly
const newKey = await api.apiKeys.create({
  name: 'New Key',
  permissions: ['read:kills', 'write:kills']
});

// Revoke old keys
await api.apiKeys.revoke('old_key_id');
```

### **Rate Limiting**

```typescript
// Implement client-side rate limiting
class RateLimitedAPI {
  private requests: number[] = [];
  private maxRequests = 100;
  private windowMs = 60000; // 1 minute

  async makeRequest(endpoint: string) {
    const now = Date.now();
    
    // Remove old requests
    this.requests = this.requests.filter(time => now - time < this.windowMs);
    
    if (this.requests.length >= this.maxRequests) {
      throw new Error('Rate limit exceeded');
    }
    
    this.requests.push(now);
    return this.api.request(endpoint);
  }
}
```

### **Error Handling**

```typescript
try {
  const kill = await api.kills.create(killData);
} catch (error) {
  if (error.status === 401) {
    // Handle authentication error
    console.log('Please login again');
  } else if (error.status === 429) {
    // Handle rate limiting
    console.log('Rate limit exceeded, please wait');
  } else if (error.status >= 500) {
    // Handle server errors
    console.log('Server error, please try again later');
  } else {
    // Handle other errors
    console.log('Error:', error.message);
  }
}
```

## 📊 Data Models

### **User Model**

```typescript
interface User {
  id: string;
  discordId: string;
  username: string;
  discriminator: string;
  avatar?: string;
  rsiHandle?: string;
  privacyLevel: 'PUBLIC' | 'PRIVATE' | 'FRIENDS_ONLY';
  createdAt: string;
  updatedAt: string;
}
```

### **Kill Model**

```typescript
interface Kill {
  id: string;
  killer: User;
  victim: User;
  server: Server;
  weapon?: string;
  location?: string;
  timestamp: string;
  isPvP: boolean;
  isSuicide: boolean;
  isEnvironmental: boolean;
}
```

### **Server Model**

```typescript
interface Server {
  id: string;
  discordId: string;
  name: string;
  icon?: string;
  ownerId: string;
  isActive: boolean;
  settings: ServerSettings;
  memberCount: number;
  createdAt: string;
  updatedAt: string;
}
```

## 🧪 Testing

### **Unit Tests**

```typescript
import { SCKillTrackerAPI } from '@sckilltracker/api-client';

describe('SCKillTrackerAPI', () => {
  let api: SCKillTrackerAPI;

  beforeEach(() => {
    api = new SCKillTrackerAPI({
      baseURL: 'https://api.millsy.dev',
      token: 'test_token'
    });
  });

  it('should get user stats', async () => {
    const stats = await api.users.getStats();
    expect(stats).toHaveProperty('totalKills');
    expect(stats).toHaveProperty('totalDeaths');
  });

  it('should create a kill', async () => {
    const kill = await api.kills.create({
      victimId: 'test_victim',
      serverId: 'test_server',
      weapon: 'Test Weapon'
    });
    
    expect(kill).toHaveProperty('id');
    expect(kill.weapon).toBe('Test Weapon');
  });
});
```

## 📈 Performance Optimization

### **Caching**

```typescript
class CachedAPI {
  private cache = new Map();
  private cacheTimeout = 5 * 60 * 1000; // 5 minutes

  async getStats() {
    const cacheKey = 'user_stats';
    const cached = this.cache.get(cacheKey);
    
    if (cached && Date.now() - cached.timestamp < this.cacheTimeout) {
      return cached.data;
    }
    
    const stats = await this.api.users.getStats();
    this.cache.set(cacheKey, {
      data: stats,
      timestamp: Date.now()
    });
    
    return stats;
  }
}
```

### **Pagination**

```typescript
// Get all kills with pagination
async getAllKills() {
  const allKills = [];
  let page = 1;
  let hasMore = true;
  
  while (hasMore) {
    const response = await api.kills.getList({
      page,
      limit: 100
    });
    
    allKills.push(...response.kills);
    hasMore = response.pagination.page < response.pagination.pages;
    page++;
  }
  
  return allKills;
}
```

## 🆘 Support & Resources

### **Documentation**

- **API Reference**: https://docs.millsy.dev/api
- **SDK Documentation**: https://docs.millsy.dev/sdk
- **Webhook Guide**: https://docs.millsy.dev/webhooks
- **Rate Limits**: https://docs.millsy.dev/rate-limits

### **Community**

- **Discord Server**: Join our support server
- **GitHub**: https://github.com/yourusername/MillsydevAPIDocs
- **Stack Overflow**: Tag questions with `sckilltracker`

### **Support**

- **Email**: developers@millsy.dev
- **GitHub Issues**: Create an issue for bugs or feature requests
- **Status Page**: Check API status

---

## Ready to build amazing applications with the Star Citizen Kill Tracker API! 🚀