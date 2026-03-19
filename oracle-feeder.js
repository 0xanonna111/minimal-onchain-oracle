const { ethers } = require("ethers");

/**
 * Example script to simulate a backend service pushing 
 * off-chain API data (e.g., from Binance or CoinGecko) to the Oracle.
 */
async function pushPrice(contractAddress, symbol, price) {
  const provider = new ethers.JsonRpcProvider("https://rpc.example.com");
  const wallet = new ethers.Wallet("YOUR_PRIVATE_KEY", provider);
  
  const abi = [
    "function updatePrice(string calldata symbol, uint256 price) external"
  ];
  
  const oracle = new ethers.Contract(contractAddress, abi, wallet);
  
  console.log(`Updating ${symbol} to $${price}...`);
  const tx = await oracle.updatePrice(symbol, ethers.parseUnits(price.toString(), 8));
  await tx.wait();
  console.log("Price updated successfully.");
}
