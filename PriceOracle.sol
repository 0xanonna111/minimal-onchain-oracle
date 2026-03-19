// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title PriceOracle
 * @dev Stores and updates asset prices with timestamping.
 */
contract PriceOracle is Ownable {
    struct PriceData {
        uint256 price;
        uint256 lastUpdated;
    }

    // Mapping from asset symbol (e.g., "BTC") to PriceData
    mapping(string => PriceData) private _prices;

    event PriceUpdated(string indexed symbol, uint256 price, uint256 timestamp);

    constructor() Ownable(msg.sender) {}

    /**
     * @notice Updates the price of a specific asset.
     * @param symbol The ticker of the asset (e.g., "ETH").
     * @param price The new price (scaled by 1e8).
     */
    function updatePrice(string calldata symbol, uint256 price) external onlyOwner {
        _prices[symbol] = PriceData({
            price: price,
            lastUpdated: block.timestamp
        });

        emit PriceUpdated(symbol, price, block.timestamp);
    }

    /**
     * @notice Fetches the latest price and update time.
     * @param symbol The ticker of the asset.
     */
    function getLatestPrice(string calldata symbol) external view returns (uint256 price, uint256 lastUpdated) {
        PriceData memory data = _prices[symbol];
        require(data.lastUpdated > 0, "Price not found");
        return (data.price, data.lastUpdated);
    }
}
