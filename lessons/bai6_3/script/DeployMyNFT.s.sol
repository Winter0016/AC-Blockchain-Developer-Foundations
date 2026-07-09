// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract DeployMyNFT is Script {
    MyNFT public mynft;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        mynft = new MyNFT(msg.sender);

        mynft.mint(msg.sender);

        console.log("Owner of NFT 0:", mynft.ownerOf(0));

        vm.stopBroadcast();
    }
}
