// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEther {
    function takeMoney() 
        public 
        payable {

    }

    function myBalance() 
        public 
        view 
        returns (uint256) {
            return address(this).balance;
    }
}

contract SendMoney {
    constructor() 
        payable {

    }

    function sendMoney(address receiveEtherContract) 
        public 
        payable {
            uint256 amount = myBalance();
            (bool ok, ) = receiveEtherContract.call{value: amount}(
                abi.encodeWithSignature("takeMoney()")
            );
            require(ok, "transfer failed");
    }

    function myBalance() 
        public 
        view 
        returns (uint256) {
            return address(this).balance;
    }
}
