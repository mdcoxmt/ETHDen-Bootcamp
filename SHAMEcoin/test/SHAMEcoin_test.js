const {ethers} = require("hardhat")
const {assert, expect} = require("chai")

describe("Test SHAMEcoin", function() {
    let SHAMEcoin, shameCoin
    let tokenSupply = "1000000000"
    let coinAmount = 1
    let DEAD = "0x000000000000000000000000000000000000dEaD"

    beforeEach(async function() {
        SHAMEcoinFactory = await ethers.getContractFactory("SHAMEcoin");
        [owner, hodler1, hodler2] = await ethers.getSigners();
        shameCoin = await SHAMEcoinFactory.deploy(tokenSupply);
    })

    describe("Transactions", function(){
        it("Owner can run contract", async function() {
            await shameCoin.transfer(hodler1.address, coinAmount)
            expect (await shameCoin.balanceOf(hodler1.address)).to.be.equal(coinAmount)
        })

        it("HODLer2 should recieve 1 SHAMEcoin when attempting to transfer to HODLer1", async function() {
            await shameCoin.connect(hodler2).transfer(hodler1.address, coinAmount)
            expect (await shameCoin.balanceOf(hodler2.address)).to.be.equal(coinAmount)
        })
        it("HODLer1 can approve Owner to transferFrom 1 SHAMEcoin", async function(){
            await shameCoin.transfer(hodler1.address, coinAmount)
            await shameCoin.connect(hodler1).approve(hodler1.address, coinAmount)
            await shameCoin.connect(owner).transferFrom(hodler1.address, DEAD, coinAmount)
            expect (await shameCoin.balanceOf(hodler1.address)).to.be.equal(0)
        })
    })




   // it("Transfer from doesn't work without approval, and works with approval", async function() {
        //constant [owner, hodler] = await ethers.getSigners();
        // owner tries to run transfer from, it doesn't work
        // hodler runs approve, owner runs tranfer from, it works
  //  }

})