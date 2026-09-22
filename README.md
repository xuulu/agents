# AI Agent Project Kit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **Language:** [English](README.md) | [简体中文](README.zh-CN.md)

Your AI coding agent is the most enthusiastic intern you've ever hired — and the most dangerous one. It starts typing before it understands the task, invents APIs out of thin air, ignores the dependency versions sitting right in front of it, and treats every error message like a diary entry worth cherishing forever.

This repo is that intern's first-day onboarding. Understand first. Never guess. Check versions. Make the smallest change. Verify. Remember only what actually matters. Same AI, but now it works like a colleague instead of a tornado with a keyboard.

## Table of Contents

- [What is this?](#what-is-this)
- [Why use it?](#why-use-it)
- [When should you use it?](#when-should-you-use-it)
- [When should you NOT use it?](#when-should-you-not-use-it)
- [Choose your language](#choose-your-language)
- [Quick start](#quick-start)
- [Initial setup](#initial-setup)
- [Daily usage](#daily-usage)
- [Architecture changes](#architecture-changes)
- [Debugging](#debugging)
- [Recommended structure](#recommended-structure)
- [What is AGENTS.md?](#what-is-agentsmd)
- [What is .ai/?](#what-is-ai)
- [Memory quality control](#memory-quality-control)
- [Don't turn .ai/ into a trash bin](#dont-turn-ai-into-a-trash-bin)
- [Why only one AGENTS.md?](#why-only-one-agentsmd)
- [Why separate memory from AGENTS.md?](#why-separate-memory-from-agentsmd)
- [Framework agnostic](#framework-agnostic)
- [Customizing the rules](#customizing-the-rules)
- [FAQ](#faq)
- [Design philosophy](#design-philosophy)
- [Contributing](#contributing)
- [License](#license)

⸻

## What is this?

A framework-agnostic instruction system for AI coding agents working inside existing repositories.

The point isn't to make AI write more code. It's to make AI work in a codebase that already exists — without guessing, breaking things, or turning your project history into noise.

The workflow:

Understand the request
        ↓
Inspect the project
        ↓
Check dependencies and versions
        ↓
Understand state and data flow
        ↓
Determine the smallest correct change
        ↓
Implement
        ↓
Verify
        ↓
Preserve only high-value knowledge

No stack is tied to it. It works for frontend, backend, full stack, APIs, CLI, web, desktop, mobile, Rust, Go, Python, Java, Node.js, React, Vue, Next.js, monorepos.

⸻

## Why use it?

AI coding agents usually fail not because they can't write code, but because they:

* Start typing before understanding the request
* Guess APIs from memory
* Ignore installed dependency versions
* Skip existing implementations
* Miss global state and data flow
* Change shared behavior without checking consumers
* Refactor big for small tasks
* Throw random fixes at bugs
* Hide errors instead of fixing their causes
* Record every error as permanent "memory"
* Let project knowledge rot into noise

This kit exists for one question: how do you make an AI agent work reliably in the same project for months?

⸻

## When should you use it?

1. **Long-lived projects** — the project already exists, keeps being developed, and AI agents will touch it repeatedly: production web apps, APIs, SaaS, backend services, frontend apps, open-source projects, long-term personal projects.

2. **Frequent agent usage** — if you use Claude Code, Cursor, Codex, Cline, Roo Code, Windsurf, or anything else that reads AGENTS.md. Define the rules once instead of re-explaining them in every chat.

3. **Complex architecture** — multiple services, multiple data sources, shared state, caches, databases, external APIs, permission systems, complex lifecycles. "Understand before changing" matters most here.

4. **Version-sensitive projects** — AI remembers a newer API, the project runs an older version, and the generated code breaks. The rules force the agent to check the actual version before trusting an API.

5. **Recurring project knowledge** — constraints that aren't visible in the source: "this dependency doesn't support API X, use Y", "only module A owns this state", "this API must stay compatible with existing clients". Those belong in .ai/.

⸻

## When should you NOT use it?

For tiny, one-off stuff — temporary scripts, small experiments, throwaway prototypes, one-time code generation — skip it and just use the agent directly.

⸻

## Choose your language

The kit ships as two self-contained folders. They are identical in structure and differ only in language:

| Folder | Language | What's inside |
| --- | --- | --- |
| [en/](en/) | English | `AGENTS.md` rules + `.ai/` memory templates |
| [zh-CN/](zh-CN/) | 简体中文 | `AGENTS.md` 规则 + `.ai/` 记忆模板 |

Pick the one your team reads. You only need one.

Repository layout:

```
agents/
├── README.md            # English guide (default)
├── README.zh-CN.md      # 简体中文指南
├── LICENSE              # MIT
├── en/                  # English kit
│   ├── AGENTS.md        # Agent rules (entry point)
│   └── .ai/             # Memory templates
│       ├── PROJECT.md
│       ├── ARCHITECTURE.md
│       ├── DECISIONS.md
│       └── TROUBLESHOOTING.md
└── zh-CN/               # 中文套件
    ├── AGENTS.md        # Agent 规则（入口）
    └── .ai/             # 记忆模板
        ├── PROJECT.md
        ├── ARCHITECTURE.md
        ├── DECISIONS.md
        └── TROUBLESHOOTING.md
```

⸻

## Quick start

Pick a language folder (`en/` or `zh-CN/`), then use either method.

**Method 1 — download the ZIP**

On GitHub, click **Code → Download ZIP**, unzip the archive, open the `en/` or `zh-CN/` folder, and copy `AGENTS.md` and the `.ai/` folder into your project root.

**Method 2 — clone and copy**

```bash
git clone https://github.com/xuulu/agents.git
cd agents/zh-CN            # or: cd agents/en
cp AGENTS.md /path/to/your-project/
cp -r .ai/ /path/to/your-project/
```

Done. `AGENTS.md` is the entry point the agent reads; `.ai/` is where the agent keeps curated project memory over time.

⸻

## Initial setup

Don't try to fill every memory file on day one. Start from the repository itself and let the agent populate things gradually:

PROJECT.md
ARCHITECTURE.md
DECISIONS.md

TROUBLESHOOTING.md can stay nearly empty until a confirmed recurring issue shows up.

A good kick-off request:

Inspect this repository and initialize the .ai project memory.
Only record confirmed information that is likely to affect future development and is not obvious from the source.
Do not guess.
Do not record temporary problems.
Do not create unnecessary documentation.

⸻

## Daily usage

Normal development needs no special commands. For example:

Fix the authentication API issue.

The agent should naturally follow:

Read project rules
        ↓
Inspect relevant code
        ↓
Check dependencies
        ↓
Check state/data flow
        ↓
Identify root cause
        ↓
Make the smallest change
        ↓
Run verification
        ↓
Decide whether new knowledge is worth storing

⸻

## Architecture changes

Before touching databases, global state, APIs, core modules, service boundaries, authentication, caching, or external services, the agent should read the relevant memory:

PROJECT.md
ARCHITECTURE.md
DECISIONS.md

After the change, update memory only if genuinely new long-term knowledge was created.

⸻

## Debugging

For bugs, check TROUBLESHOOTING.md. But don't add every new error to it. Store a problem only when the root cause is confirmed, the fix is verified, it's likely to happen again, and it isn't obvious from the source.

⸻

## Recommended structure

After installation, the target project should look like this:

```
your-project/
├── AGENTS.md
└── .ai/
    ├── PROJECT.md
    ├── ARCHITECTURE.md
    ├── DECISIONS.md
    └── TROUBLESHOOTING.md
```

The actual agent entry point is `AGENTS.md`. Don't create src/AGENTS.md, components/AGENTS.md, or api/AGENTS.md — one root AGENTS.md is the default.

⸻

## What is AGENTS.md?

AGENTS.md defines how the AI should work: requirement understanding, investigation, no guessing, dependency and version checking, state analysis, architecture, scope control, git hygiene, debugging, security, performance awareness, testing, verification, persistent memory, communication. It should stay relatively stable.

Pick the folder that fits your team: `en/` for English, `zh-CN/` for 简体中文.

⸻

## What is .ai/?

.ai/ stores persistent project knowledge. It is not a conversation history, an AI diary, a raw error log, or a dump of implementation details. It holds only what future development is likely to need.

* **PROJECT.md** — stable facts: purpose, stack, important versions, runtime environment, key dependencies, common commands, deployment, long-term constraints.
* **ARCHITECTURE.md** — non-obvious architecture: module boundaries, data flow, state ownership, lifecycle, external services, persistence, constraints. Don't document every file.
* **DECISIONS.md** — decisions that shouldn't be casually reversed: why an architecture was chosen, why a dependency was picked, API/data trade-offs.
* **TROUBLESHOOTING.md** — confirmed recurring problems in the shape: symptom → root cause → verified fix → applicable condition. No raw logs.

⸻

## Memory quality control

This is the heart of the system. The AI should not create a memory entry for every error or correction. Store something only when ALL of these are true:

Confirmed
+
Likely to affect future work
+
Not obvious from current source/configuration
+
Not already documented
+
Concise and precise

Otherwise — don't store it.

### Do not store

npm install failed today.
TypeScript produced an error today.
The user asked to change a button.
A test failed once.
Approach A failed, then approach B was tried.

These rarely have long-term value.

### Store

The current dependency version does not support API X.
API Y must be used instead.

This earns its place because it's confirmed, version-specific, likely to recur, and invisible in normal application code.

⸻

## Don't turn .ai/ into a trash bin

Don't shovel every error, every failed test, every attempt, chat history, temporary environment issues, or things that are already obvious in the source into .ai/.

The right target: 100 sessions of development → a handful of genuinely important things saved. Not 100 sessions → thousands of log lines.

⸻

## Why only one AGENTS.md?

The default deliberately avoids src/AGENTS.md, components/AGENTS.md, api/AGENTS.md. One repository → one root AGENTS.md. That keeps instructions from conflicting, rules from duplicating, maintenance cheap, and the agent unambiguous. Directory-level files can come later if a project genuinely needs them.

⸻

## Why separate memory from AGENTS.md?

Rules and knowledge are different things. AGENTS.md answers "how should the AI work?"; .ai/ answers "what should the AI remember about this project?" Keeping them apart stops AGENTS.md from growing forever.

⸻

## Framework agnostic

This isn't "Next.js Agent Rules". It's general AI coding agent rules. Framework specifics live in project memory:

PROJECT.md
Framework: Next.js
Version: ...

or

PROJECT.md
Framework: Axum
Version: ...

The core agent behavior stays the same.

⸻

## Customizing the rules

AGENTS.md is a template, not a contract.

* Keep the sections that matter to your project and drop the rest.
* Add team-specific rules (naming, commit conventions, review requirements) as new sections.
* Once AGENTS.md works, leave it alone; put changing facts in .ai/, not in AGENTS.md.
* If you remove a section, remove its entry from the table of contents too.

⸻

## FAQ

**Q: Which agents support this?**

A: Anything that reads AGENTS.md or similar project-level instruction files — Claude Code, Cursor, Codex, Cline, Roo Code, Windsurf, and others.

**Q: Which language folder should I pick?**

A: Pick the one your team reads — `en/` for English or `zh-CN/` for 简体中文. The folders are identical in structure and differ only in language. Install one; you don't need both.

**Q: Is .ai/ the same as the agent's own memory?**

A: No. .ai/ is curated, project-specific knowledge that survives across tools and sessions. Agent-internal memory is per-tool and not shared.

**Q: Can I add directory-level AGENTS.md files later?**

A: Yes, but only when there's a specific, documented need. One root AGENTS.md is the default.

**Q: What if AGENTS.md conflicts with my tool's own rules?**

A: Keep them consistent. AGENTS.md governs project behavior; tool settings govern tool behavior.

⸻

## Design philosophy

The full loop:

User request
      ↓
Understand
      ↓
Investigate
      ↓
Check dependencies and versions
      ↓
Understand state and data flow
      ↓
Determine the smallest correct change
      ↓
Implement
      ↓
Verify
      ↓
Preserve only valuable knowledge

The goal isn't an AI that remembers everything. It's an AI that understands the project better over time without being polluted by low-value memory.

⸻

## Contributing

This is a documentation project — issues and pull requests are welcome.

* Keep the `en/` and `zh-CN/` folders in sync when changing rules or templates.
* Keep README.md and README.zh-CN.md in sync.
* Keep the concise, bullet-style format.
* Explain the problem a change solves; skip rules that just restate common sense.

⸻

## License

[MIT](LICENSE)
