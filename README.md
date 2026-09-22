# AI Agent Project Kit

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **Language:** [English](README.md) | [简体中文](README.zh-CN.md)

A general-purpose project instruction and persistent-memory system for AI coding agents.

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

This project provides a framework-agnostic instruction system for AI coding agents working inside existing repositories.

Its purpose is not to make AI write more code.

Its purpose is to make AI work more reliably, safely, and consistently inside an existing codebase.

The workflow is:

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

It is not tied to any particular technology stack.

It can be used with:

* Frontend
* Backend
* Full Stack
* APIs
* CLI
* Web
* Desktop
* Mobile
* Rust
* Go
* Python
* Java
* Node.js
* React
* Vue
* Next.js
* Monorepos

⸻

## Why use it?

The biggest problems with AI coding agents are often not their ability to write code.

The bigger problems are:

* Starting implementation before understanding the request
* Guessing APIs from memory
* Ignoring installed dependency versions
* Ignoring existing implementations
* Missing global state and data flow
* Changing shared behavior without checking consumers
* Performing large refactors for small requests
* Repeatedly making speculative fixes during debugging
* Hiding errors instead of fixing their causes
* Recording every error as permanent memory
* Accumulating noisy project knowledge over time

This project is designed to solve a different problem:

How can an AI coding agent work reliably inside the same project over a long period of time?

⸻

## When should you use it?

1. Long-lived projects

Recommended when:

The project already exists
+
The project will continue to be developed
+
AI agents will be used repeatedly

Examples:

* Production web applications
* APIs
* SaaS projects
* Backend services
* Frontend applications
* Open-source projects
* Long-term personal projects

⸻

2. Frequent AI coding-agent usage

It is useful when using tools such as:

* Claude Code
* Cursor
* Codex
* Cline
* Roo Code
* Windsurf
* Other agents that support project-level instructions

Instead of repeatedly explaining the same rules in chat, the project can define them once.

⸻

3. Projects with complex architecture

Useful when the project contains:

* Multiple services
* Multiple data sources
* Shared state
* Caches
* Databases
* External APIs
* Permission systems
* Complex lifecycles
* Significant compatibility constraints

⸻

4. Version-sensitive projects

This system is particularly useful when the project depends heavily on exact dependency versions.

For example:

AI remembers a newer API
        ↓
Project uses an older version
        ↓
Generated code does not work

The rules require the agent to check the actual version before relying on an API.

⸻

5. Projects with recurring technical knowledge

Some projects have constraints that are not obvious from the source code.

For example:

The current dependency version does not support API X.
Use API Y instead.

or:

Only module A owns this state.

or:

This API must remain compatible with existing clients.

These are good candidates for persistent project memory.

⸻

## When should you NOT use it?

For a tiny, one-off project, it may be unnecessary.

Examples:

* Temporary scripts
* Small experiments
* Throwaway prototypes
* Very small demos
* One-time code generation

You can simply use the coding agent directly.

⸻

## Choose your language

The kit ships as two self-contained folders. They are identical in structure and differ only in language:

| Folder | Language | Contents |
| --- | --- | --- |
| [en/](en/) | English | `AGENTS.md` rules + `.ai/` memory templates + `install.sh` |
| [zh-CN/](zh-CN/) | 简体中文 | `AGENTS.md` 规则 + `.ai/` 记忆模板 + `install.sh` |

Each folder is complete on its own — pick the one your team reads, download or clone it, and install it into your project. You do not need both.

Repository layout:

```
agents/
├── README.md            # English guide (default)
├── README.zh-CN.md      # 简体中文指南
├── LICENSE              # MIT
├── en/                  # English kit
│   ├── AGENTS.md        # Agent rules (entry point)
│   ├── install.sh       # One-command installer
│   └── .ai/             # Memory templates
│       ├── PROJECT.md
│       ├── ARCHITECTURE.md
│       ├── DECISIONS.md
│       └── TROUBLESHOOTING.md
└── zh-CN/               # 中文套件
    ├── AGENTS.md        # Agent 规则（入口）
    ├── install.sh       # 一键安装脚本
    └── .ai/             # 记忆模板
        ├── PROJECT.md
        ├── ARCHITECTURE.md
        ├── DECISIONS.md
        └── TROUBLESHOOTING.md
```

