# VSMPC

Implementation of the Viable System Model as a Phoenix application. Applies Stafford Beer's cybernetic framework (Systems 1-5) to distributed coordination, with each VSM system running as a supervised OTP subtree inside a single BEAM node.

Version: 0.1.0 | Elixir ~> 1.14 | Phoenix ~> 1.7

## Status

Early stage. The Phoenix skeleton is in place with router, telemetry, and OTP supervision, but no VSM system logic has been implemented yet. The router defines an empty `/api` scope. The PRD describes a large scope (CRDT convergence, WASM plugins, multi-protocol transport, LLM integration) that has not been started.

## Architecture decision

Per [ADR-000](docs/adrs/adr-000-monolithic-phoenix.md): monolithic Phoenix app rather than microservices. Rationale:

- In-process messaging beats network latency for high-throughput VSM feedback loops
- Shared CRDT store is simpler inside one BEAM node
- Phoenix contexts provide module boundaries without network overhead
- Can extract services later if hot-spots emerge

## VSM systems (planned)

| System | Role | Status |
|--------|------|--------|
| S1 Operations | Task execution, aMCP-backed agents | Not started |
| S2 Coordination | Rate limiting, zone-aware sharding | Not started |
| S3 Control/Audit | Monitoring, policy enforcement | Not started |
| S4 Intelligence | LLM reasoning, capability discovery | Not started |
| S5 Policy | Governance, immune system | Not started |

## Stack

| Layer | Technology |
|-------|-----------|
| Framework | Phoenix 1.7 (API-only, no LiveView yet) |
| HTTP server | Bandit |
| CSS | Tailwind (assets pipeline configured) |
| Email | Swoosh + Finch |
| Clustering | DNSCluster |
| Telemetry | telemetry_metrics + telemetry_poller |

## Development

```bash
mix setup       # install deps, build assets
mix phx.server  # start on localhost:4000
```

Or inside IEx:

```bash
iex -S mix phx.server
```

## Project structure

```
lib/vsmcp/              Application, mailer
lib/vsmcp_web/          Endpoint, router, controllers, telemetry
docs/adrs/              Architecture decision records
docs/domain-reference.md  VSM and aMCP domain glossary
docs/coding-style.md    Code conventions
docs/stack-cheatsheet.md  Quick reference
```

## What is the Viable System Model?

A cybernetic framework by Stafford Beer for organizing systems that need to be self-regulating:

| System | Function |
|--------|----------|
| S1 | Operations -- does the work |
| S2 | Coordination -- dampens oscillations between S1 units |
| S3 | Control -- monitors performance, enforces standards |
| S4 | Intelligence -- scans environment, plans for future |
| S5 | Policy -- balances present (S3) and future (S4) |

Key principle: recursion. Each S1 unit is itself a viable system containing its own S1-S5.

## Limitations

- No VSM system logic implemented; this is currently a Phoenix skeleton
- PRD scope is ambitious (28+ weeks planned); delivery timeline is uncertain
- No database configured yet (PostgreSQL planned but not added to deps)
- No tests beyond the generated controller error test