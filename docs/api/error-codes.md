---
layout: default
title: "Error Codes Reference"
---

# 🚨 Error Codes Reference

> **Comprehensive error codes, troubleshooting, and recovery guide for the Star Citizen Kill Tracker API**

## 📋 Error Response Format

All API errors follow this standardized format:

```json
{
  "error": "Error description",
  "code": "ERROR_CODE",
  "message": "Detailed error message",
  "timestamp": "2025-01-09T12:00:00.000Z",
  "request_id": "req_123456789",
  "documentation": "https://api.millsy.dev/docs/errors/ERROR_CODE"
}
```

## 🔑 Authentication Errors (4xx)

### 401 Unauthorized

#### `INVALID_API_KEY`
**Description**: The provided API key is invalid or malformed
**HTTP Status**: 401
**Recovery**: Generate a new API key from the dashboard

```json
{
  "error": "Invalid API key",
  "code": "INVALID_API_KEY",
  "message": "The provided API key is invalid or malformed"
}
```

#### `API_KEY_EXPIRED`
**Description**: The API key has expired
**HTTP Status**: 401
**Recovery**: Generate a new API key

```json
{
  "error": "API key expired",
  "code": "API_KEY_EXPIRED",
  "message": "The API key has expired and needs to be renewed"
}
```

#### `API_KEY_REVOKED`
**Description**: The API key has been revoked
**HTTP Status**: 401
**Recovery**: Contact support or generate a new key

```json
{
  "error": "API key revoked",
  "code": "API_KEY_REVOKED",
  "message": "The API key has been revoked and is no longer valid"
}
```

#### `MISSING_AUTHORIZATION`
**Description**: No authorization header provided
**HTTP Status**: 401
**Recovery**: Add `Authorization: Bearer YOUR_API_KEY` header

```json
{
  "error": "Missing authorization",
  "code": "MISSING_AUTHORIZATION",
  "message": "Authorization header is required"
}
```

### 403 Forbidden

#### `INSUFFICIENT_PERMISSIONS`
**Description**: API key doesn't have required permissions
**HTTP Status**: 403
**Recovery**: Check API key permissions or upgrade plan

```json
{
  "error": "Insufficient permissions",
  "code": "INSUFFICIENT_PERMISSIONS",
  "message": "Your API key doesn't have permission to access this resource"
}
```

#### `ACCOUNT_SUSPENDED`
**Description**: Account has been suspended
**HTTP Status**: 403
**Recovery**: Contact support

```json
{
  "error": "Account suspended",
  "code": "ACCOUNT_SUSPENDED",
  "message": "Your account has been suspended"
}
```

## 🚦 Rate Limiting Errors (4xx)

### 429 Too Many Requests

#### `RATE_LIMIT_EXCEEDED`
**Description**: Rate limit exceeded
**HTTP Status**: 429
**Recovery**: Wait for rate limit reset or implement backoff

```json
{
  "error": "Rate limit exceeded",
  "code": "RATE_LIMIT_EXCEEDED",
  "message": "You have exceeded the rate limit for this endpoint",
  "retry_after": 3600
}
```

#### `QUOTA_EXCEEDED`
**Description**: Daily quota exceeded
**HTTP Status**: 429
**Recovery**: Wait for quota reset or upgrade plan

```json
{
  "error": "Quota exceeded",
  "code": "QUOTA_EXCEEDED",
  "message": "You have exceeded your daily quota"
}
```

## 📝 Request Errors (4xx)

### 400 Bad Request

#### `INVALID_JSON`
**Description**: Malformed JSON in request body
**HTTP Status**: 400
**Recovery**: Validate JSON format

```json
{
  "error": "Invalid JSON",
  "code": "INVALID_JSON",
  "message": "The request body contains invalid JSON"
}
```

#### `MISSING_REQUIRED_FIELD`
**Description**: Required field is missing
**HTTP Status**: 400
**Recovery**: Include all required fields

```json
{
  "error": "Missing required field",
  "code": "MISSING_REQUIRED_FIELD",
  "message": "The field 'victimId' is required",
  "field": "victimId"
}
```