⸻

## Quick start

Pick a language folder first (`en/` or `zh-CN/`), then use any of the three options below.

**Option 1 — one-command import**

Clone the repository and run the installer from the language folder you chose:

```bash
git clone https://github.com/xuulu/agents.git
cd agents/zh-CN            # or: cd agents/en
./install.sh /path/to/your-project
```

The installer copies `AGENTS.md` and the `.ai/` templates into the target repository root. It never overwrites files that already exist.

**Option 2 — manual copy**

```bash
cd agents/zh-CN            # or: cd agents/en
cp AGENTS.md /path/to/your-project/
cp -r .ai/ /path/to/your-project/
```

**Option 3 — download & unzip**

On GitHub, click **Code → Download ZIP**, unzip the archive, open the `en/` or `zh-CN/` folder, then run `./install.sh` or copy `AGENTS.md` and `.ai/` into your project manually.

That is it. `AGENTS.md` is the entry point the agent reads; `.ai/` is where the agent accumulates curated project memory over time.

⸻

## Initial setup

Do not try to fill every memory file on the first day.

Start with the repository itself.

The agent can inspect the project and gradually populate:

PROJECT.md
ARCHITECTURE.md
DECISIONS.md

TROUBLESHOOTING.md can remain nearly empty until a confirmed recurring issue appears.

A useful initialization request is:

Inspect this repository and initialize the .ai project memory.
Only record confirmed information that is likely to affect future development and is not obvious from the source.
Do not guess.
Do not record temporary problems.
Do not create unnecessary documentation.

⸻

## Daily usage

Normal development does not require special commands.

For example:

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
Determine whether new knowledge is worth storing

⸻

## Architecture changes

For changes involving:

* Databases
* Global state
* APIs
* Core modules
* Service boundaries
* Authentication
* Caching
* External services

The agent should inspect relevant project memory before changing the architecture.

Typically:

PROJECT.md
ARCHITECTURE.md
DECISIONS.md

After the change, update memory only if genuinely new long-term knowledge was created.

⸻

## Debugging

For bugs, inspect:

TROUBLESHOOTING.md

However, do not automatically add every new error.

Only store a problem when:

* The root cause is confirmed.
* The solution is verified.
* It is likely to happen again.
* The information is not obvious from the source.

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

The actual agent entry point is `AGENTS.md`.

Do not create:

src/AGENTS.md
components/AGENTS.md
api/AGENTS.md

Default to one root `AGENTS.md`.

⸻

## What is AGENTS.md?

AGENTS.md defines how the AI should work.

It covers:

* Requirement understanding
* Investigation
* No guessing
* Dependency and version checking
* State analysis
* Architecture
* Scope control
* Git and change hygiene
* Debugging
* Security
* Performance awareness
* Testing
* Verification
* Persistent memory
* Communication

The file should remain relatively stable.

Pick the language folder that fits your team: `en/` for English, `zh-CN/` for 简体中文.

⸻

## What is .ai/?

.ai/ stores persistent project knowledge.

It is not:

* A conversation history
* An AI diary
* A raw error log
* A dump of every implementation detail

It should contain only information that is likely to matter to future development.

PROJECT.md

Stable project facts:

* Project purpose
* Technology stack
* Important versions
* Runtime environment
* Important dependencies
* Common commands
* Deployment
* Long-term constraints

ARCHITECTURE.md

Important architectural knowledge:

* Module boundaries
* Data flow
* State ownership
* Lifecycle
* External services
* Persistence
* Non-obvious constraints

