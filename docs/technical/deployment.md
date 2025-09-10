# 🚀 Deployment Guide


> **Put your Star Citizen Kill Tracker online for free!**

## Free Hosting Strategy


We'll use the **best free services** that are secure and easy to set up:

- 🌐 **Frontend (Dashboard)** → **Vercel** (Free, fast, easy)

- 🔧 **Backend (API + Bot)** → **Railway** (Free, supports long-running processes)

- 🗄️ **Database** → **Supabase** (Free PostgreSQL, 500MB)

- 🔄 **Cache** → **Railway Redis** (Free tier)


## Why This Setup

✅ **100% Free** - All services have generous free tiers  
✅ **Secure** - HTTPS by default, managed databases  
✅ **Easy** - One-click deployments, auto-updates  
✅ **Scalable** - Can upgrade when you need more resources  
✅ **Fast** - Global CDN, optimized performance  

## Step 1: Deploy Frontend to Vercel (5 minutes)


### **1. Prepare Your Dashboard**

Your dashboard is already configured for Vercel! The files are ready:

- ✅ `dashboard/vercel.json` - Vercel configuration

- ✅ `dashboard/vite.config.ts` - Updated for production

- ✅ `dashboard/src/utils/api.ts` - Uses environment variables


### **2. Deploy to Vercel**

