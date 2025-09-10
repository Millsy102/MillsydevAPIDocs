# 🤝 Contributing Guide

> **Help make the Star Citizen Kill Tracker even better!**

## How to Contribute

We welcome contributions from everyone! Whether you're fixing bugs, adding features, or improving documentation, your help makes this project better for everyone.

## Ways to Contribute

### **🐛 Bug Fixes**

- Fix bugs you encounter

- Improve error handling

- Add better validation

- Optimize performance


### **✨ New Features**

- Add new Discord commands

- Improve the dashboard

- Enhance the desktop app

- Add new integrations


### **📚 Documentation**

- Improve existing guides

- Add new tutorials

- Fix typos and errors

- Translate to other languages


### **🧪 Testing**

- Test new features

- Report bugs

- Improve test coverage

- Performance testing


## Getting Started


### **1. Fork the Repository**

1. Go to the GitHub repository
2. Click "Fork" in the top right
3. Clone your fork locally:

   ```bash

   git clone https://github.com/YOUR_USERNAME/dbot2.git
   cd dbot2

   ```

### **2. Set Up Development Environment**

```bash

## Install dependencies

npm run install:all

## Set up environment

cp env.example .env

## Edit .env with your settings


## Set up database

cd backend
npx prisma migrate dev
npx prisma generate

```text

### **3. Create a Branch**

```bash

## Create a new branch for your changes

git checkout -b feature/your-feature-name

## Or for bug fixes

git checkout -b fix/your-bug-fix

```text

### **4. Make Your Changes**

- Write your code

- Add tests if applicable

- Update documentation

- Test your changes


### **5. Test Your Changes**

```bash

## Test backend

cd backend
npm test

## Test frontend

cd dashboard
npm test

## Test desktop app

cd killtracker
npm test

```text

### **6. Submit a Pull Request**

1. Commit your changes:

   ```bash

   git add .
   git commit -m "Add: your feature description"

   ```

2. Push to your fork:

   ```bash

   git push origin feature/your-feature-name

   ```

3. Create a Pull Request on GitHub

## Development Guidelines


### **Code Style**

- Use TypeScript for all new code

- Follow existing code patterns

- Use meaningful variable names

- Add comments for complex logic

- Keep functions small and focused


### **Commit Messages**

Use clear, descriptive commit messages:

```text

Add: New Discord command for kill statistics
Fix: Database connection timeout issue
Update: Improve error handling in dashboard
Remove: Unused API endpoint

```text

### **Pull Request Guidelines**

- **Title**: Clear description of changes

- **Description**: Explain what you changed and why

- **Testing**: Describe how you tested your changes

- **Screenshots**: Include screenshots for UI changes

- **Breaking Changes**: Note any breaking changes


### **Code Review Process**

1. **Automated Checks**: CI/CD runs tests and linting
2. **Manual Review**: Maintainers review your code
3. **Feedback**: Address any requested changes
4. **Approval**: Once approved, your PR will be merged

## Project Structure


### **Backend (`/backend`)**

- **`src/bot/`** - Discord bot implementation

- **`src/routes/`** - API routes

- **`src/services/`** - Business logic

- **`src/utils/`** - Utility functions

- **`prisma/`** - Database schema and migrations


### **Frontend (`/dashboard`)**

- **`src/components/`** - React components

- **`src/pages/`** - Page components

- **`src/hooks/`** - Custom React hooks

- **`src/services/`** - API services

- **`src/utils/`** - Utility functions


### **Desktop App (`/killtracker`)**

- **`src/main.ts`** - Electron main process

- **`src/renderer/`** - Renderer process

- **`src/services/`** - Kill tracking services

- **`src/utils/`** - Utility functions


### **Shared (`/shared`)**

- **`src/components/`** - Shared React components

- **`src/styles/`** - Shared styles and themes

- **`src/types/`** - Shared TypeScript types

- **`src/utils/`** - Shared utility functions


## Testing


### **Backend Testing**

```bash

cd backend
npm test              # Run all tests
npm run test:watch    # Watch mode
npm run test:coverage # Coverage report

```text

### **Frontend Testing**

```bash

cd dashboard
npm test              # Run all tests
npm run test:watch    # Watch mode
npm run test:coverage # Coverage report

```text

