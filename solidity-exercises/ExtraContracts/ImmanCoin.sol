// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract IMMANCoin {

    uint8 public decimal;
    string public name;
    string public symbol;
    address public owner;
    uint256 public totalSupply;

    constructor (string memory _name, string memory _symbol, uint8 _decimal){
        name = _name;
        symbol = _symbol;
        decimal = _decimal;
        owner = msg.sender;
    }

    mapping(address=>uint256) public balanceOf;
    mapping(address=>mapping(address=>uint256)) private approvals;
    
    function mint(uint256 amount) public {
        require(msg.sender==owner,"only the owner can mint");
        balanceOf[owner] += amount;
        totalSupply += amount;
    }
    function transfer(address to, uint256 amount) public returns(bool){
        return transferFunction(msg.sender, to, amount);
    }
    function transferFrom(address from, address to, uint256 amount) public returns(bool){
        require(balanceOf[from]>=amount,"not enough balance to transfer");
        if(msg.sender!=from){
            require(approvals[from][msg.sender]>=amount, "not enough approval");
            approvals[from][msg.sender]-=amount;
        }
        return transferFunction(from, to, amount);
    }
    function approve(address to, uint256 amount) public returns(bool){
        require(balanceOf[msg.sender]>=amount,"not enough balance to approve");
        approvals[msg.sender][to] = amount;
        return true;
    }
    function transferFunction(address from, address to, uint256 amount) private returns(bool){
        require(balanceOf[from]>=amount,"not enough balance to transfer");
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        return true;
    }
}
