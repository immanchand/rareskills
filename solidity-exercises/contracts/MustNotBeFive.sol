// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ExampleContract {
    function mustNotBeFive(
        uint256 x
    ) 
        public 
        pure 
        returns (uint256) {
            require(x != 5, "five is not valid");
            return x * 2;
    }
}
