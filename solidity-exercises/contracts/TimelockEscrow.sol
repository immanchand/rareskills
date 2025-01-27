// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TimelockEscrow {
    address public seller;
    address public buyer;
    uint256 public sellPrice;
    bool public inEscrow;
    uint256 public escrowStartTime;
    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */
    constructor(uint256 _sellPrice) {
        seller = msg.sender;
        sellPrice = _sellPrice;
    }
    /**
     * creates a buy order between msg.sender and seller
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        // your code here
        require(!inEscrow, "Already in escrow.");
        require(msg.value>=sellPrice, "Your bid does not meet the expected price.");
        inEscrow = true;
        buyer = msg.sender;
        escrowStartTime = block.timestamp;
    }
    /*
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw() external {
        // your code here
        require(inEscrow, "There is no active escrow");
        require(escrowStartTime<(block.timestamp+3 days),"Escrow time has not elapsed yet.");
        require(msg.sender==seller, "You are not the seller");
        inEscrow=false;
        buyer = 0x0000000000000000000000000000000000000000;
        escrowStartTime=0;
        seller.call{value: address(this).balance}("");
    }

    /**
     * allows buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        // your code here
        require(inEscrow, "There is no active escrow");
        require(block.timestamp<(escrowStartTime+3 minutes), "Cannot withdraw. Escrow period is over.");
        require(msg.sender==buyer, "You are not the buyer.");
        inEscrow = false;
        escrowStartTime=0;
        buyer.call{value: address(this).balance}("");
        buyer = 0x0000000000000000000000000000000000000000;
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address _buyer) external view returns (uint256) {
        // your code here
        require(_buyer==buyer, "No escrow for this buyer");
        return address(this).balance;
    }
}
