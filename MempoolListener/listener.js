import { Network, Alchemy } from 'alchemy-sdk';

// Optional Config object, but defaults to demo api-key and eth-mainnet.
const settings = {
  apiKey: '2ayGuJawCT2fsUbqE1q6JLGuddT6A-qe', // Replace with your Alchemy API Key.
  network: Network.ETH_MAINNET, // Replace with your network.
};

const alchemy = new Alchemy(settings);

var ethers = require("ethers");
var url = "wss://eth-mainnet.g.alchemy.com/v2/2ayGuJawCT2fsUbqE1q6JLGuddT6A-qe";
var init = function () {
  var customWsProvider = new ethers.providers.WebSocketProvider(url);
  customWsProvider.on("pending", (tx) => {
    
    customWsProvider.getTransaction(tx).then(function (transaction) {
      if (transaction != null){
        if (transaction.to==="0x1f9840a85d5af5bf1d1762f925bdaddc4201f984"){
          console.log(transaction);
        }
    }
    });
}); };
init();