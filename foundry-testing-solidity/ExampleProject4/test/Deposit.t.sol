// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Deposit} from "../src/Deposit.sol";

contract DepositTest is Test {
    Deposit public deposit;
    Deposit public faildeposit;
    address constant SELLER = address(0x5E11E7);
    //address constant Rejector = address(RejectTransaction);
    //RejectTransaction private rejector;

    event Deposited(address indexed);
    event SellerWithdraw(address indexed, uint256 indexed);

    function setUp() public {
        deposit = new Deposit(SELLER);
        //rejector = new RejectTransaction();
       // faildeposit = new Deposit(address(rejector));
    }

    modifier startAtPresentDay() {
        vm.warp(1680616584);
        _;
    }

    address public buyer = address(this); // the DepositTest contract is the "buyer"
    address public buyer2 = address(0x5E11E1); // random address
    address public FakeSELLER = address(0x5E1222); // random address

    function testDepositAmount() public startAtPresentDay {
        // this test checks that the buyer can only deposit 1 ether
        vm.startPrank(buyer);
        vm.expectRevert();
        deposit.buyerDeposit{value: 1.5 ether}();
        vm.expectRevert();
        deposit.buyerDeposit{value: 2.5 ether}();
        vm.stopPrank();
    }
}
