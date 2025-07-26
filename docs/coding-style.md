# Coding & Style Conventions

## General
- Prefer **pattern‑matching in function heads**; avoid deep `case`/`if`.
- Use **pipe operator** `|>` sparingly (≤5 stages).
- Keep functions small & pure; side‑effecting functions named with verbs.

## Formatting
- `mix format` enforced pre‑commit (default settings).
- 2‑space indent, max line ≈98 chars.

## Static Analysis
| Tool | Command | CI Gate |
|------|---------|---------|
| Credo | `mix credo --strict` | ✅ |
| Dialyzer | `mix dialyzer` | ✅ |
| Sobelow | `mix sobelow --exit` | ✅ |

## Testing Pyramid
- **70 % Unit** – pure logic, CRDT ops (`ExUnit`, `StreamData`)
- **20 % Integration** – aMCP flow, DB, AMQP (`Mox` for LLM)
- **10 % System / Chaos** – network partitions, load

## Security
- No `String.to_atom/1` on external data.
- All external calls wrapped in Circuit‑Breaker (`VSMCP.CircuitBreaker`).
- Secrets via `runtime.exs`, never in source.

## Phoenix Guidelines
- Business logic lives in **core/** contexts, not controllers/LiveViews.
- Long‑running tasks offloaded via `Task.Supervised` or GenServer.
