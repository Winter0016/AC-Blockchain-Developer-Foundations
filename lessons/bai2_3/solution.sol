// SPDX-License-Identifier : MIT

pragma solidity ^0.8.0;

contract Solution {
    string public greeting;
    constructor(string memory initGreeting) {
        greeting = initGreeting;
    }
    function getGreeting() public view returns (string memory) {
        return greeting;
    }
}
