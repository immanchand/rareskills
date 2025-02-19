// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Verifier.sol";

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "forge-std/console.sol";

contract TestSigs1 is Test {
    using ECDSA for bytes32;
    Verifier verifier;

    address owner;
    uint256 privateKey =
        0x1010101010101010101010101010101010101010101010101010101010101010;

    function setUp() public {
        owner = vm.addr(privateKey);
        verifier = new Verifier(owner);
    }

    function testVerifyV1andV2() public {
        string memory message = "attack at dawn";

        bytes32 msgHash = MessageHashUtils.toEthSignedMessageHash(keccak256(abi.encode(message)));

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, msgHash);

        bytes memory signature = abi.encodePacked(r, s, v);
        assertEq(signature.length, 65);

        console.logBytes(signature);
        verifier.verifyV1(message, r, s, v);
        verifier.verifyV2(message, signature);
    }
}

