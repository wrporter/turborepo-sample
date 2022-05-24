# @sample/eslint-config

This project maintains base ESLint configuration for TypeScript projects. Each file may be extended and custom configuration may be added. This package provides a convenience of not having to copy and paste the same configs for every new project.

## Installation

```shell
npm install --save-dev @sample/eslint-config
```

## Usage

In your `.eslintrc.js` (or alternative config entry), extend the config files that suit your project. For example:

```javascript
module.exports = {
    extends: [
        '@sample/eslint-config',
        '@sample/eslint-config/react',
        '@sample/eslint-config/jest',
    ],
};
```

## API

Below are each of the configuration files available and their explanations. Each config is composable and can be included with the other configs. Extend any configs that fit your project.

- [`index.js`](./index.js): Base config consumed by just about all the other configs in this project with common compiler options.
- [`react.js`](./react.js): Config for a React application.
- [`jest.js`](./jest.js): Config for a project using [Jest](https://jestjs.io/).
- [`node.js`](./node.js): Config for a Node application.
- [`remix.js`](./remix.js): Config for a Remix application.
- [`cypress.js`](./cypress.js): Config for an integration or E2E test project using [Cypress](https://www.cypress.io/).
