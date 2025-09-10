# 🆘 Troubleshooting Guide


> **Fix common problems with your Star Citizen Kill Tracker**

## Quick Fixes


### **🚨 Emergency Fixes (Try These First)**


## Bot Not Responding
```bash

## Check if bot is online in Discord

## Look for bot in member list - should show "Online" 🟢


## If offline, restart the backend

cd backend
npm run dev

```text

## Dashboard Won't Load
```bash

## Check if backend is running

curl http://localhost:3001/api/health

## If not responding, start backend

cd backend
npm run dev

```text

## Database Errors
```bash

## Check PostgreSQL is running

## Windows: Check Services

## macOS: brew services list | grep postgres

## Linux: sudo systemctl status postgresql


## If not running, start it

## Windows: Start PostgreSQL service

## macOS: brew services start postgresql

## Linux: sudo systemctl start postgresql

```text

## Common Problems & Solutions


### **🤖 Discord Bot Issues**


#### **Problem: Bot Not Responding to Commands**

## Symptoms:

- Bot shows as online but doesn't respond

- Commands like `/help` don't work

- No error messages


## Solutions:

1. **Check Bot Permissions**

   ```

   - Go to Discord Server Settings

   - Go to Roles → @your-bot

   - Make sure these are enabled:

     ✅ Send Messages
     ✅ Use Slash Commands
     ✅ Read Message History
     ✅ Embed Links

   ```

2. **Re-invite Bot**

   ```

   - Go to Discord Developer Portal

   - OAuth2 → URL Generator

   - Select "bot" and "applications.commands"

   - Copy URL and re-invite bot

   ```

3. **Check Bot Token**

   ```bash

   # Verify token in .env file
   cat .env | grep DISCORD_BOT_TOKEN
   # Should show: DISCORD_BOT_TOKEN=your_token_here

   ```

#### **Problem: Bot Goes Offline Randomly**

## Symptoms:

- Bot shows as offline in Discord

- Backend logs show disconnection errors

- Bot reconnects after a few minutes


## Solutions:

1. **Check Network Connection**

   ```bash

   # Test internet connectivity
   ping discord.com

   ```

2. **Check Bot Token Validity**

   ```bash

   # Test token with Discord API
   curl -H "Authorization: Bot YOUR_BOT_TOKEN" \
     https://discord.com/api/v10/users/@me

   ```

3. **Increase Reconnect Attempts**

   ```javascript

   // In backend/src/bot/index.ts
   const client = new Client({
     intents: [GatewayIntentBits.Guilds],
     reconnect: true,
     retryLimit: 10
   });

   ```

### **🌐 Dashboard Issues**


#### **Problem: Dashboard Shows "Connection Failed"**

## Symptoms:

- Dashboard loads but shows connection error

- API calls fail

- WebSocket connection fails


## Solutions:

1. **Check Backend is Running**

   ```bash

   # Test API endpoint
   curl http://localhost:3001/api/health
   # Should return: {"status": "ok"}

   ```

2. **Check Environment Variables**

   ```bash

   # Verify API URL in dashboard
   cat dashboard/.env
   # Should show: VITE_API_URL=http://localhost:3001/api

   ```

3. **Check CORS Settings**

   ```javascript

   // In backend/src/index.ts
   app.use(cors({
     origin: ['http://localhost:3000', '[https://your-domain.com]([https://your-domain.com)](https://your-domain.com))'],
     credentials: true
   }));

   ```

#### **Problem: Login with Discord Fails**

## Symptoms:

- Click "Login with Discord" but nothing happens

- Redirects to error page

- "Invalid OAuth" error


## Solutions:

1. **Check Discord OAuth Settings**

   ```

   - Go to Discord Developer Portal

   - OAuth2 → General

   - Add redirect URI: http://localhost:3000/auth/discord/callback

   - For production: https://your-domain.com/auth/discord/callback

   ```

2. **Verify Environment Variables**

   ```bash

   # Check OAuth settings
   cat .env | grep DISCORD_CLIENT
   # Should show
   # DISCORD_CLIENT_ID=your_client_id
   # DISCORD_CLIENT_SECRET=your_client_secret

   ```

3. **Check Redirect URI**

   ```bash

   # Make sure redirect URI matches exactly
   # Development: http://localhost:3000/auth/discord/callback
   # Production: https://your-domain.com/auth/discord/callback

   ```

### **🗄️ Database Issues**


#### **Problem: "Database Connection Failed"**

## Symptoms:

- Backend won't start

- Database errors in logs

- "Connection refused" errors


## Solutions:

1. **Check PostgreSQL is Running**

   ```bash

   # Windows
   services.msc → PostgreSQL
   
   # macOS
   brew services list | grep postgres
   
   # Linux
   sudo systemctl status postgresql

   ```

2. **Check Database URL**

   ```bash

   # Verify DATABASE_URL format
   cat .env | grep DATABASE_URL
   # Should be: postgresql://user:password@localhost:5432/database

   ```

3. **Test Database Connection**

   ```bash

   # Test connection
   psql "postgresql://user:password@localhost:5432/database"

   ```

