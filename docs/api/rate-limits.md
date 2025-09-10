---
layout: default
title: "Rate Limits & Quotas"
---

# 🚦 Rate Limits & Quotas

> **Comprehensive rate limiting, quotas, and usage policies for the Star Citizen Kill Tracker API**

## 📊 Rate Limit Overview

### Current Limits
- **All API requests**: 1000 requests/hour
- **Kill tracking**: 500 requests/hour
- **Admin operations**: 10 requests/minute
- **API Key operations**: 5 requests/minute

### Rate Limit Types
- **Per API Key**: Individual key limits
- **Per Endpoint**: Specific endpoint limits
- **Per User**: User-based limits
- **Global**: System-wide limits

## 🔢 Detailed Rate Limits

### General API Endpoints
| Endpoint Category | Limit | Window | Description |
|------------------|-------|--------|-------------|
| All API requests | 1000 | 1 hour | General API usage |
| Kill tracking | 500 | 1 hour | Kill-related operations |
| User management | 200 | 1 hour | User operations |
| Statistics | 300 | 1 hour | Analytics requests |
| Leaderboards | 100 | 1 hour | Ranking requests |

### Administrative Endpoints
| Endpoint Category | Limit | Window | Description |
|------------------|-------|--------|-------------|
| Admin operations | 10 | 1 minute | Administrative tasks |
| API Key management | 5 | 1 minute | Key operations |
| Webhook management | 20 | 1 minute | Webhook operations |
| System operations | 5 | 1 minute | System maintenance |

### Star Citizen Integration
| Endpoint Category | Limit | Window | Description |
|------------------|-------|--------|-------------|
| Ship data | 200 | 1 hour | Ship information |
| Player data | 100 | 1 hour | Player information |
| Location data | 150 | 1 hour | Location queries |
| System data | 100 | 1 hour | System information |

### Log Parser & Snare Planner
| Endpoint Category | Limit | Window | Description |
|------------------|-------|--------|-------------|
| Log parsing | 50 | 1 hour | Log processing |
| Snare planning | 100 | 1 hour | Interdiction planning |
| Map data | 200 | 1 hour | Map information |
| Traffic analysis | 50 | 1 hour | Traffic data |

## 📈 Rate Limit Headers

### Response Headers
All API responses include rate limit information:

```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1641234567
X-RateLimit-Window: 3600
```

### Header Descriptions
- **X-RateLimit-Limit**: Maximum requests allowed in the window
- **X-RateLimit-Remaining**: Requests remaining in current window
- **X-RateLimit-Reset**: Unix timestamp when limit resets
- **X-RateLimit-Window**: Window size in seconds

### Example Response
```bash
curl -H "Authorization: Bearer $API_KEY" \
     -I https://api.millsy.dev/api/kills

HTTP/1.1 200 OK
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1641234567
X-RateLimit-Window: 3600
```

## 🚨 Rate Limit Exceeded

### 429 Too Many Requests
When rate limits are exceeded:

```json
{
  "error": "Rate limit exceeded",
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "You have exceeded the rate limit for this endpoint",
  "retry_after": 3600,
  "limit": 1000,
  "remaining": 0,
  "reset_time": "2025-01-09T13:00:00.000Z"
}
```

### Recovery Strategies
1. **Wait for Reset**: Wait until rate limit resets
2. **Implement Backoff**: Use exponential backoff
3. **Optimize Requests**: Reduce unnecessary calls
4. **Batch Operations**: Combine multiple requests

## 📊 Quota Management

### Daily Quotas
- **Free Tier**: 10,000 requests/day
- **Standard Tier**: 100,000 requests/day
- **Premium Tier**: 1,000,000 requests/day

### Quota Headers
```http
X-Quota-Limit: 10000
X-Quota-Remaining: 9999
X-Quota-Reset: 1641321000
```

### Quota Exceeded
```json
{
  "error": "Quota exceeded",
  "code": "QUOTA_EXCEEDED",
  "message": "You have exceeded your daily quota",
  "quota_limit": 10000,
  "quota_remaining": 0,
  "quota_reset": "2025-01-10T00:00:00.000Z"
}
```

## 🔄 Rate Limit Best Practices

### Client-Side Implementation
```javascript
class RateLimitHandler {
  constructor() {
    this.requests = new Map();
  }
  
  async makeRequest(url, options) {
    const key = this.getRateLimitKey(url);
    const now = Date.now();
    
    // Check if we're within rate limits
    if (this.isRateLimited(key, now)) {
      const resetTime = this.getResetTime(key);
      const waitTime = resetTime - now;
      
      console.log(`Rate limited. Waiting ${waitTime}ms`);
      await new Promise(resolve => setTimeout(resolve, waitTime));
    }
    
    // Make the request
    const response = await fetch(url, options);
    
    // Update rate limit info
    this.updateRateLimitInfo(key, response.headers);
    
    return response;
  }
  
  isRateLimited(key, now) {
    const info = this.requests.get(key);
    if (!info) return false;
    
    return info.remaining <= 0 && now < info.resetTime;
  }
  
  updateRateLimitInfo(key, headers) {
    const info = {
      limit: parseInt(headers.get('X-RateLimit-Limit')),
      remaining: parseInt(headers.get('X-RateLimit-Remaining')),
      resetTime: parseInt(headers.get('X-RateLimit-Reset')) * 1000
    };
    
    this.requests.set(key, info);
  }
}
```

