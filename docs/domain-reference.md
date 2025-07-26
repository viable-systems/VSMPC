# Domain Reference – VSM & aMCP

## Viable System Model (VSM)
| System | Role |
|--------|------|
| **S1 Operations** | Executes day‑to‑day work. Recursively contains mini‑VSMs. |
| **S2 Coordination** | Dampens oscillations, handles resource conflicts. |
| **S3 Control/Audit** | Monitors performance, enforces standards, audits. |
| **S4 Intelligence** | Scans environment, plans for future, learns. |
| **S5 Policy** | Ultimate authority; balances present (S3) & future (S4). |

Key Principle: **Recursion & Requisite Variety** – each S1 must itself be viable; control variety ≥ system variety.

## Advanced MCP Highlights
- **Context‑Enriched Messages** – semantic identity, intent, priority in envelope.
- **Nonce + Bloom** – cryptographic replay defense at messaging layer.
- **Reactive Streams via GoldRush** – declarative pattern matching on live events.
- **WASM Plugins** – handler logic can be sandboxed & pushed to edge/browsers.
- **Cryptographically Signed Capability Announcements** – enables dynamic discovery & trust.

### AMQP vs MQTT vs XMPP
| Protocol | Strength | Limitation |
|----------|----------|------------|
| **AMQP** | Rich routing, reliable, headers | Heavier than MQTT |
| **MQTT** | Very lightweight, QoS tiers | Limited header metadata pre‑v5 |
| **XMPP** | Federation, presence | Steeper XML overhead |

aMCP normalizes context metadata across all.

---