4. **Create Database if Missing**

   ```sql

   -- Connect to PostgreSQL
   psql -U postgres
   
   -- Create database
   CREATE DATABASE dbot2;
   CREATE USER dbot2_user WITH PASSWORD 'your_password';
   GRANT ALL PRIVILEGES ON DATABASE dbot2 TO dbot2_user;

   ```

#### **Problem: "Table Doesn't Exist"**

## Symptoms:

- Database connection works

- But tables are missing

- Migration errors


## Solutions:

1. **Run Database Migrations**

   ```bash

   cd backend
   npx prisma migrate dev
   npx prisma generate

   ```

2. **Reset Database (Development Only)**

   ```bash

   # WARNING: This deletes all data!
   npx prisma migrate reset

   ```

3. **Check Prisma Schema**

   ```bash

   # Verify schema file exists
   ls backend/prisma/schema.prisma

   ```

### **💻 Desktop App Issues**


#### **Problem: Desktop App Won't Start**

## Symptoms:

- Electron app doesn't open

- Error messages on startup

- App crashes immediately


## Solutions:

1. **Check Node.js Version**

   ```bash

   node --version
   # Should be 18+ for Electron

   ```

2. **Reinstall Dependencies**

   ```bash

   cd killtracker
   rm -rf node_modules
   npm install

   ```

3. **Check Electron Installation**

   ```bash

   # Reinstall Electron
   npm install electron --save-dev

   ```

#### **Problem: Can't Find Star Citizen Logs**

## Symptoms:

- Desktop app starts but shows "No logs found"

- Kill tracking doesn't work

- Log path errors


## Solutions:

1. **Find Star Citizen Installation**

   ```

   Default paths:

   - Windows: C:/Users/%USERNAME%/AppData/Local/Star Citizen/Crashes

   - Linux: ~/.wine/drive_c/users/%USERNAME%/AppData/Local/Star Citizen/Crashes

   ```

2. **Check Log File Permissions**

   ```bash

   # Make sure app can read log files
   ls -la "path/to/star/citizen/logs"

   ```

3. **Manual Log Path Setup**

   ```

   - Open desktop app

   - Go to Settings

   - Set custom log path

   - Test log reading

   ```

### **🔧 General Issues**


#### **Problem: "Port Already in Use"**

## Symptoms:

- Backend won't start

- "EADDRINUSE" error

- Port 3001 is busy


## Solutions:

1. **Find What's Using the Port**

   ```bash

   # Windows
   netstat -ano | findstr :3001
   
   # macOS/Linux
   lsof -i :3001

   ```

2. **Kill the Process**

   ```bash

   # Windows
   taskkill /PID <process_id> /F
   
   # macOS/Linux
   kill -9 <process_id>

   ```

3. **Use Different Port**

   ```bash

   # Change port in .env
   echo "PORT=3002" >> .env

   ```

#### **Problem: "Module Not Found"**

## Symptoms:

- Backend won't start

- "Cannot find module" errors

- Missing dependencies


## Solutions:

1. **Reinstall Dependencies**

   ```bash

   # Clean install
   rm -rf node_modules package-lock.json
   npm install

   ```

2. **Check Node.js Version**

   ```bash

   node --version
   # Should be 18+

   ```

3. **Update Dependencies**

   ```bash

   npm update

   ```

## Debug Mode


### **Enable Debug Logging**

```bash

## Set debug environment variable

export DEBUG=*
export NODE_ENV=development

## Start with debug logging

npm run dev

```text

### **Check Logs**

```bash

## Backend logs

cd backend
npm run dev

## Dashboard logs

cd dashboard
npm run dev

## Desktop app logs

cd killtracker
npm run dev

```text

### **Browser Debug**

```javascript

// Open browser console (F12)
// Check for errors in Console tab
// Check Network tab for failed requests
// Check Application tab for localStorage issues

```text

## Getting Help


### **Before Asking for Help**

1. ✅ Check this troubleshooting guide
2. ✅ Try the quick fixes above
3. ✅ Enable debug mode and check logs
4. ✅ Search existing issues on GitHub

### **When Asking for Help**

Include this information:

- **Operating System** (Windows/macOS/Linux)

- **Node.js Version** (`node --version`)

- **Error Messages** (copy exact error text)

- **Steps to Reproduce** (what you did before the error)

- **Debug Logs** (if available)


### **Where to Get Help**

- **GitHub Issues** - Create an issue with details

- **Discord Server** - Join our support server

- **Documentation** - Check other guides in this docs folder


## Prevention Tips


### **Keep Things Updated**

```bash

## Update Node.js regularly

## Update dependencies monthly

npm update

## Keep Discord bot token secure

## Rotate secrets regularly

```text

### **Regular Maintenance**

```bash

## Check database health

npx prisma db pull

## Monitor disk space

df -h

## Check system resources

top

```text

### **Backup Important Data**

```bash

## Export database

pg_dump dbot2 > backup.sql

## Backup configuration

cp .env .env.backup

```text

---

*Most problems have simple solutions - don't panic! 🛠️*
