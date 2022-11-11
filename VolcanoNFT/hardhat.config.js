require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require("./scripts/deploy.js");

/** @type import('hardhat/config').HardhatUserConfig */
const { ALCHEMY_KEY, ACCOUNT_PRIVATE_KEY } = process.env;
module.exports = {
  solidity: "0.8.1",
   defaultNetwork: "goerli",
   networks: {
    hardhat: {},
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_KEY}`,
      accounts: [`0x${ACCOUNT_PRIVATE_KEY}`]
    },
    ethereum: {
      chainId: 1,
      url: `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_KEY}`,
      accounts: [`0x${ACCOUNT_PRIVATE_KEY}`]
    },
  },
};
