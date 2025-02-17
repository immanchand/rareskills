// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Deposit} from "../src/Deposit.sol";

contract CounterScript is Script {
    Deposit public counter;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        counter = new Deposit(msg.sender);

        vm.stopBroadcast();
    }
}
