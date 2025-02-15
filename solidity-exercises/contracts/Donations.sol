// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Donations {
    mapping(address => uint256) public amountDonated;

    receive() external payable {
        // your code here
        // amountDonated should store the amount
        // the person donated
        // don't forget a person can donate
        // multiple times!
        amountDonated[msg.sender] += msg.value;
    }

    function getMyDonations() public view returns(uint256 amount){
        return amountDonated[msg.sender];
    }
}
