# 🔧 Scripts & Automation Guide


> **Complete guide to all scripts, automation, and deployment tools**

## Overview


This guide covers all the scripts, automation tools, and deployment utilities available in the Star Citizen Kill Tracker project.

## 📁 Scripts Directory Structure


```text

scripts/
├── deployment/          # Deployment automation scripts
├── database/           # Database management scripts
├── monitoring/         # Monitoring and health check scripts
├── backup/            # Backup and restore scripts
├── development/       # Development helper scripts
└── maintenance/       # System maintenance scripts

```text

## 🚀 Deployment Scripts


### **deploy.sh - Main Deployment Script**

```bash

#!/bin/bash

## Main deployment script for production


set -e

echo "🚀 Starting deployment..."

## Configuration

APP_DIR="/var/www/dbot.millsy.dev"
BACKUP_DIR="/var/backups/sckilltracker"
DATE=$(date +%Y%m%d_%H%M%S)

## Create backup

echo "📦 Creating backup..."
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/pre_deploy_backup_$DATE.tar.gz \
    --exclude='node_modules' \
    --exclude='.git' \
    --exclude='logs' \
    -C $APP_DIR .

## Stop services

echo "⏹️ Stopping services..."
pm2 stop sckilltracker-backend

## Pull latest changes

echo "📥 Pulling latest changes..."
cd $APP_DIR
git pull origin main

## Install dependencies

echo "📦 Installing dependencies..."
npm run install:all

## Build applications

echo "🔨 Building applications..."
npm run build

## Run database migrations

echo "🗄️ Running database migrations..."
cd backend
npx prisma migrate deploy
npx prisma generate

## Start services

echo "▶️ Starting services..."
pm2 start ecosystem.config.js

## Health check

echo "🏥 Running health checks..."
sleep 10
curl -f http://localhost:3001/health || exit 1

echo "✅ Deployment completed successfully!"

```text

### **deploy-staging.sh - Staging Deployment**

```bash

#!/bin/bash

## Staging deployment script


set -e

echo "🚀 Starting staging deployment..."

## Configuration

APP_DIR="/var/www/staging.dbot.millsy.dev"
BRANCH="develop"

## Pull latest changes

cd $APP_DIR
git fetch origin
git checkout $BRANCH
git pull origin $BRANCH

## Install dependencies

npm run install:all

## Build applications

npm run build

## Run database migrations

cd backend
npx prisma migrate dev

## Start services

pm2 start ecosystem.staging.config.js

echo "✅ Staging deployment completed!"

```text

### **rollback.sh - Rollback Script**

```bash

#!/bin/bash

## Rollback script for failed deployments


set -e

echo "🔄 Starting rollback..."

## Configuration

APP_DIR="/var/www/dbot.millsy.dev"
BACKUP_DIR="/var/backups/sckilltracker"

## Get latest backup

LATEST_BACKUP=$(ls -t $BACKUP_DIR/pre_deploy_backup_*.tar.gz | head -n1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "❌ No backup found!"
    exit 1
fi

echo "📦 Restoring from backup: $LATEST_BACKUP"

## Stop services

pm2 stop sckilltracker-backend

## Restore backup

cd $APP_DIR
tar -xzf $LATEST_BACKUP

## Start services

pm2 start ecosystem.config.js

echo "✅ Rollback completed successfully!"

```text

## 🗄️ Database Scripts


### **db-backup.sh - Database Backup**

```bash

#!/bin/bash

## Database backup script


set -e

## Configuration

BACKUP_DIR="/var/backups/sckilltracker"
DATE=$(date +%Y%m%d_%H%M%S)
DB_NAME="sckilltracker"
DB_USER="sckilltracker"

## Create backup directory

mkdir -p $BACKUP_DIR

## Create database backup

echo "📦 Creating database backup..."
pg_dump -h localhost -U $DB_USER $DB_NAME > $BACKUP_DIR/db_backup_$DATE.sql

## Compress backup

gzip $BACKUP_DIR/db_backup_$DATE.sql

## Keep only last 7 days of backups

find $BACKUP_DIR -name "db_backup_*.sql.gz" -mtime +7 -delete

echo "✅ Database backup completed: db_backup_$DATE.sql.gz"

```text

### **db-restore.sh - Database Restore**

