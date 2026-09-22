AI Agent Project Kit

A general-purpose project instruction and persistent-memory system for AI coding agents.

What is this?

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

Why use it?

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

When should you use it?

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

When should you NOT use it?

For a tiny, one-off project, it may be unnecessary.

Examples:

* Temporary scripts
* Small experiments
* Throwaway prototypes
* Very small demos
* One-time code generation

You can simply use the coding agent directly.

⸻

Recommended structure

your-project/
├── AGENTS.md
├── AGENTS.zh-CN.md
├── README.md
├── README.zh-CN.md
└── .ai/
    ├── PROJECT.md
    ├── ARCHITECTURE.md
    ├── DECISIONS.md
    └── TROUBLESHOOTING.md

The actual agent entry point is:

AGENTS.md

The Chinese version is provided as a reference:

AGENTS.zh-CN.md

The .ai/ directory contains persistent project knowledge.

⸻

What is AGENTS.md?

AGENTS.md defines how the AI should work.

It covers:

* Requirement understanding
* Investigation
* No guessing
* Dependency and version checking
* State analysis
* Architecture
* Scope control
* Debugging
* Security
* Testing
* Verification
* Persistent memory
* Communication

The file should remain relatively stable.

⸻

What is .ai/?

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

Memory quality control

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

Do not store

Examples:

npm install failed today.
TypeScript produced an error today.
The user asked to change a button.
A test failed once.
Approach A failed, then approach B was tried.

These usually do not have long-term value.

⸻

Store

For example:

The current dependency version does not support API X.
API Y must be used instead.

This is useful because it is:

* Confirmed
* Version-specific
* Likely to recur
* Not obvious from normal application code

⸻

Installation

Copy:

AGENTS.md
.ai/

into the root of the target repository.

You may also keep:

AGENTS.zh-CN.md

as a Chinese reference.

Recommended:

your-project/
├── AGENTS.md
├── AGENTS.zh-CN.md
└── .ai/

⸻

Initial setup

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

Daily usage

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

Architecture changes

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

Debugging

For bugs, inspect:

TROUBLESHOOTING.md

However, do not automatically add every new error.

Only store a problem when:

* The root cause is confirmed.
* The solution is verified.
* It is likely to happen again.
* The information is not obvious from the source.

⸻

Why only one AGENTS.md?

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

Why separate memory from AGENTS.md?

Rules and knowledge are different things.

AGENTS.md answers:

How should the AI work?

.ai/ answers:

What should the AI remember about this project?

Separating them prevents AGENTS.md from growing indefinitely.

⸻

Framework agnostic

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

Design philosophy

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