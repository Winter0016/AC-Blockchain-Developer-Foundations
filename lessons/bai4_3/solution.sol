//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;

    mapping(address => bool) public hasVoted;

    address public owner;

    uint public currentId;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only deployer can call this function");
        _;
    }

    event Voted(address voter, uint candidateId);

    function addCandidate(string memory name) public onlyOwner {
        uint id = currentId++;
        candidates[id] = Candidate(name, 0);
    }

    function vote(uint candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;
        emit Voted(msg.sender, candidateId);
    }

    function getCandidate(
        uint candidateId
    ) public view returns (string memory, uint) {
        return (
            candidates[candidateId].name,
            candidates[candidateId].voteCount
        );
    }
}
