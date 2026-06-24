//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract VotingEligibility {
    uint minAge;
    address public Deployer;

    constructor() {
        minAge = 18;
        Deployer = msg.sender;
    }

    function checkEligibility(uint age) public view returns (bool) {
        return age >= minAge;
    }

    function updateMinAge(uint newMinAge) public {
        require(msg.sender == Deployer, "Only deployer can update minAge");
        minAge = newMinAge;
    }
}
