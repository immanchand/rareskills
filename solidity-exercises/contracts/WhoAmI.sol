// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ExampleContract{

    function whoaimi() public view returns(address contractAddress){
        return address(this);
    }
}
