
const { task } = require("hardhat/config");
const { getAccount } = require("./helpers");


task("check-balance", "Prints out the balance of your account").setAction(async function (taskArguments, hre) {
    const account = getAccount();
    console.log(`Account balance for ${account.address}: ${await account.getBalance()}`);
});

task("deploy", "Deploys the VolcanoNFT.sol contract").setAction(async function (taskArguments, hre) {
    const VolcanoNftContractFactory = await hre.ethers.getContractFactory("VolcanoNFT", getAccount());
    const volcanoNFT = await VolcanoNftContractFactory.deploy();
    console.log(`Contract deployed to address: ${volcanoNFT.address}`);
});