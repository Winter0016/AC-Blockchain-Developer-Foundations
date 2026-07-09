// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract InteractionScript is Script {
    MyToken public mytoken;

    function setUp() public {
        mytoken = MyToken(address(0x41d0Ad4E6227062B59CA673B418Fc00E3A2d10Cf));
    }

    function run() public {
        uint256 currentDeployerBalance = mytoken.balanceOf(msg.sender);
        console.log("Current deployer balance: ", currentDeployerBalance);
    }
}
