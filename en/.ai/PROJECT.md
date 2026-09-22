# PROJECT.md — Stable project facts

> **Read this file when:** the task depends on the project stack, runtime, versions, commands, deployment, or long-term constraints.
>
> Fill in gradually, only from confirmed evidence.
> If a fact is already obvious from the source or configuration, do not record it here.
> Delete any section that does not apply to this project.

## Purpose

<!-- One or two sentences: what the project is, who it serves, what it must keep doing. -->

## Technology stack

<!-- Language / framework / runtime. Include versions when code depends on them. -->

## Important versions

<!-- Dependency or tool versions that generated code must match. Example: "axios 0.27.x — API `X` is not available; use `Y`." -->

Never treat this file as the source of truth for installed versions. Verify actual versions from the project's package manifest, lockfile, environment, or tool output when they matter.

## Runtime environment

<!-- Node / Python / Rust / Java versions, OS targets, containers, CI environment, required services. -->

## Important dependencies

<!-- Only dependencies whose constraints affect daily development, not an exhaustive list. -->

## Common commands

<!-- install / dev / test / lint / typecheck / build / deploy -->

## Deployment

<!-- How the project is built, deployed, and rolled back. -->

## Long-term constraints

<!-- Non-obvious rules that must not be broken casually. -->
