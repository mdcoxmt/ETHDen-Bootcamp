const { expect } = require('chai');
const { ethers } = require("hardhat")

describe("VolcanoNFT Tests", function() {

    this.beforeEach(async function() {
      const VolcanoNFT = await ethers.getContractFactory("VolcanoNFT");
      volcanoNFT = await VolcanoNFT.deploy();

    })

    it("NFT is Minted", async function() {
      [account1] = await ethers.getSigners();
      
      expect(await volcanoNFT.balanceOf(account1.address)).to.equal(0);

      const tx = await volcanoNFT.connect(account1).mint();

      expect(await volcanoNFT.balanceOf(account1.address)).to.equal(1);
    })

   // it("NFT is Transferred", async function() {

  //  })

})