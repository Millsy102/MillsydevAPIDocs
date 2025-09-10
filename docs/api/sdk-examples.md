---
layout: default
title: "Integration Examples & Code Samples"
---

# 📚 Integration Examples & Code Samples

> **Real integration examples for the Star Citizen Kill Tracker API**

## 🔒 Security First

**⚠️ CRITICAL SECURITY WARNING:**
- **Never hardcode API keys** in your source code
- **Always use environment variables** for API keys
- **Add .env files to .gitignore** to prevent accidental commits
- **Use secure key management** for production applications
- **Rotate API keys regularly** (every 90 days recommended)

## 🚀 Quick Start Examples

### JavaScript/TypeScript Integration

#### Basic Setup
```javascript
// Simple API client using fetch
class KillTrackerAPI {
  constructor(apiKey, baseURL = 'https://api.millsy.dev') {
    // SECURITY: Always validate API key is not hardcoded
    if (!apiKey || apiKey.includes('YOUR_API_KEY') || apiKey.includes('sk-')) {
      throw new Error('Invalid API key. Use environment variables for security.');
    }
    this.apiKey = apiKey;
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.apiKey}`,
        ...options.headers
      },
      ...options
    };

    const response = await fetch(url, config);
    
    if (!response.ok) {
      throw new Error(`API Error: ${response.status} ${response.statusText}`);
    }
    
    return await response.json();
  }

  // Test API key validity
  async validate() {
    return await this.request('/api/api-keys/validate');
  }

  // Record a kill
  async recordKill(killData) {
    return await this.request('/api/kills', {
      method: 'POST',
      body: JSON.stringify(killData)
    });
  }

  // Get user stats
  async getUserStats(userId) {
    return await this.request(`/api/stats/user/${userId}`);
  }

  // Get leaderboard
  async getLeaderboard(type, limit = 10) {
    return await this.request(`/api/leaderboard/${type}?limit=${limit}`);
  }
}

// Usage - SECURE: Use environment variables
const api = new KillTrackerAPI(process.env.API_KEY);

// Test connection
try {
  const validation = await api.validate();
  console.log('API Key valid:', validation.valid);
} catch (error) {
  console.error('API connection failed:', error);
}
```

#### Record a Kill
```javascript
// Simple kill recording
const kill = await api.recordKill({
  victimId: 'EnemyPlayer',
  weapon: 'Laser Cannon',
  location: 'Stanton System',
  isPvP: true,
  isSuicide: false,
  isEnvironmental: false
});

console.log('Kill recorded:', kill.id);
```

#### Get User Statistics
```javascript
const stats = await api.getUserStats('USER_ID');
console.log('User stats:', {
  totalKills: stats.totalKills,
  totalDeaths: stats.totalDeaths,
  kdr: stats.killDeathRatio
});
```

#### Get Leaderboard
```javascript
const leaderboard = await api.getLeaderboard('kills', 10);
console.log('Top 10 killers:', leaderboard.entries);
```

### Python Integration

#### Basic Setup
```python
import requests
import json
import os
from typing import Dict, Any, Optional

class KillTrackerAPI:
    def __init__(self, api_key: str = None, base_url: str = 'https://api.millsy.dev'):
        # SECURITY: Use environment variables, never hardcode
        self.api_key = api_key or os.getenv('API_KEY')
        if not self.api_key or 'YOUR_API_KEY' in self.api_key:
            raise ValueError('Invalid API key. Use environment variables for security.')
        self.base_url = base_url
        self.session = requests.Session()
        self.session.headers.update({
            'Content-Type': 'application/json',
            'Authorization': f'Bearer {api_key}'
        })

    def _request(self, method: str, endpoint: str, **kwargs) -> Dict[str, Any]:
        url = f'{self.base_url}{endpoint}'
        response = self.session.request(method, url, **kwargs)
        response.raise_for_status()
        return response.json()

    def validate(self) -> Dict[str, Any]:
        """Test API key validity"""
        return self._request('GET', '/api/api-keys/validate')

    def record_kill(self, kill_data: Dict[str, Any]) -> Dict[str, Any]:
        """Record a new kill"""
        return self._request('POST', '/api/kills', json=kill_data)

    def get_user_stats(self, user_id: str) -> Dict[str, Any]:
        """Get user statistics"""
        return self._request('GET', f'/api/stats/user/{user_id}')

    def get_leaderboard(self, type: str, limit: int = 10) -> Dict[str, Any]:
        """Get leaderboard data"""
        return self._request('GET', f'/api/leaderboard/{type}?limit={limit}')

