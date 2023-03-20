const { expect } = require("chai");

describe("Smart Contract PokemonFactory", function () {
  
  it("The smart contract must emit the pokemon created", async function () {

    const smartContract = await ethers.getContractFactory("PokemonFactory");

    const hardhatSmart = await smartContract.deploy();

    expect(await hardhatSmart.createPokemon("Pikachu", 1)).to.emit();

  });

});