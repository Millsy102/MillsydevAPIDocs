# 🤖 Bot-Dashboard Integration Guide


> **Connect your Discord bot to the web dashboard for full control**

## What This Does


This integration lets you:

- 🎛️ **Control your bot** from the web dashboard

- 📊 **See real-time stats** and bot status

- ⚙️ **Configure server settings** without touching code

- 💬 **Send messages** to Discord channels

- 🔄 **Get live updates** when things change


## How It Works


```text

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Discord Bot   │◄──►│  Web Dashboard  │◄──►│   Backend API   │
│   (discord.js)  │    │    (React)      │    │   (Express)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────┴─────────────┐
                    │     WebSocket Server      │
                    │   (Real-time Updates)     │
                    └───────────────────────────┘

```text

## Key Features


### **1. Real-Time Bot Status**

- ✅ See if bot is online/offline

- 📊 View server count, user count, uptime

- 🎛️ Start/stop bot from dashboard


### **2. Server Management**

- ⚙️ Configure bot settings per server

- 🔧 Enable/disable features

- 📝 Set custom commands and cooldowns


### **3. Live Communication**

- 💬 Send messages to Discord channels

- 📢 Broadcast announcements

- 🔔 Get notifications when bot joins/leaves servers


### **4. WebSocket Updates**

- ⚡ Instant updates when settings change

- 🔄 Real-time guild join/leave events

- 📊 Live statistics updates


## Setup Guide


### **1. Backend Integration**


The backend already has everything set up:

```typescript

// BotIntegrationService handles all bot-dashboard communication
import { BotIntegrationService } from './services/BotIntegrationService';

// WebSocket server for real-time updates
import { WebSocketManager } from './utils/websocket';

```text

### **2. Frontend Integration**


The dashboard has hooks for everything:

```typescript

// Get bot status and control it
const { status, statistics, toggleBotStatus } = useBotStatus();

// Manage server settings
const { settings, updateSettings } = useServerBotSettings(serverId);

// Send messages to Discord
const { sendMessage } = useServerInfo(serverId);

```text

### **3. WebSocket Connection**


Real-time updates work automatically:

```typescript

// Dashboard connects to WebSocket
const { isConnected, lastMessage } = useWebSocket();

// Get live guild events
const guildEvents = useGuildEvents();

```text

## Usage Examples


### **Admin Dashboard**


```typescript

// Check bot status
const { status, statistics } = useBotStatus();

// Start/stop bot
await toggleBotStatus(true);  // Start bot
await toggleBotStatus(false); // Stop bot

// View server statistics
console.log(statistics);
// {
//   serverCount: 5,
//   userCount: 150,
//   totalKills: 1250,
//   uptime: "2 days, 5 hours"
// }

```text

### **Server Owner Dashboard**


```typescript

// Get server settings
const { settings, updateSettings } = useServerBotSettings(serverId);

// Update bot settings
await updateSettings({
  prefix: '!',
  language: 'en',
  features: {
    killTracker: true,
    leaderboard: true,
    customCommands: false
  }
});

// Configure commands
const { commands, updateCommand } = useServerCommands(serverId);

await updateCommand('stats', {
  enabled: true,
  cooldown: 5,
  permissions: ['everyone']
});

// Send message to Discord
const { sendMessage } = useServerInfo(serverId);
await sendMessage({
  channelId: '123456789',
  message: 'Hello from dashboard!',
  embed: {
    title: 'Dashboard Update',
    description: 'Settings have been updated',
    color: '#00ff00'
  }
});

```text

## API Endpoints


### **Bot Control**

- `GET /bot/status` - Get bot status and statistics

- `PATCH /bot/toggle` - Start/stop bot (admin only)

- `GET /bot/statistics` - Get detailed statistics


### **Server Management**

- `GET /bot/servers/:serverId/settings` - Get server settings

- `PATCH /bot/servers/:serverId/settings` - Update server settings

- `GET /bot/servers/:serverId/commands` - Get server commands

- `PATCH /bot/servers/:serverId/commands/:commandId` - Update command


### **Communication**

- `POST /bot/servers/:serverId/send-message` - Send message to channel

- `POST /bot/broadcast` - Broadcast to all servers (admin only)


## WebSocket Events


### **Bot Events**

- `bot_status_update` - Bot online/offline status changed

- `guild_join` - Bot joined a new server

- `guild_leave` - Bot left a server


### **Settings Events**

- `server_settings_update` - Server settings changed

- `command_update` - Command settings changed

- `feature_toggle` - Feature enabled/disabled


## Security


### **Authentication**

- 🔐 All API endpoints require JWT authentication

- 👑 Role-based access control (admin, server_owner, user)

- 🏠 Server owners can only manage their own servers


### **Rate Limiting**

- ⏱️ API endpoints protected by rate limiting

- 🔌 WebSocket connection limits

- 💬 Message sending cooldowns


## Testing the Integration


### **1. Start the Backend**

```bash

cd backend
npm run dev

```text

### **2. Start the Dashboard**

```bash

cd dashboard
npm run dev

```text

### **3. Test Bot Control**

1. Login to dashboard as admin
2. Go to **Admin Dashboard**
3. Check **Bot Status** section
4. Try toggling bot online/offline

### **4. Test Server Management**

1. Login as server owner
2. Go to **Server Owner Dashboard**
3. Select a server you own
4. Try updating bot settings
5. Test sending a message to Discord

### **5. Test Real-Time Updates**

1. Make changes in dashboard
2. Watch for instant updates
3. Check Discord for changes
4. Monitor WebSocket connection status

## Troubleshooting


### **Common Issues**


## WebSocket Connection Failed

- Check `REACT_APP_WS_URL` environment variable

- Verify backend WebSocket server is running

- Check firewall/network settings


## Bot Status Not Updating

- Verify bot is properly initialized

- Check BotIntegrationService event listeners

- Ensure WebSocket connection is active


## Server Settings Not Saving

- Check database connection

- Verify user has server owner permissions

- Check API endpoint authentication


## Messages Not Sending

- Verify bot has permissions in target channel

- Check channel ID is correct

- Ensure bot is online and connected


### **Debug Mode**

Enable detailed logging:

```env

NODE_ENV=development
DEBUG=bot-integration:*

```text

## Future Enhancements


### **Planned Features**

- 🎨 **Command Creation** - Create custom commands from dashboard

- 📊 **Analytics Dashboard** - Detailed bot usage statistics

- 🔄 **Multi-Server Management** - Bulk operations across servers

- 📝 **Bot Logs** - View bot logs in real-time

- 🔌 **Plugin System** - Install/configure bot plugins


### **API Extensions**

- 🪝 **Webhook Integration** - Discord webhook management

- 👥 **Role Management** - Automated role assignment

- 🛡️ **Moderation Tools** - Ban/kick/mute from dashboard

- 🎨 **Custom Embeds** - Rich embed builder

- ⏰ **Scheduled Messages** - Message scheduling system


## Conclusion


The bot-dashboard integration provides a comprehensive solution for managing Discord bots through a web interface. With real-time updates, secure authentication, and intuitive controls, you can efficiently manage your bot configurations and monitor bot activity.

The system is designed to be extensible, allowing for future enhancements while maintaining security and performance standards.

---

*Control your bot like a pro! 🤖*
