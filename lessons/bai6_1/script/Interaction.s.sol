// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/MyToken.sol";

contract InteractionScript is Script {
    MyToken public mytoken;

    function setUp() public {
        mytoken = MyToken(address(0x841e707CB0bb81b5973f2D451378a629878B13BF));
    }

    function run() public {
        uint256 currentDeployerBalance = mytoken.balanceOf(msg.sender);
        console.log("Current deployer balance: ", currentDeployerBalance);
    }
}
