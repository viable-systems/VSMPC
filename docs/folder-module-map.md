# Folder / Module Map

| Path | Purpose |
|------|---------|
| `lib/core/s1/` | **System 1 – Operations** (`Dispatcher`, `IntentClassifier`, `DelegationSupervisor`, `SubVSMClient`) |
| `lib/core/s2/` | **System 2 – Coordination** (`Coordinator`, `RateLimiter`, `ZombieDetector`) |
| `lib/core/s3/` | **System 3 – Control & Audit** (`Control`, `Audit`, `CentralAggregator`) |
| `lib/core/s4/` | **System 4 – Intelligence** (`Intelligence`, `LLMAdapter`, `AMCPBridge`, `AMCPDiscovery`, `PolicyReviewEngine`) |
| `lib/core/s5/` | **System 5 – Policy** (`Policy`, `RecursionGuard`, `ZonePolicy`, `ImmuneSystem`) |
| `lib/amcp/` | aMCP protocol layer (`Server`, `Client`, `Envelopes`, `ContextFusion`, `SecurityLayer`) |
| `lib/goldrush/` | GoldRush runtime (`StreamProcessor`, `PatternManager`, `EventBroadcaster`) |
| `lib/context/` | Context store & CRDT utilities |
| `lib/message_bus/` | RabbitMQ / MQTT / XMPP adapters (`AMQPBus`, …) |
| `lib/telegram/` | Telegram bot interface (`Bot`, `UserContext`, `ConversationManager`) |
| `lib/wasm/` | WASM compiler & policy agents (`Compiler`, `PolicyAgentGenerator`) |
| `lib/gateway/` | Phoenix endpoint, router, LiveView canvases |
