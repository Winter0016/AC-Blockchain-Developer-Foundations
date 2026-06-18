// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Solution} from "../src/solution.sol";

contract SolutionTest is Test {
    Solution public solution;
    function setUp() public {
        solution = new Solution("Hello Solidity");
    }
    function test_getGreeting() public {
        assertEq(solution.getGreeting(), "Hello Solidity");
    }
}
