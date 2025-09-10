# 🤖 Discord Commands Reference


**Date**: December 20, 2024  
**Project**: Star Citizen Discord Bot & Dashboard  
**Status**: ✅ **COMPLETE COMMAND REFERENCE**

---

## 📋 Table of Contents


1. [Core Commands](#core-commands)
2. [Star Citizen Commands](#star-citizen-commands)
3. [Advanced Commands](#advanced-commands)
4. [Social Commands](#social-commands)
5. [Utility Commands](#utility-commands)
6. [Moderation Commands](#moderation-commands)
7. [Fun Commands](#fun-commands)
8. [Music Commands](#music-commands)
9. [Leveling Commands](#leveling-commands)
10. [Giveaway Commands](#giveaway-commands)

---

## 🎯 Core Commands


### `/help`

**Description**: Display help information and command list  
**Usage**: `/help [command]`  
**Permissions**: Everyone  
**Example**: `/help stats`

### `/ping`

**Description**: Check bot latency and status  
**Usage**: `/ping`  
**Permissions**: Everyone  
**Example**: `/ping`

### `/stats`

**Description**: View personal kill statistics  
**Usage**: `/stats [user]`  
**Permissions**: Everyone  
**Example**: `/stats @username`

### `/leaderboard`

**Description**: Display server leaderboards  
**Usage**: `/leaderboard [type] [period]`  
**Permissions**: Everyone  
**Example**: `/leaderboard kills weekly`

### `/mykills`

**Description**: View personal kill history  
**Usage**: `/mykills [limit]`  
**Permissions**: Everyone  
**Example**: `/mykills 10`

---

## 🚀 Star Citizen Commands


### Ship Commands

#### `/ship`

**Description**: Get ship information and specifications  
**Usage**: `/ship <name>`  
**Permissions**: Everyone  
**Example**: `/ship Gladius`

### Player Commands

#### `/player`

**Description**: Look up player information  
**Usage**: `/player <handle>`  
**Permissions**: Everyone  
**Example**: `/player TestUser`

### Location Commands

#### `/location`

**Description**: Get location details and information  
**Usage**: `/location <name>`  
**Permissions**: Everyone  
**Example**: `/location New Babbage`

### Fleet Commands

#### `/fleet`

**Description**: Fleet management and information  
**Usage**: `/fleet [subcommand]`  
**Permissions**: Everyone  
**Example**: `/fleet info`

### Organization Commands

#### `/org`

**Description**: Organization information and management  
**Usage**: `/org [subcommand]`  
**Permissions**: Everyone  
**Example**: `/org info`

### System Commands

#### `/system`

**Description**: System information and status  
**Usage**: `/system [subcommand]`  
**Permissions**: Everyone  
**Example**: `/system status`

### Status Commands

#### `/status`

**Description**: Server status and information  
**Usage**: `/status [subcommand]`  
**Permissions**: Everyone  
**Example**: `/status server`

### Manufacturer Commands

#### `/manufacturer`

**Description**: Ship manufacturer information  
**Usage**: `/manufacturer <name>`  
**Permissions**: Everyone  
**Example**: `/manufacturer Anvil`

### Trade Commands

#### `/trade`

**Description**: Trading information and routes  
**Usage**: `/trade [subcommand]`  
**Permissions**: Everyone  
**Example**: `/trade routes`

### Mining Commands

#### `/mining`

**Description**: Mining locations and resources  
**Usage**: `/mining [subcommand]`  
**Permissions**: Everyone  
**Example**: `/mining locations`

### Station Commands

#### `/station`

**Description**: Station information and services  
**Usage**: `/station <name>`  
**Permissions**: Everyone  
**Example**: `/station Port Olisar`

### Hangar Commands

#### `/hangar`

**Description**: Personal hangar management  
**Usage**: `/hangar [subcommand]`  
**Permissions**: Everyone  
**Example**: `/hangar list`

### Verification Commands

#### `/verify`

**Description**: Account verification system  
**Usage**: `/verify [subcommand]`  
**Permissions**: Everyone  
**Example**: `/verify status`

### Role Commands

#### `/roles`

**Description**: Role management and assignment  
**Usage**: `/roles [subcommand]`  
**Permissions**: Moderator+  
**Example**: `/roles assign @user`

### Nickname Commands

#### `/nickname`

**Description**: Nickname formatting and management  
**Usage**: `/nickname [subcommand]`  
**Permissions**: Moderator+  
**Example**: `/nickname set @user`

---

## ⚡ Advanced Commands


### Custom Commands

#### `/custom`

**Description**: Server-specific command creation and management  
**Usage**: `/custom [subcommand]`  
**Permissions**: Server Admin+  
**Subcommands**:

- `create <name> <response>` - Create custom command

- `delete <name>` - Delete custom command

- `list` - List all custom commands

- `edit <name> <response>` - Edit custom command


**Example**: `/custom create welcome Welcome to our server!`

### Webhook Management

#### `/webhook`

**Description**: Webhook endpoint management  
**Usage**: `/webhook [subcommand]`  
**Permissions**: Server Admin+  
**Subcommands**:

- `create <name> <url>` - Create webhook

- `test <name>` - Test webhook

- `delete <name>` - Delete webhook

- `list` - List all webhooks

- `toggle <name>` - Enable/disable webhook


**Example**: `/webhook create killfeed https://example.com/webhook`

### Analytics Commands

#### `/analytics`

**Description**: Detailed analytics and statistics  
**Usage**: `/analytics [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `kills` - Kill analytics

- `weapons` - Weapon statistics

- `trends` - Trend analysis

- `leaderboard` - Advanced leaderboard


**Example**: `/analytics kills weekly`

### Mission System

#### `/mission`

**Description**: Mission tracking and management  
**Usage**: `/mission [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `start <title> <description>` - Start mission

- `complete <mission-id>` - Complete mission

- `abandon <mission-id>` - Abandon mission

- `list [status]` - List missions

- `info <mission-id>` - Mission details

- `stats` - Mission statistics


**Example**: `/mission start "Bounty Hunt" "Eliminate target"`

### Achievement System

#### `/achievements`

**Description**: Achievement system management  
**Usage**: `/achievements [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `list` - List achievements

- `user <user>` - User achievements

- `progress` - Achievement progress

- `leaderboard` - Achievement leaderboard


**Example**: `/achievements user @username`

### Tournament System

#### `/tournament`

**Description**: Tournament management and participation  
**Usage**: `/tournament [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `create <name> <type>` - Create tournament

- `join <tournament-id>` - Join tournament

- `leave <tournament-id>` - Leave tournament

- `list` - List tournaments

- `info <tournament-id>` - Tournament details

- `stats` - Tournament statistics


**Example**: `/tournament create "Kill Competition" "elimination"`

### Voice Integration

#### `/voice`

**Description**: Voice channel management and TTS  
**Usage**: `/voice [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `join` - Join voice channel

- `leave` - Leave voice channel

- `tts <message>` - Text-to-speech

- `play <sound>` - Play sound effect

- `settings` - Voice settings


**Example**: `/voice tts "Welcome to the server!"`

### Stream Integration

#### `/stream`

**Description**: Stream overlay and integration management  
**Usage**: `/stream [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `overlay <type>` - Generate overlay URL

- `scene <name>` - Create stream scene

- `token <overlay>` - Generate access token

- `test` - Test stream integration


**Example**: `/stream overlay killfeed`

### Kill Feed Management

#### `/killfeed`

**Description**: Advanced kill feed management  
**Usage**: `/killfeed [subcommand]`  
**Permissions**: Moderator+  
**Subcommands**:

- `setup <channel> <format>` - Setup kill feed

- `filter <options>` - Configure filters

- `preset <preset>` - Apply filter preset

- `settings <options>` - Display settings

- `stats [period]` - Kill feed statistics

- `test <options>` - Test kill feed

- `toggle <enabled>` - Toggle kill feed

- `status` - Kill feed status


**Example**: `/killfeed setup #killfeed embed`

---

## 👥 Social Commands


### Friend Management

#### `/friend`

**Description**: Friend list management  
**Usage**: `/friend [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `add <user>` - Add friend

- `remove <user>` - Remove friend

- `list` - List friends

- `requests` - Friend requests


**Example**: `/friend add @username`

### Group Management

#### `/group`

**Description**: Group creation and management  
**Usage**: `/group [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `create <name>` - Create group

- `join <group-id>` - Join group

- `leave <group-id>` - Leave group

- `invite <user> <group-id>` - Invite to group

- `list` - List groups

- `info <group-id>` - Group information


**Example**: `/group create "Elite Pilots"`

### Marketplace

#### `/marketplace`

**Description**: Virtual item trading and marketplace  
**Usage**: `/marketplace [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `browse [category]` - Browse marketplace

- `sell <item> <price>` - List item for sale

- `buy <listing-id>` - Purchase item

- `orders` - View orders

- `wishlist` - Manage wishlist

- `watchlist` - Manage watchlist


**Example**: `/marketplace sell "Rare Ship" 1000000`

### Community Events

#### `/events`

**Description**: Community event management  
**Usage**: `/events [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `create <title> <description>` - Create event

- `join <event-id>` - Join event

- `leave <event-id>` - Leave event

- `list` - List events

- `info <event-id>` - Event details

- `stats` - Event statistics


**Example**: `/events create "Fleet Battle" "Large scale PvP event"`

---

## 🛠️ Utility Commands


### Time Commands

#### `/time`

**Description**: Time conversion and timezone utilities  
**Usage**: `/time [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `convert <time> <timezone>` - Convert time

- `world` - World clock

- `timezone <timezone>` - Timezone information


**Example**: `/time convert "12:00 PM" "UTC"`

### Calculator

#### `/calc`

**Description**: Mathematical calculations  
**Usage**: `/calc <expression>`  
**Permissions**: Everyone  
**Example**: `/calc 2 + 2 * 3`

### Random Commands

#### `/random`

**Description**: Random number generation  
**Usage**: `/random [min] [max]`  
**Permissions**: Everyone  
**Example**: `/random 1 100`

### Text Commands

#### `/text`

**Description**: Text manipulation utilities  
**Usage**: `/text [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `reverse <text>` - Reverse text

- `uppercase <text>` - Convert to uppercase

- `lowercase <text>` - Convert to lowercase

- `length <text>` - Get text length


**Example**: `/text reverse "Hello World"`

### URL Commands

#### `/url`

**Description**: URL utilities and shorteners  
**Usage**: `/url [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `shorten <url>` - Shorten URL

- `expand <short-url>` - Expand short URL

- `qr <url>` - Generate QR code


**Example**: `/url shorten https://example.com`

### Weather Commands

#### `/weather`

**Description**: Weather information  
**Usage**: `/weather <location>`  
**Permissions**: Everyone  
**Example**: `/weather New York`

### Unit Conversion

#### `/convert`

**Description**: Unit conversion utilities  
**Usage**: `/convert <value> <unit>`  
**Permissions**: Everyone  
**Example**: `/convert 100 km miles`

### Color Commands

#### `/color`

**Description**: Color information and utilities  
**Usage**: `/color <hex>`  
**Permissions**: Everyone  
**Example**: `/color #FF0000`

### Hash Commands

#### `/hash`

**Description**: Hash generation utilities  
**Usage**: `/hash <text> <algorithm>`  
**Permissions**: Everyone  
**Example**: `/hash "Hello" md5`

### Base64 Commands

#### `/base64`

**Description**: Base64 encoding and decoding  
**Usage**: `/base64 [encode/decode] <text>`  
**Permissions**: Everyone  
**Example**: `/base64 encode "Hello World"`

### UUID Commands

#### `/uuid`

**Description**: UUID generation  
**Usage**: `/uuid [count]`  
**Permissions**: Everyone  
**Example**: `/uuid 5`

### Password Commands

#### `/password`

**Description**: Password generation  
**Usage**: `/password [length] [options]`  
**Permissions**: Everyone  
**Example**: `/password 16`

### Reminder Commands

#### `/reminder`

**Description**: Reminder system  
**Usage**: `/reminder [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `create <message> <time>` - Create reminder

- `list` - List reminders

- `delete <id>` - Delete reminder

- `edit <id> <message>` - Edit reminder

- `snooze <id> <time>` - Snooze reminder

- `stats` - Reminder statistics


**Example**: `/reminder create "Check server" "in 1 hour"`

---

## 🛡️ Moderation Commands


### Rules Management

#### `/rules`

**Description**: Server rules management  
**Usage**: `/rules [subcommand]`  
**Permissions**: Moderator+  
**Subcommands**:

- `setup` - Setup rules system

- `send` - Send rules to channel

- `add <rule>` - Add new rule

- `remove <number>` - Remove rule

- `edit <number> <rule>` - Edit rule

- `list` - List all rules

- `violation <user> <rule>` - Report violation

- `warnings <user>` - View user warnings

- `clear-warnings <user>` - Clear user warnings

- `stats` - Rules statistics


**Example**: `/rules add "No spam in general chat"`

### Auto-Moderation

#### `/automod`

**Description**: Auto-moderation configuration  
**Usage**: `/automod [subcommand]`  
**Permissions**: Server Admin+  
**Subcommands**:

- `setup` - Setup auto-moderation

- `config` - Configure auto-moderation

- `status` - Auto-moderation status


**Example**: `/automod setup`

### Moderation Actions

#### `/mod`

**Description**: Moderation actions  
**Usage**: `/mod [subcommand]`  
**Permissions**: Moderator+  
**Subcommands**:

- `warn <user> <reason>` - Issue warning

- `mute <user> <duration>` - Mute user

- `unmute <user>` - Unmute user

- `kick <user> <reason>` - Kick user

- `ban <user> <reason>` - Ban user

- `unban <user>` - Unban user

- `timeout <user> <duration>` - Timeout user

- `history <user>` - User moderation history


**Example**: `/mod warn @user "Spamming in chat"`

---

## 🎉 Fun Commands


### Magic 8-Ball

#### `/8ball`

**Description**: Magic 8-ball fortune telling  
**Usage**: `/8ball <question>`  
**Permissions**: Everyone  
**Example**: `/8ball "Will I win today?"`

### Jokes

#### `/joke`

**Description**: Random jokes  
**Usage**: `/joke`  
**Permissions**: Everyone  
**Example**: `/joke`

### Dice Rolling

#### `/roll`

**Description**: Dice rolling  
**Usage**: `/roll [sides]`  
**Permissions**: Everyone  
**Example**: `/roll 20`

### Coin Flipping

#### `/flip`

**Description**: Coin flipping  
**Usage**: `/flip`  
**Permissions**: Everyone  
**Example**: `/flip`

### Random Choice

#### `/choose`

**Description**: Random choice selection  
**Usage**: `/choose <options>`  
**Permissions**: Everyone  
**Example**: `/choose "Option 1, Option 2, Option 3"`

### Memes

#### `/meme`

**Description**: Random memes  
**Usage**: `/meme`  
**Permissions**: Everyone  
**Example**: `/meme`

### Quotes

#### `/quote`

**Description**: Random quotes  
**Usage**: `/quote`  
**Permissions**: Everyone  
**Example**: `/quote`

### Facts

#### `/fact`

**Description**: Random facts  
**Usage**: `/fact`  
**Permissions**: Everyone  
**Example**: `/fact`

### Trivia

#### `/trivia`

**Description**: Trivia questions  
**Usage**: `/trivia`  
**Permissions**: Everyone  
**Example**: `/trivia`

### Riddles

#### `/riddle`

**Description**: Riddles  
**Usage**: `/riddle`  
**Permissions**: Everyone  
**Example**: `/riddle`

---

## 🎵 Music Commands


### Playback Control

#### `/play`

**Description**: Play music  
**Usage**: `/play <query>`  
**Permissions**: Everyone  
**Example**: `/play "Never Gonna Give You Up"`

#### `/skip`

**Description**: Skip current track  
**Usage**: `/skip`  
**Permissions**: Everyone  
**Example**: `/skip`

#### `/stop`

**Description**: Stop music  
**Usage**: `/stop`  
**Permissions**: Everyone  
**Example**: `/stop`

#### `/pause`

**Description**: Pause music  
**Usage**: `/pause`  
**Permissions**: Everyone  
**Example**: `/pause`

#### `/resume`

**Description**: Resume music  
**Usage**: `/resume`  
**Permissions**: Everyone  
**Example**: `/resume`

### Queue Management

#### `/queue`

**Description**: View music queue  
**Usage**: `/queue`  
**Permissions**: Everyone  
**Example**: `/queue`

#### `/clear`

**Description**: Clear music queue  
**Usage**: `/clear`  
**Permissions**: Everyone  
**Example**: `/clear`

#### `/remove`

**Description**: Remove track from queue  
**Usage**: `/remove <position>`  
**Permissions**: Everyone  
**Example**: `/remove 3`

### Volume Control

#### `/volume`

**Description**: Adjust volume  
**Usage**: `/volume <level>`  
**Permissions**: Everyone  
**Example**: `/volume 50`

### Playback Options

#### `/loop`

**Description**: Toggle loop mode  
**Usage**: `/loop`  
**Permissions**: Everyone  
**Example**: `/loop`

#### `/shuffle`

**Description**: Shuffle queue  
**Usage**: `/shuffle`  
**Permissions**: Everyone  
**Example**: `/shuffle`

### Information

#### `/nowplaying`

**Description**: Current track information  
**Usage**: `/nowplaying`  
**Permissions**: Everyone  
**Example**: `/nowplaying`

#### `/lyrics`

**Description**: Get song lyrics  
**Usage**: `/lyrics [song]`  
**Permissions**: Everyone  
**Example**: `/lyrics`

---

## 🏆 Leveling Commands


### User Information

#### `/rank`

**Description**: View user rank and level  
**Usage**: `/rank [user]`  
**Permissions**: Everyone  
**Example**: `/rank @username`

#### `/leaderboard`

**Description**: Level leaderboard  
**Usage**: `/leaderboard`  
**Permissions**: Everyone  
**Example**: `/leaderboard`

### XP Management

#### `/xp-give`

**Description**: Award XP to user  
**Usage**: `/xp-give <user> <amount>`  
**Permissions**: Moderator+  
**Example**: `/xp-give @user 100`

#### `/xp-remove`

**Description**: Remove XP from user  
**Usage**: `/xp-remove <user> <amount>`  
**Permissions**: Moderator+  
**Example**: `/xp-remove @user 50`

### Configuration

#### `/level-config`

**Description**: Level system configuration  
**Usage**: `/level-config [subcommand]`  
**Permissions**: Server Admin+  
**Example**: `/level-config xp-rate 10`

#### `/role-rewards`

**Description**: Role reward configuration  
**Usage**: `/role-rewards [subcommand]`  
**Permissions**: Server Admin+  
**Example**: `/role-rewards add @role 10`

### Statistics

#### `/level-stats`

**Description**: Level system statistics  
**Usage**: `/level-stats`  
**Permissions**: Everyone  
**Example**: `/level-stats`

#### `/level-reset`

**Description**: Reset user levels  
**Usage**: `/level-reset <user>`  
**Permissions**: Server Admin+  
**Example**: `/level-reset @user`

---

## 🎁 Giveaway Commands


### Giveaway Management

#### `/giveaway`

**Description**: Giveaway creation and management  
**Usage**: `/giveaway [subcommand]`  
**Permissions**: Moderator+  
**Subcommands**:

- `create <prize> <duration>` - Create giveaway

- `end <giveaway-id>` - End giveaway

- `reroll <giveaway-id>` - Reroll winners

- `list` - List giveaways

- `join <giveaway-id>` - Join giveaway


**Example**: `/giveaway create "Discord Nitro" "1 hour"`

#### `/quick-giveaway`

**Description**: Quick giveaway creation  
**Usage**: `/quick-giveaway <prize> <duration>`  
**Permissions**: Moderator+  
**Example**: `/quick-giveaway "Game Key" "30 minutes"`

### Templates and Analytics

#### `/giveaway-template`

**Description**: Giveaway template management  
**Usage**: `/giveaway-template [subcommand]`  
**Permissions**: Server Admin+  
**Example**: `/giveaway-template create "Nitro Giveaway"`

#### `/giveaway-analytics`

**Description**: Giveaway analytics  
**Usage**: `/giveaway-analytics`  
**Permissions**: Server Admin+  
**Example**: `/giveaway-analytics`

---

## 📰 News Commands


### Star Citizen News

#### `/news`

**Description**: Star Citizen news and updates  
**Usage**: `/news [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `latest` - Latest news

- `commlink` - Comm-Link posts

- `roadmap` - Roadmap updates

- `search <query>` - Search news


**Example**: `/news latest`

### Patch Notes

#### `/patchnotes`

**Description**: Star Citizen patch notes  
**Usage**: `/patchnotes [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `latest` - Latest patch notes

- `version <version>` - Specific version

- `changes` - Recent changes

- `known-issues` - Known issues


**Example**: `/patchnotes latest`

---

## 📊 Log Management Commands


### Log Settings

#### `/logs`

**Description**: Log management and configuration  
**Usage**: `/logs [subcommand]`  
**Permissions**: Server Admin+  
**Subcommands**:

- `setup` - Setup log channels

- `check` - Check log status

- `test` - Test log functionality

- `view [category]` - View logs

- `stats` - Log statistics

- `clear` - Clear logs

- `export` - Export logs

- `configure` - Configure log settings


**Example**: `/logs setup`

### Log Monitoring

#### `/logmonitor`

**Description**: Log monitoring and alerts  
**Usage**: `/logmonitor [subcommand]`  
**Permissions**: Server Admin+  
**Subcommands**:

- `start` - Start log monitoring

- `stop` - Stop log monitoring

- `status` - Monitor status

- `alerts` - Configure alerts


**Example**: `/logmonitor start`

---

## 🎫 Feedback Commands


### Feedback System

#### `/feedback`

**Description**: User feedback submission  
**Usage**: `/feedback [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `submit <type> <message>` - Submit feedback

- `list [status]` - List feedback

- `view <id>` - View feedback details

- `stats` - Feedback statistics


**Example**: `/feedback submit bug "Bot not responding"`

### Support System

#### `/support`

**Description**: Support ticket system  
**Usage**: `/support [subcommand]`  
**Permissions**: Everyone  
**Subcommands**:

- `ticket <type> <subject>` - Create support ticket

- `tickets [status]` - List support tickets

- `view <id>` - View ticket details

- `stats` - Support statistics

- `help` - Support help


**Example**: `/support ticket technical "Login issues"`

---

## 🔧 Command Permissions


### Permission Levels

- **Everyone**: All users can use these commands

- **Member**: Server members and above

- **Moderator**: Server moderators and above

- **Server Admin**: Server administrators and above

- **Bot Owner**: Bot owner only


### Role Requirements

- **@everyone**: No special role required

- **@Member**: Basic server member

- **@Moderator**: Moderator role

- **@Admin**: Administrator role

- **@Bot Owner**: Bot owner role


---

## 📝 Command Usage Tips


### Best Practices

1. **Use proper syntax**: Follow the exact command format
2. **Check permissions**: Ensure you have the required permissions
3. **Use subcommands**: Many commands have subcommands for specific actions
4. **Provide examples**: Use the examples provided for reference
5. **Read descriptions**: Command descriptions explain what each command does

### Common Issues

1. **Permission denied**: Check your role and permissions
2. **Invalid syntax**: Verify command format and parameters
3. **Command not found**: Ensure the command is properly registered
4. **Rate limited**: Wait before using the command again

---

## 🆘 Getting Help


### Support Resources

- **Help Command**: Use `/help` for command information

- **Documentation**: Check the comprehensive documentation

- **Support Tickets**: Use `/support ticket` for issues

- **Feedback**: Use `/feedback submit` for suggestions


### Command Discovery

- **Slash Commands**: Use Discord's slash command autocomplete

- **Help System**: Built-in help system with examples

- **Command Categories**: Commands are organized by category

- **Search Function**: Use `/help [command]` to search for specific commands


---

*Command Reference completed on: December 20, 2024*  
*Discord Commands Reference by: AI Assistant*  
*Status: ✅ COMPLETE COMMAND REFERENCE*
