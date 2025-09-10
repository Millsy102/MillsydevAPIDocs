# <i class="fas fa-globe"></i> Web Dashboard Guide


> **Master the Star Citizen Kill Tracker web dashboard**

## What is the Dashboard

The web dashboard is your **control center** for the Star Citizen Kill Tracker. It's a website where you can:

- <i class="fas fa-chart-bar"></i> **View your kill statistics** and leaderboards

- <i class="fas fa-cog"></i> **Configure bot settings** for your servers

- <i class="fas fa-users"></i> **Manage users** and permissions

- <i class="fas fa-chart-line"></i> **See analytics** and trends

- <i class="fas fa-tools"></i> **Control the bot** remotely


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

- **<i class="fas fa-crown"></i> Bot Owner** - Full system access

- **<i class="fas fa-shield-alt"></i> Server Admin** - Server-specific management

- **<i class="fas fa-user"></i> User** - Personal stats and settings


## Dashboard Sections


### **🏠 Dashboard (Home)**

**What you see:** Overview of your statistics and recent activity

## Features:

- <i class="fas fa-chart-bar"></i> **Personal Stats** - Your kills, deaths, K/D ratio

- <i class="fas fa-trophy"></i> **Recent Kills** - Latest kill events

- <i class="fas fa-chart-line"></i> **Server Stats** - Server-wide statistics

- <i class="fas fa-bell"></i> **Notifications** - Recent bot events


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

### **<i class="fas fa-gamepad"></i> Servers**

**What you see:** Manage your Discord servers and bot settings

## Features:

- <i class="fas fa-list"></i> **Server List** - All servers where bot is active

- <i class="fas fa-cog"></i> **Server Settings** - Configure bot per server

- <i class="fas fa-users"></i> **User Management** - Manage server members

- <i class="fas fa-chart-bar"></i> **Server Analytics** - Server-specific statistics


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

- <i class="fas fa-list"></i> **Kill History** - All your recorded kills

- <i class="fas fa-search"></i> **Search & Filter** - Find specific kills

- <i class="fas fa-chart-bar"></i> **Kill Analytics** - Detailed statistics

- <i class="fas fa-trophy"></i> **Achievements** - Unlock badges and rewards


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

- <i class="fas fa-list"></i> **User List** - All registered users

- <i class="fas fa-search"></i> **User Search** - Find specific users

- <i class="fas fa-cog"></i> **Permission Management** - Set user roles

- <i class="fas fa-chart-bar"></i> **User Analytics** - User activity statistics


### **<i class="fas fa-cog"></i> Settings**

**What you see:** Configure your personal preferences

## Features:

- <i class="fas fa-lock"></i> **Privacy Settings** - Control data visibility

- <i class="fas fa-bell"></i> **Notification Preferences** - Set notification types

- <i class="fas fa-palette"></i> **Theme Settings** - Customize appearance

- <i class="fas fa-tools"></i> **Account Settings** - Manage your account


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

- <i class="fas fa-chart-bar"></i> **System Statistics** - Overall bot performance

- <i class="fas fa-desktop"></i> **Server Monitoring** - All connected servers

- <i class="fas fa-users"></i> **User Management** - Global user administration

- <i class="fas fa-tools"></i> **Bot Control** - Start/stop/restart bot

- <i class="fas fa-chart-line"></i> **Analytics** - Detailed system analytics


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

### **<i class="fas fa-shield-alt"></i> Server Owner Dashboard**

**What you see:** Manage your specific servers

## Features:

- <i class="fas fa-cog"></i> **Server Configuration** - Bot settings per server

- <i class="fas fa-users"></i> **Member Management** - Server member administration

- <i class="fas fa-chart-bar"></i> **Server Analytics** - Server-specific statistics

- <i class="fas fa-comment"></i> **Message Broadcasting** - Send messages to Discord


## Advanced Features


### **<i class="fas fa-chart-bar"></i> Analytics**

**What you see:** Detailed statistics and trends

## Features:

- 📈 **Kill Trends** - Kill patterns over time

- <i class="fas fa-crosshairs"></i> **Weapon Statistics** - Most used weapons

- 🗺️ **Location Data** - Popular kill locations

- ⏰ **Time Analysis** - Peak activity times


### **🔧 Bot Integration**

**What you see:** Real-time bot control and monitoring

## Features:

- <i class="fas fa-sliders-h"></i> **Bot Control** - Start/stop bot remotely

- <i class="fas fa-broadcast-tower"></i> **Real-time Updates** - Live bot status

- <i class="fas fa-comment"></i> **Message Sending** - Send messages to Discord

- <i class="fas fa-bell"></i> **Event Monitoring** - Bot events and logs


### **<i class="fas fa-mobile-alt"></i> Mobile Responsive**

**What you see:** Dashboard works on all devices

## Features:

- <i class="fas fa-mobile-alt"></i> **Mobile Optimized** - Works on phones/tablets

- <i class="fas fa-desktop"></i> **Desktop Enhanced** - Full features on desktop

- <i class="fas fa-chart-bar"></i> **Responsive Charts** - Charts adapt to screen size

- <i class="fas fa-palette"></i> **Touch Friendly** - Easy to use on touch devices


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

- <i class="fas fa-mobile-alt"></i> **Native Mobile App** - iOS and Android

- <i class="fas fa-bell"></i> **Push Notifications** - Real-time alerts

- <i class="fas fa-chart-bar"></i> **Offline Mode** - View cached data

- <i class="fas fa-gamepad"></i> **Game Integration** - Direct Star Citizen connection


---

*Master the dashboard and become a kill tracking expert! <i class="fas fa-crosshairs"></i>*
