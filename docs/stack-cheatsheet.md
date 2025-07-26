# VSMCP Stack Cheat‑Sheet

## Core Languages & Frameworks
| Layer | Version | Notes |
|-------|---------|-------|
| Elixir | **1.18** | Requires OTP 26 compatibility |
| Erlang/OTP | **26.x** | Tested in CI matrix (26 & 27) |
| Phoenix | **1.7.x** | LiveView 0.18+, `mix phx.new vsmcp --no-ecto --no-html` |
| Rust | 2025 Edition | For NIFs + WASM compilation |
| PostgreSQL | 14+ | JSONB, logical replication support |
| RabbitMQ (AMQP) | 3.11+ | AMQP 0‑9‑1 & 1.0 support |
| MQTT | v5 broker (optional) | Edge / IoT bridge |
| XMPP | 1.0 | Federation bridge |

## Elixir Libraries
- **amqp ~1.9** – RabbitMQ client
- **ExGram** – Telegram bot
- **Sobelow** – security scan
- **Credo 1.7+** – style/lint
- **Dialyxir 1.3+** – type analysis
- **StreamData** – property tests

## Config Conventions
```elixir
# config/config.exs
config :vsmcp, :amqp_connection,
  System.get_env("AMQP_URL") ||
  "amqp://guest:guest@rabbitmq:5672"
```
- AMQP virtual host: `/vsmcp`
- Exchange: `vsmcp.topic` (topic type, durable)
- Endpoint binds `0.0.0.0`, port from `PORT` env.

## CI Targets
- Docker image `elixir:1.18.4-erlang-26`
- Services: Postgres 14, RabbitMQ 3.11
- Steps:
  1. `mix deps.get`
  2. `mix compile --warnings-as-errors`
  3. `mix credo --strict`
  4. `mix dialyzer`
  5. `mix sobelow --exit`
  6. `mix test`