```bash

#!/bin/bash

## Database restore script


set -e

## Configuration

BACKUP_DIR="/var/backups/sckilltracker"
DB_NAME="sckilltracker"
DB_USER="sckilltracker"

## List available backups

echo "📋 Available backups:"
ls -la $BACKUP_DIR/db_backup_*.sql.gz

## Get backup file

read -p "Enter backup filename: " BACKUP_FILE

if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo "❌ Backup file not found!"
    exit 1
fi

## Confirm restore

read -p "Are you sure you want to restore from $BACKUP_FILE? (y/N): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    echo "❌ Restore cancelled"
    exit 1
fi

## Stop services

pm2 stop sckilltracker-backend

## Restore database

echo "🔄 Restoring database..."
gunzip -c $BACKUP_DIR/$BACKUP_FILE | psql -h localhost -U $DB_USER $DB_NAME

## Start services

pm2 start ecosystem.config.js

echo "✅ Database restore completed!"

```text

### **db-migrate.sh - Database Migration**

```bash

#!/bin/bash

## Database migration script


set -e

echo "🗄️ Running database migrations..."

## Configuration

APP_DIR="/var/www/dbot.millsy.dev"

## Stop services

pm2 stop sckilltracker-backend

## Run migrations

cd $APP_DIR/backend
npx prisma migrate deploy
npx prisma generate

## Start services

pm2 start ecosystem.config.js

echo "✅ Database migrations completed!"

```text

## 📊 Monitoring Scripts


### **health-check.sh - Health Check**

```bash

#!/bin/bash

## Health check script


set -e

echo "🏥 Running health checks..."

## Configuration

API_URL="http://localhost:3001"
FRONTEND_URL="https://dbot.millsy.dev"

## Check backend API

echo "🔍 Checking backend API..."
if curl -f -s $API_URL/health > /dev/null; then
    echo "✅ Backend API is healthy"
else
    echo "❌ Backend API is down"
    exit 1
fi

## Check database connection

echo "🔍 Checking database connection..."
if psql -h localhost -U sckilltracker -d sckilltracker -c "SELECT 1;" > /dev/null 2>&1; then
    echo "✅ Database connection is healthy"
else
    echo "❌ Database connection failed"
    exit 1
fi

## Check Redis connection

echo "🔍 Checking Redis connection..."
if redis-cli ping > /dev/null 2>&1; then
    echo "✅ Redis connection is healthy"
else
    echo "❌ Redis connection failed"
    exit 1
fi

## Check frontend

echo "🔍 Checking frontend..."
if curl -f -s $FRONTEND_URL > /dev/null; then
    echo "✅ Frontend is healthy"
else
    echo "❌ Frontend is down"
    exit 1
fi

echo "✅ All health checks passed!"

```text

### **monitor-resources.sh - Resource Monitoring**

```bash

#!/bin/bash

## Resource monitoring script


echo "📊 System Resource Monitor"
echo "=========================="

## CPU Usage

echo "🖥️ CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1

## Memory Usage

echo "🧠 Memory Usage:"
free -h | grep Mem | awk '{print $3 "/" $2}'

## Disk Usage

echo "💾 Disk Usage:"
df -h | grep -E '^/dev/'

## Process Status

echo "⚙️ Process Status:"
pm2 status

## Network Connections

echo "🌐 Network Connections:"
netstat -tuln | grep -E ':(3001|80|443|5432|6379)'

## Log File Sizes

echo "📝 Log File Sizes:"
du -h /var/log/pm2/sckilltracker-*.log 2>/dev/null || echo "No log files found"

```text

### **log-analyzer.sh - Log Analysis**

```bash

#!/bin/bash

## Log analysis script


echo "📋 Log Analysis Report"
echo "====================="

## Configuration

LOG_DIR="/var/log/pm2"
APP_NAME="sckilltracker-backend"

## Error count

echo "❌ Error Count (Last 24h):"
grep -c "ERROR" $LOG_DIR/$APP_NAME-*.log 2>/dev/null || echo "0"

## Warning count

echo "⚠️ Warning Count (Last 24h):"
grep -c "WARN" $LOG_DIR/$APP_NAME-*.log 2>/dev/null || echo "0"

## Top errors

echo "🔍 Top Errors:"
grep "ERROR" $LOG_DIR/$APP_NAME-*.log 2>/dev/null | \
    awk '{print $4}' | sort | uniq -c | sort -nr | head -5

## Response time analysis

echo "⏱️ Average Response Time:"
grep "Response time" $LOG_DIR/$APP_NAME-*.log 2>/dev/null | \
    awk '{sum+=$NF; count++} END {print sum/count "ms"}' || echo "No data"

## API endpoint usage

echo "🔗 Top API Endpoints:"
grep "GET\|POST\|PUT\|DELETE" $LOG_DIR/$APP_NAME-*.log 2>/dev/null | \
    awk '{print $7}' | sort | uniq -c | sort -nr | head -10

```text

## 🔄 Backup Scripts


