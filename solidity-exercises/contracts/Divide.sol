// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Divide{
    uint256 public constant PERCENTAGE_INTEREST = 3;

    /**
     * The calculate interest function is buggy because of how it calculates interest of amount passed into it
     * Make it return the right value.
     */

    function calculateInterest(uint256 amount) external pure returns (uint256) {
        uint256 x = (PERCENTAGE_INTEREST * amount) / 100;
        return x;
    }
}