# Usage - SECURE: Use environment variables
api = KillTrackerAPI()  # Will use API_KEY from environment

# Test connection
try:
    validation = api.validate()
    print(f'API Key valid: {validation["valid"]}')
except Exception as e:
    print(f'API connection failed: {e}')
```

#### Record a Kill
```python
# Simple kill recording
kill = api.record_kill({
    'victimId': 'EnemyPlayer',
    'weapon': 'Laser Cannon',
    'location': 'Stanton System',
    'isPvP': True,
    'isSuicide': False,
    'isEnvironmental': False
})

print(f'Kill recorded: {kill["id"]}')
```

#### Get User Statistics
```python
stats = api.get_user_stats('USER_ID')
print(f'User stats: {stats["totalKills"]} kills, {stats["totalDeaths"]} deaths, KDR: {stats["killDeathRatio"]}')
```

## 🔧 Advanced Integration Examples

### Kill Tracker Application Integration

#### C# Example (for Kill Tracker Windows App)
```csharp
using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

public class KillTrackerAPI
{
    private readonly HttpClient _httpClient;
    private readonly string _apiKey;
    private readonly string _baseUrl = "https://api.millsy.dev";

    public KillTrackerAPI(string apiKey)
    {
        _apiKey = apiKey;
        _httpClient = new HttpClient();
        _httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {apiKey}");
    }

    public async Task<KillRecord> RecordKillAsync(string victimId, string weapon, string location, bool isPvP = true)
    {
        var killData = new
        {
            victimId = victimId,
            weapon = weapon,
            location = location,
            isPvP = isPvP,
            isSuicide = false,
            isEnvironmental = false
        };

        var json = JsonSerializer.Serialize(killData);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await _httpClient.PostAsync($"{_baseUrl}/api/kills", content);
        response.EnsureSuccessStatusCode();

        var responseJson = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<KillRecord>(responseJson);
    }

    public async Task<UserStats> GetUserStatsAsync(string userId)
    {
        var response = await _httpClient.GetAsync($"{_baseUrl}/api/stats/user/{userId}");
        response.EnsureSuccessStatusCode();

        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<UserStats>(json);
    }
}

public class KillRecord
{
    public string Id { get; set; }
    public string KillerId { get; set; }
    public string VictimId { get; set; }
    public string Weapon { get; set; }
    public string Location { get; set; }
    public bool IsPvP { get; set; }
    public DateTime Timestamp { get; set; }
}

public class UserStats
{
    public int TotalKills { get; set; }
    public int TotalDeaths { get; set; }
    public double KillDeathRatio { get; set; }
    public string FavoriteWeapon { get; set; }
}
```

### Discord Bot Integration

#### JavaScript Discord Bot Example
```javascript
const { Client, GatewayIntentBits } = require('discord.js');

