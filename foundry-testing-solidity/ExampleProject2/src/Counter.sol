// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    address public owner;

    constructor (){
        owner = msg.sender;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function changeOwner(address _newowner) public {
        require(msg.sender == owner, "only the owner can change the owner");
        owner = _newowner;
    }
}
