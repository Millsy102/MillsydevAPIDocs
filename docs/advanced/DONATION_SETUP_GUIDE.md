# 💳 Donation System Setup Guide


This guide will help you set up the complete donation system for your Discord bot, including PayPal integration and automatic role assignment.

## 🗄️ Database Setup


### 1. Run Database Migration


```bash

cd backend
npx prisma migrate dev --name add_donation_system

```text

This will create the following tables:

- `donations` - Stores all donation records

- `DonationStatus` enum - Tracks donation states


### 2. Verify Database Schema


The migration adds these models to your Prisma schema:

```prisma

model Donation {
  id              String   @id @default(cuid())
  discordId       String
  paypalId        String   @unique
  amount          Decimal
  currency        String   @default("USD")
  status          DonationStatus @default(PENDING)
  paypalOrderId   String?
  paypalPayerId   String?
  paypalEmail     String?
  discordUsername String?
  discordGuildId  String?
  roleAssigned    Boolean  @default(false)
  roleAssignedAt  DateTime?
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt
}

enum DonationStatus {
  PENDING
  COMPLETED
  FAILED
  REFUNDED
  CANCELLED
}

```text

## 🔧 Environment Variables


Add these to your `.env` file:

```env

## PayPal Integration

PAYPAL_CLIENT_ID="your_paypal_client_id_here"
PAYPAL_CLIENT_SECRET="your_paypal_client_secret_here"
PAYPAL_WEBHOOK_ID="your_paypal_webhook_id_here"
PAYPAL_MODE="sandbox" # or "live" for production

## Bot Owner ID (for admin commands)

BOT_OWNER_ID="your_discord_user_id_here"

```text

## 💰 PayPal Integration


### 1. Create PayPal App


1. Go to [PayPal Developer Dashboard](https://developer.paypal.com/)
2. Create a new app
3. Get your Client ID and Client Secret
4. Set up webhooks

### 2. Configure Webhook


**Webhook URL:** `https://yourdomain.com/api/donations/webhook/paypal`

## Events to Subscribe:

- `PAYMENT.CAPTURE.COMPLETED`

- `PAYMENT.CAPTURE.DENIED`

- `PAYMENT.CAPTURE.FAILED`

- `PAYMENT.CAPTURE.REFUNDED`


### 3. Test PayPal Integration


Use PayPal's sandbox mode for testing:

- Set `PAYPAL_MODE="sandbox"`

- Use sandbox credentials

- Test with sandbox accounts


## 🤖 Discord Bot Setup


### 1. Register Commands


The donation commands are automatically registered:

- `/donation-status` - Check donation status

- `/assign-donator-role` - Manually assign donator role (admin)

- `/remove-donator-role` - Remove donator role (admin)

- `/list-donators` - List all donators (admin)


### 2. Setup Command Integration


The `/setup` command now automatically:

- Creates a "Donator" role (gold color #FFD700)

- Checks for completed donations

- Assigns donator role to users with completed donations


### 3. Permission System


Donation commands are integrated with your permission system:

- `donation-status` - Available to all users

- Admin commands - Bot owner only (you control access)


## 🎛️ Dashboard Integration


### 1. Add DonationManager Component


Import and use the `DonationManager` component in your admin dashboard:

```tsx

import { DonationManager } from '@/components/DonationManager';

// In your admin dashboard
<DonationManager />

```text

### 2. Add DonationButton Component


For user-facing donation buttons:

```tsx

import { DonationButton, DonationStatus } from '@/components/DonationButton';

// Donation button
<DonationButton 
  discordId={user.discordId}
  discordUsername={user.username}
  discordGuildId={guildId}
/>

// Check donation status
<DonationStatus discordId={user.discordId} />

```text

## 🔄 How It Works


### 1. User Donation Flow


1. **User clicks donate** → Creates donation record
2. **PayPal processes payment** → Webhook updates status
3. **User runs `/setup`** → Bot checks donation status
4. **Role assignment** → Donator role assigned automatically

### 2. Admin Management


1. **Dashboard view** → See all donations and pending roles
2. **Manual assignment** → Assign roles for users who haven't run `/setup`
3. **Statistics** → Track donation revenue and user engagement

### 3. Command Usage


```bash

## Check your donation status

/donation-status

## Check someone else's status (admin only)

/donation-status user:@username

## Manually assign donator role (admin only)

/assign-donator-role user:@username reason:Manual assignment

## List all donators (admin only)

/list-donators limit:10

```text

## 🧪 Testing


### 1. Test Donation Creation


```bash

curl -X POST http://localhost:3001/api/donations/create \
  -H "Content-Type: application/json" \
  -d '{
    "discordId": "123456789",
    "paypalId": "test_donation_123",
    "amount": 10,
    "currency": "USD",
    "discordUsername": "TestUser"
  }'

```text

### 2. Test Role Assignment


1. Create a test donation with `status: "COMPLETED"`
2. Run `/setup` command
3. Verify donator role is assigned

### 3. Test Admin Commands


1. Use `/donation-status` to check status
2. Use `/list-donators` to see role holders
3. Use `/assign-donator-role` for manual assignment

## 🚀 Production Deployment


### 1. Switch to Live PayPal


```env

PAYPAL_MODE="live"
PAYPAL_CLIENT_ID="your_live_client_id"
PAYPAL_CLIENT_SECRET="your_live_client_secret"

```text

### 2. Update Webhook URL


Change webhook URL to your production domain:
`https://yourdomain.com/api/donations/webhook/paypal`

### 3. Test Everything


- Test donation flow end-to-end

- Verify webhook processing

- Confirm role assignments work

- Check admin dashboard functionality


## 📊 Monitoring


### 1. Dashboard Analytics


The `DonationManager` provides:

- Total revenue tracking

- Donation count statistics

- Pending role assignments

- User engagement metrics


### 2. Logs


Monitor these logs for issues:

- Donation creation/updates

- Role assignment attempts

- PayPal webhook processing

- Permission system checks


### 3. Database Queries


Useful queries for monitoring:

```sql

-- Total revenue
SELECT SUM(amount) FROM donations WHERE status = 'COMPLETED';

-- Pending role assignments
SELECT COUNT(*) FROM donations 
WHERE status = 'COMPLETED' AND roleAssigned = false;

-- Recent donations
SELECT * FROM donations 
WHERE status = 'COMPLETED' 
ORDER BY createdAt DESC 
LIMIT 10;

```text

## 🛠️ Troubleshooting


### Common Issues


1. **Role not assigned after donation**

   - Check if user ran `/setup` command

   - Verify donation status is "COMPLETED"

   - Check bot permissions in Discord


2. **PayPal webhook not working**

   - Verify webhook URL is correct

   - Check webhook events are subscribed

   - Test with PayPal webhook simulator


3. **Permission denied errors**

   - Ensure bot has "Manage Roles" permission

   - Check role hierarchy (donator role below bot role)

   - Verify user has proper permissions


### Debug Commands


```bash

## Check donation status

/donation-status

## List all donators

/list-donators

## Check bot permissions

/server

```text

## 🎉 Success

Once everything is set up, you'll have:

✅ **Automatic role assignment** for donors  
✅ **Admin dashboard** for donation management  
✅ **PayPal integration** with webhook processing  
✅ **Permission system** integration  
✅ **Command management** for admins  
✅ **Statistics tracking** and analytics  

Your donation system is now fully functional and integrated with your existing bot infrastructure!
