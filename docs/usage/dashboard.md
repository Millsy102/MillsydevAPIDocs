# 🌐 Web Dashboard Guide


> **Master the Star Citizen Kill Tracker web dashboard**

## What is the Dashboard

The web dashboard is your **control center** for the Star Citizen Kill Tracker. It's a website where you can:

- 📊 **View your kill statistics** and leaderboards

- ⚙️ **Configure bot settings** for your servers

- 👥 **Manage users** and permissions

- 📈 **See analytics** and trends

- 🔧 **Control the bot** remotely


## Getting Started


### **1. Access the Dashboard**

- **Local Development**: http://localhost:3000

- **Production**: https://dbot.millsy.dev (or your custom domain)


### **2. Login with Discord**

1. Click **"Login with Discord"**
2. Authorize the application
3. You'll be redirected to the dashboard

### **3. Choose Your Role**

The dashboard adapts based on your role:

- **👑 Bot Owner** - Full system access

- **🛡️ Server Admin** - Server-specific management

- **👤 User** - Personal stats and settings


## Dashboard Sections


### **🏠 Dashboard (Home)**

**What you see:** Overview of your statistics and recent activity

## Features:

- 📊 **Personal Stats** - Your kills, deaths, K/D ratio

- 🏆 **Recent Kills** - Latest kill events

- 📈 **Server Stats** - Server-wide statistics

- 🔔 **Notifications** - Recent bot events


## Example:

```text

Your Stats:
├── Total Kills: 127
├── Total Deaths: 89
├── K/D Ratio: 1.43
└── Favorite Weapon: Laser Cannon

Recent Activity:
├── 2 minutes ago: Killed "EnemyPlayer" with "Laser"
├── 15 minutes ago: Killed "Pirate" with "Missile"
└── 1 hour ago: Died to "Environmental Hazard"

```text

### **🎮 Servers**

**What you see:** Manage your Discord servers and bot settings

## Features:

- 📋 **Server List** - All servers where bot is active

- ⚙️ **Server Settings** - Configure bot per server

- 👥 **User Management** - Manage server members

- 📊 **Server Analytics** - Server-specific statistics


## Server Settings:

```text

Bot Configuration:
├── Prefix: "!"
├── Language: English
├── Timezone: UTC
└── Features:
    ├── Kill Tracker: ✅ Enabled
    ├── Leaderboard: ✅ Enabled
    ├── Notifications: ✅ Enabled
    └── Custom Commands: ❌ Disabled

Channels:
├── Kill Feed: #kill-feed
├── Leaderboard: #stats
├── Bot Logs: #bot-logs
└── General: #general

```text

### **⚔️ Kills**

**What you see:** Detailed kill history and statistics

## Features:

- 📋 **Kill History** - All your recorded kills

- 🔍 **Search & Filter** - Find specific kills

- 📊 **Kill Analytics** - Detailed statistics

- 🏆 **Achievements** - Unlock badges and rewards


## Kill Details:

```text

Kill #127
├── Victim: "EnemyPlayer"
├── Weapon: "Laser Cannon"
├── Location: "Stanton System"
├── Time: 2024-01-15 14:30:25
├── Server: "Star Citizen Server #1"
└── Notes: "Clean kill, no assists"

```text

### **👥 Users**

**What you see:** Manage users and their permissions

## Features:

- 📋 **User List** - All registered users

- 🔍 **User Search** - Find specific users

- ⚙️ **Permission Management** - Set user roles

- 📊 **User Analytics** - User activity statistics


### **⚙️ Settings**

**What you see:** Configure your personal preferences

## Features:

- 🔒 **Privacy Settings** - Control data visibility

- 🔔 **Notification Preferences** - Set notification types

- 🎨 **Theme Settings** - Customize appearance

- 🔧 **Account Settings** - Manage your account


## Privacy Options:

```text

Data Visibility:
├── Leaderboard: Public
├── Kill History: Friends Only
├── Statistics: Private
└── Location Data: Hidden

Notifications:
├── Kill Events: ✅ Enabled
├── Death Events: ✅ Enabled
├── Server Updates: ❌ Disabled
└── Bot Maintenance: ✅ Enabled

```text

