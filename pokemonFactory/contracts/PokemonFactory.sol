// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {

    event eventNewPokemon(Pokemon newPokemon);

    struct Pokemon {
        uint id;
        string name;
        uint[] abilities;
    }

    struct Abilities {
        string name;
        string description;
    }

    Pokemon[] private pokemons;
    Abilities[] private abilitiesPokemon; //Each abilities will be indentify for a id

    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;

    constructor(){
        createPokemonAbility("Name", "Description");
    }

    function createPokemon (string memory _name, uint _id, uint[] memory _abilities) public {

        require(_id > 0, "The ID must be grater that 0");
        require(bytes(_name).length > 2, "The name must have grater that 2 characters");

        pokemons.push(Pokemon(_id, _name, _abilities));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;

        emit eventNewPokemon(Pokemon(_id, _name, _abilities));
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }


    function getResult() public pure returns(uint product, uint sum){
        uint a = 1; 
        uint b = 2;
        product = a * b;
        sum = a + b; 
    }

    function createPokemonAbility(string memory _name, string memory _description) public {
        abilitiesPokemon.push(Abilities({name: _name, description: _description}));
    }

}