# {% include icon.html name="control-panel" size="20" %} Updated Dashboard - Complete Feature Guide

> **Your unified dashboard now includes all scripts, features, and functionality we've built**

## Overview

The updated dashboard is a comprehensive control center that gives you complete management over your entire infrastructure. It includes all the features we've built:

- **VPS Admin Controls** - System management and script execution
- **Bot Management** - Discord bot control and monitoring
- **Command Management** - Control where commands are available
- **External API Management** - Manage organizations using your API
- **Feature Flag System** - Control feature rollouts
- **System Monitoring** - Real-time system health monitoring
- **Script Execution** - Safe execution of administrative scripts

## Dashboard Tabs

### 1. **Overview Tab** 🌍
**Available to:** Everyone

**Features:**
- System overview with key metrics
- Bot status and statistics
- Quick action buttons
- Recent activity summary

**Key Metrics:**
- Bot online/offline status
- Active Discord servers
- Total users
- System resource usage

### 2. **VPS Tab** {% include icon.html name="monitor" size="16" %}
**Available to:** VPS Admins only

**Features:**
- Systemd service management
- Resource monitoring
- Service status overview
- Quick service controls

**Services Monitored:**
- `dbot2-backend` - Discord bot backend
- `dbot2-dashboard` - Dashboard frontend
- `nginx` - Web server
- `postgresql` - Database

### 3. **Bot Tab** 🤖
**Available to:** VPS Admins, Bot Admins

**Features:**
- Bot status control (start/stop)
- Bot-wide feature flags
- Bot analytics and logs
- Global bot settings

**Controls:**
- Toggle bot online/offline
- Enable/disable bot features
- View bot performance metrics
- Manage bot-wide settings

### 4. **Project Tab** {% include icon.html name="home" size="16" %}
**Available to:** VPS Admins, Project Admins

**Features:**
- Project-specific settings
- User management per project
- Project analytics
- API configuration

**Projects:**
- Discord Bot (`dbot.millsy.dev`)
- API (`api.millsy.dev`)
- Portfolio (`millsy.dev`)

### 5. **Server Tab** {% include icon.html name="home" size="16" %}
**Available to:** Server Owners

**Features:**
- Server-specific bot settings
- Server feature toggles
- Server command management
- Server analytics

### 6. **Commands Tab** {% include icon.html name="cog" size="16" %}
**Available to:** VPS Admins, Server Owners

**Features:**
- Command visibility management
- Command enable/disable
- Command permissions
- Command categories

**Command Categories:**
- **Utility** - Help, ping, etc.
- **Stats** - Statistics and leaderboards
- **Admin** - Owner-only commands
- **Development** - Server-specific dev commands
- **Advanced** - Private/beta features

### 7. **API Tab** 🔌
**Available to:** VPS Admins only

**Features:**
- External API user management
- Organization data sharing controls
- API usage statistics
- Rate limiting management

**API Management:**
- Create/manage organizations
- Set data sharing permissions
- Monitor API usage
- Configure rate limits

### 8. **Scripts Tab** 📜
**Available to:** VPS Admins only

**Features:**
- Execute system scripts
- Script execution history
- Parameter configuration
- Safety warnings

**Available Scripts:**
- **Deploy Discord Bot** - Deploy bot updates
- **Toggle Command** - Enable/disable commands
- **Restart Services** - Restart systemd services
- **Database Backup** - Create database backups

### 9. **Monitor Tab** {% include icon.html name="chart-line" size="16" %}
**Available to:** VPS Admins only

**Features:**
- Real-time system monitoring
- Resource usage charts
- System alerts
- Service health checks

**Monitoring:**
- CPU, Memory, Disk usage
- Service status
- System uptime
- Performance metrics

## Key Features

### Command Visibility Management

**4 Visibility Levels:**
1. **Public** - Available to everyone
2. **Owner Only** - Only you can use
3. **Server Specific** - Available in specific servers
4. **Private** - Available to specific users

**Example Usage:**
```bash
# Make command owner-only
./scripts/toggle-command.sh --command=admin --visibility=owner_only

# Make command available only in your server
./scripts/toggle-command.sh --command=devstats --visibility=server_specific --server_id=YOUR_SERVER_ID

# Make command public
./scripts/toggle-command.sh --command=help --visibility=public
```

### Script Execution

**Available Scripts:**
- **Deploy Bot** - Safe deployment with backups
- **Toggle Commands** - Enable/disable commands
- **Restart Services** - Restart systemd services
- **Database Backup** - Create backups

**Safety Features:**
- Dangerous operation warnings
- Parameter validation
- Execution history
- Error handling

### External API Management

**Organization Features:**
- API key generation
- Data sharing controls
- Rate limiting
- Usage monitoring

**Data Sharing Options:**
- Share kills/deaths
- Share statistics
- Share location/weapon data
- Anonymize data
- PvP/PvE filtering

### Feature Flag System

**Flag Types:**
- **VPS Level** - System-wide controls
- **Bot Level** - Bot-wide settings
- **Project Level** - Per-project features
- **Server Level** - Per-server settings

**Rollout Strategies:**
- Simple on/off toggle
- Percentage-based rollout
- User targeting
- Server targeting

## Usage Examples

### 1. **Deploy New Bot Version**

**Via Dashboard:**
1. Go to Scripts tab
2. Click "Execute" on "Deploy Discord Bot"
3. Set parameters: environment=production, force=false, backup=true
4. Confirm execution
5. Monitor deployment progress

