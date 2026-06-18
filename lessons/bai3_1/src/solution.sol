//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract solution {
    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }

    function setProfile(string _name, uint _age) public {
        name = _name;
        age = _age;
    }

    string public name;
    uint public age;
}
