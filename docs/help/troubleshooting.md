# 🆘 API Troubleshooting Guide

> **Fix common problems with the Star Citizen Kill Tracker API**

## Quick Fixes

### **🚨 Common API Issues (Try These First)**

#### **API Not Responding**
- Check if the API server is online at https://api.millsy.dev
- Verify your internet connection
- Try the API health endpoint: `GET https://api.millsy.dev/health`

#### **Authentication Errors**
- Verify your API key is correct
- Check if your API key has expired
- Ensure you're using the correct authentication header format

#### **Rate Limit Exceeded**
- Check your current rate limit status
- Wait for the rate limit window to reset
- Consider implementing request throttling in your application

## Common Problems & Solutions

### **🔑 Authentication Issues**

#### **Problem: "Invalid API Key" Error**

**Symptoms:**
- API returns 401 Unauthorized
- "Invalid API key" error message
- Authentication header not recognized

**Solutions:**

1. **Verify API Key Format**
   ```bash
   # Check your API key format
   curl -H "Authorization: Bearer YOUR_API_KEY" \
     https://api.millsy.dev/health
   ```

2. **Check API Key Validity**
   - Log into the dashboard at https://millsy.dev
   - Go to API Settings
   - Verify your API key is active
   - Generate a new key if needed

3. **Verify Header Format**
   ```bash
   # Correct format
   Authorization: Bearer YOUR_API_KEY
   
   # Incorrect formats
   Authorization: YOUR_API_KEY
   X-API-Key: YOUR_API_KEY
   ```

#### **Problem: "API Key Expired" Error**

**Symptoms:**
- API returns 401 Unauthorized
- "API key expired" error message
- Previously working requests now fail

**Solutions:**

1. **Generate New API Key**
   - Log into the dashboard
   - Go to API Settings
   - Generate a new API key
   - Update your application with the new key

2. **Check Key Expiration**
   - API keys expire after 90 days
   - Set up monitoring for key expiration
   - Implement automatic key renewal if possible

### **🌐 Connection Issues**

#### **Problem: "Connection Timeout" Error**

**Symptoms:**
- Requests take too long to respond
- Timeout errors in your application
- Intermittent connection failures

**Solutions:**

1. **Check API Status**
   ```bash
   # Test basic connectivity
   curl -w "@curl-format.txt" https://api.millsy.dev/health
   ```

2. **Implement Retry Logic**
   ```javascript
   // Example retry implementation
   async function apiCallWithRetry(url, options, maxRetries = 3) {
     for (let i = 0; i < maxRetries; i++) {
       try {
         const response = await fetch(url, options);
         return response;
       } catch (error) {
         if (i === maxRetries - 1) throw error;
         await new Promise(resolve => setTimeout(resolve, 1000 * (i + 1)));
       }
     }
   }
   ```

3. **Check Network Configuration**
   - Verify firewall settings
   - Check proxy configuration
   - Ensure HTTPS is not blocked

#### **Problem: "SSL Certificate" Errors**

**Symptoms:**
- SSL/TLS handshake failures
- Certificate verification errors
- "Untrusted certificate" warnings

**Solutions:**

1. **Update Certificate Store**
   - Update your system's certificate store
   - Ensure your application trusts the API's certificate

2. **Check API Endpoint**
   - Use the correct HTTPS endpoint: `https://api.millsy.dev`
   - Avoid HTTP endpoints in production

### **📊 Data Issues**

#### **Problem: "Invalid Request Format" Error**

**Symptoms:**
- API returns 400 Bad Request
- "Invalid JSON" or "Missing required field" errors
- Request body not accepted

**Solutions:**

1. **Verify Request Format**
   ```bash
   # Check JSON format
   curl -X POST https://api.millsy.dev/kills \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer YOUR_API_KEY" \
     -d '{"player_id": "12345", "victim_id": "67890"}'
   ```

2. **Check Required Fields**
   - Review the API documentation for required fields
   - Ensure all mandatory parameters are included
   - Verify data types match the expected format

3. **Validate JSON Structure**
   ```javascript
   // Example validation
   const requestData = {
     player_id: "12345",
     victim_id: "67890",
     timestamp: new Date().toISOString()
   };
   
   // Ensure all required fields are present
   if (!requestData.player_id || !requestData.victim_id) {
     throw new Error("Missing required fields");
   }
   ```

