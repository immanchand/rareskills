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
        console.log(owner);
        verifier = new Verifier(owner);
    }

    function constructSignatureElements() private view
        returns(uint8 _v, bytes32 _r, bytes32 _s,string memory _message, bytes memory _signature) {

            
            string memory message = "stand down 123";
            console.log(message);

            bytes32 msgHash = MessageHashUtils.toEthSignedMessageHash(keccak256(abi.encode(message)));

            (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, msgHash);

            bytes memory signature = abi.encodePacked(r, s, v);
            assertEq(signature.length, 65);

            console.logBytes(signature);

            return (v, r, s, message, signature);
    }

    function testVerifyV1() public view {
        
        (uint8 v, bytes32 r, bytes32 s,string memory message, ) = constructSignatureElements();
        verifier.verifyV1(message, r, s, v);
    }

    function testVerifyV2() public view {
        
       (, , , string memory message, bytes memory signature) = constructSignatureElements();
        verifier.verifyV2(message, signature);
    }

    function testVerifyV1Fail() public {
        
        (uint8 v, bytes32 r, bytes32 s, , ) = constructSignatureElements();
        vm.expectRevert();
        verifier.verifyV1("different message", r, s, v);
    }

    function testVerifyV2Fail() public {
        
        (, , , , bytes memory signature) = constructSignatureElements();
        vm.expectRevert();
        verifier.verifyV2("different message", signature);
    }
    
}
