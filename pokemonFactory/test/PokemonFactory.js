const { expect } = require("chai");

describe("Smart Contract PokemonFactory", function () {
  
  it("The smart contract must emit the pokemon created", async function () {

    const smartContract = await ethers.getContractFactory("PokemonFactory");

    const hardhatSmart = await smartContract.deploy();

    expect(await hardhatSmart.createPokemon("Pikachu", 1)).to.emit();

  });

  it("The argument _id of the function createPokemon must be greater that 0", async function () {

    const smartContract = await ethers.getContractFactory("PokemonFactory");

    const hardhatSmart = await smartContract.deploy();

    expect(await hardhatSmart.createPokemon("Pikachu", 1));

  });

  it("The argument name of the function createPokemon must have greater that 2 characters", async function () {

    const smartContract = await ethers.getContractFactory("PokemonFactory");

    const hardhatSmart = await smartContract.deploy();

    expect(await hardhatSmart.createPokemon("Pikachu", 1));

  });

});