// Simple API client
class KillTrackerAPI {
  constructor(apiKey, baseURL = 'https://api.millsy.dev') {
    this.apiKey = apiKey;
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.apiKey}`,
        ...options.headers
      },
      ...options
    };

    const response = await fetch(url, config);
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }
    return await response.json();
  }

  async recordKill(killData) {
    return await this.request('/api/kills', {
      method: 'POST',
      body: JSON.stringify(killData)
    });
  }

  async getUserStats(userId) {
    return await this.request(`/api/stats/user/${userId}`);
  }

  async getLeaderboard(type, limit = 10) {
    return await this.request(`/api/leaderboard/${type}?limit=${limit}`);
  }
}

const client = new Client({ intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages] });
const api = new KillTrackerAPI(process.env.KILLTRACKER_API_KEY);

client.on('messageCreate', async (message) => {
  if (message.content.startsWith('!kill')) {
    const args = message.content.split(' ');
    if (args.length < 3) {
      return message.reply('Usage: !kill <victim> <weapon> [location]');
    }

    try {
      const kill = await api.kills.create({
        victimId: args[1],
        weapon: args[2],
        location: args[3] || 'Unknown',
        isPvP: true
      });

      message.reply(`✅ Kill recorded! ${message.author.username} eliminated ${args[1]} with ${args[2]}`);
    } catch (error) {
      message.reply('❌ Failed to record kill. Please try again.');
      console.error('Kill recording error:', error);
    }
  }

  if (message.content.startsWith('!stats')) {
    try {
      const stats = await api.users.getStats(message.author.id);
      const embed = {
        title: `${message.author.username}'s Statistics`,
        fields: [
          { name: 'Total Kills', value: stats.totalKills.toString(), inline: true },
          { name: 'Total Deaths', value: stats.totalDeaths.toString(), inline: true },
          { name: 'K/D Ratio', value: stats.killDeathRatio.toFixed(2), inline: true },
          { name: 'Favorite Weapon', value: stats.favoriteWeapon || 'None', inline: true }
        ],
        color: 0x00ff00
      };

      message.reply({ embeds: [embed] });
    } catch (error) {
      message.reply('❌ Failed to get statistics. Please try again.');
      console.error('Stats error:', error);
    }
  }

  if (message.content.startsWith('!leaderboard')) {
    try {
      const leaderboard = await api.leaderboard.get('kills', { limit: 10 });
      const embed = {
        title: '🏆 Top 10 Killers',
        description: leaderboard.entries.map((entry, index) => 
          `${index + 1}. ${entry.user.username} - ${entry.value} kills`
        ).join('\n'),
        color: 0xffd700
      };

      message.reply({ embeds: [embed] });
    } catch (error) {
      message.reply('❌ Failed to get leaderboard. Please try again.');
      console.error('Leaderboard error:', error);
    }
  }
});

client.login(process.env.DISCORD_TOKEN);
```

### Web Application Integration

#### React Component Example
```jsx
import React, { useState, useEffect } from 'react';

