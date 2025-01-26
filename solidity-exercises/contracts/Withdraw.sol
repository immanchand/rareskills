// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Withdraw {
    // @notice make this contract able to receive ether from anyone and anyone can call withdraw below to withdraw all ether from it
    function withdraw() public {
        // your code here
        msg.sender.call{value: address(this).balance}("");
    }
    receive() external payable { }
}
