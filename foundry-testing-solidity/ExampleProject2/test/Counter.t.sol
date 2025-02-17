// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address deployer = address(0xBed);
    address newOwner = address(0xBad);

    function setUp() public {
        vm.prank(deployer);
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1, "expect the counter number to equal 1");
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x, "expect to set the number to x");
    }

    function testChangeOwner() public {
        vm.prank(deployer);
        counter.changeOwner(newOwner);
        assertEq(counter.owner(), newOwner, "expect new owner to be changed");
    }

}