// Simple API client
class KillTrackerAPI {
  constructor(apiKey, baseURL = 'https://api.millsy.dev') {
    this.apiKey = apiKey;
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.apiKey}`,
        ...options.headers
      },
      ...options
    };

    const response = await fetch(url, config);
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }
    return await response.json();
  }

  async getUserStats(userId) {
    return await this.request(`/api/stats/user/${userId}`);
  }

  async getLeaderboard(type, limit = 10) {
    return await this.request(`/api/leaderboard/${type}?limit=${limit}`);
  }

  async recordKill(killData) {
    return await this.request('/api/kills', {
      method: 'POST',
      body: JSON.stringify(killData)
    });
  }
}

const KillTracker = () => {
  const [api] = useState(new KillTrackerAPI(process.env.REACT_APP_API_KEY));
  
  const [stats, setStats] = useState(null);
  const [leaderboard, setLeaderboard] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const [statsData, leaderboardData] = await Promise.all([
          api.users.getStats('USER_ID'),
          api.leaderboard.get('kills', { limit: 10 })
        ]);
        
        setStats(statsData);
        setLeaderboard(leaderboardData);
      } catch (error) {
        console.error('Failed to fetch data:', error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [api]);

  const recordKill = async (victimId, weapon, location) => {
    try {
      const kill = await api.kills.create({
        victimId,
        weapon,
        location,
        isPvP: true
      });
      
      console.log('Kill recorded:', kill);
      // Refresh stats after recording
      const newStats = await api.users.getStats('USER_ID');
      setStats(newStats);
    } catch (error) {
      console.error('Failed to record kill:', error);
    }
  };

  if (loading) return <div>Loading...</div>;

  return (
    <div className="kill-tracker">
      <div className="stats">
        <h2>Your Statistics</h2>
        <p>Kills: {stats?.totalKills}</p>
        <p>Deaths: {stats?.totalDeaths}</p>
        <p>K/D Ratio: {stats?.killDeathRatio?.toFixed(2)}</p>
      </div>
      
      <div className="leaderboard">
        <h2>Top 10 Killers</h2>
        <ol>
          {leaderboard?.entries.map((entry, index) => (
            <li key={entry.user.id}>
              {index + 1}. {entry.user.username} - {entry.value} kills
            </li>
          ))}
        </ol>
      </div>
    </div>
  );
};

export default KillTracker;
```

### Webhook Integration

#### Node.js Webhook Handler
```javascript
const express = require('express');
const crypto = require('crypto');
const app = express();

app.use(express.json());

// Webhook signature verification
const verifyWebhookSignature = (req, res, next) => {
  const signature = req.headers['x-webhook-signature'];
  const payload = JSON.stringify(req.body);
  const secret = process.env.WEBHOOK_SECRET;
  
  const expectedSignature = crypto
    .createHmac('sha256', secret)
    .update(payload)
    .digest('hex');
  
  if (signature !== expectedSignature) {
    return res.status(401).json({ error: 'Invalid signature' });
  }
  
  next();
};

// Webhook endpoint
app.post('/webhook', verifyWebhookSignature, (req, res) => {
  const { event, data } = req.body;
  
  switch (event) {
    case 'kill.recorded':
      console.log('New kill recorded:', data);
      // Process kill data
      handleKillRecorded(data);
      break;
      
    case 'user.stats_updated':
      console.log('User stats updated:', data);
      // Update local cache or database
      handleStatsUpdated(data);
      break;
      
    case 'leaderboard.updated':
      console.log('Leaderboard updated:', data);
      // Refresh leaderboard display
      handleLeaderboardUpdated(data);
      break;
      
    default:
      console.log('Unknown event:', event);
  }
  
  res.json({ received: true });
});

function handleKillRecorded(killData) {
  // Send notification to Discord channel
  // Update real-time dashboard
  // Log to database
  console.log(`Kill: ${killData.killerId} eliminated ${killData.victimId} with ${killData.weapon}`);
}

function handleStatsUpdated(statsData) {
  // Update user's local statistics
  // Send achievement notifications
  console.log(`Stats updated for ${statsData.playerName}: ${statsData.stats.totalKills} kills`);
}

function handleLeaderboardUpdated(leaderboardData) {
  // Update leaderboard display
  // Send notifications for rank changes
  console.log(`Leaderboard updated: ${leaderboardData.type}`);
}

app.listen(3000, () => {
  console.log('Webhook server running on port 3000');
});
```

### Analytics Integration

#### Advanced Analytics Dashboard
```javascript
// Simple API client for analytics
class KillTrackerAPI {
  constructor(apiKey, baseURL = 'https://api.millsy.dev') {
    this.apiKey = apiKey;
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.apiKey}`,
        ...options.headers
      },
      ...options
    };

    const response = await fetch(url, config);
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }
    return await response.json();
  }

  async getDashboard(params = {}) {
    const query = new URLSearchParams(params).toString();
    return await this.request(`/api/analytics/dashboard?${query}`);
  }

  async getMetrics(params = {}) {
    const query = new URLSearchParams(params).toString();
    return await this.request(`/api/analytics/metrics?${query}`);
  }

  async getTrends(params = {}) {
    const query = new URLSearchParams(params).toString();
    return await this.request(`/api/analytics/trends?${query}`);
  }

  async getInsights(params = {}) {
    const query = new URLSearchParams(params).toString();
    return await this.request(`/api/analytics/insights?${query}`);
  }

  async getRecommendations(params = {}) {
    const query = new URLSearchParams(params).toString();
    return await this.request(`/api/analytics/recommendations?${query}`);
  }

  async export(params = {}) {
    const query = new URLSearchParams(params).toString();
    return await this.request(`/api/analytics/export?${query}`);
  }
}

class AnalyticsDashboard {
  constructor(apiKey) {
    this.api = new KillTrackerAPI(apiKey);
  }

  async getDashboardData(userId, game = 'star_citizen', serverId = null) {
    try {
      const [dashboard, metrics, trends, insights, recommendations] = await Promise.all([
        this.api.getDashboard({ game, serverId }),
        this.api.getMetrics({ game, serverId, period: '7d' }),
        this.api.getTrends({ metric: 'kills', period: '7d', game, serverId }),
        this.api.getInsights({ game, serverId, limit: 5 }),
        this.api.getRecommendations({ game, serverId, limit: 5 })
      ]);

      return {
        overview: dashboard.data.overview,
        metrics: metrics.data,
        trends: trends.data,
        insights: insights.data,
        recommendations: recommendations.data
      };
    } catch (error) {
      console.error('Failed to fetch analytics data:', error);
      throw error;
    }
  }

  async exportData(userId, format = 'json', period = '30d') {
    try {
      const exportData = await this.api.export({
        format,
        period,
        game: 'star_citizen'
      });

      return exportData;
    } catch (error) {
      console.error('Failed to export data:', error);
      throw error;
    }
  }

