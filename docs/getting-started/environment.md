# Environment Configuration

> **Configure your Star Citizen Kill Tracker system settings**

## What Are Environment Variables

Think of them as **settings for your application**. They tell your app:

- Where to find the database

- What Discord bot to use

- How to connect to APIs

- And much more!


## Step 1: Create Your .env File


```bash

## Copy the example file

cp env.example .env

## Now edit the .env file with your settings

```text

## Step 2: Required Settings


### **Database Settings**

```env

## PostgreSQL database connection

DATABASE_URL="postgresql://dbot2_user:your_password@localhost:5432/dbot2"

```text

### **Discord Bot Settings**

```env

## Your Discord bot token (get this from Discord Developer Portal)

DISCORD_BOT_TOKEN="your_discord_bot_token_here"

## Discord OAuth settings (for dashboard login)

DISCORD_CLIENT_ID="your_discord_client_id"
DISCORD_CLIENT_SECRET="your_discord_client_secret"
DISCORD_REDIRECT_URI="http://localhost:3000/auth/discord/callback"

```text

### **Security Settings**

```env

## Create strong, random secrets for these

JWT_SECRET="your_super_secret_jwt_key_here"
AUTH_SECRET="your_super_secret_auth_key_here"

```text

### **Server Settings**

```env

## Port for the backend API

PORT="3001"

## Environment (development or production)

NODE_ENV="development"

```text

### **Redis Settings**

```env

## Redis connection (usually these defaults work)

REDIS_HOST="localhost"
REDIS_PORT="6379"
REDIS_PASSWORD=""
REDIS_DB="0"

```text

## Step 3: Discord Bot Setup


### **1. Create Discord Application**

1. Go to https://discord.com/developers/applications
2. Click **"New Application"**
3. Give it a name (like "Star Citizen Kill Tracker")
4. Click **"Create"**

### **2. Create Bot**

1. Go to **"Bot"** section in the left menu
2. Click **"Add Bot"**
3. Copy the **Token** → This goes in `DISCORD_BOT_TOKEN`

### **3. Set Bot Permissions**

Your bot needs these permissions:

- ✅ Send Messages

- ✅ Use Slash Commands

- ✅ Read Message History

- ✅ Embed Links

- ✅ Attach Files


### **4. Invite Bot to Server**

1. Go to **"OAuth2"** → **"URL Generator"**
2. Select **"bot"** and **"applications.commands"** scopes
3. Select the permissions above
4. Copy the generated URL and open it
5. Choose your server and click **"Authorize"**

## Step 4: Optional Settings


### **Star Citizen API Keys (Optional)**

These give you better data, but aren't required:

```env

## SC Universe API - https://api.scuniverse.com

SC_UNIVERSE_API_KEY="your_sc_universe_api_key_here"

## PyRSI API - https://api.pyrsi.com (early development)

PYRSI_API_KEY="your_pyrsi_api_key_here"

## Star Citizen Wiki API - https://starcitizen.tools/api.php

SC_WIKI_API_KEY="your_sc_wiki_api_key_here"

## SC Stats API - https://api.scstats.com

SC_STATS_API_KEY="your_sc_stats_api_key_here"

```text

### **Log Parser Settings (Optional)**

```env

## Enable automatic log parsing

ENABLE_LOG_PARSING="true"

## How long to wait for log parsing (milliseconds)

LOG_PARSER_TIMEOUT="30000"

## Maximum log file size (bytes)

MAX_LOG_FILE_SIZE="104857600"

## Where to store uploaded logs

UPLOAD_DIR="/app/uploads/logs"

```text

### **Frontend Settings**

```env

## WebSocket URL for real-time updates

REACT_APP_WS_URL="ws://localhost:3001"

## API port

REACT_APP_API_PORT="3001"

```text

## Step 5: Test Your Setup


### **1. Test Database Connection**

```bash

cd backend
npm run test:db

```text

### **2. Test Redis Connection**

```bash

cd backend
npm run test:redis

```text

### **3. Test Discord Bot**

```bash

cd backend
npm run dev

## Look for "Discord bot is ready!" message

```text

### **4. Test Dashboard**

```bash

cd dashboard
npm run dev

## Open http://localhost:3000

```text

## 🔐 **Security Tips**


### **Keep Your Secrets Secret!**

- ❌ **Never** commit your `.env` file to git

- ❌ **Never** share your bot token publicly

- ✅ Use strong, random passwords

- ✅ Rotate your secrets regularly


### **Generate Strong Secrets**

```bash

## Generate a random JWT secret

node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"

## Generate a random auth secret

node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

```text

## 🆘 **Common Problems**


### **"Invalid bot token"**

→ Check your Discord bot token is correct

### **"Database connection failed"**

→ Make sure PostgreSQL is running and DATABASE_URL is correct

### **"Redis connection failed"**

→ Make sure Redis is running

### **"Port already in use"**

→ Stop other applications using port 3001

## Configuration Complete

Your environment is now properly configured. Next steps:

1. **Start the application** → `npm run dev`
2. **Test the Discord bot** → Try `/help` in Discord
3. **Access the dashboard** → Go to http://localhost:3000

## Next Steps

- [**Dashboard Guide**](../usage/dashboard.md) - Learn to use the web interface
- [**Discord Commands**](../usage/discord-commands.md) - All bot commands
- [**Updated Dashboard Guide**](../usage/updated-dashboard-guide.md) - Latest features

---

*Professional Star Citizen Integration Solutions*