Do not document every file.

DECISIONS.md

Important project decisions:

* Why an architecture was chosen
* Why a dependency was selected
* Important API/data decisions
* Important trade-offs
* Decisions that should not be casually reversed

TROUBLESHOOTING.md

Confirmed recurring problems:

Symptom
↓
Root cause
↓
Verified fix
↓
Applicable condition

Do not store full logs.

⸻

## Memory quality control

This is a core part of the system.

The AI should not create a memory entry for every error or correction.

A piece of information should be stored only when ALL conditions are true:

Confirmed
+
Likely to affect future work
+
Not obvious from current source/configuration
+
Not already documented
+
Concise and precise

Otherwise:

Do not store it.

⸻

### Do not store

Examples:

npm install failed today.
TypeScript produced an error today.
The user asked to change a button.
A test failed once.
Approach A failed, then approach B was tried.

These usually do not have long-term value.

⸻

### Store

For example:

The current dependency version does not support API X.
API Y must be used instead.

This is useful because it is:

* Confirmed
* Version-specific
* Likely to recur
* Not obvious from normal application code

⸻

## Why only one AGENTS.md?

The default setup intentionally avoids:

src/AGENTS.md
components/AGENTS.md
api/AGENTS.md

The default model is:

One repository
      ↓
One root AGENTS.md

This reduces:

* Conflicting instructions
* Duplicate rules
* Maintenance cost
* Agent ambiguity

Directory-level instructions can be introduced later if a project genuinely requires them.

⸻

## Why separate memory from AGENTS.md?

Rules and knowledge are different things.

AGENTS.md answers:

How should the AI work?

.ai/ answers:

What should the AI remember about this project?

Separating them prevents AGENTS.md from growing indefinitely.

⸻

## Framework agnostic

This is not a:

Next.js Agent Rules

system.

It is:

General AI Coding Agent Rules

Framework-specific information belongs in project memory.

For example:

PROJECT.md
Framework: Next.js
Version: ...

or:

PROJECT.md
Framework: Axum
Version: ...

The core agent behavior remains the same.

⸻

## Customizing the rules

AGENTS.md is a template, not a contract.

* Keep the sections that matter to your project and remove the rest.
* Add team-specific rules (naming, commit conventions, review requirements) as new sections.
* Keep AGENTS.md stable once it works; put changing facts in .ai/, not in AGENTS.md.
* If you remove a section, also remove its entry from the table of contents.

⸻

## FAQ

Q: Which agents support this?

A: Any agent that reads AGENTS.md or similar project-level instruction files — Claude Code, Cursor, Codex, Cline, Roo Code, Windsurf, and others.

Q: Which language folder should I pick?

A: Pick the folder your team reads — `en/` for English or `zh-CN/` for 简体中文. The two folders are identical in structure and differ only in language. Install one of them; installing both is unnecessary.

Q: Is .ai/ the same as the agent's own memory?

A: No. .ai/ is curated, project-specific knowledge that survives across tools and sessions. Agent-internal memory is per-tool and not shared.

Q: Can I add directory-level AGENTS.md files later?

A: Yes, but only when there is a specific, documented need. One root AGENTS.md is the default.

Q: What if AGENTS.md conflicts with my tool's own rules?

A: Keep them consistent. AGENTS.md governs project behavior; tool settings govern tool behavior.

⸻

## Design philosophy

The complete workflow is:

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

The goal is not to build an AI that remembers everything.

The goal is to build an AI that:

understands the project better over time without becoming polluted by low-value memory.

⸻

## Contributing

This is a documentation project — issues and pull requests are welcome.

* Keep the `en/` and `zh-CN/` folders in sync when changing rules or templates.
* Keep README.md and README.zh-CN.md in sync.
* Preserve the concise, bullet-style format.
* Explain the problem a change solves; avoid adding rules that merely restate common sense.

⸻

## License

[MIT](LICENSE)