  async generateReport(userId) {
    const data = await this.getDashboardData(userId);
    
    const report = {
      generatedAt: new Date().toISOString(),
      summary: {
        totalKills: data.metrics.totalKills,
        totalDeaths: data.metrics.totalDeaths,
        killDeathRatio: data.metrics.killDeathRatio,
        pvpRatio: data.metrics.pvpRatio
      },
      trends: data.trends,
      insights: data.insights,
      recommendations: data.recommendations
    };

    return report;
  }
}

// Usage
const dashboard = new AnalyticsDashboard('YOUR_API_KEY');
const report = await dashboard.generateReport('USER_ID');
console.log('Analytics Report:', report);
```

## 🔐 Authentication Examples

### API Key Management
```javascript
// Generate new API key
const newKey = await api.apiKeys.create({
  userId: 'USER_ID',
  playerName: 'PlayerName',
  name: 'My Application',
  expiresAt: '2025-12-31T23:59:59.000Z'
});

console.log('New API Key:', newKey.key); // Only shown once!

// List existing keys
const keys = await api.apiKeys.list('USER_ID');
console.log('Existing keys:', keys);

// Get primary key for Kill Tracker
const primaryKey = await api.apiKeys.getPrimary('USER_ID', 'PlayerName');
console.log('Primary key:', primaryKey.key);

// Revoke a key
await api.apiKeys.revoke('KEY_ID', 'USER_ID');
```

### JWT Token Management
```javascript
// Discord OAuth login
const authResponse = await fetch('https://api.millsy.dev/auth/discord', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ code: 'DISCORD_OAUTH_CODE' })
});

const { user, token, expiresAt } = await authResponse.json();

// Store token securely
localStorage.setItem('jwt_token', token);
localStorage.setItem('token_expires', expiresAt);

// Use token for authenticated requests
const api = new KillTrackerAPI({
  baseURL: 'https://api.millsy.dev',
  token: token
});

// Refresh token when needed
const refreshResponse = await fetch('https://api.millsy.dev/auth/refresh', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({ refreshToken: 'REFRESH_TOKEN' })
});
```

## 🧪 Testing Examples

### Unit Tests with Jest
```javascript
// Mock API client for testing
class KillTrackerAPI {
  constructor(apiKey, baseURL = 'https://api.millsy.dev') {
    this.apiKey = apiKey;
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.apiKey}`,
        ...options.headers
      },
      ...options
    };

    const response = await fetch(url, config);
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }
    return await response.json();
  }

  async recordKill(killData) {
    return await this.request('/api/kills', {
      method: 'POST',
      body: JSON.stringify(killData)
    });
  }

  async getUserStats(userId) {
    return await this.request(`/api/stats/user/${userId}`);
  }
}

describe('KillTrackerAPI', () => {
  let api;

  beforeEach(() => {
    api = new KillTrackerAPI('test-api-key');
  });

  test('should record a kill', async () => {
    const mockKill = {
      id: 'kill_123',
      killerId: 'TestPlayer',
      victimId: 'EnemyPlayer',
      weapon: 'Laser Cannon',
      location: 'Stanton System',
      isPvP: true,
      timestamp: '2025-01-09T12:00:00.000Z'
    };

    // Mock the API call
    jest.spyOn(api, 'recordKill').mockResolvedValue(mockKill);

    const result = await api.recordKill({
      victimId: 'EnemyPlayer',
      weapon: 'Laser Cannon',
      location: 'Stanton System',
      isPvP: true
    });

    expect(result).toEqual(mockKill);
    expect(api.recordKill).toHaveBeenCalledWith({
      victimId: 'EnemyPlayer',
      weapon: 'Laser Cannon',
      location: 'Stanton System',
      isPvP: true
    });
  });

  test('should get user stats', async () => {
    const mockStats = {
      totalKills: 100,
      totalDeaths: 50,
      killDeathRatio: 2.0,
      favoriteWeapon: 'Laser Cannon'
    };

    jest.spyOn(api, 'getUserStats').mockResolvedValue(mockStats);

    const result = await api.getUserStats('USER_ID');

    expect(result).toEqual(mockStats);
    expect(api.getUserStats).toHaveBeenCalledWith('USER_ID');
  });
});
```

## 📱 Mobile App Integration

### React Native Example
```javascript
import React, { useState, useEffect } from 'react';
import { View, Text, Button, TextInput, Alert } from 'react-native';

// Simple API client for React Native
class KillTrackerAPI {
  constructor(apiKey, baseURL = 'https://api.millsy.dev') {
    this.apiKey = apiKey;
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${this.apiKey}`,
        ...options.headers
      },
      ...options
    };

    const response = await fetch(url, config);
    if (!response.ok) {
      throw new Error(`API Error: ${response.status}`);
    }
    return await response.json();
  }

  async recordKill(killData) {
    return await this.request('/api/kills', {
      method: 'POST',
      body: JSON.stringify(killData)
    });
  }

  async getUserStats(userId) {
    return await this.request(`/api/stats/user/${userId}`);
  }
}

