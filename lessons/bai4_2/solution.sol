//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract StudentRegistryV2 {
    struct Student {
        string name;
        uint age;
        bool isRegistered;
    }

    mapping(address => Student) public students;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only deployer can call this function");
        _;
    }

    event StudentRegistered(address indexed user, string name, uint age);

    function register(string memory name, uint age) public onlyOwner {
        students[msg.sender] = Student(name, age, true);
        emit StudentRegistered(msg.sender, name, age);
    }

    function getStudent(
        address user
    ) public view returns (string memory, uint, bool) {
        return (
            students[user].name,
            students[user].age,
            students[user].isRegistered
        );
    }

    function isStudentRegistered(address user) public view returns (bool) {
        return students[user].isRegistered;
    }
}