#### **Problem: "Data Not Found" Error**

**Symptoms:**
- API returns 404 Not Found
- "Player not found" or "Kill record not found" errors
- Empty response data

**Solutions:**

1. **Verify Data Exists**
   - Check if the player exists in the system
   - Verify the kill record ID is correct
   - Ensure the data hasn't been deleted

2. **Check Query Parameters**
   ```bash
   # Verify query parameters
   curl "https://api.millsy.dev/players/12345/kills?limit=10&offset=0" \
     -H "Authorization: Bearer YOUR_API_KEY"
   ```

3. **Handle Empty Results**
   ```javascript
   // Handle empty responses gracefully
   const response = await fetch(url, options);
   const data = await response.json();
   
   if (data.length === 0) {
     console.log("No data found for the given criteria");
     return [];
   }
   ```

### **⚡ Rate Limiting Issues**

#### **Problem: "Rate Limit Exceeded" Error**

**Symptoms:**
- API returns 429 Too Many Requests
- "Rate limit exceeded" error message
- Requests are being throttled

**Solutions:**

1. **Check Rate Limit Status**
   ```bash
   # Check rate limit headers
   curl -I https://api.millsy.dev/health \
     -H "Authorization: Bearer YOUR_API_KEY"
   ```

2. **Implement Rate Limiting**
   ```javascript
   // Example rate limiting implementation
   class RateLimiter {
     constructor(requestsPerMinute) {
       this.requests = [];
       this.limit = requestsPerMinute;
     }
     
     async waitIfNeeded() {
       const now = Date.now();
       this.requests = this.requests.filter(time => now - time < 60000);
       
       if (this.requests.length >= this.limit) {
         const waitTime = 60000 - (now - this.requests[0]);
         await new Promise(resolve => setTimeout(resolve, waitTime));
       }
       
       this.requests.push(now);
     }
   }
   ```

3. **Optimize Request Patterns**
   - Batch multiple requests when possible
   - Use pagination to limit data per request
   - Cache responses to reduce API calls

## Debug Mode

### **Enable Detailed Logging**

```javascript
// Enable debug logging in your application
const DEBUG = true;

function logRequest(url, options, response) {
  if (DEBUG) {
    console.log('Request:', { url, options });
    console.log('Response:', response);
  }
}
```

### **Check Response Headers**

```bash
# Check all response headers
curl -I https://api.millsy.dev/health \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### **Monitor API Usage**

```javascript
// Track API usage and errors
class APIMonitor {
  constructor() {
    this.requests = [];
    this.errors = [];
  }
  
  logRequest(url, status, duration) {
    this.requests.push({ url, status, duration, timestamp: Date.now() });
  }
  
  logError(url, error) {
    this.errors.push({ url, error, timestamp: Date.now() });
  }
}
```

## Getting Help

### **Before Asking for Help**

1. ✅ Check this troubleshooting guide
2. ✅ Verify your API key is valid
3. ✅ Test with a simple request
4. ✅ Check the API status page

### **When Asking for Help**

Include this information:

- **API Endpoint** (the URL you're calling)
- **Request Method** (GET, POST, etc.)
- **Error Message** (copy exact error text)
- **Request Headers** (especially Authorization)
- **Request Body** (if applicable)
- **Response Status Code** (200, 400, 401, etc.)

### **Where to Get Help**

- **Discord Server** - Join our support server for real-time help
- **API Documentation** - Check the complete API reference
- **Status Page** - Check if there are known issues

## Prevention Tips

### **Best Practices**

- **Use HTTPS** - Always use secure connections
- **Handle Errors Gracefully** - Implement proper error handling
- **Implement Retry Logic** - Handle temporary failures
- **Monitor Rate Limits** - Track your API usage
- **Cache Responses** - Reduce unnecessary API calls
- **Validate Data** - Check data before sending requests

### **Regular Maintenance**

- **Rotate API Keys** - Generate new keys before expiration
- **Monitor Usage** - Track your API consumption
- **Update Documentation** - Keep your integration up to date
- **Test Regularly** - Verify your integration works

---

*Most API issues have simple solutions - check your authentication and request format first! 🛠️*