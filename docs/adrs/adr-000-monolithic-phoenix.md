# ADR‑000: Adopt Monolithic Phoenix Architecture

| Status | Date | Authors |
|--------|------|---------|
| **Accepted** | 2025‑07‑26 | Core Team |

## Context
We considered:
1. **Microservices** – each VSM system as independent service.
2. **Monolithic Phoenix app** – all systems in one BEAM node.

Constraints:
- Tight coupling & recursive feedback across Systems 1‑5.
- Need low‑latency context fusion and CRDT updates.
- Limited ops budget for early phases.

## Decision
Implement VSMCP as a **single Phoenix 1.7 application** with OTP supervision; each VSM system is a supervised subtree.

## Rationale
- **In‑process messaging** beats network latency for high‑throughput events.
- **Shared CRDT store** simpler inside one BEAM node.
- Phoenix contexts give micro‑service‑like boundaries without network overhead.
- Scaling: run multiple clustered nodes; extract services later if hot‑spots emerge.
- Aligns with Erlang design philosophy ("let it crash" with supervision trees).

## Consequences
+ Faster dev & unified deployment pipeline.  
− Must enforce module boundaries to avoid a "big ball of mud".  
+ Easier CI/CD (one image, one version matrix).  
+ Future extraction possible (Elixir distribution primitives).  

This ADR is baseline; new ADRs required for any move away from this architecture.
