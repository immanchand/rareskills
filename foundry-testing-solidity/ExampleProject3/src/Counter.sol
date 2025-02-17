// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function buyerDeposit() external payable {
		require(msg.value == 2 ether, "incorrect amount");
		//emit Deposited(msg.sender);
	}
}
