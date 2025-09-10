# 🎮 Command Visibility Management

> **Complete guide to controlling where commands go and keeping commands just for yourself**

## Overview

Your command system now supports **4 levels of visibility** that let you control exactly where commands are available and who can use them:

1. **Public** - Available to everyone
2. **Owner Only** - Only you can use these commands
3. **Server Specific** - Available only in specific Discord servers
4. **Private** - Available to specific users only

## Command Visibility Levels

### 1. **Public Commands** 🌍
Available to everyone in all servers where your bot is present.

**Examples:**
- `/help` - Show help information
- `/ping` - Check bot latency
- `/stats` - Show server statistics
- `/leaderboard` - Show kill leaderboard

### 2. **Owner Only Commands** 🔒
Only you (the bot owner) can use these commands. Perfect for admin functions.

**Examples:**
- `/admin` - Admin panel access
- `/deploy` - Deploy bot updates
- `/system` - System management
- `/debug` - Debug information
- `/emergency` - Emergency controls

### 3. **Server Specific Commands** 🏠
Available only in specific Discord servers. Great for development and testing.

**Examples:**
- `/devstats` - Development statistics (only in your server)
- `/test` - Test command for development
- `/dev` - Development tools

### 4. **Private Commands** 👥
Available to specific users only. Can be used for beta testing or special access.

**Examples:**
- `/advanced` - Advanced features for specific users
- `/beta` - Beta features for testers

## How to Use

### Via Dashboard

1. **Navigate to Command Management**
   - Go to your unified dashboard
   - Click on "Bot Admin" or "VPS Admin" tab
   - Find "Command Management" section

2. **Change Command Visibility**
   - Find the command you want to modify
   - Click the settings icon (⚙️)
   - Select new visibility level
   - Confirm the change

3. **Toggle Commands On/Off**
   - Use the toggle switch to enable/disable commands
   - Changes take effect immediately

### Via Scripts (Command Line)

#### Make a Command Owner-Only
```bash
./scripts/toggle-command.sh --command=admin --visibility=owner_only
```

#### Make a Command Available Only in Your Server
```bash
./scripts/toggle-command.sh --command=devstats --visibility=server_specific --server_id=YOUR_SERVER_ID
```

#### Make a Command Public
```bash
./scripts/toggle-command.sh --command=help --visibility=public
```

#### Make a Command Private (for specific users)
```bash
./scripts/toggle-command.sh --command=advanced --visibility=private
```

#### Toggle Command On/Off for Specific Server
```bash
./scripts/toggle-command.sh --command=stats --enabled=false --server_id=123456789
```

## Real-World Examples

### Example 1: Development Workflow

You're developing a new feature and want to test it only in your server:

```bash
# Create a new command for testing
./scripts/toggle-command.sh --command=newfeature --visibility=server_specific --server_id=YOUR_SERVER_ID

# Test the command in your server
# When ready, make it public
./scripts/toggle-command.sh --command=newfeature --visibility=public

# Or keep it private for beta testers
./scripts/toggle-command.sh --command=newfeature --visibility=private
```

### Example 2: Admin Commands

Keep sensitive admin commands only for yourself:

```bash
# Make admin commands owner-only
./scripts/toggle-command.sh --command=admin --visibility=owner_only
./scripts/toggle-command.sh --command=deploy --visibility=owner_only
./scripts/toggle-command.sh --command=system --visibility=owner_only
./scripts/toggle-command.sh --command=debug --visibility=owner_only
```

### Example 3: Server-Specific Features

Enable special features only for specific servers:

```bash
# Enable advanced features for your main server
./scripts/toggle-command.sh --command=advanced --visibility=server_specific --server_id=YOUR_MAIN_SERVER_ID

# Enable beta features for testing server
./scripts/toggle-command.sh --command=beta --visibility=server_specific --server_id=YOUR_TEST_SERVER_ID
```

### Example 4: Gradual Rollout

Roll out a new command gradually:

```bash
# Start with owner-only for testing
./scripts/toggle-command.sh --command=newcommand --visibility=owner_only

# Test thoroughly, then make it server-specific
./scripts/toggle-command.sh --command=newcommand --visibility=server_specific --server_id=YOUR_SERVER_ID

# When confident, make it public
./scripts/toggle-command.sh --command=newcommand --visibility=public
```

## Command Categories

Commands are organized into categories for better management:

### **Utility Commands** (Public)
- `/help` - Show help information
- `/ping` - Check bot latency

### **Stats Commands** (Public)
- `/stats` - Show server statistics
- `/leaderboard` - Show kill leaderboard
- `/ship` - Get ship information
- `/player` - Get player information
- `/location` - Get location information

### **Admin Commands** (Owner Only)
- `/admin` - Admin panel access
- `/deploy` - Deploy bot updates
- `/system` - System management commands
- `/debug` - Debug information
- `/emergency` - Emergency controls
- `/feature` - Feature flag management

### **Development Commands** (Server Specific)
- `/devstats` - Development statistics
- `/test` - Test command for development
- `/dev` - Development tools

