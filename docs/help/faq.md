# ❓ Frequently Asked Questions


> **Common questions about the Star Citizen Kill Tracker**

## General Questions


### **Q: What is the Star Citizen Kill Tracker?**

**A:** It's a Discord bot system that tracks kills and deaths in Star Citizen, with a web dashboard and desktop app for monitoring your game logs.

### **Q: Is it free to use?**

**A:** Yes! The entire system is free to use. We use free hosting services (Vercel, Railway, Supabase) that have generous free tiers.

### **Q: Do I need to install anything?**

**A:** For basic use, just invite the Discord bot to your server. For advanced features, you can run the desktop app to automatically track your kills.

### **Q: Is my data safe?**

**A:** Yes! We use industry-standard security practices:

- All data is encrypted in transit

- Database is secured with proper authentication

- You control your privacy settings

- No data is shared without your consent


## Discord Bot Questions


### **Q: How do I invite the bot to my server?**

## A:

1. Go to the [Discord Developer Portal](https://discord.com/developers/applications)
2. Find your bot application
3. Go to OAuth2 → URL Generator
4. Select "bot" and "applications.commands" scopes
5. Select required permissions
6. Copy the URL and invite the bot

### **Q: What permissions does the bot need?**

**A:** The bot needs these permissions:

- ✅ Send Messages

- ✅ Use Slash Commands

- ✅ Read Message History

- ✅ Embed Links

- ✅ Attach Files


### **Q: Why isn't the bot responding to commands?**

**A:** Check these things:

1. Bot is online (green dot in member list)
2. Bot has proper permissions
3. You're using slash commands (like `/help`)
4. Bot token is correct in configuration

### **Q: Can I customize the bot's prefix?**

**A:** Yes! Server admins can change the bot prefix using `/server settings` or through the web dashboard.

### **Q: How do I remove the bot from my server?**

## A:

1. Go to Server Settings → Members
2. Find the bot in the member list
3. Click the three dots → Kick
4. Or use `/admin remove` if you're the bot owner

## Kill Tracking Questions


### **Q: How does kill tracking work?**

**A:** The system reads your Star Citizen game logs to detect kill events. It can also track kills manually entered through Discord commands.

### **Q: Do I need to run the desktop app?**

**A:** No! The desktop app is optional. It automatically monitors your game logs, but you can also manually report kills through Discord commands.

### **Q: Where are Star Citizen logs stored?**

**A:** Default locations:

- **Windows**: `C:/Users/%USERNAME%/AppData/Local/Star Citizen/Crashes`

- **Linux**: `~/.wine/drive_c/users/%USERNAME%/AppData/Local/Star Citizen/Crashes`


### **Q: Can I track kills from multiple servers?**

**A:** Yes! The system tracks kills across all Star Citizen servers and can separate them by server if needed.

### **Q: What if I don't want my kills tracked?**

**A:** You can:

- Use `/privacy optout` to stop tracking

- Set privacy to "Private" to hide from leaderboards

- Delete your account data entirely


## Dashboard Questions


### **Q: How do I access the web dashboard?**

## A:

- **Development**: http://localhost:3000

- **Production**: https://dbot.millsy.dev (or your custom domain)


### **Q: How do I login to the dashboard?**

**A:** Click "Login with Discord" and authorize the application. You'll be redirected back to the dashboard.

### **Q: Can I use the dashboard on mobile?**

**A:** Yes! The dashboard is fully responsive and works on phones, tablets, and desktop computers.

### **Q: Why can't I see certain features in the dashboard?**

**A:** The dashboard shows different features based on your role:

- **Bot Owner**: Full system access

- **Server Admin**: Server-specific management

- **User**: Personal stats and settings


### **Q: How do I change my privacy settings?**

## A:

1. Go to Settings in the dashboard
2. Click on Privacy
3. Adjust your visibility settings
4. Save changes

## Technical Questions


### **Q: What technology is this built with?**

## A:

- **Backend**: Node.js, Express, TypeScript

- **Database**: PostgreSQL with Prisma ORM

- **Cache**: Redis

- **Frontend**: React, TypeScript, Vite

- **Desktop**: Electron, TypeScript

- **Discord**: discord.js


### **Q: Can I self-host this?**

**A:** Yes! The entire system is open source and can be self-hosted. Check the [Deployment Guide](../technical/deployment.md) for instructions.

### **Q: How much does hosting cost?**

## A:

- **Free Tier**: $0/month (generous limits)

- **If you scale up**: ~$50/month for professional hosting


### **Q: Is there an API?**

**A:** Yes! The backend provides a REST API for all functionality. Check the [API Documentation](../api/) for details.

### **Q: Can I contribute to the project?**

**A:** Absolutely! We welcome contributions. Please reach out through our Discord community or GitHub issues to get started.

## Privacy & Security Questions


### **Q: What data do you collect?**

**A:** We collect:

- Discord user ID and basic profile info

- Kill/death statistics from Star Citizen

- Server configuration settings

- Usage analytics (anonymized)


### **Q: Can I delete my data?**

**A:** Yes! You can:

- Delete individual kills

- Set privacy to maximum

- Request complete data deletion

- Export your data before deletion


### **Q: Is my Discord data safe?**

**A:** Yes! We only access:

- Your Discord user ID

- Basic profile information

- Server membership (for permissions)

- We never access private messages or other sensitive data


### **Q: Can I opt out of data collection?**

**A:** Yes! You can:

- Use `/privacy optout` to stop kill tracking

- Set privacy to "Private" to hide from leaderboards

- Disable analytics in settings

- Request data deletion


## Troubleshooting Questions


### **Q: The bot is offline, what do I do?**

## A:

1. Check if the backend is running
2. Verify the bot token is correct
3. Check Discord's status page
4. Restart the backend service

### **Q: I'm getting database errors, help!**

## A:

1. Check if PostgreSQL is running
2. Verify the database connection string
3. Run database migrations: `npx prisma migrate dev`
4. Check the [Troubleshooting Guide](./troubleshooting.md)

### **Q: The dashboard won't load, what's wrong?**

## A:

1. Check if the backend is running on port 3001
2. Verify the API URL in environment variables
3. Check browser console for errors
4. Try refreshing the page

### **Q: My kills aren't being tracked, why?**

## A:

1. Make sure Star Citizen is running
2. Check if log files are being created
3. Verify the log path in settings
4. Try manually reporting a kill with `/kill`

## Feature Questions


### **Q: Can I create custom commands?**

**A:** Custom commands are coming soon! For now, you can use the built-in commands.

### **Q: Can I integrate with other Star Citizen tools?**

**A:** Yes! The system has APIs for integration. Check the [API Documentation](../api/) for details.

### **Q: Can I export my data?**

**A:** Yes! You can export your kill data in JSON format from the dashboard.

### **Q: Can I import data from other kill trackers?**

**A:** Import functionality is planned for future releases.

### **Q: Can I set up automated notifications?**

**A:** Yes! You can configure notifications for:

- Kill events

- Death events

- Server updates

- Bot maintenance


## Support Questions


### **Q: Where can I get help?**

## A:

1. Check this FAQ
2. Read the [Troubleshooting Guide](./troubleshooting.md)
3. Search existing GitHub issues
4. Join our Discord support server
5. Create a new GitHub issue

### **Q: How do I report a bug?**

## A:

1. Check if it's already reported on GitHub
2. Create a new issue with:

   - Steps to reproduce

   - Expected vs actual behavior

   - Error messages

   - System information


### **Q: Can I request a feature?**

**A:** Yes! Create a GitHub issue with the "enhancement" label and describe your feature request.

### **Q: How often is the project updated?**

**A:** We release updates regularly. Check the GitHub releases page for the latest version.

## Still Have Questions

### **Can't Find Your Answer?**

- <i class="fas fa-search"></i> **Search the documentation** - Use Ctrl+F to search

- <i class="fas fa-bug"></i> **Check GitHub issues** - Someone might have asked the same question

- <i class="fab fa-discord"></i> **Join our Discord** - Get help from the community

- <i class="fas fa-edit"></i> **Create an issue** - Ask your question on GitHub


### **Want to Contribute?**

- <i class="fas fa-bug"></i> **Fix bugs** - Help improve the project

- <i class="fas fa-star"></i> **Add features** - Implement new functionality

- <i class="fas fa-book"></i> **Improve docs** - Make the documentation better


---

*Don't see your question? Ask us! We're here to help. <i class="fas fa-handshake"></i>*
