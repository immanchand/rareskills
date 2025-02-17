// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    event Deposited(address indexed);
    address buyer = address(0xBad);

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testBuyerDeposit() public {
	    uint256 balanceBefore = address(counter).balance;
	    counter.buyerDeposit{value: 2 ether}();
	    uint256 balanceAfter = address(counter).balance;

	    assertEq(balanceAfter - balanceBefore, 2 ether, "expect increase of 2 ether");
    }

    function testBuyerDepositWrongPrice() public {
	    vm.expectRevert("incorrect amount");
	    counter.buyerDeposit{value: 2 ether + 1 wei}();

	    vm.expectRevert("incorrect amount");
	    counter.buyerDeposit{value: 2 ether - 1 wei}();
    }

    function testBuyerDepositEvent() public {
        vm.deal(address(buyer), 2 ether);
        vm.expectEmit();
        emit Deposited(buyer);
        vm.prank(buyer);
	    counter.buyerDeposit{value: 2 ether}();
    }


}