#### `INVALID_FIELD_VALUE`
**Description**: Field value is invalid
**HTTP Status**: 400
**Recovery**: Check field value format and constraints

```json
{
  "error": "Invalid field value",
  "code": "INVALID_FIELD_VALUE",
  "message": "The field 'isPvP' must be a boolean",
  "field": "isPvP",
  "expected_type": "boolean"
}
```

#### `INVALID_ENDPOINT`
**Description**: Endpoint doesn't exist
**HTTP Status**: 400
**Recovery**: Check endpoint URL

```json
{
  "error": "Invalid endpoint",
  "code": "INVALID_ENDPOINT",
  "message": "The requested endpoint does not exist"
}
```

### 404 Not Found

#### `RESOURCE_NOT_FOUND`
**Description**: Requested resource doesn't exist
**HTTP Status**: 404
**Recovery**: Check resource ID or create resource

```json
{
  "error": "Resource not found",
  "code": "RESOURCE_NOT_FOUND",
  "message": "The requested resource was not found"
}
```

#### `USER_NOT_FOUND`
**Description**: User doesn't exist
**HTTP Status**: 404
**Recovery**: Check user ID or create user

```json
{
  "error": "User not found",
  "code": "USER_NOT_FOUND",
  "message": "The specified user does not exist"
}
```

#### `KILL_NOT_FOUND`
**Description**: Kill record doesn't exist
**HTTP Status**: 404
**Recovery**: Check kill ID

```json
{
  "error": "Kill not found",
  "code": "KILL_NOT_FOUND",
  "message": "The specified kill record does not exist"
}
```

### 409 Conflict

#### `RESOURCE_ALREADY_EXISTS`
**Description**: Resource already exists
**HTTP Status**: 409
**Recovery**: Use existing resource or update

```json
{
  "error": "Resource already exists",
  "code": "RESOURCE_ALREADY_EXISTS",
  "message": "A resource with this identifier already exists"
}
```

#### `DUPLICATE_KILL`
**Description**: Kill record already exists
**HTTP Status**: 409
**Recovery**: Check for duplicate or update existing

```json
{
  "error": "Duplicate kill",
  "code": "DUPLICATE_KILL",
  "message": "A kill record with these details already exists"
}
```

## <i class="fas fa-tools"></i> Validation Errors (4xx)

### 422 Unprocessable Entity

#### `VALIDATION_ERROR`
**Description**: Request data validation failed
**HTTP Status**: 422
**Recovery**: Fix validation errors

```json
{
  "error": "Validation error",
  "code": "VALIDATION_ERROR",
  "message": "Request data validation failed",
  "details": [
    {
      "field": "victimId",
      "message": "victimId must be at least 3 characters long"
    }
  ]
}
```

#### `INVALID_KILL_DATA`
**Description**: Kill data is invalid
**HTTP Status**: 422
**Recovery**: Check kill data format

```json
{
  "error": "Invalid kill data",
  "code": "INVALID_KILL_DATA",
  "message": "The provided kill data is invalid",
  "details": [
    {
      "field": "weapon",
      "message": "Weapon name is required"
    }
  ]
}
```

## <i class="fas fa-globe"></i> Server Errors (5xx)

### 500 Internal Server Error

#### `INTERNAL_SERVER_ERROR`
**Description**: Internal server error
**HTTP Status**: 500
**Recovery**: Retry request or contact support

```json
{
  "error": "Internal server error",
  "code": "INTERNAL_SERVER_ERROR",
  "message": "An unexpected error occurred on the server"
}
```

#### `DATABASE_ERROR`
**Description**: Database operation failed
**HTTP Status**: 500
**Recovery**: Retry request or contact support

```json
{
  "error": "Database error",
  "code": "DATABASE_ERROR",
  "message": "A database operation failed"
}
```

### 502 Bad Gateway

#### `UPSTREAM_ERROR`
**Description**: Upstream service error
**HTTP Status**: 502
**Recovery**: Retry request

