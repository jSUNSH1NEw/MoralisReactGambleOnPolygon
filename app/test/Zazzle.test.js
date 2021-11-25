const Zazzle = artifacts.require('Zazzle');

contract("Zazzle", (account) => {
    before(async () => {
        zazzlle = await Zazzle.deployed();
    })

    it ("give the owner of the token Some token", async() =>{
        const owner = await zazzlle.owner();
        assert.equal(owner, account[0]);
    })
})