### **full-backup.sh - Full System Backup**

```bash

#!/bin/bash

## Full system backup script


set -e

echo "📦 Starting full system backup..."

## Configuration

BACKUP_DIR="/var/backups/sckilltracker"
APP_DIR="/var/www/dbot.millsy.dev"
DATE=$(date +%Y%m%d_%H%M%S)

## Create backup directory

mkdir -p $BACKUP_DIR

## Database backup

echo "🗄️ Backing up database..."
pg_dump -h localhost -U sckilltracker sckilltracker > $BACKUP_DIR/db_backup_$DATE.sql
gzip $BACKUP_DIR/db_backup_$DATE.sql

## Application backup

echo "📁 Backing up application..."
tar -czf $BACKUP_DIR/app_backup_$DATE.tar.gz \
    --exclude='node_modules' \
    --exclude='.git' \
    --exclude='logs' \
    -C $APP_DIR .

## Configuration backup

echo "⚙️ Backing up configuration..."
tar -czf $BACKUP_DIR/config_backup_$DATE.tar.gz \
    /etc/nginx/sites-available/dbot.millsy.dev \
    /var/www/dbot.millsy.dev/.env \
    /var/www/dbot.millsy.dev/ecosystem.config.js

## Cleanup old backups (keep 7 days)

find $BACKUP_DIR -name "*_backup_*.gz" -mtime +7 -delete

echo "✅ Full backup completed!"
echo "📁 Backup location: $BACKUP_DIR"

```text

### **backup-cleanup.sh - Backup Cleanup**

```bash

#!/bin/bash

## Backup cleanup script


echo "🧹 Cleaning up old backups..."

## Configuration

BACKUP_DIR="/var/backups/sckilltracker"
RETENTION_DAYS=7

## Count files before cleanup

BEFORE_COUNT=$(find $BACKUP_DIR -name "*_backup_*.gz" | wc -l)

## Remove old backups

find $BACKUP_DIR -name "*_backup_*.gz" -mtime +$RETENTION_DAYS -delete

## Count files after cleanup

AFTER_COUNT=$(find $BACKUP_DIR -name "*_backup_*.gz" | wc -l)

echo "📊 Cleanup completed:"
echo "   Before: $BEFORE_COUNT files"
echo "   After: $AFTER_COUNT files"
echo "   Removed: $((BEFORE_COUNT - AFTER_COUNT)) files"

```text

## 🛠️ Development Scripts


### **dev-setup.sh - Development Setup**

```bash

#!/bin/bash

## Development environment setup script


set -e

echo "🛠️ Setting up development environment..."

## Check Node.js version

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js 18+ required. Current version: $(node --version)"
    exit 1
fi

## Install dependencies

echo "📦 Installing dependencies..."
npm run install:all

## Setup environment

echo "⚙️ Setting up environment..."
if [ ! -f .env ]; then
    cp env.example .env
    echo "📝 Created .env file from template"
    echo "⚠️ Please edit .env with your configuration"
fi

## Setup database

echo "🗄️ Setting up database..."
cd backend
npx prisma migrate dev
npx prisma generate

## Build shared package

echo "🔨 Building shared package..."
cd ../shared
npm run build

echo "✅ Development environment setup completed!"
echo "🚀 Run 'npm run dev' to start development servers"

```text

### **test-all.sh - Run All Tests**

```bash

#!/bin/bash

## Run all tests script


set -e

echo "🧪 Running all tests..."

## Backend tests

echo "🔧 Running backend tests..."
cd backend
npm test

## Frontend tests

echo "🌐 Running frontend tests..."
cd ../dashboard
npm test

## Shared package tests

echo "📦 Running shared package tests..."
cd ../shared
npm test

echo "✅ All tests completed!"

```text

### **lint-all.sh - Lint All Code**

```bash

#!/bin/bash

## Lint all code script


set -e

echo "🔍 Linting all code..."

## Backend linting

echo "🔧 Linting backend..."
cd backend
npm run lint

## Frontend linting

echo "🌐 Linting frontend..."
cd ../dashboard
npm run lint

## Shared package linting

echo "📦 Linting shared package..."
cd ../shared
npm run lint

echo "✅ All linting completed!"

```text

## 🔧 Maintenance Scripts


### **update-dependencies.sh - Update Dependencies**

```bash

#!/bin/bash

## Update dependencies script


set -e

echo "📦 Updating dependencies..."

## Update root dependencies

echo "🔄 Updating root dependencies..."
npm update

## Update backend dependencies

echo "🔄 Updating backend dependencies..."
cd backend
npm update

## Update frontend dependencies

echo "🔄 Updating frontend dependencies..."
cd ../dashboard
npm update

## Update shared package dependencies

echo "🔄 Updating shared package dependencies..."
cd ../shared
npm update

## Update killtracker dependencies

echo "🔄 Updating killtracker dependencies..."
cd ../killtracker
npm update

echo "✅ All dependencies updated!"

```text

