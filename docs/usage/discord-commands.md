# <i class="fas fa-robot"></i> Discord Commands Guide


> **All the commands your Star Citizen Kill Tracker bot can do**

## Basic Commands


### **Help Commands**

```text

/help

```text

**What it does:** Shows all available commands  
**Who can use:** Everyone  
**Example:** `/help`

```text

/ping

```text

**What it does:** Tests if the bot is responding  
**Who can use:** Everyone  
**Example:** `/ping` → "Pong! 🏓"

## Kill Tracking Commands


### **Personal Stats**

```text

/mykills

```text

**What it does:** Shows your personal kill statistics  
**Who can use:** Everyone  
**Example:** `/mykills`

## Shows:

- Total kills

- Total deaths

- Kill/Death ratio

- Recent kills

- Favorite weapons


### **Server Stats**

```text

/stats

```text

**What it does:** Shows server-wide kill statistics  
**Who can use:** Everyone  
**Example:** `/stats`

## Shows:

- Total server kills

- Most active players

- Popular weapons

- Kill trends


### **Leaderboard**

```text

/leaderboard

```text

**What it does:** Shows the top players by kills  
**Who can use:** Everyone  
**Example:** `/leaderboard`

## Options:

- `/leaderboard kills` - Top killers

- `/leaderboard kd` - Best K/D ratio

- `/leaderboard recent` - Most recent activity


## Server Management Commands


### **Server Settings** (Server Admins Only)

```text

/server settings

```text

**What it does:** Shows current server configuration  
**Who can use:** Server Admins  
**Example:** `/server settings`

## Shows:

- Bot prefix

- Enabled features

- Notification settings

- Channel configurations


### **Toggle Features** (Server Admins Only)

```text

/server toggle <feature>

```text

**What it does:** Enable/disable specific features  
**Who can use:** Server Admins  

## Examples:

- `/server toggle killtracker` - Enable/disable kill tracking

- `/server toggle leaderboard` - Enable/disable leaderboards

- `/server toggle notifications` - Enable/disable notifications


### **Set Channels** (Server Admins Only)

```text

/server channel <type> <channel>

```text

**What it does:** Set specific channels for bot features  
**Who can use:** Server Admins  

## Examples:

- `/server channel kills #kill-feed` - Set kill notifications channel

- `/server channel leaderboard #stats` - Set leaderboard channel

- `/server channel logs #bot-logs` - Set bot logs channel


## Privacy Commands


### **Privacy Settings**

```text

/privacy

```text

**What it does:** Shows your current privacy settings  
**Who can use:** Everyone  
**Example:** `/privacy`

## Shows:

- Leaderboard visibility

- Data sharing preferences

- Notification settings


### **Set Privacy Level**

```text

/privacy set <level>

```text

**What it does:** Change your privacy level  
**Who can use:** Everyone  

## Options:

- `/privacy set public` - Visible on all leaderboards

- `/privacy set private` - Only visible to server admins

- `/privacy set friends` - Visible to friends and server members


### **Opt Out/In**

```text

/privacy optout
/privacy optin

```text

**What it does:** Opt out of or back into kill tracking  
**Who can use:** Everyone  

## Examples:

- `/privacy optout` - Stop tracking your kills

- `/privacy optin` - Start tracking your kills again


## Utility Commands


### **Bot Info**

```text

/botinfo

```text

**What it does:** Shows bot information and statistics  
**Who can use:** Everyone  
**Example:** `/botinfo`

## Shows:

- Bot version

- Uptime

- Server count

- Total users


### **Invite Bot**

```text

/invite

```text

**What it does:** Get an invite link for the bot  
**Who can use:** Everyone  
**Example:** `/invite`

### **Support**

```text

/support

```text

**What it does:** Get help and support information  
**Who can use:** Everyone  
**Example:** `/support`

## Shows:

- Support Discord server

- GitHub repository

- Documentation links

- Contact information


## Admin Commands (Bot Owner Only)


### **Global Settings**

```text

/admin settings

```text

**What it does:** Shows global bot settings  
**Who can use:** Bot Owner  
**Example:** `/admin settings`

### **Server Management**

```text

/admin servers

```text

**What it does:** Shows all servers the bot is in  
**Who can use:** Bot Owner  
**Example:** `/admin servers`

### **Bot Control**

```text

/admin restart
/admin stop
/admin start

```text

**What it does:** Control the bot (restart/stop/start)  
**Who can use:** Bot Owner  

## Examples:

- `/admin restart` - Restart the bot

- `/admin stop` - Stop the bot

- `/admin start` - Start the bot


### **Broadcast Message**

```text

/admin broadcast <message>

```text

**What it does:** Send a message to all servers  
**Who can use:** Bot Owner  
**Example:** `/admin broadcast Server maintenance in 10 minutes!`

## Command Permissions


### **Permission Levels**

- **Everyone** - All server members can use

- **Server Admins** - Server administrators and moderators

- **Bot Owner** - Only the bot owner can use


### **How Permissions Work**

- Commands check your role in the server

- Some commands require specific Discord permissions

- Bot owner commands work across all servers


## Command Examples


### **Basic Usage**

```text

## Check if bot is working

/ping

## See your stats

/mykills

## Check server stats

/stats

## See leaderboard

/leaderboard

```text

### **Server Admin Usage**

```text

## Configure server

/server settings
/server toggle killtracker
/server channel kills #kill-feed

## Check privacy settings

/privacy

```text

### **Bot Owner Usage**

```text

## Manage bot

/admin settings
/admin servers
/admin broadcast Hello everyone!

```text

## Troubleshooting Commands


### **If Commands Don't Work**


## Check Bot Permissions:

- Make sure bot has "Use Slash Commands" permission

- Verify bot is online and responding


## Check Your Permissions:

- Some commands require admin/moderator roles

- Bot owner commands only work for the bot owner


## Try These:

```text

/ping          # Test basic connectivity
/help          # See all available commands
/botinfo       # Check bot status

```text

### **Common Issues**


## "Command not found"

- Bot might be offline

- Check bot permissions in server

- Try `/ping` to test connectivity


## "You don't have permission"

- Check your role in the server

- Some commands require admin/moderator roles

- Bot owner commands only work for bot owner


## "Bot is not responding"

- Check if bot is online

- Verify bot has proper permissions

- Try restarting the bot


## Advanced Usage


### **Custom Commands** (Coming Soon)

```text

/custom create <name> <response>
/custom delete <name>
/custom list

```text

### **Webhooks** (Coming Soon)

```text

/webhook create <name> <url>
/webhook test <name>
/webhook delete <name>

```text

### **Analytics** (Coming Soon)

```text

/analytics kills
/analytics weapons
/analytics trends

```text

## Tips & Tricks


### **Pro Tips**

- Use `/privacy` to control who sees your stats

- Set up dedicated channels for different features

- Use `/server settings` to optimize bot performance

- Check `/botinfo` regularly to monitor bot health


### **Best Practices**

- Don't spam commands (respect cooldowns)

- Use appropriate channels for different features

- Keep privacy settings updated

- Report bugs using `/support`


---

*Master these commands and become a kill tracking pro! <i class="fas fa-crosshairs"></i>*
