// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ReducingPayout {
    /*
        This exercise assumes you know how block.timestamp works.
        1. This contract has 1 ether in it, each second that goes by, 
           the amount that can be withdrawn by the caller goes from 100% to 0% deducted in 1gwei per second passes.
        2. Implement your logic in `withdraw` function.
       ------X-----X--- Hint: 1 second deducts 0.0011574% from the current %.
    */

    // The time 1 ether was sent to this contract
    uint256 public immutable depositedTime;
    bool private withdrawn;

    constructor() payable {
        require(msg.value==1 ether, "The contract must have 1 ether");
        depositedTime = block.timestamp;
    }

    function withdraw() public {
        // your code here
        require(!withdrawn, "Contract has been withdrawn");
        uint256 elapsedSeconds = block.timestamp - depositedTime;
        uint256 amountWithdraw =0;
        if((elapsedSeconds*1 gwei)<1 ether)
            amountWithdraw = 1 ether - (elapsedSeconds*1 gwei);
        
        msg.sender.call{value: amountWithdraw}("");
        withdrawn = true;
    }
}
