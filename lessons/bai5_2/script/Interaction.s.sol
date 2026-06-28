// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract Increasement is Script {
    Counter public counter;
    address mostRecentCounter;
    function setUp() public {
        mostRecentCounter = DevOpsTools.get_most_recent_deployment(
            "Counter",
            block.chainid
        );
    }

    function run() public {
        counter = Counter(mostRecentCounter);
        console.log("counter address", address(counter));
        vm.startBroadcast();
        counter.increment();
        vm.stopBroadcast();
    }
}
contract CheckIncreasement is Script {
    Counter public counter;
    address mostRecentCounter;
    function setUp() public {
        mostRecentCounter = DevOpsTools.get_most_recent_deployment(
            "Counter",
            block.chainid
        );
    }

    function run() public {
        counter = Counter(mostRecentCounter);
        vm.startBroadcast();
        uint currentcount = counter.getCount();
        console.log("Count: ", currentcount);
        vm.stopBroadcast();
    }
}