**Via Script:**
```bash
./scripts/deploy-dbot.sh --environment=production --force=false --backup=true
```

### 2. **Toggle Command for Development**

**Via Dashboard:**
1. Go to Commands tab
2. Find the command you want to modify
3. Click settings icon
4. Change visibility to "Server Specific"
5. Select your server ID

**Via Script:**
```bash
./scripts/toggle-command.sh --command=devstats --visibility=server_specific --server_id=YOUR_SERVER_ID
```

### 3. **Create External API User**

**Via Dashboard:**
1. Go to API tab
2. Click "Create Organization"
3. Fill in organization details
4. Configure data sharing settings
5. Set rate limits
6. Generate API key

### 4. **Monitor System Health**

**Via Dashboard:**
1. Go to Monitor tab
2. View real-time resource usage
3. Check service status
4. Review system alerts
5. Take action if needed

### 5. **Manage Feature Flags**

**Via Dashboard:**
1. Go to Bot tab
2. Find Feature Flags section
3. Toggle flags on/off
4. Set rollout percentages
5. Configure targeting

## Security & Permissions

### Role-Based Access Control

**VPS Admin (You):**
- Full system control
- Script execution
- External API management
- Global feature flags
- System monitoring

**Bot Admin:**
- Bot status control
- Bot-wide settings
- Command management
- Bot analytics

**Project Admin:**
- Project-specific features
- User management
- Project analytics
- API configuration

**Server Owner:**
- Server settings
- Server features
- Server commands
- Server analytics

### Permission System

```typescript
const PERMISSIONS = {
  VPS_ADMIN: [
    'vps:system:control',
    'vps:features:manage',
    'vps:admins:grant',
    'vps:emergency:shutdown',
    'vps:scripts:execute',
    'vps:services:manage'
  ],
  BOT_ADMIN: [
    'bot:status:control',
    'bot:features:manage',
    'bot:commands:manage',
    'bot:analytics:view'
  ],
  PROJECT_ADMIN: [
    'project:features:manage',
    'project:users:manage',
    'project:analytics:view'
  ],
  SERVER_ADMIN: [
    'server:settings:manage',
    'server:features:manage',
    'server:commands:manage'
  ]
};
```

## API Integration

### Dashboard API Endpoints

```typescript
// Bot Management
GET    /bot/status                    // Get bot status
PATCH  /bot/toggle                    // Toggle bot online/offline
GET    /bot/servers/:id/settings      // Get server settings
PATCH  /bot/servers/:id/settings      // Update server settings

// Command Management
GET    /admin/commands                // Get all commands
PATCH  /admin/commands/:name          // Update command
PATCH  /admin/commands/:name/visibility // Change command visibility

// VPS Management
GET    /vps/services                  // Get systemd services
POST   /vps/services/:name/restart    // Restart service
GET    /vps/resources                 // Get system resources
GET    /vps/scripts                   // Get executable scripts
POST   /vps/scripts/:id/execute       // Execute script

// Feature Flags
GET    /vps/features                  // Get feature flags
POST   /vps/features                  // Create feature flag
PATCH  /vps/features/:id              // Update feature flag
DELETE /vps/features/:id              // Delete feature flag

// External API
GET    /admin/external-api/users      // Get organizations
POST   /admin/external-api/users      // Create organization
PUT    /admin/external-api/users/:id  // Update organization
GET    /admin/external-api/stats      // Get API usage stats
```

## Best Practices

### 1. **Start Small, Scale Up**
- Test new features as owner-only first
- Use server-specific for broader testing
- Make public when ready

### 2. **Monitor System Health**
- Check resource usage regularly
- Monitor service status
- Review system alerts
- Take action on warnings

### 3. **Use Scripts Safely**
- Read warnings carefully
- Test in staging first
- Keep backups current
- Monitor execution results

### 4. **Manage Permissions**
- Follow principle of least privilege
- Regular permission audits
- Remove unused access
- Document changes

### 5. **Feature Flag Strategy**
- Use flags for all new features
- Start with simple toggles
- Add targeting as needed
- Clean up unused flags

## Troubleshooting

### Common Issues

**Dashboard Not Loading:**
1. Check authentication status
2. Verify API endpoints
3. Check browser console for errors
4. Ensure backend is running

**Scripts Not Executing:**
1. Check script permissions
2. Verify database connection
3. Review script logs
4. Check systemd service status

**Commands Not Working:**
1. Check command visibility
2. Verify bot status
3. Review command permissions
4. Check server settings

**API Issues:**
1. Verify API key validity
2. Check rate limits
3. Review data sharing settings
4. Monitor API usage logs

### Getting Help

1. **Check Logs** - Review system and application logs
2. **Monitor Dashboard** - Use the Monitor tab for system health
3. **Test Scripts** - Use the Scripts tab to test functionality
4. **Review Permissions** - Ensure proper access levels
5. **Check Documentation** - Refer to this guide and other docs

---

## Summary

Your updated dashboard now provides:

✅ **Complete Infrastructure Control** - Manage all services and projects  
✅ **Command Visibility Management** - Control where commands are available  
✅ **Script Execution** - Safe execution of administrative scripts  
✅ **External API Management** - Manage organizations using your API  
✅ **Feature Flag System** - Control feature rollouts  
✅ **System Monitoring** - Real-time health monitoring  
✅ **Role-Based Access** - Secure permissions system  
✅ **Comprehensive Logging** - Track all actions and changes  

The dashboard is your central control center for managing your entire infrastructure, from Discord bot commands to system services, all in one unified interface!
