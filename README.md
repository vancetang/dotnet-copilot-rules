# 🤖 GitHub Copilot Handbook

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/nikiforovall/github-copilot-rules?style=social)](https://github.com/nikiforovall/github-copilot-rules/stargazers)
[![Docusaurus](https://img.shields.io/badge/Built%20with-Docusaurus-45b8d8?logo=docusaurus)](https://nikiforovall.github.io/github-copilot-rules/)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Fnikiforovall.github.io%2Fgithub-copilot-rules%2F&label=handbook)](https://nikiforovall.github.io/github-copilot-rules/)

A curated collection of [GitHub Copilot customizations](https://code.visualstudio.com/docs/copilot/copilot-customization) — instructions, prompts, agents, and skills — ready to drop into your project.

📖 **Full documentation**: [nikiforovall.github.io/github-copilot-rules](https://nikiforovall.github.io/github-copilot-rules/)

## Structure

```
.github/
├── instructions/      # Path-specific coding rules (applyTo patterns)
├── prompts/           # Reusable prompt templates
├── agents/            # Custom agent modes
└── skills/            # Auto-loaded agent capabilities
AGENTS.md              # Workspace-wide agent instructions
```

## What's Included

### Instructions

| File | Purpose |
|------|---------|
| [coding-guidelines](.github/instructions/coding-guidelines.instructions.md) | Code generation rules |
| [coding-style](.github/instructions/coding-style.instructions.md) | Style & formatting conventions |
| [testing-xunit](.github/instructions/testing-xunit.instructions.md) | Test generation rules |
| [git-message](.github/instructions/git-message.instructions.md) | Conventional commit format |

### Agents

| Agent | Purpose |
|-------|---------|
| [code-review](.github/agents/code-review.agent.md) | Structured code review with prioritized feedback |
| [debug](.github/agents/debug.agent.md) | Systematic bug investigation & resolution |
| [differ](.github/agents/differ.agent.md) | Branch diff analysis & change summaries |
| [research](.github/agents/research.agent.md) | In-depth research with source synthesis |
| [spec](.github/agents/spec.agent.md) | Interview-driven spec creation |

### Prompts

| Prompt | Purpose |
|--------|---------|
| [commit](.github/prompts/commit.prompt.md) | Generate commit messages |
| [reflect](.github/prompts/reflect.prompt.md) | Session retrospective |
| [pros-and-cons](.github/prompts/pros-and-cons.prompt.md) | Compare options in table format |

### Skills

| Skill | Purpose |
|-------|---------|
| [planning-with-files](.github/skills/planning-with-files/SKILL.md) | Persistent multi-session planning |
| [dotnet-test](.github/skills/dotnet-test/SKILL.md) | Run .NET tests with xUnit |
| [dotnet-run-file](.github/skills/dotnet-run-file/SKILL.md) | Run C# scripts without projects |
| [dotnet-dependency](.github/skills/dotnet-dependency/SKILL.md) | Audit .NET dependencies |

## How to Use

1. Copy the files you need into your project's `.github/` directory
2. Configure `.vscode/settings.json`:

```json
{
  "chat.useAgentsMdFile": true,
  "github.copilot.chat.commitMessageGeneration.instructions": [
    { "file": ".github/instructions/git-message.instructions.md" }
  ],
  "github.copilot.chat.reviewSelection.enabled": true,
  "github.copilot.chat.reviewSelection.instructions": [
    { "file": ".github/instructions/coding-guidelines.instructions.md" },
    { "file": ".github/instructions/coding-style.instructions.md" }
  ],
  "github.copilot.chat.testGeneration.instructions": [
    { "file": ".github/instructions/testing-xunit.instructions.md" }
  ]
}
```

> [!TIP]
> Customize the rules to fit your team's workflow. See [Awesome Copilot](https://github.com/github/awesome-copilot) for more inspiration.

## Credits

Inspired by <https://github.com/Aaronontheweb/dotnet-cursor-rules>