### Exponential Backoff
```javascript
async function apiRequestWithBackoff(url, options, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      const response = await fetch(url, options);
      
      if (response.status === 429) {
        const error = await response.json();
        const waitTime = error.retry_after * 1000;
        
        console.log(`Rate limited. Waiting ${waitTime}ms`);
        await new Promise(resolve => setTimeout(resolve, waitTime));
        continue;
      }
      
      return response;
      
    } catch (error) {
      if (i === maxRetries - 1) throw error;
      
      // Exponential backoff
      const waitTime = Math.pow(2, i) * 1000;
      await new Promise(resolve => setTimeout(resolve, waitTime));
    }
  }
}
```

### Request Batching
```javascript
class RequestBatcher {
  constructor(batchSize = 10, batchDelay = 1000) {
    this.batchSize = batchSize;
    this.batchDelay = batchDelay;
    this.queue = [];
    this.timer = null;
  }
  
  addRequest(request) {
    this.queue.push(request);
    
    if (this.queue.length >= this.batchSize) {
      this.processBatch();
    } else if (!this.timer) {
      this.timer = setTimeout(() => this.processBatch(), this.batchDelay);
    }
  }
  
  async processBatch() {
    if (this.timer) {
      clearTimeout(this.timer);
      this.timer = null;
    }
    
    const batch = this.queue.splice(0, this.batchSize);
    await this.executeBatch(batch);
  }
  
  async executeBatch(batch) {
    // Execute batch requests
    const promises = batch.map(request => this.executeRequest(request));
    await Promise.all(promises);
  }
}
```

## 📊 Usage Monitoring

### Check Current Usage
```bash
# Check rate limit status
curl -H "Authorization: Bearer $API_KEY" \
     -I https://api.millsy.dev/api/kills

# Check quota status
curl -H "Authorization: Bearer $API_KEY" \
     https://api.millsy.dev/api/usage
```

### Usage Response
```json
{
  "rate_limits": {
    "all_requests": {
      "limit": 1000,
      "remaining": 999,
      "reset": "2025-01-09T13:00:00.000Z"
    },
    "kill_tracking": {
      "limit": 500,
      "remaining": 499,
      "reset": "2025-01-09T13:00:00.000Z"
    }
  },
  "quotas": {
    "daily": {
      "limit": 10000,
      "remaining": 9999,
      "reset": "2025-01-10T00:00:00.000Z"
    }
  },
  "usage_stats": {
    "requests_today": 1,
    "requests_this_hour": 1,
    "last_request": "2025-01-09T12:00:00.000Z"
  }
}
```

## 🚀 Rate Limit Optimization

### Efficient API Usage
1. **Cache Responses**: Cache frequently accessed data
2. **Batch Requests**: Combine multiple operations
3. **Use Webhooks**: Subscribe to events instead of polling
4. **Optimize Queries**: Use filters and pagination
5. **Implement Caching**: Cache responses locally

### Caching Strategy
```javascript
class ApiCache {
  constructor(ttl = 300000) { // 5 minutes
    this.cache = new Map();
    this.ttl = ttl;
  }
  
  get(key) {
    const item = this.cache.get(key);
    if (!item) return null;
    
    if (Date.now() - item.timestamp > this.ttl) {
      this.cache.delete(key);
      return null;
    }
    
    return item.data;
  }
  
  set(key, data) {
    this.cache.set(key, {
      data,
      timestamp: Date.now()
    });
  }
}
```

### Webhook Usage
Instead of polling for updates, use webhooks:

```javascript
// Subscribe to kill events
const webhook = await fetch('https://api.millsy.dev/api/webhooks', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${API_KEY}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    url: 'https://your-app.com/webhook',
    events: ['kill.created', 'kill.updated'],
    secret: 'your_webhook_secret'
  })
});
```

## 📈 Rate Limit Tiers

### Free Tier
- **Requests**: 1,000/hour, 10,000/day
- **Features**: Basic API access
- **Support**: Community support

### Standard Tier
- **Requests**: 5,000/hour, 100,000/day
- **Features**: Advanced analytics, webhooks
- **Support**: Email support

### Premium Tier
- **Requests**: 10,000/hour, 1,000,000/day
- **Features**: All features, priority support
- **Support**: Priority support, SLA

### Enterprise Tier
- **Requests**: Custom limits
- **Features**: Custom features, dedicated support
- **Support**: Dedicated support, custom SLA

## 🔧 Rate Limit Testing

### Test Rate Limits
```bash
# Test rate limiting
for i in {1..1001}; do
  curl -H "Authorization: Bearer $API_KEY" \
       https://api.millsy.dev/api/kills
  echo "Request $i"
done
```

### Monitor Rate Limit Headers
```bash
# Monitor rate limit headers
curl -H "Authorization: Bearer $API_KEY" \
     -I https://api.millsy.dev/api/kills | grep -i rate
```

## 🆘 Rate Limit Support

### Common Issues
1. **Rate Limit Exceeded**: Implement backoff strategy
2. **Quota Exceeded**: Wait for daily reset or upgrade
3. **Inconsistent Limits**: Check endpoint-specific limits
4. **Header Missing**: Ensure proper authentication

### Getting Help
- **Documentation**: Check this rate limit guide
- **FAQ**: Common rate limit questions
- **Discord**: Real-time help
- **Email**: Technical support

### Upgrade Options
- **Contact Support**: Request higher limits
- **Upgrade Plan**: Move to higher tier
- **Custom Limits**: Enterprise solutions

---

*© 2025 MILLSY.dev | Professional API Service*