```json
{
  "error": "Upstream error",
  "code": "UPSTREAM_ERROR",
  "message": "An upstream service is temporarily unavailable"
}
```

### 503 Service Unavailable

#### `SERVICE_UNAVAILABLE`
**Description**: Service temporarily unavailable
**HTTP Status**: 503
**Recovery**: Retry after delay

```json
{
  "error": "Service unavailable",
  "code": "SERVICE_UNAVAILABLE",
  "message": "The service is temporarily unavailable",
  "retry_after": 300
}
```

#### `MAINTENANCE_MODE`
**Description**: Service in maintenance mode
**HTTP Status**: 503
**Recovery**: Wait for maintenance to complete

```json
{
  "error": "Maintenance mode",
  "code": "MAINTENANCE_MODE",
  "message": "The service is currently in maintenance mode",
  "estimated_duration": "2 hours"
}
```

## 🔄 Recovery Strategies

### Authentication Errors
1. **Check API Key**: Verify key is correct and not expired
2. **Regenerate Key**: Create a new API key if needed
3. **Check Permissions**: Ensure key has required permissions
4. **Contact Support**: If issues persist

### Rate Limiting Errors
1. **Implement Backoff**: Wait before retrying
2. **Check Headers**: Monitor rate limit headers
3. **Optimize Requests**: Reduce unnecessary API calls
4. **Upgrade Plan**: Consider higher rate limits

### Validation Errors
1. **Check Documentation**: Verify required fields
2. **Validate Data**: Ensure data format is correct
3. **Test with Examples**: Use provided examples
4. **Use Validation Tools**: Test data before sending

### Server Errors
1. **Retry Request**: Implement exponential backoff
2. **Check Status**: Monitor API status page
3. **Contact Support**: Report persistent issues
4. **Use Fallbacks**: Implement fallback strategies

## <i class="fas fa-wrench"></i> Error Handling Best Practices

### Client-Side Handling
```javascript
async function handleApiError(response) {
  const error = await response.json();

  switch (error.code) {
    case 'RATE_LIMIT_EXCEEDED':
      // Wait and retry
      await new Promise(resolve =>
        setTimeout(resolve, error.retry_after * 1000)
      );
      break;

    case 'INVALID_API_KEY':
      // Redirect to login or refresh key
      redirectToLogin();
      break;

    case 'VALIDATION_ERROR':
      // Show field-specific errors
      showValidationErrors(error.details);
      break;

    default:
      // Show generic error
      showError(error.message);
  }
}
```

### Retry Logic
```javascript
async function apiRequest(url, options, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      const response = await fetch(url, options);

      if (response.ok) {
        return response;
      }

      if (response.status === 429) {
        const error = await response.json();
        await new Promise(resolve =>
          setTimeout(resolve, error.retry_after * 1000)
        );
        continue;
      }

      if (response.status >= 500) {
        // Retry on server errors
        await new Promise(resolve =>
          setTimeout(resolve, Math.pow(2, i) * 1000)
        );
        continue;
      }

      // Don't retry on client errors
      throw new Error(`API Error: ${response.status}`);

    } catch (error) {
      if (i === maxRetries - 1) throw error;
    }
  }
}
```

## <i class="fas fa-chart-line"></i> Error Monitoring

### Rate Limit Headers
```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 999
X-RateLimit-Reset: 1641234567
```

### Error Tracking
- **Request ID**: Track specific requests
- **Timestamp**: When error occurred
- **Documentation**: Link to error details
- **Support**: Contact information

## 🆘 Getting Help

### Before Reporting
1. **Check Error Code**: Look up the specific error
2. **Verify Request**: Ensure request format is correct
3. **Test with Examples**: Use provided examples
4. **Check Status**: Verify API is operational

### When Reporting
Include:
- **Error Code**: Specific error code
- **Request Details**: URL, method, headers, body
- **Response**: Full error response
- **Steps**: How to reproduce
- **Environment**: Client details

### Support Channels
- **Documentation**: Check this error reference
- **FAQ**: Common error solutions
- **Discord**: Real-time help
- **Email**: Technical support

