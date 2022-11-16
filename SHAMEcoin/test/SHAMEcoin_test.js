const {ethers} = require("hardhat")
const {assert, expect} = require("chai")

describe("Test SHAMEcoin", function() {
    let SHAMEcoin, shameCoin
    beforeEach(async function() {
        SHAMEcoinFactory = await ethers.getContractFactory("SHAMEcoin")
        shameCoin = await SHAMEcoinFactory.deploy()
    })

    it("Only the owner can run contract", async function() {
        const [owner, hodler] = await ethers.getSigners();
        await expect(shameCoin.connect(owner).transfer(hodler)). // balance of hodler = 1
        await expect(volcanoCoin.connect(hodler).transfer() // balance of hodler = 1
    })

    it("Transfer from doesn't work without approval, and works with approval", async function() {
        constant [owner, hodler] = await ethers.getSigners();
        // owner tries to run transfer from, it doesn't work
        // hodler runs approve, owner runs tranfer from, it works
    }

})