## Admin Features (Bot Owner)


### **👑 Admin Dashboard**

**What you see:** System-wide management and monitoring

## Features:

- 📊 **System Statistics** - Overall bot performance

- 🖥️ **Server Monitoring** - All connected servers

- 👥 **User Management** - Global user administration

- 🔧 **Bot Control** - Start/stop/restart bot

- 📈 **Analytics** - Detailed system analytics


## System Overview:

```text

Bot Status: Online 🟢
├── Uptime: 5 days, 12 hours
├── Servers: 15 active
├── Users: 1,247 registered
├── Total Kills: 12,456
└── API Calls: 45,678 today

Resource Usage:
├── CPU: 23%
├── Memory: 156MB
├── Database: 2.3GB
└── Cache: 45MB

```text

### **🛡️ Server Owner Dashboard**

**What you see:** Manage your specific servers

## Features:

- ⚙️ **Server Configuration** - Bot settings per server

- 👥 **Member Management** - Server member administration

- 📊 **Server Analytics** - Server-specific statistics

- 💬 **Message Broadcasting** - Send messages to Discord


## Advanced Features


### **📊 Analytics**

**What you see:** Detailed statistics and trends

## Features:

- 📈 **Kill Trends** - Kill patterns over time

- 🎯 **Weapon Statistics** - Most used weapons

- 🗺️ **Location Data** - Popular kill locations

- ⏰ **Time Analysis** - Peak activity times


### **🔧 Bot Integration**

**What you see:** Real-time bot control and monitoring

## Features:

- 🎛️ **Bot Control** - Start/stop bot remotely

- 📡 **Real-time Updates** - Live bot status

- 💬 **Message Sending** - Send messages to Discord

- 🔔 **Event Monitoring** - Bot events and logs


### **📱 Mobile Responsive**

**What you see:** Dashboard works on all devices

## Features:

- 📱 **Mobile Optimized** - Works on phones/tablets

- 🖥️ **Desktop Enhanced** - Full features on desktop

- 📊 **Responsive Charts** - Charts adapt to screen size

- 🎨 **Touch Friendly** - Easy to use on touch devices


## Tips & Tricks


### **Pro Tips**

- **Bookmark Important Pages** - Save frequently used sections

- **Use Filters** - Narrow down kill history and user lists

- **Set Up Notifications** - Get alerts for important events

- **Monitor Analytics** - Track trends and patterns


### **Keyboard Shortcuts**

- **Ctrl + K** - Quick search

- **Ctrl + S** - Save settings

- **Ctrl + R** - Refresh data

- **Esc** - Close modals


### **Best Practices**

- **Regular Backups** - Export your data regularly

- **Privacy Settings** - Review and update privacy preferences

- **Server Management** - Keep server settings organized

- **User Permissions** - Regularly review user access


## Troubleshooting


### **Common Issues**


## Dashboard Won't Load

- Check if backend is running

- Verify API connection

- Try refreshing the page

- Check browser console for errors


## Login Issues

- Make sure Discord OAuth is configured

- Check if you're authorized in Discord

- Try logging out and back in

- Clear browser cache


## Data Not Updating

- Check WebSocket connection

- Verify bot is online

- Try refreshing the page

- Check network connectivity


## Settings Not Saving

- Check your permissions

- Verify database connection

- Try logging out and back in

- Check browser console for errors


### **Debug Mode**

Enable debug mode in browser console:

```javascript

localStorage.setItem('debug', 'true');
location.reload();

```text

## Mobile App (Coming Soon)


### **Planned Features**

- 📱 **Native Mobile App** - iOS and Android

- 🔔 **Push Notifications** - Real-time alerts

- 📊 **Offline Mode** - View cached data

- 🎮 **Game Integration** - Direct Star Citizen connection


---

*Master the dashboard and become a kill tracking expert! 🎯*
