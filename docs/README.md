# MILLSY.dev Star Citizen Kill Tracker Documentation

> **Professional Discord bot system for comprehensive Star Citizen kill tracking and analytics**

Welcome to the Star Citizen Kill Tracker documentation. This comprehensive system provides real-time kill tracking, detailed analytics, and seamless integration across Discord, web dashboard, and desktop applications.

## Project Overview

The Star Citizen Kill Tracker is a complete ecosystem designed for Star Citizen players and communities:

- **Discord Bot** - Real-time kill tracking and community management
- **Web Dashboard** - Advanced analytics and configuration management  
- **Desktop Application** - Native CMake-built .exe for automated game log monitoring
- **API System** - RESTful API for third-party integrations

## Quick Start

### Prerequisites

- Node.js 18 or higher
- PostgreSQL 13 or higher
- Redis server
- Access to Star Citizen game logs

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd dbot2

# Install all dependencies
npm run install:all

# Configure environment
cp env.example .env
# Edit .env with your configuration

# Initialize database
npm run db:migrate
npm run db:seed

# Start development environment
npm run dev
```

### Services

After installation, the following services will be available:

- **Web Dashboard**: http://localhost:3000
- **API Server**: http://localhost:3001
- **Desktop Application**: Launches automatically

## Documentation Structure

### Getting Started
- [Environment Configuration](./getting-started/environment.md) - System configuration

### User Guides
- [Discord Commands](./usage/discord-commands.md) - Bot command reference
- [Dashboard Usage](./usage/dashboard.md) - Web interface guide
- [Updated Dashboard Guide](./usage/updated-dashboard-guide.md) - Latest dashboard features

### Technical Documentation
- [Implementation Guide](./technical/STAR_CITIZEN_IMPLEMENTATION_GUIDE.md) - Core implementation details
- [API Reference](./api/) - Complete API documentation
- [Deployment Guide](./technical/deployment.md) - Production deployment
- [Security Audit](./technical/SECURITY_AUDIT.md) - Security analysis

### Advanced Features
- [Bot Integration](./advanced/bot-integration.md) - Advanced bot configuration
- [Dashboard Bot Control](./advanced/dashboard-bot-control.md) - Bot management system
- [Discord Commands Reference](./advanced/DISCORD_COMMANDS_REFERENCE.md) - Complete command list
- [Unified Dashboard System](./advanced/unified-dashboard-system.md) - Advanced dashboard features

### Support
- [Troubleshooting](./help/troubleshooting.md) - Common issues and solutions
- [FAQ](./help/faq.md) - Frequently asked questions
- [Contributing](./help/contributing.md) - Development contribution guide

## Project Architecture

```
dbot2/
├── backend/          # Discord bot and API server
├── dashboard/        # React web application
├── killtracker/      # Electron desktop application
├── shared/           # Shared utilities and types
└── docs/             # Documentation
```

## Common Issues

### Bot Not Responding
Verify your Discord bot token is correctly configured in the `.env` file.

### Dashboard Connection Issues
Ensure the backend API server is running on port 3001.

### Database Connection Errors
Check your PostgreSQL connection settings and ensure the database is accessible.

### Kill Tracking Not Working
Verify Star Citizen is running and the log file paths are correctly configured.

## Support

For additional support:

1. Review the [Troubleshooting Guide](./help/troubleshooting.md)
2. Check the [FAQ](./help/faq.md)
3. Create an issue on GitHub
4. Contact support through Discord

## License

MIT License - See LICENSE file for complete terms.

---

*© 2025 MILLSY.dev | Professional Star Citizen Integration Solutions*