const KillTrackerApp = () => {
  const [api] = useState(new KillTrackerAPI('YOUR_API_KEY'));
  
  const [victimId, setVictimId] = useState('');
  const [weapon, setWeapon] = useState('');
  const [location, setLocation] = useState('');
  const [stats, setStats] = useState(null);

  const recordKill = async () => {
    if (!victimId || !weapon) {
      Alert.alert('Error', 'Please fill in victim and weapon');
      return;
    }

    try {
      const kill = await api.kills.create({
        victimId,
        weapon,
        location: location || 'Unknown',
        isPvP: true
      });

      Alert.alert('Success', `Kill recorded: ${kill.id}`);
      
      // Clear form
      setVictimId('');
      setWeapon('');
      setLocation('');
      
      // Refresh stats
      const newStats = await api.users.getStats('USER_ID');
      setStats(newStats);
    } catch (error) {
      Alert.alert('Error', 'Failed to record kill');
      console.error(error);
    }
  };

  useEffect(() => {
    const loadStats = async () => {
      try {
        const userStats = await api.users.getStats('USER_ID');
        setStats(userStats);
      } catch (error) {
        console.error('Failed to load stats:', error);
      }
    };

    loadStats();
  }, [api]);

  return (
    <View style={{ padding: 20 }}>
      <Text style={{ fontSize: 24, marginBottom: 20 }}>Kill Tracker</Text>
      
      <TextInput
        placeholder="Victim Name"
        value={victimId}
        onChangeText={setVictimId}
        style={{ borderWidth: 1, padding: 10, marginBottom: 10 }}
      />
      
      <TextInput
        placeholder="Weapon"
        value={weapon}
        onChangeText={setWeapon}
        style={{ borderWidth: 1, padding: 10, marginBottom: 10 }}
      />
      
      <TextInput
        placeholder="Location (optional)"
        value={location}
        onChangeText={setLocation}
        style={{ borderWidth: 1, padding: 10, marginBottom: 20 }}
      />
      
      <Button title="Record Kill" onPress={recordKill} />
      
      {stats && (
        <View style={{ marginTop: 20 }}>
          <Text>Kills: {stats.totalKills}</Text>
          <Text>Deaths: {stats.totalDeaths}</Text>
          <Text>K/D Ratio: {stats.killDeathRatio.toFixed(2)}</Text>
        </View>
      )}
    </View>
  );
};

export default KillTrackerApp;
```

## 🚀 Deployment Examples

### Docker Configuration
```dockerfile
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

### Environment Variables
```bash
# .env
KILLTRACKER_API_KEY=your_api_key_here
KILLTRACKER_BASE_URL=https://api.millsy.dev
WEBHOOK_SECRET=your_webhook_secret_here
DISCORD_TOKEN=your_discord_bot_token_here
```

### Kubernetes Deployment
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: killtracker-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: killtracker-app
  template:
    metadata:
      labels:
        app: killtracker-app
    spec:
      containers:
      - name: killtracker-app
        image: your-registry/killtracker-app:latest
        ports:
        - containerPort: 3000
        env:
        - name: KILLTRACKER_API_KEY
          valueFrom:
            secretKeyRef:
              name: killtracker-secrets
              key: api-key
        - name: KILLTRACKER_BASE_URL
          value: "https://api.millsy.dev"
```

---

*© 2025 MILLSY.dev | Star Citizen Kill Tracker API SDK Examples*