### **Desktop App Testing**

```bash

cd killtracker
npm test              # Run all tests
npm run test:e2e      # End-to-end tests

```text

## Documentation


### **Documentation Structure**

- **`docs/getting-started/`** - Setup and installation guides

- **`docs/usage/`** - How to use the system

- **`docs/technical/`** - Technical documentation

- **`docs/advanced/`** - Advanced features

- **`docs/help/`** - Help and support


### **Writing Documentation**

- Use clear, simple language

- Include code examples

- Add screenshots for UI changes

- Keep it up to date

- Test all instructions


## Feature Development


### **New Discord Commands**

1. **Add Command Definition**

   ```typescript

   // In backend/src/bot/commands/index.ts
   export const newCommand = {
     name: 'newcommand',
     description: 'Description of what it does',
     options: [
       {
         name: 'option',
         description: 'Option description',
         type: ApplicationCommandOptionType.String,
         required: false
       }
     ]
   };

   ```

2. **Implement Command Handler**

   ```typescript

   // In backend/src/bot/events/interaction.ts
   if (interaction.commandName === 'newcommand') {
     // Handle the command
   }

   ```

3. **Add Tests**

   ```typescript

   // Test the command
   describe('New Command', () => {
     it('should respond correctly', async () => {
       // Test implementation
     });
   });

   ```

### **New Dashboard Features**

1. **Create Component**

   ```typescript

   // In dashboard/src/components/NewFeature.tsx
   export const NewFeature: React.FC = () => {
     // Component implementation
   };

   ```

2. **Add Route**

   ```typescript

   // In dashboard/src/App.tsx
   <Route path="/new-feature" element={<NewFeature />} />

   ```

3. **Add Navigation**

   ```typescript

   // In dashboard/src/config/navigation.ts
   {
     name: 'New Feature',
     path: '/new-feature',
     icon: 'icon-name'
   }

   ```

## Bug Reports


### **Before Reporting a Bug**

1. Check if it's already reported
2. Try the latest version
3. Check the troubleshooting guide
4. Test with minimal configuration

### **Bug Report Template**

```markdown

## Bug Description

A clear description of the bug.

## Steps to Reproduce

1. Go to '...'
2. Click on '...'
3. See error

## Expected Behavior

What you expected to happen.

## Actual Behavior

What actually happened.

## Environment

- OS: [e.g., Windows 10]

- Node.js: [e.g., 18.17.0]

- Browser: [e.g., Chrome 91]


## Additional Context

Any other relevant information.

```text

## Feature Requests


### **Feature Request Template**

```markdown

## Feature Description

A clear description of the feature.

## Use Case

Why would this feature be useful?

## Proposed Solution

How should this feature work?

## Alternatives

Other solutions you've considered.

## Additional Context

Any other relevant information.

```text

## Community Guidelines


### **Be Respectful**

- Be kind and respectful to everyone

- Use inclusive language

- Help others learn and grow

- Constructive feedback only


### **Be Helpful**

- Answer questions when you can

- Share knowledge and experience

- Help newcomers get started

- Contribute to discussions


### **Be Professional**

- Keep discussions on-topic

- Use appropriate language

- Follow the code of conduct

- Respect others' time and effort


## Recognition


### **Contributors**

We recognize all contributors in:

- GitHub contributors list

- Project README

- Release notes

- Community highlights


### **Types of Contributions**

- **Code**: Bug fixes, features, improvements

- **Documentation**: Guides, tutorials, translations

- **Testing**: Bug reports, test cases, QA

- **Community**: Support, discussions, feedback


## Getting Help


### **Need Help Contributing?**

- **Documentation**: Check the docs folder

- **Discord**: Join our community server

- **GitHub**: Create an issue with questions

- **Code Review**: Ask for help in PR comments


### **Mentorship**

- New contributors can request mentorship

- Experienced contributors can offer to mentor

- We pair newcomers with experienced developers


## License


By contributing to this project, you agree that your contributions will be licensed under the same license as the project (MIT License).

## Thank You

Thank you for considering contributing to the Star Citizen Kill Tracker! Your contributions help make this project better for everyone in the Star Citizen community.

---

*Together, we can build something amazing! 🚀*
