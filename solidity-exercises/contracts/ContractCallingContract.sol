// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ExampleContract {
    function askTheMeaningOfLife(address source)
        public
        returns (uint256) {
            (bool ok, bytes memory result) = source.call(
                abi.encodeWithSignature("meaningOfLifeAndAllExistence()")
            );
            require(ok, "call failed");

            return abi.decode(result, (uint256));
    }
}

contract AnotherContract {
    function meaningOfLifeAndAllExistence()
        public 
        pure 
        returns (uint256) {
            return 42;
    }
}