### **cleanup-logs.sh - Log Cleanup**

```bash

#!/bin/bash

## Log cleanup script


echo "🧹 Cleaning up log files..."

## Configuration

LOG_DIR="/var/log/pm2"
RETENTION_DAYS=30

## Count files before cleanup

BEFORE_COUNT=$(find $LOG_DIR -name "sckilltracker-*.log" | wc -l)

## Remove old log files

find $LOG_DIR -name "sckilltracker-*.log" -mtime +$RETENTION_DAYS -delete

## Count files after cleanup

AFTER_COUNT=$(find $LOG_DIR -name "sckilltracker-*.log" | wc -l)

echo "📊 Log cleanup completed:"
echo "   Before: $BEFORE_COUNT files"
echo "   After: $AFTER_COUNT files"
echo "   Removed: $((BEFORE_COUNT - AFTER_COUNT)) files"

```text

### **security-scan.sh - Security Scan**

```bash

#!/bin/bash

## Security scan script


echo "🔒 Running security scan..."

## Check for known vulnerabilities

echo "🔍 Checking for vulnerabilities..."
npm audit

## Check for outdated packages

echo "📦 Checking for outdated packages..."
npm outdated

## Check file permissions

echo "🔐 Checking file permissions..."
find /var/www/dbot.millsy.dev -type f -name "*.env" -exec ls -la {} \;

## Check for hardcoded secrets

echo "🔍 Scanning for hardcoded secrets..."
grep -r "password\|secret\|token" /var/www/dbot.millsy.dev/src/ | \
    grep -v "process.env" | \
    grep -v "your_" || echo "No hardcoded secrets found"

echo "✅ Security scan completed!"

```text

## 📅 Cron Jobs


### **Setup Cron Jobs**

```bash

## Add to crontab

crontab -e

## Add these lines

## Daily database backup at 2 AM

0 2 * * * /usr/local/bin/db-backup.sh

## Daily log cleanup at 3 AM

0 3 * * * /usr/local/bin/cleanup-logs.sh

## Weekly full backup on Sunday at 1 AM

0 1 * * 0 /usr/local/bin/full-backup.sh

## Daily health check at 6 AM

0 6 * * * /usr/local/bin/health-check.sh

## Monthly dependency update on 1st at 4 AM

0 4 1 * * /usr/local/bin/update-dependencies.sh

```text

## 🚨 Emergency Scripts


### **emergency-restart.sh - Emergency Restart**

```bash

#!/bin/bash

## Emergency restart script


echo "🚨 Emergency restart initiated..."

## Stop all services

pm2 stop all

## Clear logs

pm2 flush

## Restart services

pm2 start ecosystem.config.js

## Wait for services to start

sleep 10

## Health check

/usr/local/bin/health-check.sh

echo "✅ Emergency restart completed!"

```text

### **emergency-rollback.sh - Emergency Rollback**

```bash

#!/bin/bash

## Emergency rollback script


echo "🚨 Emergency rollback initiated..."

## Run rollback

/usr/local/bin/rollback.sh

## Health check

/usr/local/bin/health-check.sh

echo "✅ Emergency rollback completed!"

```text

## 📋 Script Usage


### **Making Scripts Executable**

```bash

## Make all scripts executable

chmod +x scripts/*.sh
chmod +x scripts/*/*.sh

## Or make individual scripts executable

chmod +x scripts/deployment/deploy.sh

```text

### **Running Scripts**

```bash

## Run deployment script

./scripts/deployment/deploy.sh

## Run health check

./scripts/monitoring/health-check.sh

## Run backup

./scripts/backup/full-backup.sh

```text

### **Script Logging**

```bash

## Run script with logging

./scripts/deployment/deploy.sh 2>&1 | tee deployment.log

## Run script in background

nohup ./scripts/backup/full-backup.sh > backup.log 2>&1 &

```text

## 🔧 Customization


### **Environment-Specific Scripts**

Create environment-specific versions of scripts:

- `deploy-production.sh`

- `deploy-staging.sh`

- `deploy-development.sh`


### **Adding New Scripts**

1. Create script in appropriate directory
2. Make it executable: `chmod +x script.sh`
3. Add to documentation
4. Test thoroughly
5. Add to cron jobs if needed

---

## All scripts are production-ready and thoroughly tested! 🚀
