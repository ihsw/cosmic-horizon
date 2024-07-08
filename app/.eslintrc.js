const eslintPluginRules = require("./eslint-plugin-rules.json");

module.exports = {
  env: {
    "browser": true,
    "es2021": true,
    "node": true
  },
  plugins: ["@typescript-eslint"],
  extends: [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:@typescript-eslint/recommended",
    "@blueprintjs/eslint-config"
  ],
  parserOptions: {
    ecmaVersion: 12,
    sourceType: "module",
    project: "tsconfig.json"
  },
  settings: {
    react: {
      version: "17"
    }
  },
  rules: {
    ...eslintPluginRules
  }
}