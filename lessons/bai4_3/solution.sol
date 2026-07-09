// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
        bytes32 uniqueID;
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
        bytes32 uniqueID = keccak256(abi.encodePacked(msg.sender, name, id));
        candidates[id] = Candidate(name, 0, uniqueID);
    }

    function vote(uint candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;
        candidates[candidateId].voteCount++;
        emit Voted(msg.sender, candidateId);
    }

    function getCandidate(
        uint candidateId
    ) public view returns (string memory, uint, bytes32) {
        return (
            candidates[candidateId].name,
            candidates[candidateId].voteCount,
            candidates[candidateId].uniqueID
        );
    }
}
