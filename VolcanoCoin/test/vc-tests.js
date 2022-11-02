const {ethers} = require("hardhat")
const {assert, expect} = require("chai")

describe("Test VolcanoCoin", function() {
    let VolcanoCoinFactory, volcanoCoin
    beforeEach(async function() {
        VolcanoCoinFactory = await ethers.getContractFactory("VolcanoCoin")
        volcanoCoin = await VolcanoCoinFactory.deploy()
    })

    it("Initial Supply is 10000", async function() {
        const supply = await volcanoCoin.whatSupply()
        const expected = "10000"
        assert.equal(supply.toString(), expected)
    })

    it("Supply can be updated in 1000 increments", async function() {
        const transactionResponse = await volcanoCoin.increaseSupply()
        await transactionResponse.wait(1)
        const updatedSupply = await volcanoCoin.whatSupply()
        const expected = "11000"
        assert.equal(updatedSupply.toString(), expected)
    })

    it("Only the owner can run contract", async function() {
        const [owner, hodler] = await ethers.getSigners();
        await expect(volcanoCoin.connect(owner).increaseSupply()).to.not.be.reverted
        await expect(volcanoCoin.connect(hodler).increaseSupply()).to.be.revertedWith("You aren't the owner")
    })

})