### **Advanced Commands** (Private/Server Specific)
- `/advanced` - Advanced features
- `/beta` - Beta features

## Permission System

### Who Can Manage Commands

1. **You (VPS Admin)** - Can manage all commands
2. **Bot Admins** - Can manage bot-level commands
3. **Server Owners** - Can manage commands for their servers only

### Permission Checks

The system automatically checks:
- **User Role** - Admin, server owner, regular user
- **Server Membership** - Is user in the target server?
- **Owner Status** - Is user the bot owner?
- **Command Visibility** - What visibility level is set?

## Database Schema

Commands are stored in the `command_visibility` table:

```sql
CREATE TABLE command_visibility (
  id VARCHAR(255) PRIMARY KEY,
  command_name VARCHAR(100) UNIQUE NOT NULL,
  visibility VARCHAR(20) NOT NULL, -- 'public', 'private', 'server_specific', 'owner_only'
  target_servers JSONB, -- Array of Discord server IDs
  allowed_users JSONB, -- Array of Discord user IDs
  owner_only BOOLEAN DEFAULT false,
  enabled BOOLEAN DEFAULT true,
  description TEXT,
  category VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

## API Endpoints

### Get Commands
```typescript
GET /admin/commands
Authorization: Bearer <your-token>

Response:
{
  "success": true,
  "data": [
    {
      "commandName": "help",
      "visibility": "public",
      "enabled": true,
      "description": "Show help information",
      "category": "utility"
    }
  ]
}
```

### Update Command Visibility
```typescript
PATCH /admin/commands/:commandName/visibility
Authorization: Bearer <your-token>
Content-Type: application/json

{
  "visibility": "owner_only",
  "targetServers": [],
  "enabled": true
}
```

### Toggle Command
```typescript
PATCH /admin/commands/:commandName
Authorization: Bearer <your-token>
Content-Type: application/json

{
  "enabled": false
}
```

## Best Practices

### 1. **Start Private, Go Public**
- Always test new commands as owner-only first
- Then make them server-specific for broader testing
- Finally make them public when ready

### 2. **Use Categories**
- Group related commands together
- Makes management easier
- Clearer organization

### 3. **Document Commands**
- Always provide clear descriptions
- Explain what each command does
- Note any special requirements

### 4. **Monitor Usage**
- Check command usage statistics
- Remove unused commands
- Update descriptions as needed

### 5. **Security First**
- Keep admin commands owner-only
- Be careful with server-specific commands
- Regularly review permissions

## Troubleshooting

### Command Not Working

1. **Check Visibility**
   ```bash
   # Check current visibility
   psql $DATABASE_URL -c "SELECT * FROM command_visibility WHERE command_name = 'your_command';"
   ```

2. **Check if Enabled**
   ```bash
   # Enable the command
   ./scripts/toggle-command.sh --command=your_command --enabled=true
   ```

3. **Check Bot Status**
   ```bash
   # Restart bot to apply changes
   systemctl restart dbot2-backend
   ```

### Permission Denied

1. **Check User Role**
   - Make sure you're the bot owner
   - Verify your Discord UID is set correctly

2. **Check Server ID**
   - Verify the server ID is correct
   - Make sure the bot is in that server

### Script Errors

1. **Check Database Connection**
   ```bash
   echo $DATABASE_URL
   ```

2. **Check Script Permissions**
   ```bash
   chmod +x scripts/toggle-command.sh
   ```

3. **Check Bot Service**
   ```bash
   systemctl status dbot2-backend
   ```

## Advanced Usage

### Custom Command Creation

1. **Add to Database**
   ```sql
   INSERT INTO command_visibility (
     id, command_name, visibility, enabled, description, category
   ) VALUES (
     'cmd_mycommand', 'mycommand', 'owner_only', true, 
     'My custom command', 'custom'
   );
   ```

2. **Set Visibility**
   ```bash
   ./scripts/toggle-command.sh --command=mycommand --visibility=owner_only
   ```

### Bulk Operations

```bash
# Make all admin commands owner-only
for cmd in admin deploy system debug emergency feature; do
  ./scripts/toggle-command.sh --command=$cmd --visibility=owner_only
done

# Enable all public commands
for cmd in help ping stats leaderboard ship player location; do
  ./scripts/toggle-command.sh --command=$cmd --enabled=true
done
```

### Integration with CI/CD

```bash
# In your deployment script
./scripts/toggle-command.sh --command=newfeature --visibility=server_specific --server_id=$TEST_SERVER_ID

# Run tests...

# If tests pass, make public
./scripts/toggle-command.sh --command=newfeature --visibility=public
```

---

## Summary

Your command visibility system gives you complete control over:

✅ **Where commands are available** - Public, private, server-specific, or owner-only  
✅ **Who can use commands** - Based on roles and permissions  
✅ **When commands are active** - Enable/disable as needed  
✅ **How to manage them** - Via dashboard or command line scripts  
✅ **Security and privacy** - Keep sensitive commands private  
✅ **Development workflow** - Test commands safely before public release  

This system ensures you can keep certain commands just for yourself while making others available to the right people at the right time!
