// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterHarness is Counter {
    function returnTimestampHarness() public view returns (uint256 _timestamp){
        return super.returnTimestamp();
    }
}
contract CounterTest is Test {
    Counter public counter;
    CounterHarness public counterHarness;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
        counterHarness = new CounterHarness();
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
/*
    function testReturnTimestamp() public view {
        uint256 _timestamp = counterHarness.returnTimestampHarness();
        assertEq(_timestamp, block.timestamp, "timestamp is not the same");
    }*/
}
