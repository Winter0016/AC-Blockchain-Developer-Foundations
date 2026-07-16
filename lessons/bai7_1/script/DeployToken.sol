// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract DeployToken is Script {
    Token public token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        token = new Token("MyToken", "MTK");
        token.mint(msg.sender, 1000 * 10 ** 18);
        console.log(
            "Token balance of msg.sender:",
            token.balanceOf(msg.sender)
        );

        vm.stopBroadcast();
    }
}
