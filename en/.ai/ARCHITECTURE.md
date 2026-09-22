# ARCHITECTURE.md — Non-obvious architectural knowledge

> **Read this file when:** the task changes shared state, module boundaries, data flow, lifecycle, persistence, or external service integration.
>
> Record only knowledge that is NOT obvious from the source code.
> Do not document every file, module, or class.
> If the code already expresses it, do not duplicate it here.

## Module boundaries

<!-- Which modules exist, what each owns, and what they may not touch. -->

## Data flow

<!-- How data moves through the system; important request/response paths. -->

## State ownership

<!-- Who creates, owns, reads, and mutates each piece of shared state. -->

## Lifecycle rules

<!-- Startup / shutdown order, background jobs, sessions, singletons. -->

## External services

<!-- Third-party APIs, databases, caches; versions and contracts that matter. -->

## Persistence

<!-- Storage, migrations, schema decisions that are not obvious from code. -->

## Important system constraints

<!-- Compatibility promises, performance ceilings, invariants that must be preserved. -->

<!--
## Example entry

This is a model for how concise a good entry should be — delete it once your own entries exist.

### Authentication ownership

Authentication state is owned by the API session layer. UI components must not directly mutate authentication state.

Reason: multiple clients depend on the same session lifecycle.
-->
