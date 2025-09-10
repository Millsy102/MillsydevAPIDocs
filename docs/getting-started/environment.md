# API Configuration Guide

> **Configure your Star Citizen Kill Tracker API integration**

## Getting Started

The Star Citizen Kill Tracker API is a cloud-based service that doesn't require local installation or configuration. Simply get your API key and start making requests!

## Step 1: Get Your API Key

### **1. Create Account**
1. Go to https://millsy.dev
2. Click "Sign Up" or "Login with Discord"
3. Complete the registration process

### **2. Generate API Key**
1. Log into your dashboard
2. Navigate to "API Settings"
3. Click "Generate New API Key"
4. Copy your API key (keep it secure!)

### **3. Test Your API Key**
```bash
# Test your API key
curl -H "Authorization: Bearer YOUR_API_KEY" \
  https://api.millsy.dev/health
```

## Step 2: Configure Your Application

### **Environment Variables**
Store your API key securely in your application:

```bash
# .env file (for development)
SCKILLTRACKER_API_KEY=your_api_key_here
SCKILLTRACKER_BASE_URL=https://api.millsy.dev
```

### **JavaScript/TypeScript**
```javascript
const config = {
  apiKey: process.env.SCKILLTRACKER_API_KEY,
  baseURL: process.env.SCKILLTRACKER_BASE_URL || 'https://api.millsy.dev'
};
```

### **Python**
```python
import os

config = {
    'api_key': os.getenv('SCKILLTRACKER_API_KEY'),
    'base_url': os.getenv('SCKILLTRACKER_BASE_URL', 'https://api.millsy.dev')
}
```

## Step 3: Make Your First Request

### **Get Your Statistics**
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
  https://api.millsy.dev/api/v1/users/me/stats
```

### **Create a Kill Record**
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

## API Endpoints

### **Base URL**
- **Production**: `https://api.millsy.dev`
- **API Version**: `/api/v1`

### **Authentication**
All requests require an API key in the Authorization header:
```
Authorization: Bearer YOUR_API_KEY
```

### **Common Endpoints**
- `GET /health` - API health check
- `GET /api/v1/users/me/stats` - Your statistics
- `GET /api/v1/kills` - List kills
- `POST /api/v1/kills` - Create kill record
- `GET /api/v1/leaderboards` - Get leaderboards

## Rate Limits

### **Free Tier**
- **Requests**: 1,000 per hour
- **Burst**: 100 requests per minute
- **Webhooks**: 10 webhooks per hour

### **Rate Limit Headers**
```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1640995200
```

## Error Handling

### **Common Error Codes**
- `400` - Bad Request (invalid data)
- `401` - Unauthorized (invalid API key)
- `403` - Forbidden (insufficient permissions)
- `404` - Not Found (resource doesn't exist)
- `429` - Too Many Requests (rate limit exceeded)
- `500` - Internal Server Error

### **Error Response Format**
```json
{
  "error": {
    "code": "INVALID_API_KEY",
    "message": "The provided API key is invalid",
    "details": "Please check your API key and try again"
  }
}
```

## Security Best Practices

### **API Key Security**
- ✅ Store API keys in environment variables
- ✅ Never commit API keys to version control
- ✅ Rotate API keys regularly
- ✅ Use different keys for different environments

### **Request Security**
- ✅ Always use HTTPS
- ✅ Validate input data
- ✅ Implement proper error handling
- ✅ Monitor your API usage

## Testing Your Integration

### **Health Check**
```bash
curl https://api.millsy.dev/health
```

### **Authentication Test**
```bash
curl -H "Authorization: Bearer YOUR_API_KEY" \
  https://api.millsy.dev/api/v1/users/me
```

### **Full Integration Test**
```bash
# 1. Get your stats
curl -H "Authorization: Bearer YOUR_API_KEY" \
  https://api.millsy.dev/api/v1/users/me/stats

# 2. Create a test kill
curl -X POST \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"victimId": "test", "weapon": "Test Weapon"}' \
  https://api.millsy.dev/api/v1/kills

# 3. Get recent kills
curl -H "Authorization: Bearer YOUR_API_KEY" \
  https://api.millsy.dev/api/v1/kills?limit=5
```

## Next Steps

### **Explore the API**
- [API Endpoints](./api/endpoints.md) - Complete endpoint reference
- [SDK Examples](./api/sdk-examples.md) - Code examples and SDKs
- [Rate Limits](./api/rate-limits.md) - Usage limits and quotas

### **Build Your Integration**
- [Discord Bot Integration](./advanced/bot-integration.md)
- [Web Dashboard Integration](./usage/dashboard.md)
- [Webhook Integration](./api/webhooks.md)

### **Get Help**
- [Troubleshooting](./help/troubleshooting.md) - Common issues and solutions
- [FAQ](./help/faq.md) - Frequently asked questions
- Join our Discord support server

---

*Your API integration is ready! Start building amazing Star Citizen applications! 🚀*