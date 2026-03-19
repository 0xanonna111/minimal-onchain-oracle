# Minimal On-Chain Oracle

A high-quality implementation of a push-based Price Oracle. This contract allows an authorized "reporter" or "feeder" to update asset prices on-chain, which can then be consumed by other smart contracts (Lending, Synthetic Assets, etc.).

## Features
- **Access Control**: Only authorized addresses can update price data.
- **Heartbeat Monitoring**: Track the timestamp of the last update to ensure data freshness.
- **Decimals Handling**: Standardized 8-decimal precision for price feeds.

## Security Considerations
In a production environment, it is recommended to use a decentralized network like Chainlink. This implementation is ideal for private sidechains, testing environments, or as a base for a custom validator-set oracle.

## License
MIT