1. Go to [vercel.com](https://vercel.com) and sign up with GitHub
2. Click **"Import Project"**
3. Select your `dbot2` repository
4. Set **Root Directory** to `dashboard`
5. Click **"Deploy"**

### **3. Configure Environment Variables**

In Vercel dashboard, go to **Settings** → **Environment Variables**:

```text

VITE_API_URL = https://your-railway-backend-url.railway.app/api

```text

### **4. Set Custom Domain (Optional)**

- Go to **Settings** → **Domains**

- Add `dbot.millsy.dev`

- Update your DNS to point to Vercel


## Step 2: Set Up Database with Supabase (5 minutes)


### **1. Create Supabase Project**

1. Go to [supabase.com](https://supabase.com) and create account
2. Click **"New Project"**
3. Choose region closest to you
4. Set database password (save this!)

### **2. Get Connection String**

1. Go to **Settings** → **Database**
2. Copy the **Connection String**
3. It looks like: `postgresql://postgres:[password]@db.[project].supabase.co:5432/postgres`

### **3. Run Database Migrations**

```bash

## Set your database URL

export DATABASE_URL="your-supabase-connection-string"

## Run migrations

cd backend
npx prisma migrate deploy
npx prisma generate

```text

#### **⚠️ Important: Command Permission System Migration**

The new command permission system requires a specific migration. Run this **before** deploying the new code:

```bash

## Run the command permissions migration

npx prisma migrate dev --name command_permissions

```text

## Migration Order is Critical:

1. **First**: Run database migrations
2. **Then**: Deploy new code
3. **Finally**: Test the system

This ensures backward compatibility during rolling updates and prevents database inconsistencies.

## Step 3: Deploy Backend to Railway (10 minutes)


### **1. Create Railway Project**

1. Go to [railway.app](https://railway.app) and sign up with GitHub
2. Click **"New Project"**
3. Select **"Deploy from GitHub repo"**
4. Choose your `dbot2` repository

### **2. Configure Deployment**

1. Set **Root Directory** to `backend`
2. Railway will auto-detect it's a Node.js project
3. It will automatically run `npm install` and `npm start`

### **3. Add Environment Variables**

In Railway dashboard, go to **Variables** tab:

```env

## Database

DATABASE_URL=your-supabase-connection-string

## Discord Bot

DISCORD_BOT_TOKEN=your-discord-bot-token
DISCORD_CLIENT_ID=your-discord-client-id
DISCORD_CLIENT_SECRET=your-discord-client-secret

## Security

JWT_SECRET=your-jwt-secret
AUTH_SECRET=your-auth-secret

## Bot Owner (for command permissions)

BOT_OWNER_ID=your-discord-user-id

## Server

NODE_ENV=production
PORT=3001

## Optional: Star Citizen APIs

SC_UNIVERSE_API_KEY=your-sc-universe-key
SC_WIKI_API_KEY=your-sc-wiki-key

```text

### **4. Add Redis (Optional)**

1. In Railway, click **"+ New"**
2. Select **"Redis"**
3. Railway will create a Redis instance
4. Add `REDIS_URL` to your environment variables

## Step 4: Update Frontend API URL


### **1. Get Your Railway URL**

- Railway gives you a URL like: `https://your-project.railway.app`

- Copy this URL


### **2. Update Vercel Environment Variable**

- Go to Vercel dashboard

- **Settings** → **Environment Variables**

- Update `VITE_API_URL` to: `https://your-project.railway.app/api`


### **3. Redeploy**

- Vercel will automatically redeploy with the new API URL


## Step 5: Configure Custom Domains


### **1. Frontend Domain (dbot.millsy.dev)**

1. In Vercel, go to **Settings** → **Domains**
2. Add `dbot.millsy.dev`
3. Vercel will give you DNS instructions
4. Update your DNS records

### **2. Backend Domain (Optional)**

1. In Railway, go to **Settings** → **Domains**
2. Add `api.millsy.dev` (or similar)
3. Update DNS records

## Step 6: Test Your Deployment


### **1. Test Frontend**

- Go to `https://dbot.millsy.dev`

- Should load your dashboard

- Try logging in with Discord


### **2. Test Backend**

- Go to `https://your-railway-url.railway.app/api/health`

- Should return health status


### **3. Test Discord Bot**

- Check if bot is online in Discord

- Try `/help` command

- Should respond normally


### **4. Test Database**

- Try creating a kill in the dashboard

- Check if it saves to database

- Verify data appears in Supabase dashboard


### **5. Test Command Management System**

- Go to `/commands` in your dashboard

- Verify command categories are displayed

- Test enabling/disabling commands

- Check bot owner vs server owner permissions


## 🎉 **You're Live!**


Your Star Citizen Kill Tracker is now online and accessible to everyone!

### **What You Have:**

- 🌐 **Dashboard**: `https://dbot.millsy.dev`

- 🔧 **API**: `https://your-railway-url.railway.app`

- 🤖 **Discord Bot**: Running 24/7

- 🗄️ **Database**: Managed PostgreSQL

- 🔄 **Cache**: Redis for performance


## Monitoring & Maintenance


### **Check Status Regularly**

- **Vercel**: Check deployment status

- **Railway**: Monitor resource usage

- **Supabase**: Check database health

- **Discord**: Verify bot is online


### **Free Tier Limits**

- **Vercel**: 100GB bandwidth/month

- **Railway**: 500 hours/month, 512MB RAM

- **Supabase**: 500MB database, 2GB bandwidth


### **Scaling Up**

When you hit limits:

- **Vercel Pro**: $20/month for more bandwidth

- **Railway Pro**: $5/month for more resources

- **Supabase Pro**: $25/month for more database space


## Troubleshooting


### **Common Issues**


## Frontend Won't Load

- Check Vercel deployment status

- Verify environment variables

- Check browser console for errors


## Backend Not Responding

- Check Railway deployment logs

- Verify environment variables

- Check database connection


## Discord Bot Offline

- Check Railway logs for errors

- Verify bot token is correct

- Check bot permissions in Discord


## Database Errors

- Check Supabase connection string

- Verify database is running

- Check Prisma migrations


## Command Permission Issues

- Verify `BOT_OWNER_ID` environment variable is set

- Check that command permissions migration ran successfully

- Ensure bot owner ID matches your Discord user ID

- Verify command categories are properly configured


### **Debug Commands**

```bash

## Check Railway logs

railway logs

## Check Vercel deployment

vercel logs

## Test database connection

npx prisma db pull

```text

## Security Checklist


### **Production Security**

- ✅ Use strong, unique secrets

- ✅ Enable HTTPS everywhere

- ✅ Set up proper CORS

- ✅ Use environment variables

- ✅ Regular security updates


### **Discord Bot Security**

- ✅ Rotate bot token regularly

- ✅ Limit bot permissions

- ✅ Monitor bot activity

- ✅ Use rate limiting


## 🎯 **Next Steps**


1. **Share Your Bot** - Invite friends to use it
2. **Monitor Usage** - Check analytics and logs
3. **Add Features** - Enhance based on user feedback
4. **Scale Up** - Upgrade when you hit limits

## Cost Breakdown


### **Free Tier (What You Get)**

- **Vercel**: $0/month

- **Railway**: $0/month (500 hours)

- **Supabase**: $0/month (500MB DB)

- **Total**: **$0/month** 🎉


### **If You Scale Up**

- **Vercel Pro**: $20/month

- **Railway Pro**: $5/month

- **Supabase Pro**: $25/month

- **Total**: **$50/month** (still very reasonable!)


---

*Your kill tracker is now live and ready to dominate the verse! 🚀*
